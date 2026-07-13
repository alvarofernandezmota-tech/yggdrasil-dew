---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, adr, gobernanza, decisiones]
status: vigente
---

# Protocolo ADR — Cómo registrar una decisión de arquitectura

> Usar cuando se toma una decisión técnica o estructural importante que afecta al ecosistema.

## Cuándo abrir una ADR

- Cambio en la estructura de un repo
- Decisión sobre qué herramienta usar para algo recurrente
- Cambio en cómo fluye la información entre repos
- Cualquier decisión que si no se documenta se volverá a debatir

## Numeración

Siguiente número disponible: ver `docs/` en DEW y buscar el último `ADR-NNN`.

## Frontmatter obligatorio

```yaml
---
tipo: ADR
numero: ADR-NNN
titulo: <titulo descriptivo>
fecha: YYYY-MM-DD
status: propuesto  # propuesto | aceptado | obsoleto | supersedido-por: ADR-NNN
author: Alvaro Fernandez Mota
tags: [ADR, <dominio>]
---
```

## Secciones obligatorias

```markdown
## Contexto
¿Por qué se está tomando esta decisión? ¿Qué problema resuelve?

## Decisión
¿Qué se decide hacer?

## Consecuencias
¿Qué cambia? ¿Qué obligaciones crea?

## Refs
Issues relacionados, diario del día
```

## Al publicar

1. Crear `docs/ADR-NNN-<nombre-kebab>.md` en DEW
2. Commit: `docs(#N): ADR-NNN <titulo>`
3. Si hay issue asociado → cerrarlo con referencia al ADR

## ADRs existentes

Ver `docs/` en `yggdrasil-dew` para el historial completo.

---
_Creado: 2026-07-13 · Perplexity MCP_
