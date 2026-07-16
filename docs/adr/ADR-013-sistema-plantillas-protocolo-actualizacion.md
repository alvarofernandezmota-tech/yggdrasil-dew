---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/adr/ADR-013-sistema-plantillas-protocolo-actualizacion.md
tags: [adr, plantillas, protocolos, actualizacion, cascada, arquitectura, f15]
status: vigente
---

# ADR-013 — Sistema de plantillas + protocolo de actualización en cascada

## Contexto

El ecosistema Yggdrasil crece de forma continua. Hasta ahora cada archivo nuevo
nacía con estructura ad-hoc, lo que generaba:

- Inconsistencias de frontmatter detectadas en auditorías (fix #65)
- Propagación manual de cambios de nombre a 17+ archivos (fix #65)
- Ausencia de un mecanismo formal para decir "cambié X, ¿qué más hay que tocar?"

Referencias externas consultadas:
- **MADR** (Markdown Architectural Decision Records) — [adr.github.io](https://adr.github.io/adr-templates/) [web:449]
- **joelparkerhenderson/architecture-decision-record** — estándar de facto en GitHub [web:445]
- **Microsoft Well-Architected Framework ADR guide** — status: proposed/accepted/superseded [web:442]
- **Runbook best practices** (IdeaPlan/em-tools) — "escríbelo primero, automatiza después" [web:431]
- **Docs-as-Code / Single Source of Truth** — git como fuente única [web:450]

---

## Problema

Sin plantillas canónicas y sin protocolo de actualización:
1. Cada archivo nuevo tiene frontmatter diferente → las auditorías fallan
2. Un cambio de nombre en un repo se propaga manualmente y siempre queda alguno sin corregir
3. El agente (Perplexity MCP) no tiene instrucciones formales de qué tocar cuando algo cambia

---

## Decisión

### 1. Sistema de plantillas por tipo de contenido

Una plantilla por cada tipo de archivo que puede entrar al ecosistema:

| Plantilla | Ruta | Aplica a |
|---|---|---|
| `PLANTILLA-DIARIO-DEW.md` | `docs/canon/` | Diarios técnicos de sesión en DEW |
| `PLANTILLA-DIARIO-TRACKING.md` | `docs/canon/` | Diarios personales en yggdrasil-tracking |
| `PLANTILLA-ISLA-WIKI.md` | `docs/canon/` | Islas temáticas en yggdrasil-wiki |
| `PLANTILLA-APUNTE-FORMACION.md` | `docs/canon/` | Apuntes/cursos en yggdrasil-formacion |
| `PLANTILLA-ADR.md` | `docs/canon/` | ADRs en docs/adr/ |
| `PLANTILLA-PROTOCOLO.md` | `docs/canon/` | Protocolos en protocolo/ |
| `PLANTILLA-ESTADO-ISLA.md` | `docs/canon/` | ESTADO-ISLA-*.md en docs/islas/ |

Regla: **ningún archivo nuevo entra sin copiar su plantilla**. Si no hay plantilla para ese tipo → crear la plantilla antes de crear el archivo (genera un ADR si es un tipo nuevo).

### 2. Protocolo de actualización en cascada

Cada vez que algo cambia en el ecosistema, el agente ejecuta
`PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md` que define exactamente qué tocar
según el tipo de cambio. Ver el protocolo para la tabla de propagación.

### 3. Arquitectura de 4 tipos de protocolo por repo

```
CONTEXTO     → carga el estado del repo al inicio de sesión
AUDITORIA    → verifica consistencia completa del repo
ACTUALIZACION → propaga cambios en cascada cuando algo cambia
DOCUMENTACION → entrada formal de elementos nuevos al ecosistema
```

Los protocolos individuales por repo son orquestados por protocolos globales de ecosistema.

---

## Alternativas consideradas

**A (rechazada): documentar en el README de cada repo**
- Contra: se duplica, se desactualiza, no hay mecanismo de propagación

**B (rechazada): usar Obsidian + Dataview para templates automáticos**
- Contra: añade dependencia de herramienta externa, el ecosistema es git-native [web:433]

**C (adoptada): plantillas Markdown en docs/canon/ + protocolo de actualización**
- Pro: git-native, sin dependencias externas, el agente puede copiarlas directamente
- Pro: alineado con Docs-as-Code / Single Source of Truth [web:450]
- Pro: compatible con el flujo MCP actual

---

## Consecuencias

- Toda sesión nueva copia la plantilla correspondiente → frontmatter siempre correcto
- Toda actualización de nombre/repo sigue el protocolo → propagación completa garantizada
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md se ejecuta siempre que hay cambio estructural
- NORMA-ENTRADA-NUEVA-ISLA.md sigue vigente — este ADR la complementa con plantillas
- F15 añadida a MASTER-PENDIENTES como fase formal

---

## Relacionado

- ADR-008: toda decisión de arquitectura genera ADR
- ADR-011: separación tracking/formacion
- ADR-012: protocolo cierre de sesión
- NORMA-ENTRADA-NUEVA-ISLA.md: checklist de entrada de repos nuevos
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md: la implementación de la cascada

---

_Creado: 2026-07-16 · F15 · alineado MADR + joelparkerhenderson + MS-WAF · Perplexity MCP_
