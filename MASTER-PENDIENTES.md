---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-13
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-13 18:40 CEST.
> Actualizar al inicio y cierre de cada sesión.

---

## Estado de Fases de Alineación

| Fase | Descripcion | Estado | Notas |
|---|---|---|---|
| **F0** | Seguridad repos (privado, SSH, puerto 21) | ⚪ Parcial | secops privado ✅ · SSH/puerto21 pendiente terminal |
| **F1** | Canon ADRs (ADR-001→010 + INDEX.md) | ✅ CERRADA | Commit 4ed2f42e |
| **F2** | Unificar índices WIKI (punteros a INDEX.md) | ✅ CERRADA | README + HOME ya OK · tabla repos actualizada |
| **F3** | Purga WIKI 279→80 archivos | ⚪ PENDIENTE | Requiere sesión dedicada con Álvaro |
| **F4** | Consolidar MCP → wiki/islas/mcp.md | ✅ CERRADA | Verificado — mcp.md existe 4.2KB |
| **F5** | CI enforcement (gitleaks + validate-canon) | ✅ CERRADA | Commit 1cbd1f10 |
| **F6** | Ritual semanal checklist | 📌 DEFINIDO | Escrito en PLAN-MAESTRO · pendiente primera ejecución |
| **F7** | GitOps/Observabilidad (.env, healthchecks, Loki) | 🔵 PARCIAL | .env.template ✅ · env-checker ✅ · DRP ✅ · healthchecks docker ❌ · Loki ❌ |

---

## Bloques de trabajo sesion 13-Jul (TODOS CERRADOS ✅)

| Bloque | Descripcion | Estado |
|---|---|---|
| B1 | 5 ESTADO-ISLA (Tracking, Scripts, Acer, Formacion, Formacion-Legacy) | ✅ |
| B2 | Borrar archivos zombi recreados (4 archivos) | ✅ |
| B3 | MAPA-ISLAS-DEPENDENCIAS actualizado (12 islas) | ✅ |
| B4 | NORMA-ENTRADA-NUEVA-ISLA.md creada en docs/canon/ | ✅ |

---

## Issues abiertos (dew) al 13-Jul

> Ver listado completo en [Issues](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues)

| Prioridad | Issue | Titulo | Isla |
|---|---|---|---|
| 🔴🔴 | HAL-005 / secops#7 | Backup HDD Madre critico | Infra + Seguridad |
| 🔴 | HAL-003 / secops#5 | Token Telegram THDORA expuesto | THDORA + Seguridad |
| 🔴 | HAL-002 / secops#4 | Vaultwarden sin backup | Seguridad |
| 🟠 | #51 | Acer — auditoría isla | Acer |
| 🟠 | #54 | Formación — auditoría post-migración | Formación |

---

## Pendiente próxima sesión (martes 14-Jul)

1. **F3** — Purga WIKI: sesión dedicada, revisar los 279 archivos con Álvaro y decidir qué conservar
2. **F7 completar** — healthchecks docker + Loki (no requiere Álvaro, MCP puede ejecutarlo)
3. **Auditoría Infra** (madre-config) — desbloquea HAL-005
4. **PRIMER PROYECTO REAL** 🚀 — Álvaro decide cuál

---

## Normas añadidas hoy (2026-07-13)

| Regla nueva | Resumen |
|---|---|
| **Regla de zombis** | Ningun archivo vacio puede existir · revision en cada cierre |
| **Regla de nueva isla** | Checklist 5 pasos antes de integrar repo |
| **Regla de sesión** | Toda sesión genera diario + MASTER-PENDIENTES al dia |
| **Regla de fronteras personales/tecnicas** | Vida personal → tracking · tecnico → formacion · nunca mezclar |

---

_Actualizado: 2026-07-13 18:40 CEST · Cierre sesión tarde · Perplexity MCP_
