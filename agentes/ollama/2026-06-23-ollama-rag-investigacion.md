---
tags: [ollama, rag, investigacion, chromadb, bm25, qdrant]
fecha: 2026-06-23
estado: documentado
tipo: investigacion
ruta-obsidian: agentes/ollama/2026-06-23-ollama-rag-investigacion.md
fuente: inbox/2026-06-23-ollama-rag-investigacion.md
---

# RAG en Ollama — Investigación 2026-06-23

> Investigación paralela Claude + Gemini. Decisiones finales documentadas.

## Stack RAG decidido

| Componente | Decisión | Motivo |
|---|---|---|
| LLM | qwen2.5:3b / qwen2.5:7b | Mejor ratio calidad/VRAM |
| Embeddings | bge-m3 | Mejor calidad multilingual |
| Vector DB | Qdrant (ChromaDB conservar) | Qdrant más escalable |
| BM25 | Sí, con persistencia pickle | Bug: no persiste entre reinicios |
| Fusión | RRF (Reciprocal Rank Fusion) | Mejor que extend() directo |

## Bug crítico BM25

Detectado por Claude: BM25 no persiste entre reinicios del proceso.
Solución: serializar con pickle.

```python
import pickle
from rank_bm25 import BM25Okapi

# Guardar
with open('bm25_index.pkl', 'wb') as f:
    pickle.dump(bm25, f)

# Cargar
with open('bm25_index.pkl', 'rb') as f:
    bm25 = pickle.load(f)
```

## Modo potente sin más VRAM

Groq API (key ya disponible en thdora) → qwen2.5-72b gratis.
Usar local para embeddings, Groq para inferencia pesada.

## Referencias
- [[agentes/2026-06-23-actualizacion-claude-gemini]]
- [[agentes/ollama/2026-06-23-ollama-bge-m3]]
- [[agentes/ollama/2026-06-23-ollama-guia-seleccion]]
