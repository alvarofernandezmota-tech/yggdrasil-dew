---
tags: [ollama, modelo, embeddings, bge-m3, rag, vector]
fecha: 2026-06-23
tipo: ficha-modelo
categoria: embeddings
estado: pendiente-instalar
comando: ollama pull bge-m3
ruta-obsidian: ollama/modelos/bge-m3.md
---

# bge-m3 — Modelo de embeddings multilingüe

> Movido desde inbox/ · Ver [[inbox/2026-06-23-ollama-bge-m3]]

## Para qué sirve

bge-m3 es un modelo especializado en generar embeddings de texto de alta calidad.
Ideal para RAG (Retrieval Augmented Generation) — convierte texto en vectores
para búsqueda semántica en Qdrant.

## Uso en el ecosistema

- Indexar `yggdrasil-dew` para búsqueda semántica desde Open WebUI
- Pipeline RAG: documento → bge-m3 → vector → Qdrant → query → respuesta
- Multilingüe — funciona en español e inglés

## Comandos

```bash
# Instalar
ollama pull bge-m3

# Verificar
ollama list | grep bge

# Test embedding
curl http://localhost:11434/api/embeddings -d '{"model": "bge-m3", "prompt": "test"}'
```

## Ver también
- [[ollama/modelos/qwen2.5-7b]]
- [[ollama/arquitectura/rag-investigacion]]
- [[agentes/especializados-embeddings]]
