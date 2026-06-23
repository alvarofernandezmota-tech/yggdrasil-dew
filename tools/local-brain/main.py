import os
import re
import glob
import requests
from typing import List
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import chromadb
from rank_bm25 import BM25Okapi

app = FastAPI(title="Local Brain RAG Engine", version="1.0")

VAULT_PATH = os.getenv("OBSIDIAN_VAULT", os.path.expanduser("~/Projects/yggdrasil-dew"))
OLLAMA_URL = os.getenv("OLLAMA_URL", "http://localhost:11434")
LLM_MODEL = os.getenv("LLM_MODEL", "llama3.2:3b")
EMBED_MODEL = os.getenv("EMBED_MODEL", "nomic-embed-text")

chroma_client = chromadb.PersistentClient(path="./chroma_db")
collection = chroma_client.get_or_create_collection(name="obsidian_notes")

bm25_index = None
bm25_docs = []

class QueryRequest(BaseModel):
    prompt: str
    top_k: int = 5

def get_embedding(text: str) -> List[float]:
    response = requests.post(f"{OLLAMA_URL}/api/embeddings", json={
        "model": EMBED_MODEL,
        "prompt": text
    })
    return response.json()["embedding"]

def chunk_markdown(content: str, max_chars: int = 1200) -> List[str]:
    content = re.sub(r'^---[\s\S]+?---', '', content)
    paragraphs = content.split("\n\n")
    chunks, current = [], ""
    for p in paragraphs:
        if len(current) + len(p) < max_chars:
            current += p + "\n\n"
        else:
            if current.strip(): chunks.append(current.strip())
            current = p + "\n\n"
    if current.strip(): chunks.append(current.strip())
    return chunks

@app.post("/index")
def index_vault():
    global bm25_index, bm25_docs
    if not os.path.exists(VAULT_PATH):
        raise HTTPException(status_code=400, detail=f"Vault no encontrado: {VAULT_PATH}")
    try:
        chroma_client.delete_collection("obsidian_notes")
    except:
        pass
    coll = chroma_client.create_collection(name="obsidian_notes")
    md_files = glob.glob(os.path.join(VAULT_PATH, "**/*.md"), recursive=True)
    docs, metas, ids, embeddings, corpus = [], [], [], [], []
    for idx, filepath in enumerate(md_files):
        filename = os.path.basename(filepath)
        with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
        for ci, chunk in enumerate(chunk_markdown(content)):
            text = f"--- {filename} ---\n{chunk}"
            docs.append(text); metas.append({"source": filename, "path": filepath})
            ids.append(f"{filename}_{idx}_{ci}")
            embeddings.append(get_embedding(text))
            corpus.append(text)
    if ids:
        coll.add(embeddings=embeddings, documents=docs, metadatas=metas, ids=ids)
    bm25_index = BM25Okapi([d.lower().split() for d in corpus])
    bm25_docs = corpus
    return {"status": "ok", "files": len(md_files), "chunks": len(ids)}

@app.post("/query")
def query_brain(request: QueryRequest):
    global bm25_index, bm25_docs
    if not bm25_docs:
        index_vault()
    query_vec = get_embedding(request.prompt)
    coll = chroma_client.get_collection("obsidian_notes")
    vec_results = coll.query(query_embeddings=[query_vec], n_results=request.top_k)
    vec_ctx = vec_results['documents'][0] if vec_results['documents'] else []
    lex_ctx = bm25_index.get_top_n(request.prompt.lower().split(), bm25_docs, n=request.top_k) if bm25_index else []
    context = list(dict.fromkeys(vec_ctx + lex_ctx))[:request.top_k]
    context_str = "\n\n".join(context)
    system = (
        "Eres el cerebro secundario del usuario. Responde SOLO con lo que aparece en el contexto.\n"
        "Si no está en el contexto, dilo claramente. Sé directo y técnico.\n\n"
        f"CONTEXTO:\n{context_str}"
    )
    r = requests.post(f"{OLLAMA_URL}/api/generate", json={
        "model": LLM_MODEL, "prompt": request.prompt,
        "system": system, "stream": False,
        "options": {"temperature": 0.2, "num_ctx": 8192}
    })
    return {"response": r.json()["response"], "sources": context}

@app.get("/health")
def health():
    return {"status": "ok", "vault": VAULT_PATH, "ollama": OLLAMA_URL}
