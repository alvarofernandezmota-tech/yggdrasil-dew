---
title: Estado Isla Infra
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:06 CEST
ruta: docs/islas/ESTADO-ISLA-INFRA.md
tags: [isla, infra, estado, madre, ssh, docker]
status: auditada
---

# 🏗️ Estado Isla Infra

> Auditada en sesión 2026-07-16 vía SSH directo a Madre.
> Fuente de verdad: issues en [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) + `docs/inventario-madre.md`

---

## Nodo Madre — estado verificado 2026-07-16

| Parámetro | Valor |
|---|---|
| **Hostname** | `varpc` |
| **OS** | Arch Linux kernel 7.0.9-arch2-1 |
| **IP Tailscale** | `100.91.112.32` |
| **Usuario principal** | `varopc` |
| **Home** | `/home/varopc/` |
| **Proyectos** | `/home/varopc/Projects/` |
| **Estado general** | ✅ Operativo |
| **Última auditoría** | 2026-07-16 16:06 CEST |

---

## Acceso SSH canónico

```bash
ssh varopc@100.91.112.32
```

> Puerto 22 estándar activo en 0.0.0.0:22 y [::]:22 (sshd pid=889).
> Puerto 2222 también expuesto vía docker-proxy — pertenece a Gitea.

---

## RAM — verificado 2026-07-16

| | Total | Usado | Libre | Disponible |
|---|---|---|---|---|
| **Mem** | 15 Gi | 7.0 Gi | 298 Mi | 8.6 Gi |
| **Swap** | 19 Gi | 5.7 Gi | 13 Gi | — |

> Swap con 5.7 Gi usados — sistema bajo presión de memoria. A monitorizar.

---

## Disco — SMART verificado 2026-07-16

| Check | Resultado |
|---|---|
| **SMART overall-health** | ✅ PASSED |
| **Riesgo inmediato** | 🟢 No |
| **Issue asociado** | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) HAL-005 HDD ~28.000h — monitorizar |

> SMART pasa pero el disco tiene horas elevadas. Ejecutar `smartctl -a /dev/sda` periódicamente.

---

## Puerto 21 FTP — verificado 2026-07-16

| Check | Resultado |
|---|---|
| `ss -tlnp \| grep :21` | ✅ Sin output — puerto 21 NO escucha en Madre |
| **Conclusión** | El issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) es a nivel router Digi, no Madre |

---

## Contenedores Docker activos — verificado 2026-07-16

| Contenedor | Estado | Imagen | Isla |
|---|---|---|---|
| `thdora` | ✅ Up 2d healthy | thdora-thdora | THDORA |
| `thdora-bot` | 🟡 Up (health: starting) | thdora-bot | THDORA |
| `local_tripwire` | 🟡 Up 4min (health: starting) | yggdrasil-secops | Seguridad |
| `radar_backup` | ✅ Up 2d | alpine:latest | Seguridad |
| `guardian_bot` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `yggdrasil_watchdog` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `network_radar` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `log_guardian_bot` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `tailscale_monitor` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `grafana` | ✅ Up 2d | grafana/grafana:10.4.2 | Infra |
| `prometheus` | ✅ Up 2d | prom/prometheus:v2.51.2 | Infra |
| `yggdrasil-mcp` | ⚪ Created (no running) | mcp-server | MCP |
| `open-webui` | 🔴 Up 2d unhealthy | open-webui:main | IA-Local |
| `qdrant` | 🔴 Up 2d unhealthy | qdrant/qdrant:latest | IA-Local |
| `ollama` | ✅ Up 2d healthy | ollama/ollama:latest | IA-Local |
| `ollama-embeddings` | ✅ Up 2d healthy | ollama/ollama:latest | IA-Local |
| `kali-pentest` | ✅ Up 2d | kasmweb/kali-rolling | Labs |
| `spiderfoot` | ✅ Up 2d | spiderfoot | Labs |
| `code-server` | ✅ Up 2d | linuxserver/code-server | Infra |
| `n8n` | ✅ Up 2d | n8nio/n8n:latest | Infra |
| `gitea` | ✅ Up 2d | gitea/gitea:latest | Infra |
| `uptime-kuma` | ✅ Up 2d healthy | louislam/uptime-kuma:1 | Infra |
| `portainer` | ✅ Up 2d | portainer/portainer-ce | Infra |

**Total: 23 contenedores** · 18 healthy/up · 2 unhealthy · 2 health:starting · 1 created

---

## Issues activos

| Issue | Descripción | Estado |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 HDD Madre ~28.000h | 🟡 SMART PASSED — monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | 🟡 No en Madre — está en router Digi |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | Mapear stacks restantes | 🔵 Pendiente |

---

## Dependencias con otras islas

| Dependencia | Isla | Criticidad |
|---|---|---|
| Madre es el host físico de todos los servicios | Todas | 🔴 Crítica |
| HDD en riesgo (HAL-005) afecta radar_backup | Seguridad | 🔴 Alta |
| open-webui + qdrant unhealthy | IA-Local | 🟡 Media |

---

_Actualizado: 2026-07-16 16:06 CEST · Auditoría SSH directa · Perplexity MCP_
