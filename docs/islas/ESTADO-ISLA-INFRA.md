---
title: Estado Isla Infra
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:15 CEST
ruta: docs/islas/ESTADO-ISLA-INFRA.md
tags: [isla, infra, estado, madre, ssh, docker]
status: auditada
---

# 🏗️ Estado Isla Infra

> Auditada en sesion 2026-07-16 via SSH directo a Madre + analisis de logs.
> Fuente de verdad: issues en [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) + `docs/inventario-madre.md`

---

## Nodo Madre — estado verificado 2026-07-16

| Parametro | Valor |
|---|---|
| **Hostname** | `varpc` |
| **OS** | Arch Linux kernel 7.0.9-arch2-1 |
| **IP Tailscale** | `100.91.112.32` |
| **Usuario principal** | `varopc` |
| **Home** | `/home/varopc/` |
| **Proyectos** | `/home/varopc/Projects/` |
| **Estado general** | ✅ Operativo |
| **Ultima auditoria** | 2026-07-16 16:15 CEST |

---

## Acceso SSH canonico

```bash
ssh varopc@100.91.112.32
```

> Puerto 22 estandar activo (sshd pid=889).
> Puerto 2222 expuesto via docker-proxy — pertenece a Gitea SSH.

---

## RAM — verificado 2026-07-16

| | Total | Usado | Libre | Disponible |
|---|---|---|---|---|
| **Mem** | 15 Gi | 7.0 Gi | 298 Mi | 8.6 Gi |
| **Swap** | 19 Gi | 5.7 Gi | 13 Gi | — |

> Swap con 5.7 Gi usados — sistema bajo presion de memoria. Monitorizar.

---

## Disco — SMART verificado 2026-07-16

| Check | Resultado |
|---|---|
| **SMART overall-health** | ✅ PASSED |
| **Riesgo inmediato** | 🟢 No |
| **Issue asociado** | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) HAL-005 HDD ~28.000h — monitorizar |

---

## Puerto 21 FTP — verificado 2026-07-16

| Check | Resultado |
|---|---|
| `ss -tlnp \| grep :21` | ✅ Sin output — puerto 21 NO escucha en Madre |
| **Conclusion** | Issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) es a nivel router Digi, no Madre |

---

## Contenedores Docker — estado verificado 2026-07-16

| Contenedor | Estado | Imagen | Isla |
|---|---|---|---|
| `thdora` | ✅ Up 2d healthy | thdora-thdora | THDORA |
| `thdora-bot` | 🟡 health: starting (reiniciado) | thdora-bot | THDORA |
| `local_tripwire` | 🟡 health: starting (reiniciado) | yggdrasil-secops | Seguridad |
| `radar_backup` | ✅ Up 2d | alpine:latest | Seguridad |
| `guardian_bot` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `yggdrasil_watchdog` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `network_radar` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `log_guardian_bot` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `tailscale_monitor` | ✅ Up 2d healthy | yggdrasil-secops | Seguridad |
| `grafana` | ✅ Up 2d | grafana/grafana:10.4.2 | Infra |
| `prometheus` | ✅ Up 2d | prom/prometheus:v2.51.2 | Infra |
| `yggdrasil-mcp` | 🔴 Created — ERROR | mcp-server | MCP |
| `open-webui` | 🟡 unhealthy (falso positivo) | open-webui:main | IA-Local |
| `qdrant` | 🟡 unhealthy (falso positivo) | qdrant/qdrant:latest | IA-Local |
| `ollama` | ✅ Up 2d healthy | ollama/ollama:latest | IA-Local |
| `ollama-embeddings` | ✅ Up 2d healthy | ollama/ollama:latest | IA-Local |
| `kali-pentest` | ✅ Up 2d | kasmweb/kali-rolling-desktop:1.16.0 | Labs |
| `spiderfoot` | ✅ Up 2d | spiderfoot | Labs |
| `code-server` | ✅ Up 2d | linuxserver/code-server:latest | Infra |
| `n8n` | ✅ Up 2d | n8nio/n8n:latest | Infra |
| `gitea` | ✅ Up 2d | gitea/gitea:latest | Infra |
| `uptime-kuma` | ✅ Up 2d healthy | louislam/uptime-kuma:1 | Infra |
| `portainer` | ✅ Up 2d | portainer/portainer-ce:latest | Infra |

**Total: 23 contenedores** · 18 healthy/up · 2 unhealthy (falsos positivos) · 2 health:starting · 1 error critico

---

## yggdrasil-mcp — ERROR CRITICO documentado

| Campo | Valor |
|---|---|
| **Status** | `created` — nunca arrancado |
| **ExitCode** | `128` |
| **Error** | `Bind for 0.0.0.0:3000 failed: port is already allocated` |
| **Causa** | El puerto 3000 ya esta ocupado por otro contenedor |
| **Issue** | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |

**Diagnostico — identificar quien usa el puerto 3000:**
```bash
sudo ss -tlnp | grep :3000
docker ps --format "table {{.Names}}\t{{.Ports}}" | grep 3000
```

**Fix — opciones:**
1. Cambiar el puerto de `yggdrasil-mcp` en su compose (ej: `3001:3000`)
2. Liberar el puerto 3000 si el servicio que lo ocupa no es necesario

---

## Issues activos

| Issue | Descripcion | Estado |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 HDD Madre ~28.000h | 🟡 SMART PASSED — monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP | 🟡 No en Madre — esta en router Digi |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | Mapear stacks restantes | 🔵 Pendiente |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | yggdrasil-mcp puerto 3000 conflicto | 🔴 Bloqueante |

---

_Actualizado: 2026-07-16 16:15 CEST · Auditoria SSH + analisis logs · Perplexity MCP_
