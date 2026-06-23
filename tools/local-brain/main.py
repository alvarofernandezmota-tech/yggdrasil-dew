import os
import re
import glob
import pickle
import requests
import yaml
from typing import List, Dict
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import chromadb
from rank_bm25 import BM25Okapi

app = FastAPI(title="Local Brain RAG — Ollama", version="2.0")

# ─── Configuración ────────────────────────────────────────────────────────────
# 100% local. Sin red. Sin API keys. Sin datos saliendo de Madre.
VAULT_PATH   = os.getenv("OBSIDIAN_VAULT", os.path.expanduser("~/Projects/yggdrasil-dew"))
OLLAMA_URL   = os.getenv("OLLAMA_URL", "http://localhost:11434")
LLM_MODEL    = os.getenv("LLM_MODEL",   "qwen2.5:3b")          # mejor español que llama3.2
EMBED_MODEL  = os.getenv("EMBED_MODEL", "nomic-embed-text")     # ligero, cabe con el LLM
BM25_PATH    = "./bm25_index.pkl"
BM25_CORPUS  = "./bm25_corpus.pkl"

chroma_client = chromadb.PersistentClient(path="./chroma_db")
bm25_index: BM25Okapi = None
bm25_docs: List[str]  = []

class QueryRequest(BaseModel):
    prompt: str
    top_k: int = 10

# ─── Embeddings locales (Ollama) ──────────────────────────────────────────────

def get_embedding(text: str) -> List[float]:
    r = requests.post(f"{OLLAMA_URL}/api/embeddings",
                      json={"model": EMBED_MODEL, "prompt": text})
    if r.status_code != 200:
        raise HTTPException(500, detail=f"Ollama embedding error: {r.text}")
    return r.json()["embedding"]

# ─── Chunking Markdown-aware (v2) ─────────────────────────────────────────────
# Cambios vs v1:
#   - Frontmatter extraído como metadata, NO dentro del chunk
#   - Split por headers H1/H2/H3 primero
#   - Chunk size 400-600 chars (antes 1200)
#   - Overlap 100 chars entre chunks
#   - Metadata inyectada como prefijo en cada chunk

def parse_frontmatter(content: str) -> tuple:
    """Separa el frontmatter YAML del cuerpo. Devuelve (cuerpo, metadata_dict)."""
    fm_match = re.match(r'^---\n(.*?)\n---\n', content, re.DOTALL)
    metadata = {}
    if fm_match:
        try:
            metadata = yaml.safe_load(fm_match.group(1)) or {}
        except Exception:
            metadata = {}
        content = content[fm_match.end():]
    return content, metadata

def chunk_markdown(content: str, filename: str, metadata: dict,
                   max_chars: int = 500, overlap: int = 100) -> List[str]:
    """Split por headers primero, luego por párrafo si el bloque es largo."""
    # Prefijo de contexto para cada chunk (mejora el embedding)
    tags = metadata.get('tags', [])
    prefix = f"Nota: {filename} | Tags: {tags}"

    # Split por headers H1/H2/H3
    parts = re.split(r'(\n#{1,3} .+)', content)
    sections, current_header = [], ""
    for part in parts:
        if re.match(r'\n#{1,3} ', part):
            current_header = part.strip()
        else:
            sections.append((current_header, part))

    chunks = []
    for header, body in sections:
        block = f"{header}\n{body}".strip() if header else body.strip()
        if not block:
            continue
        # Si el bloque cabe en max_chars → chunk directo
        if len(block) <= max_chars:
            chunks.append(f"{prefix}\n{block}")
        else:
            # Subdividir por párrafo con overlap
            paragraphs = block.split("\n\n")
            current = ""
            for p in paragraphs:
                if len(current) + len(p) <= max_chars:
                    current += p + "\n\n"
                else:
                    if current.strip():
                        chunks.append(f"{prefix}\n{current.strip()}")
                    # Overlap: últimos 100 chars del chunk anterior
                    current = current[-overlap:] + p + "\n\n" if current else p + "\n\n"
            if current.strip():
                chunks.append(f"{prefix}\n{current.strip()}")
    return chunks

# ─── BM25 con persistencia en disco ───────────────────────────────────────────

def load_or_build_bm25(corpus: List[str]) -> BM25Okapi:
    """Carga BM25 desde disco si existe, si no lo construye y lo guarda."""
    if os.path.exists(BM25_PATH):
        with open(BM25_PATH, "rb") as f:
            return pickle.load(f)
    bm25 = BM25Okapi([doc.lower().split() for doc in corpus])
    with open(BM25_PATH, "wb") as f:
        pickle.dump(bm25, f)
    return bm25

def save_bm25(bm25: BM25Okapi, corpus: List[str]):
    with open(BM25_PATH,   "wb") as f: pickle.dump(bm25,   f)
    with open(BM25_CORPUS, "wb") as f: pickle.dump(corpus, f)

def load_bm25_corpus() -> List[str]:
    if os.path.exists(BM25_CORPUS):
        with open(BM25_CORPUS, "rb") as f:
            return pickle.load(f)
    return []

# ─── Reciprocal Rank Fusion ───────────────────────────────────────────────────

