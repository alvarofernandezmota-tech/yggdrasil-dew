---
tipo: indice
author: Alvaro Fernandez Mota
actualizado: 2026-07-13
tags: [adr, indice, decisiones]
---

# Índice de ADRs — Yggdrasil

> Toda decisión arquitectural o de gobernanza tiene su ADR aquí.
> Un ADR nunca se borra — si cambia, se marca `superado` y se crea uno nuevo.

---

## ADRs activos

| ID | Título | Fecha | Estado | Principio |
|----|--------|-------|--------|-----------|
| [ADR-001](ADR-001-estructura-ecosistema.md) | Estructura del ecosistema multi-repo | 2026-07-02 | ✅ Aceptado | Soberanía digital |
| [ADR-002](ADR-002-triangulo-dew-wiki-vida.md) | Triángulo DEW ↔ Wiki ↔ VIDAPERSONAL | 2026-07-05 | ✅ Aceptado | Un solo punto de verdad |
| [ADR-003](ADR-003-convencion-islas.md) | Convención de islas en la Wiki | 2026-07-09 | ✅ Aceptado | Sistemas que perduran |
| [ADR-004](ADR-004-mcp-como-capa-infraestructura.md) | MCP como capa de infraestructura | 2026-07-13 | ✅ Aceptado | Automatizar lo repetible |
| [ADR-005](ADR-005-normas-tridente-dew-wiki-vidapersonal.md) | Normas del Tridente — qué va en cada vértice | 2026-07-13 | ✅ Aceptado | Un solo punto de verdad |
| [ADR-006](ADR-006-sesion-log-como-artefacto.md) | Logs de sesión como artefactos de primer nivel | 2026-07-13 | ✅ Aceptado | Transparencia interna |
| [ADR-007](ADR-007-isla-mcp-propia.md) | MCP tiene isla propia en la Wiki | 2026-07-13 | ✅ Aceptado | Un solo punto de verdad |
| [ADR-008](ADR-008-adr-obligatorio-por-decision.md) | Toda decisión arquitectural requiere ADR | 2026-07-13 | ✅ Aceptado | Transparencia interna |

---

## Principios fundacionales relacionados

| Principio | ADRs que lo materializan |
|-----------|-------------------------|
| Soberanía digital | ADR-001 |
| Un solo punto de verdad | ADR-002, ADR-005, ADR-007 |
| Transparencia interna | ADR-006, ADR-008 |
| Automatizar lo repetible | ADR-004 |
| Sistemas que perduran | ADR-003 |
| Deuda visible | (pendiente: ADR sobre gestibn de HALs) |

---

_Actualizado: 2026-07-13 · Perplexity-MCP_
