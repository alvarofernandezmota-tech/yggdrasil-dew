---
tags: [ollama, guia, seleccion, modelos, vram, gtx1060]
fecha: 2026-06-23
estado: activo
tipo: guia
ruta-obsidian: agentes/ollama/2026-06-23-ollama-guia-seleccion.md
fuente: inbox/2026-06-23-ollama-guia-seleccion.md
---

# Guía selección modelos Ollama — GTX 1060 6GB

## Restricción de hardware

- VRAM disponible: 6GB
- LLM + embedding model NO pueden coexistir si suman > 5.5GB
- Solución: usar modelos pequeños de embeddings + LLM moderado

## Combinaciones recomendadas

| Modo | LLM | Embedding | VRAM total |
|---|---|---|---|
| 🟢 Recomendado | qwen2.5:3b (2GB) | bge-m3 (1GB) | ~3GB |
| 🟡 General | qwen2.5:7b (4.5GB) | nomic (0.5GB) | ~5GB |
| 🔴 Potente | qwen2.5:14b offload | bge-m3 | >6GB (swap) |
| ⚡ API ext. | Groq qwen2.5-72b | bge-m3 local | ~1GB |

## Regla de oro

> Para RAG: usa bge-m3 para embeddings, qwen2.5:3b para queries rápidas.
> Para conversación larga: qwen2.5:7b + nomic-embed-text.
> Para potencia sin límites: Groq API (key ya disponible en thdora).

## Referencias
- [[agentes/ollama/2026-06-23-ollama-bge-m3]]
- [[agentes/ollama/2026-06-23-ollama-rag-investigacion]]
