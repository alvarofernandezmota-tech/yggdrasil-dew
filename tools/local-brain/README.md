---
tags: [rag, ollama, chromadb, fastapi, segundo-cerebro, local-brain]
fecha: 2026-06-23
estado: pendiente-desplegar
---

# Local Brain — RAG Híbrido con Ollama

Este es el **core del proyecto**: backend FastAPI que indexa yggdrasil-dew
usando **Ollama 100% local** para embeddings y generación.

## Arquitectura

```
yggdrasil-dew (*.md)          ← tu vault / conocimiento
        ↓ lee y chunka
  nomic-embed-text             ← Ollama :11434 (embeddings locales)
        ↓ vectoriza
  ChromaDB + BM25              ← índice en disco
        ↓ RAG híbrido
  llama3.2:3b                  ← Ollama :11434 (LLM local, GTX 1060 6GB)
        ↓
  FastAPI :8001                ← tu API
        ↓
  Thdora / curl / Obsidian
```

**100% local. Sin red. Sin API keys. Sin datos saliendo de Madre.**

## Modos disponibles

| Puerto | Embeddings | LLM | Red necesaria |
|---|---|---|---|
| `:8001` | Ollama `nomic-embed-text` | Ollama `llama3.2:3b` | ❌ ninguna |
| `:8002` | Ollama `nomic-embed-text` | Claude `claude-sonnet-4-6` | ✅ Anthropic API |

El core siempre es `:8001`. El modo Claude es opcional para casos
que requieran razonamiento más profundo.

## Requisitos

- Ollama instalado: `curl -fsSL https://ollama.com/install.sh | sh`
- Modelos: `ollama pull llama3.2:3b && ollama pull nomic-embed-text`
- `uv` instalado
- Python 3.11

## Despliegue

```bash
# Paso 1 — arrancar Ollama (terminal 1)
ollama serve

# Paso 2 — bajar modelos (terminal 2)
ollama pull llama3.2:3b
ollama pull nomic-embed-text

# Paso 3 — lanzar backend (terminal 3)
chmod +x tools/local-brain/deploy_brain.sh
./tools/local-brain/deploy_brain.sh

# Paso 4 — indexar vault
curl -X POST http://127.0.0.1:8001/index

# Paso 5 — consultar
curl -X POST http://127.0.0.1:8001/query \
  -H "Content-Type: application/json" \
  -d '{"prompt": "qué pendientes tengo con thdora?", "top_k": 5}'
```

## Integración con Thdora

```python
# En thdora — handler de mensaje Telegram
response = requests.post("http://localhost:8001/query",
    json={"prompt": user_message, "top_k": 5})
reply = response.json()["response"]
```

## Estado

⏳ Pendiente desplegar — Ollama descargando (~6% al momento de documentar)
