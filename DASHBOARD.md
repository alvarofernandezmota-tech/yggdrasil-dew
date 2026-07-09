---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-09 23:04 CEST
ruta: DASHBOARD.md
tags: [dashboard, planes, estado, navegacion]
status: vigente
---

# 👁️ Dashboard — Ecosistema Yggdrasil

> Una página. Todo el contexto.
> Las tareas viven en GitHub Issues. Este documento es contexto de fases, no lista de to-dos.

---

## 🎯 Tablero de tareas (fuente de verdad)

**[→ GitHub Project: Yggdrasil](https://github.com/users/alvarofernandezmota-tech/projects/5/views/1)**

Todas las tareas activas, su estado y prioridad están ahí.
Los Issues se crean, actualizan y cierran desde GitHub o via MCP — nunca editando este archivo.

---

## Planes activos

| Plan | Qué resuelve | Fase actual |
|---|---|---|
| [PLAN-MAESTRO-2026-07.md](./PLAN-MAESTRO-2026-07.md) | Todo el ecosistema — 6 fases | 🟠 Fase 1 ✅ · Fase 2 pendiente · Fases 3-6 pendientes |
| [PLAN-ALINEACION-SECOPS-2026-07.md](./PLAN-ALINEACION-SECOPS-2026-07.md) | Estructura secops + colisión IDs | ✅ Rutas resueltas · ✅ secops en privado |
| [PLAN-DEUDA-TECNICA-2026-07.md](./PLAN-DEUDA-TECNICA-2026-07.md) | Token, puertos, logging, tests | 🟠 Tier 1 parcial — ver Issues [#30](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/30) [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) [#32](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/32) |
| [docs/canon/FASE6-MANTENIMIENTO.md](./docs/canon/FASE6-MANTENIMIENTO.md) | Mantenimiento permanente | ♾️ Activo siempre |

---

## Incidentes activos (HAL)

| ID | Problema | Issue | Estado |
|---|---|---|---|
| HAL-001/003 | Token Telegram THDORA expuesto | — | ✅ Rotado 2026-07-09 |
| HAL-006 | Tercera exposición secretos — `.env` completo | [#30](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/30) | 🔴 Pendiente |
| HAL-001💥 | Colisión IDs: HAL-001 en Dew Y en secops | — | 🔴 Sin resolver |
| HAL-005 | HDD Madre 28k+ horas — riesgo fallo | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | 🔴 Pendiente |
| — | `docs/pentesting/` y `docs/seguridad/` perdidos en secops | — | 🟡 Irrecuperable — documentado |

---

## ✅ Completado sesión 2026-07-09 NOCHE

- [x] WIKI---PERSONAL → **privado** ✅
- [x] `inbox/` WIKI borrada completamente ✅
- [x] `docs/` WIKI borrada completamente ✅
- [x] Stubs y duplicados `wiki/` eliminados (6 archivos) ✅
- [x] `diario-2026-07-06.md` movido a `docs/diarios/` en Dew ✅
- [x] Issues #24 (AUDIT-001) y #12 (inbox) cerradas ✅
- [x] 5 nuevas issues de auditoría creadas (#38-#42) ✅
- [x] PLAN-MAESTRO-2026-07.md creado en Dew ✅
- [x] ADR-005 y ADR-006 indexados ✅

## ✅ Completado sesión 2026-07-09 TARDE

- [x] Token Telegram THDORA rotado
- [x] Symlinks `~/repos/thdora` y `~/repos/yggdrasil-secops` creados
- [x] Archivos basura 0-bytes THDORA limpiados
- [x] `ownership-matrix.md` actualizado
- [x] `MAPA-REPOS-MADRE.md` actualizado
- [x] Fichas de auditoría `thdora-personal.md` y `yggdrasil-secops.md` creadas
- [x] `PLANTILLA-REPO-ONBOARDING.md` creada
- [x] `yggdrasil-secops` → privado ✅
- [x] GitHub Project `Yggdrasil` creado
- [x] `DASHBOARD.md` migrado a modelo empresa

---

## 🔴 Pendiente próxima sesión (por prioridad)

| # | Tarea | Prioridad |
|---|---|---|
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP cerrar | 🔴 Crítica |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD Madre smartctl | 🔴 Crítica |
| [#30](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/30) | HAL-006 secretos .env | 🔴 Crítica |
| Fase 2 WIKI | README/HOME → INDEX.md | 🟡 Alta |
| [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | CI secret-scan IPv4/email | 🟡 Alta |
| [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | Gitleaks en push | 🟡 Alta |
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | AUDIT-002 Dew completo | 🟠 Media |
| [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | AUDIT-005 agentes/MCP | 🟠 Media |
| [#41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41) | Diagrama C4 Mermaid | 🟠 Media |
| [#40](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/40) | Ownership matrix completa | 🟠 Media |
| [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | AUDIT-003 thdora-personal | 🔵 Baja |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | AUDIT-004 secops Fase 1 | 🔵 Baja |
| [#19](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/19) | Stack Wazuh/Suricata/Pihole | 🔵 Baja |

---

## Sin prisa (futuras sesiones)

- VIDAPERSONAL repo — auditar y alinear
- Fase 3 WIKI: purga 279 archivos (Fase 3 Plan Maestro)
- Tier 3: logging estructurado Thdora
- Tier 4: BATS testing scripts críticos
- Tier 5: Ansible en Acer para Madre
- Script `check-ecosistema.py` — Fase 6 Plan Maestro
- MCP Server de Madre

---

## Herramientas de verificación

| Herramienta | Cómo ejecutar |
|---|---|
| `check-ecosistema.py` | `python3 check-ecosistema.py` en Madre (pendiente crear) |
| CI `validate-canon.yml` | Automático en cada push |
| CI `gitleaks.yml` | Automático en cada push |
| `docs/canon/RUNBOOKS.md` | Consultar antes de improvisar |

---

## Regla de oro

> Las tareas viven en GitHub Issues — no en este archivo.
> Si surge algo nuevo → abrir Issue primero.
> El Project es el dashboard real. Este documento es el mapa de fases.

---

_Actualizado: 2026-07-09 23:04 CEST · Perplexity-MCP · sesión noche completa_
