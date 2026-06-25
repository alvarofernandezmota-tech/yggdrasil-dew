---
tags: [adr, arquitectura, qdrant, vectordb]
fecha: 2026-06-25
estado: aceptado
---

# ADR-001: Selección de Base de Datos Vectorial

## Contexto

Necesitaba una base de datos vectorial para el sistema RAG (Retrieval Augmented Generation) de la Batcueva, integrado con Ollama y los agentes de THDORA.

## Opciones consideradas

| Opción | Pros | Contras |
|--------|------|---------|
| **Qdrant** | Rust (rápido), Docker oficial, API REST limpia | Más RAM en arranque |
| ChromaDB | Simple, Python nativo | Menos performante en búsquedas |
| Weaviate | Muy completo | Pesado, complejo de configurar |
| pgvector | Ya en Postgres | Requiere tuning SQL |

## Decisión

**Qdrant** en contenedor Docker en puerto 6333.

## Justificación

- Performance superior en búsquedas ANN (Approximate Nearest Neighbor)
- Imagen Docker oficial y bien mantenida
- API REST + gRPC — compatible con LangChain, LlamaIndex y n8n
- Comunidad activa y documentación excelente

## Consecuencias

- Consume ~300MB RAM en idle en Madre (16GB — asumible)
- Dependencia de volumen persistente `qdrant-data` — no borrar nunca con `-v`
- Si se migra a Acer, reindexar embeddings

---
_Decidido por: alvarofernandezmota-tech | Fecha: 2026-06-25_
