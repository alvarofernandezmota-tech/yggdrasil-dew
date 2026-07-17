---
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17
ruta: docs/islas/ESTADO-ISLA-MADRE-CONFIG.md
tags: [isla, madre, infra, docker, iac]
status: vigente
version: 1
---

# 🌍 Estado Isla — Madre Config (IaC)

## Identidad

| Campo | Valor |
|---|---|
| **Repo** | `madre-config` |
| **Visibilidad** | 🔒 Privado |
| **Estado** | 🔴 Bloqueada |
| **Última sesión** | 2026-07-05 |

---

## Estado actual

- 🔴 **16 docker-compose sin commitear** — IaC no versionada
- 🔴 Estructura del repo pendiente de definir
- ✅ Madre operativa con Docker stack funcional
- ⚠️ Cambios en Madre no rastreables — riesgo de pérdida tras reinstalación

---

## Servicios en Madre (estado 2026-07-16)

| Servicio | Estado |
|---|---|
| `thdora` | ✅ Up (healthy) |
| `thdora-bot` | ⚠️ Token pendiente |
| `qdrant` | 🟡 Unhealthy falso positivo — fix: `QDRANT__TELEMETRY_DISABLED=true` |
| `yggdrasil-mcp` | 🔴 Created/ExitCode 128 — puerto 3000 ocupado |
| `n8n` | ✅ Up |
| `guardian_bot` | ✅ Up (healthy) |
| `log_guardian_bot` | ⚠️ Estado desconocido |
| `local_tripwire` | ⚠️ Estado desconocido |
| `portainer` | ✅ Activo |
| `grafana` + `prometheus` | ✅ Activo |
| `nextcloud` + `vaultwarden` | ✅ Activo |
| `pi-hole` + `unbound` | ✅ Activo |
| `ollama` | ✅ :11434 — exposición internet sin verificar |

---

## Issues activos

| Issue | Descripción | Prioridad |
|---|---|---|
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | Versionar docker-compose en madre-config | 🔴 Alta |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant unhealthy falso positivo | 🟡 Fix trivial con terminal |
| [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) | yggdrasil-mcp no arranca | 🔴 Runbook listo |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD Madre 28k+ horas | 🔴 Sin datos smartctl |

---

## Próxima acción

Con terminal: fix qdrant (#71) → fix mcp (#75) → versionar composes (#43).

---

_v1 · 2026-07-17 · Perplexity MCP_
