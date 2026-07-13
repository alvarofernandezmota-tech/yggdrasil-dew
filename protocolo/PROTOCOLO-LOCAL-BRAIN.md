---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, local-brain, rag, ia, ecosistema]
status: borrador
---

# Protocolo Local Brain — Indexación RAG del Ecosistema

> Estado: BORRADOR — pendiente implementación de local-brain (#67)

## Qué es local-brain

El orquestador de conocimiento del ecosistema. Indexa los 4 repos en Qdrant y sirve contexto unificado a los agentes IA (Perplexity, TOKI, Claude, OpenCode).

Ver ADR completo en issue #67.

## Qué se indexa

| Repo | Qué entra | Prioridad |
|---|---|---|
| `yggdrasil-dew` | Protocolos, ADRs, issues cerrados | 🔴 Alta |
| `WIKI---PERSONAL` | Todas las islas activas | 🔴 Alta |
| `yggdrasil-tracking` | Diarios, filosofia/, metas/ | 🟡 Media |
| `yggdrasil-formacion` | Recursos, rutas de formación | 🟡 Media |

## Qué NO se indexa

- `_archivo/` — contenido obsoleto
- `.env`, secretos, credenciales
- Archivos binarios
- Diarios con contenido muy personal (decidir caso a caso)

## Al añadir un repo al ecosistema

1. Añadirlo al pipeline de indexación de local-brain
2. Verificar que tiene `README.md` y `AGENT.md` optimizados para RAG
3. Actualizar este protocolo con el nuevo repo

## Al añadir un archivo importante

Si el archivo debe estar disponible para los agentes inmediatamente:
1. Hacer push normal
2. Forzar re-indexación: `<comando pendiente implementación>`

## Refs
- Issue #67 — ADR-012 local-brain
- ADR-002 — alineación Tridente

---
_Creado: 2026-07-13 · Perplexity MCP_
