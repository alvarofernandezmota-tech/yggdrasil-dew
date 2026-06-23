---
tags: [prompt, claude, refactor, repo, obsidian, convenciones]
fecha: 2026-06-23
estado: listo-para-ejecutar
tipo: prompt-agente
agente: claude-sonnet
prioridad: ALTA
ruta-obsidian: agentes/prompts/2026-06-23-prompt-claude-refactor-repo.md
fuente: inbox/2026-06-23-prompt-claude-refactor-repo.md
---

# Prompt Claude — Refactor repo nivel ingeniero software

> Usar con Claude + acceso MCP a yggdrasil-dew.
> Transforma el repo al estándar v4.

## RAW PROMPT — COPIAR COMPLETO

```
Eres un ingeniero de software senior especializado en arquitectura de conocimiento.
Tienes acceso MCP al repo alvarofernandezmota-tech/yggdrasil-dew.

TAREAS (en orden):

1. AUDITAR pendientes:
   - Leer inbox/MASTER-PENDIENTES.md
   - Identificar tareas bloqueadas o duplicadas
   - Proponer consolidación

2. CREAR .obsidian/ workspace:
   - .obsidian/app.json — configuración base
   - .obsidian/graph.json — configuración grafo
   - Asegurar que inbox/ es carpeta por defecto

3. ACTUALIZAR HOME.md:
   - Índice de todas las carpetas
   - Estado actual del ecosistema
   - Links rápidos a proyectos activos

4. CREAR CONVENCIONES.md en raíz:
   - Naming conventions (fechas, slugs, tags)
   - Frontmatter obligatorio
   - Reglas de wikilinks
   - Flujo inbox → destino

5. ACTUALIZAR CONTEXT.md:
   - Estado real del repo post-auditoría
   - Estructura actual de carpetas
   - Proyectos activos

RESTRICCIONES:
- Un commit por tarea
- Nunca borrar contenido existente
- Wikilinks [[]] siempre
- Frontmatter YAML en todos los docs nuevos
```

## Referencias
- [[agentes/claude-sonnet-4.6]]
- [[HOME]]
- [[CONTEXT]]
