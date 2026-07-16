---
title: Estado Isla Seguridad
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:06 CEST
ruta: docs/islas/ESTADO-ISLA-SEGURIDAD.md
tags: [isla, seguridad, estado, secops]
status: auditada
---

# 🛡️ Estado Isla Seguridad

> Auditada en sesión 2026-07-16 vía SSH directo a Madre.
> Fuente de verdad: issues en [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops)

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 Parcialmente auditada |
| **Repo principal** | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) |
| **Ruta física en Madre** | `/home/varopc/yggdrasil-secops` |
| **Compose activo** | `docker-compose.maestro.yml` |
| **Última auditoría** | 2026-07-16 16:06 CEST |
| **Issues abiertos** | 6 |
| **HALs activos** | HAL-001, HAL-002, HAL-003, HAL-004, HAL-005 |

---

## Servicios — estado real verificado 2026-07-16

| Servicio | Estado real | Notas |
|---|---|---|
| `yggdrasil_watchdog` | ✅ Up 2d healthy | Antes sin auditar — ahora confirmado activo |
| `tailscale_monitor` | ✅ Up 2d healthy | HAL-004 — candidato a cerrar si lleva >7d |
| `log_guardian_bot` | ✅ Up 2d healthy | Bug anterior resuelto — issue #2 cerrar |
| `network_radar` | ✅ Up 2d healthy | Antes sin auditar — ahora confirmado activo |
| `local_tripwire` | 🟡 Up 4min (health: starting) | Recién reiniciado — verificar en 5min |
| `guardian_bot` | ✅ Up 2d healthy | Antes sin auditar — ahora confirmado activo |
| `radar_backup` | ✅ Up 2d | Sin healthcheck — SMART PASSED hoy |

---

## SMART disco — verificado 2026-07-16

| Check | Resultado |
|---|---|
| **SMART overall-health** | ✅ PASSED |
| **Riesgo inmediato** | 🟢 No |
| **Acción** | Monitorizar — disco con horas elevadas (~28.000h) pero sin fallos activos |

---

## Puerto 21 FTP — verificado 2026-07-16

| Check | Resultado |
|---|---|
| Puerto 21 en Madre | ✅ NO escucha — `ss -tlnp` sin output |
| **Conclusión** | Issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) / HAL-001 es a nivel **router Digi**, no Madre |
| **Acción pendiente** | Cerrar puerto en panel router Digi + verificar con nmap externo |

---

## Issues activos por prioridad

| # | Título | Severidad | Estado 2026-07-16 |
|---|---|---|---|
| [#7](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/7) | HAL-005: HDD WD 1TB ~28.000h | 🔴 Crítica | SMART PASSED — monitorizar |
| [#3](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/3) | HAL-001: Puerto 21 FTP router Digi | 🔴 Alta | No en Madre — acción en router |
| [#4](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/4) | HAL-002: Vaultwarden exposición | 🔴 Alta | Pendiente auditar |
| [#5](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/5) | HAL-003: Token Telegram sin rotación | 🔴 Alta | Pendiente — isla THDORA |
| [#2](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/2) | Crash-loop log_guardian_bot | ⚠️ Bug | 🟢 Resuelto — healthy 2d |
| [#8](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/8) | MCP conector intermitente | ℹ️ Backlog | Pendiente |

---

## Hallazgos nuevos 2026-07-16

| Contenedor | Issue nuevo | Descripción |
|---|---|---|
| `open-webui` | ⚠️ Sin issue | Estado unhealthy — revisar logs |
| `qdrant` | ⚠️ Sin issue | Estado unhealthy — revisar logs |
| `yggdrasil-mcp` | ⚠️ Sin issue | Estado `Created` — no está corriendo |
| `thdora-bot` | 🟡 Monitorizar | health: starting al momento de auditoría |

---

## Plan de cierre actualizado

### Pendiente con terminal
- [ ] Cerrar puerto 21 en router Digi + verificar con `nmap -p 21 <IP-publica>`
- [ ] `docker logs open-webui` + `docker logs qdrant` — diagnosticar unhealthy
- [ ] `docker start yggdrasil-mcp` o investigar por qué está en Created
- [ ] Auditar Vaultwarden (HAL-002)
- [ ] Rotar token Telegram THDORA (HAL-003) — coordinar con isla THDORA

### Candidatos a cerrar
- [ ] Issue #2 log_guardian_bot — llevar 2d healthy → cerrar
- [ ] HAL-004 tailscale_monitor — llevar 2d+ healthy → cerrar

---

## Dependencias con otras islas

| Dependencia | Isla destino | Issue/HAL | Tipo |
|---|---|---|---|
| `radar_backup` depende del HDD de Madre | Infra | HAL-005 | Infraestructura |
| Token Telegram THDORA sin rotación | THDORA | HAL-003 | Fix en otra isla |
| Vaultwarden gestiona credenciales del ecosistema | Todas | HAL-002 | Servicio transversal |
| open-webui + qdrant unhealthy | IA-Local | — | Nueva dependencia |

---

_Actualizado: 2026-07-16 16:06 CEST · Auditoría SSH directa · Perplexity MCP_
