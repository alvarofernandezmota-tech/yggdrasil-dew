---
title: Índice de ADRs — Ecosistema Yggdrasil
tipo: indice
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/INDICE-ADR.md
tags: [indice, adr, canon, arquitectura]
status: vigente
---

# 📋 Índice de ADRs — Ecosistema Yggdrasil

> **¿Qué es un ADR?**  
> Architecture Decision Record — documento que registra UNA decisión técnica o de ecosistema: qué se decidió, por qué, qué alternativas se descartaron y qué consecuencias tiene.  
> Son **permanentes e inmutables** una vez en estado `vigente`. Si la decisión cambia, se crea un ADR nuevo que depreca al anterior.

> **¿Para qué sirven en este ecosistema?**  
> Para que cualquier persona (o yo mismo en 6 meses) entienda POR QUÉ el sistema está construido así, y para construir un portafolio técnico que demuestre que cada decisión tiene una razón y una alternativa evaluada. No se toman decisiones por inercia.

---

## Registro

| ID | Título | Estado | Fecha | Repo |
|----|--------|--------|-------|------|
| [ADR-001](./ADR-001-platform-stack.md) | Platform Stack de Madre | ✅ vigente | 2026-07-05 | yggdrasil-dew |
| [ADR-002](./ADR-002-seguridad-ecosistema.md) | Modelo de Seguridad del Ecosistema | ✅ vigente | 2026-07-06 | yggdrasil-dew |
| [ADR-003](./ADR-003-ia-local-rag.md) | Estrategia IA Local y RAG | ✅ vigente | 2026-07-06 | yggdrasil-dew |
| [ADR-004](./ADR-004-agentes-mcp.md) | Arquitectura de Agentes y MCP | ✅ vigente | 2026-07-06 | yggdrasil-dew |

---

## Estados posibles

| Estado | Significado |
|--------|-------------|
| 🟡 borrador | En redacción, no vinculante aún |
| ✅ vigente | Decisión activa, el sistema la sigue |
| ⚠️ deprecado | Superado por otro ADR (se indica cuál) |
| ❌ rechazado | Evaluado y descartado, se documenta por qué |

---

## Convención de nombres

```
ADR-NNN-titulo-kebab-case.md
```

- Numeración correlativa, nunca reutilizar un número
- Si una decisión cambia → nuevo ADR con referencia al anterior
- Un ADR = una decisión. Si hay dos decisiones → dos ADRs

---

_Actualizado: 2026-07-06 · Perplexity-MCP_
