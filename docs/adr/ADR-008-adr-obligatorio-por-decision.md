---
id: ADR-008
titulo: Toda decisión arquitectural o de gobernanza requiere ADR
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, gobernanza, meta]
principio: Transparencia interna
---

# ADR-008 — Toda decisión arquitectural requiere ADR

## Contexto

Durante las sesiones del 2026-07-09 al 2026-07-13 se tomaron múltiples decisiones (estructura de repos, uso de MCP, normas del tridente, separación de responsabilidades) que no quedaron formalizadas como ADR.

## Decisión

Toda decisión que afecte a:
- La estructura del ecosistema (repos, carpetas, convenciones)
- La asignación de responsabilidades entre herramientas o repos
- El uso de un agente IA o protocolo
- La filosofía operativa del sistema

...debe tener su ADR en `docs/adr/` con el formato estándar:
```
id, titulo, fecha, estado, author, tags, principio
## Contexto / ## Decisión / ## Consecuencias
```

## Consecuencias

- El INDEX.md de ADRs se actualiza en el mismo commit que el ADR
- Los ADRs se crean en la misma sesión en que se toma la decisión
- Un ADR nunca se borra — si la decisión cambia, se marca `estado: superado` y se crea uno nuevo

---
_Aceptado: 2026-07-13 · Principio: Transparencia interna_
