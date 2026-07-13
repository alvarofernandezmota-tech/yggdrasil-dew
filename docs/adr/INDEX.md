---
tipo: index
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/adr/INDEX.md
tags: [adr, decisiones, arquitectura, canon]
status: vigente
---

# 📐 ADR Index — Decisiones de Arquitectura

> Una ADR (Architecture Decision Record) documenta UNA decisión de diseño significativa: qué se decidió, por qué, y qué alternativas se descartaron.
> Este índice es el punto de entrada. Nunca borrar ADRs — si una decisión cambia, se crea una nueva ADR que supercede la anterior.

---

## Índice

| # | Título | Estado | Fecha | Supercede |
|---|--------|--------|-------|-----------|
| [ADR-001](ADR-001-estructura-ecosistema.md) | Estructura canónica del ecosistema Yggdrasil | ✅ Vigente | 2026-07-05 | — |
| [ADR-002](ADR-002-triangulo-dew-wiki-vida.md) | Triángulo maestro DEW ↔ WIKI ↔ VIDAPERSONAL | ✅ Vigente | 2026-07-12 | — |
| [ADR-003](ADR-003-convencion-islas.md) | Convención de islas como unidad de organización | ✅ Vigente | 2026-07-09 | — |

---

## Cuándo crear una ADR

- Decides usar una tecnología, framework o herramienta específica
- Defines una convención de naming, estructura o gobernanza
- Eliges una arquitectura de sistema (monolito vs. microservicios, etc.)
- Cambias algo que ya estaba decidido antes
- Descartas una alternativa viable de forma consciente

## Cuándo NO crear una ADR

- Decisiones reversibles sin impacto estructural
- Tareas operativas (esas van a Issues)
- Preferencias estéticas sin consecuencias de sistema

---

## Plantilla

```markdown
---
tipo: adr
numero: ADR-XXX
titulo: Título corto
estado: Propuesta | Vigente | Superada | Deprecada
fecha: YYYY-MM-DD
author: Alvaro Fernandez Mota
supercede: —
superada_por: —
---

# ADR-XXX — Título

## Contexto
Situación que motivó esta decisión.

## Decisión
Qué se decidió exactamente, en una frase.

## Alternativas consideradas
| Alternativa | Por qué se descartó |
|---|---|
| ... | ... |

## Consecuencias
- **Positivas:** ...
- **Negativas / trade-offs:** ...

## Referencias
- Issues relacionados
- Sesión / fecha de la decisión
```

---

_Creado: 2026-07-13 · Fase 1 plan maestro · Perplexity-MCP_
