---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-13T18:55:00+02:00
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-13 18:55 CEST. Cierre de sesión completo.
> Actualizar al inicio y cierre de cada sesión.

---

## Estado de Fases de Alineación

| Fase | Descripcion | Estado | Notas |
|---|---|---|---|
| **F0** | Seguridad repos (privado, SSH, puerto 21) | ⚪ Parcial | secops privado ✅ · SSH/puerto21 pendiente terminal |
| **F1** | Canon ADRs (ADR-001→012 + INDEX.md) | ✅ CERRADA | 12 ADRs vigentes |
| **F2** | Unificar índices WIKI | ✅ CERRADA | README + HOME + INDEX.md OK |
| **F3** | Purga WIKI 279→80 archivos | ⚪ PENDIENTE | Requiere sesión dedicada con Álvaro |
| **F4** | Consolidar MCP → wiki/islas/mcp.md | ✅ CERRADA | Verificado — mcp.md existe |
| **F5** | CI enforcement (gitleaks + validate-canon) | ✅ CERRADA | Activo en yggdrasil-scripts |
| **F6** | Ritual semanal checklist | 📌 DEFINIDO | Pendiente primera ejecución (domingo) |
| **F7** | GitOps/Observabilidad | 🔵 PARCIAL | .env.template ✅ · DRP ✅ · healthchecks docker ❌ · Loki ❌ |
| **F8** | VIDAPERSONAL → tracking + formacion | ✅ CERRADA | ADR-011 · #48 cerrado · wiki actualizada |
| **F9** | Protocolo cierre sesión | ✅ CERRADA | ADR-012 · PROTOCOLO-CIERRE-SESION.md |

---

## Ejecutado tarde-4 sesión 13-Jul (18:40’19:00)

| Qué | Resultado |
|---|---|
| Issue #48 AUDIT-006 VIDAPERSONAL cerrado | ✅ |
| wiki/islas/tracking.md creada (isla nueva) | ✅ |
| wiki/islas/VIDAPERSONAL.md → redirect deprecado | ✅ |
| wiki/islas/INDEX.md actualizado (26 islas, tracking activa) | ✅ |
| ADR-011 separación tracking/formacion | ✅ |
| ADR-012 protocolo cierre sesión | ✅ |
| ADR-002 y ADR-005 actualizados (refs tracking) | ✅ |
| docs/adr/INDEX.md → 12 ADRs | ✅ |
| PROTOCOLO-CIERRE-SESION.md v2 — archivo por archivo | ✅ |
| ESTADO-SISTEMA.md al día (20 repos, 12 ADRs, 26 islas) | ✅ |
| Zombis raíz dew: 0 | ✅ |

---

## Issues abiertos prioritarios — 13-Jul 18:55

| Prioridad | Issue | Título | Requiere |
|---|---|---|---|
| 🔴🔴 | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 — HDD Madre 28k horas | Terminal |
| 🔴 | [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 — Token Telegram expuesto | Terminal |
| 🔴 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | HAL-009 — log_guardian crash | Depende #45 |
| 🔴 | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | Router |
| 🟠 | [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | IaC Madre — 16 servicios no versionados | Terminal |
| 🟡 | [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 — purga WIKI | MCP + Álvaro |
| 🟡 | [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 — healthchecks + Loki | MCP |
| 🟡 | [#61](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/61) | Diarios VIDAPERSONAL dispersos | Terminal (git mv) |

---

## Pendiente próxima sesión (martes 14-Jul)

1. 🔴 **Terminal primero** — #31 smartctl + #45 rotar token + #15 puerto 21
2. 🟡 **F3 purga WIKI** — sesión dedicada, qué conservar de los 279 archivos
3. 🟡 **F7 completar** — healthchecks docker + Loki (MCP solo)
4. 🚀 **PRIMER PROYECTO REAL** — Álvaro decide cuál

---

## Reglas establecidas hoy — 2026-07-13

| Regla | Dónde |
|---|---|
| Regla de zombis | NORMAS.md |
| Regla de nueva isla (5 pasos) | NORMA-ENTRADA-NUEVA-ISLA.md |
| Regla de sesión (diario obligatorio) | NORMAS.md |
| Regla de fronteras personales/técnicas | NORMAS.md |
| Protocolo de cierre archivo x archivo | PROTOCOLO-CIERRE-SESION.md |
| Propagación DEW→WIKI→repo operativo | ADR-012 |

---

_Actualizado: 2026-07-13 18:55 CEST · Cierre completo · Perplexity MCP_
