---
tags: [setup, local-brain, rag, ollama, qdrant]
fecha: 2026-06-23
estado: pendiente-ejecutar
ruta-obsidian: setup/2026-06-23-local-brain-setup.md
fuente: inbox/2026-06-23-local-brain-setup.md
---

# Setup Local Brain — Madre

> El cerebro local es el stack completo: Ollama + Qdrant + RAG sobre yggdrasil-dew.

## Stack requerido

| Componente | Función | Puerto |
|---|---|---|
| Ollama | LLM local (qwen2.5) | 11434 |
| Qdrant | Vector DB para RAG | 6333 |
| Open WebUI | Interfaz chat | 3000 |
| yggdrasil-dew | Fuente de conocimiento | — |

## Pasos de setup

### 1. Verificar stack Docker
```bash
docker ps | grep -E 'ollama|qdrant|open-webui'
```

### 2. Pull modelos en Ollama
```bash
docker exec -it ollama ollama pull qwen2.5:7b
docker exec -it ollama ollama pull qwen2.5:3b
docker exec -it ollama ollama pull bge-m3
docker exec -it ollama ollama pull nomic-embed-text
```

### 3. Crear colección RAG en Qdrant
```bash
curl -X PUT http://localhost:6333/collections/yggdrasil \
  -H 'Content-Type: application/json' \
  -d '{"vectors": {"size": 1024, "distance": "Cosine"}}'
```

### 4. Indexar yggdrasil-dew
- Clonar repo en Madre
- Script Python para chunking + embeddings + push a Qdrant
- Ver [[proyectos/local-brain/README]]

## Referencias
- [[ollama/README]]
- [[proyectos/local-brain/README]]
- [[setup/servidor/docker-stack]]
