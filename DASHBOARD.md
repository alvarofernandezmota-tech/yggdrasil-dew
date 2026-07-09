---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-09 16:36 CEST
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
| [PLAN-ALINEACION-2026-07.md](./PLAN-ALINEACION-2026-07.md) | Estructura Dew + WIKI | ⚠️ CASI completo — ADR-005/006 sin indexar → Issue [#33](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/33) |
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

## Completado sesión 2026-07-09 ✅

- [x] Token Telegram THDORA rotado
- [x] Symlinks `~/repos/thdora` y `~/repos/yggdrasil-secops` creados
- [x] Archivos basura 0-bytes THDORA limpiados
- [x] `ownership-matrix.md` actualizado
- [x] `MAPA-REPOS-MADRE.md` actualizado
- [x] Fichas de auditoría `thdora-personal.md` y `yggdrasil-secops.md` creadas
- [x] `PLANTILLA-REPO-ONBOARDING.md` creada
- [x] `yggdrasil-secops` → privado ✅ [Issue #29](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/29)
- [x] GitHub Project `Yggdrasil` creado — Issues migrados al tablero
- [x] `DASHBOARD.md` migrado a modelo empresa (Issues como fuente de verdad)

---

## Sin prisa (próximas sesiones)

- Documentar internamente `thdora-personal` y `yggdrasil-secops` (README/CONTEXT/AGENT/ECOSYSTEM)
- Fase 2 secops: purga duplicados internos
- Fase 3 secops: alinear gobernanza con Dew
- Tier 3: logging estructurado Thdora
- Tier 4: BATS testing scripts críticos
- Tier 5: Ansible en Acer para Madre
- Workflow sync automático WIKI←Dew
- MCP Server de Madre

---

## Herramientas de verificación

| Herramienta | Cómo ejecutar |
|---|---|
| `check-ecosistema.py` | `python3 check-ecosistema.py` en Madre |
| CI `validate-canon.yml` | Automático en cada push |
| CI `gitleaks.yml` | Automático en cada push |
| `docs/canon/RUNBOOKS.md` | Consultar antes de improvisar |

---

## Regla de oro

> Las tareas viven en GitHub Issues — no en este archivo.
> Si surge algo nuevo → abrir Issue primero.
> El Project es el dashboard real. Este documento es el mapa de fases.

---

_Actualizado: 2026-07-09 16:36 CEST · Perplexity-MCP · migración a GitHub Project_
