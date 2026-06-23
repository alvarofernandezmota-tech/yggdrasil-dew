---
tags: [ollama, auditoria, modelos, rag, local]
fecha: 2026-06-23
estado: pendiente-ejecutar
tipo: auditoria
ruta-obsidian: agentes/ollama/2026-06-23-auditoria-ollama.md
fuente: inbox/2026-06-23-auditoria-ollama.md
---

# Auditoría `ollama/` — plan de mejora

> Sesión 2026-06-23. Separación definitiva agentes/ vs ollama/ decidida.

## Regla definitiva

> `agentes/` = IAs externas con API
> `ollama/` = todo lo que corre local en Madre

## Estructura objetivo

```
ollama/
  README.md           ← índice modelos + estado Madre
  modelos/
    qwen2.5-7b.md
    qwen2.5-3b.md
    bge-m3.md
    nomic-embed-text.md
  rag/
    investigacion.md  ← resultados investigación Claude+Gemini
    implementacion.md
    qdrant.md
  guia-seleccion.md
  ecosistema-prep.md
```

## Modelos decididos para Madre (GTX 1060 6GB)

| Modelo | Uso | VRAM |
|---|---|---|
| qwen2.5:3b | tareas rápidas, agente inbox | ~2GB |
| qwen2.5:7b | uso general, RAG query | ~4.5GB |
| bge-m3 | embeddings RAG (mejor calidad) | ~1GB |
| nomic-embed-text | embeddings alternativos (más rápido) | ~0.5GB |

## Pasos

- [ ] Crear `ollama/README.md` con estado Madre
- [ ] Crear fichas de modelos con casos de uso
- [ ] Consolidar investigación RAG en `ollama/rag/`
- [ ] Eliminar fichas duplicadas en `agentes/`

## Referencias
- [[docs/adr/2026-06-23-adr-ollama-en-agentes]]
- [[setup/servidor/docker-stack]]
