---
id: 202406242254
fecha: 2026-06-24
tipo: proyecto
status: activo
repo: local-brain
tags: [proyecto, #repo/local-brain, docker, rag, embeddings]
sync: true
---

# Proyecto: local-brain

- **Repo**: [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) — privado
- **Descripción**: Cerebro cognitivo — RAG, embeddings, memoria vectorial, pipelines IA
- **Lenguaje**: Python + Docker

## Stack Docker
| Contenedor | Puerto | Rol |
|---|---|---|
| qdrant | 6333 | Base vectorial principal |
| postgres + pgvector | 5432 | BD con extensión vectorial |
| ollama (referencia) | 11434 | Via ollama-stack |
| litellm (referencia) | 4000 | Via ollama-stack |

## Estado
- ✅ Repo creado 24 jun 2026
- ⚠️ README mínimo — pendiente estructura completa
- ⚠️ Pendiente: pipelines RAG, scripts embeddings

## Links
- [[ECOSISTEMA]] · [[proyectos/ollama-stack/README]] · [[agentes/ollama/RAG]]
