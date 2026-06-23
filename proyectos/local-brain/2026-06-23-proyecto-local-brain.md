---
tags: [proyecto, local-brain, rag, ollama, qdrant, ia-local]
fecha: 2026-06-23
estado: en-progreso
tipo: proyecto
ruta-obsidian: proyectos/local-brain/2026-06-23-proyecto-local-brain.md
fuente: inbox/2026-06-23-proyecto-local-brain.md
---

# Proyecto local-brain

> El cerebro IA local: yggdrasil-dew indexado en Qdrant, consultable via Ollama.

## Objetivo

Poder hacer preguntas en lenguaje natural sobre el contenido del cerebro
(notas, docs, proyectos, diarios) y obtener respuestas contextualizadas.

## Arquitectura

```
yggdrasil-dew (Markdown)
        ↓
Chunking + Embeddings (bge-m3)
        ↓
Qdrant (vector store)
        ↓
RAG Query (qwen2.5:7b)
        ↓
Respuesta contextualizada
```

## Estado

- ✅ Qdrant en Docker (pendiente arrancar)
- ✅ bge-m3 disponible en Ollama
- 🔴 Script indexación pendiente
- 🔴 Script query pendiente

## Próximos pasos

- [ ] Script Python: chunking de Markdown
- [ ] Script Python: embeddings + push a Qdrant
- [ ] Script Python: query RAG
- [ ] Integrar en thdora como handler `/cerebro <pregunta>`

## Referencias
- [[setup/2026-06-23-local-brain-setup]]
- [[ollama/README]]
- [[proyectos/chatbot-control/README]]
