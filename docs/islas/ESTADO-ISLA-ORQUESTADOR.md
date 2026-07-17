---
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17
ruta: docs/islas/ESTADO-ISLA-ORQUESTADOR.md
tags: [isla, orquestador, agentes, bootstrap, mcp, cerebro]
status: vigente
version: 1
---

# 🌍 Estado Isla — Orquestador (Cerebro IA)

## Identidad

| Campo | Valor |
|---|---|
| **Repo** | `yggdrasil-orquestador` |
| **Visibilidad** | 🟢 Público |
| **Estado** | 🟡 Recién creado |
| **Última sesión** | 2026-07-17 |
| **ADR origen** | ADR-014 |

---

## Propósito

Contexto cross-repo para agentes IA. Un agente nuevo lee `BOOTSTRAP.md` y tiene contexto completo del ecosistema Yggdrasil sin necesidad de explorar repo a repo.

---

## Estado actual

- ✅ Repo creado 2026-07-17
- ✅ `BOOTSTRAP.md` v1 — contexto completo del ecosistema
- ✅ `protocols/boot.md` v1.1 — contrato agente IA con orden de lectura real
- ✅ `AGENT.md` — instrucciones para agente en este repo
- ✅ `CONTEXT.md` — mapa del ecosistema
- 🟡 `BOOTSTRAP.md` v2 pendiente — requiere datos reales de terminal (#79)
- 🟡 `agents/` — instrucciones por isla pendientes de completar
- ⏳ CI `validate-canon.yml` pendiente

---

## Issues activos

| Issue | Descripción | Prioridad |
|---|---|---|
| [#79](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/79) | BOOTSTRAP.md v2 con datos terminal | ⏳ Pendiente terminal |

---

## Próxima acción

Con terminal: completar `BOOTSTRAP.md` v2 con inventario Madre real + estado Qdrant + confirmar islas. Luego CI.

---

_v1 · 2026-07-17 · Perplexity MCP · ADR-014_
