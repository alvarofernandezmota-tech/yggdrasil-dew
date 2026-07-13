---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, wiki, isla, gobernanza]
status: vigente
---

# Protocolo Nueva Isla en Wiki

> Al crear una isla nueva en `WIKI---PERSONAL`.

## Cuándo crear una isla

- Nuevo hardware en el ecosistema
- Nuevo servicio importante en Madre
- Nuevo dominio de conocimiento recurrente
- Cuando un tema aparece en 3+ diarios o sesiones

## Pasos

1. Crear archivo en `wiki/islas/<nombre>.md`
2. Frontmatter obligatorio:
   ```yaml
   ---
   tipo: isla
   nombre: <Nombre legible>
   tags: [tag1, tag2]
   status: activo  # activo | borrador | obsoleto | archivado
   creado: YYYY-MM-DD
   actualizado: YYYY-MM-DD
   ---
   ```
3. Secciones mínimas:
   - `## Qué es` — descripción en 2-3 líneas
   - `## Rol en el ecosistema` — cómo encaja con el resto
   - `## Estado actual` — qué está funcionando, qué no
   - `## Refs` — links a repos, issues DEW, otras islas
4. Añadir entrada en `wiki/INDEX.md`
5. Si es hardware → enlazar desde isla `madre.md`
6. Commit: `feat(wiki): nueva isla <nombre>`

## Tamaño mínimo

Una isla nueva debe tener al menos **400 bytes de contenido real**. No crear islas stub vacías.

## Refs
- Issue #59 — purga wiki (objetivo <80 archivos)
- `PROTOCOLO-AUDITORIA-WIKI.md`

---
_Creado: 2026-07-13 · Perplexity MCP_