def reciprocal_rank_fusion(vec_docs: List[str], bm25_docs_ranked: List[str],
                           k: int = 60, top_n: int = 10) -> List[str]:
    """RRF — fusiona rankings de vector search y BM25 correctamente.
    Evita mezclar scores de distinto tipo (coseno vs absoluto BM25).
    """
    scores: Dict[str, float] = {}
    for rank, doc in enumerate(vec_docs):
        scores[doc] = scores.get(doc, 0) + 1 / (k + rank + 1)
    for rank, doc in enumerate(bm25_docs_ranked):
        scores[doc] = scores.get(doc, 0) + 1 / (k + rank + 1)
    ranked = sorted(scores.keys(), key=lambda d: scores[d], reverse=True)
    return ranked[:top_n]

# ─── Indexación ───────────────────────────────────────────────────────────────

@app.post("/index")
def index_vault():
    global bm25_index, bm25_docs
    if not os.path.exists(VAULT_PATH):
        raise HTTPException(400, detail=f"Vault no encontrado: {VAULT_PATH}")
    # Limpiar colección anterior
    try:
        chroma_client.delete_collection("obsidian_notes")
    except Exception:
        pass
    # Borrar BM25 cacheado para forzar rebuild
    for path in [BM25_PATH, BM25_CORPUS]:
        if os.path.exists(path): os.remove(path)

    coll = chroma_client.create_collection(
        name="obsidian_notes",
        metadata={"hnsw:space": "cosine"}
    )
    md_files = glob.glob(os.path.join(VAULT_PATH, "**/*.md"), recursive=True)
    docs, metas, ids, embeddings, corpus = [], [], [], [], []
    print(f"Indexando {len(md_files)} archivos...")

    for file_idx, filepath in enumerate(md_files):
        filename = os.path.basename(filepath)
        with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
            raw = f.read()
        body, fm_meta = parse_frontmatter(raw)
        for chunk_idx, chunk in enumerate(chunk_markdown(body, filename, fm_meta)):
            chunk_id = f"{filename}_{file_idx}_{chunk_idx}"
            docs.append(chunk)
            # Frontmatter como metadata de ChromaDB (no dentro del chunk)
            metas.append({
                "source":   filename,
                "path":     filepath,
                "tags":     str(fm_meta.get("tags", [])),
                "fecha":    str(fm_meta.get("fecha", "")),
                "estado":   str(fm_meta.get("estado", ""))
            })
            ids.append(chunk_id)
            embeddings.append(get_embedding(chunk))
            corpus.append(chunk)

    if ids:
        coll.add(embeddings=embeddings, documents=docs, metadatas=metas, ids=ids)

    bm25_index = load_or_build_bm25(corpus)
    save_bm25(bm25_index, corpus)
    bm25_docs = corpus
    return {"status": "ok", "files": len(md_files), "chunks": len(ids)}

# ─── Query RAG híbrido (vector + BM25 + RRF) ──────────────────────────────────

@app.post("/query")
def query_brain(request: QueryRequest):
    global bm25_index, bm25_docs

    # Cargar BM25 desde disco si no está en memoria
    if not bm25_docs:
        bm25_docs = load_bm25_corpus()
        if bm25_docs:
            bm25_index = load_or_build_bm25(bm25_docs)
        else:
            index_vault()

    # 1. Vector search (Ollama embeddings)
    q_vec  = get_embedding(request.prompt)
    coll   = chroma_client.get_collection("obsidian_notes")
    v_res  = coll.query(query_embeddings=[q_vec], n_results=request.top_k)
    vec_ctx = v_res['documents'][0] if v_res['documents'] else []

    # 2. BM25 lexical search
    lex_ctx = bm25_index.get_top_n(
        request.prompt.lower().split(), bm25_docs, n=request.top_k
    ) if bm25_index else []

    # 3. RRF fusion (no extend() directo)
    context = reciprocal_rank_fusion(vec_ctx, lex_ctx, top_n=request.top_k)
    context_str = "\n\n".join(context)

    # 4. Generar respuesta con Ollama local
    system_prompt = (
        "Eres el cerebro secundario del usuario. "
        "Responde SOLO con lo que aparece en el contexto de sus notas personales. "
        "Si no está en el contexto, dilo claramente. Sé directo y técnico."
    )
    payload = {
        "model": LLM_MODEL,
        "prompt": f"{system_prompt}\n\nCONTEXTO:\n{context_str}\n\nPREGUNTA: {request.prompt}",
        "stream": False
    }
    r = requests.post(f"{OLLAMA_URL}/api/generate", json=payload)
    if r.status_code != 200:
        raise HTTPException(500, detail=f"Ollama generate error: {r.text}")

    return {
        "response": r.json()["response"],
        "sources":  context,
        "model":    LLM_MODEL
    }

@app.get("/health")
def health():
    return {
        "status":  "ok",
        "vault":   VAULT_PATH,
        "embed":   EMBED_MODEL,
        "llm":     LLM_MODEL,
        "version": "2.0 — qwen2.5:3b + RRF + BM25 pickle + chunking v2"
    }
