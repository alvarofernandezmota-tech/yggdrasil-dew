---
tags: [rag, ollama, chromadb, fastapi, segundo-cerebro, local-brain]
fecha: 2026-06-23
estado: pendiente-desplegar
ruta-obsidian: tools/local-brain/README.md
---

# Local Brain — RAG Híbrido sobre yggdrasil-dew

Backend FastAPI que indexa el vault de Obsidian y expone una API de consulta inteligente usando Ollama local.

## Arquitectura

```
yggdrasil-dew (Markdown)
        ↓ indexa
  ChromaDB (vectorial)
  BM25 (léxico)
        ↓ consulta híbrida
  Ollama llama3.2:3b (generación)
        ↓
  FastAPI :8001
        ↓
  Thdora bot / curl / Obsidian plugin
```

## Requisitos

- Ollama corriendo en Docker (`~/docker/batcueva-nueva/`) en `:11434`
- `uv` instalado
- Python 3.11
- Modelos: `llama3.2:3b` + `nomic-embed-text`

## Despliegue

```bash
chmod +x tools/local-brain/deploy_brain.sh
./tools/local-brain/deploy_brain.sh
```

## Endpoints

| Endpoint | Método | Para qué |
|---|---|---|
| `/health` | GET | Ver estado |
| `/index` | POST | Re-indexar vault |
| `/query` | POST | Consultar cerebro |

## Uso

```bash
# Indexar vault
curl -X POST http://127.0.0.1:8001/index

# Consultar
curl -X POST http://127.0.0.1:8001/query \
  -H "Content-Type: application/json" \
  -d '{"prompt": "qué pendientes tengo con thdora?", "top_k": 4}'
```

## Integración con Thdora

Thdora puede llamar a `/query` directamente:
```python
# En thdora — handler de mensaje
response = requests.post("http://localhost:8001/query",
    json={"prompt": user_message, "top_k": 5})
reply = response.json()["response"]
```

## Estado

⏳ Pendiente desplegar — requiere Ollama corriendo (descargando)

## Para investigar más

- [ChromaDB docs](https://docs.trychroma.com)
- [Ollama API](https://github.com/ollama/ollama/blob/main/docs/api.md)
- [rank_bm25](https://github.com/dorianbrown/rank_bm25)
- [FastAPI](https://fastapi.tiangolo.com)
- RAG híbrido: combinar dense retrieval (vectorial) + sparse retrieval (BM25)
- Reranking: `cross-encoder/ms-marco-MiniLM-L-6-v2` para mejorar resultados
