---
tags: [ollama, embeddings, bge-m3, rag, local]
fecha: 2026-06-23
estado: pendiente-descargar
modelo: bge-m3
tipo: embedding
ruta-obsidian: agentes/ollama/2026-06-23-ollama-bge-m3.md
fuente: inbox/2026-06-23-ollama-bge-m3.md
---

# bge-m3 — Embedding model local

## Ficha técnica

| Campo | Valor |
|---|---|
| Modelo | BAAI/bge-m3 |
| VRAM | ~1GB |
| Dimensiones | 1024 |
| Idiomas | Multilingual (100+) |
| Uso | Embeddings RAG de alta calidad |

## Ventajas vs nomic-embed-text

- Mejor calidad semántica en español
- Multilingual nativo
- Dimensiones 1024 (vs 768 de nomic)
- Más lento pero más preciso

## Instalación

```bash
docker exec -it ollama ollama pull bge-m3
```

## Uso en RAG

```python
import ollama
response = ollama.embeddings(model='bge-m3', prompt='texto a embeber')
vector = response['embedding']  # 1024 dimensiones
```

## Referencias
- [[agentes/ollama/2026-06-23-ollama-guia-seleccion]]
- [[agentes/ollama/2026-06-23-ollama-rag-investigacion]]
