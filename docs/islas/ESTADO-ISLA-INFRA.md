---
title: Estado Isla Infra
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:21 CEST
ruta: docs/islas/ESTADO-ISLA-INFRA.md
tags: [isla, infra, estado, madre, ssh, docker]
status: auditada
---

# 🏗️ Estado Isla Infra

> Auditada en sesion 2026-07-16 via SSH directo a Madre + analisis completo de logs.
> Fuente de verdad: `docs/inventario-madre.md` + [madre-config](https://github.com/alvarofernandezmota-tech/madre-config)

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
| **Ultima auditoria** | 2026-07-16 16:21 CEST |

---

## Acceso SSH canonico

```bash
ssh varopc@100.91.112.32
```

> Puerto 22 estandar activo (sshd pid=889).
> Puerto 2222 = Gitea SSH (docker-proxy).

---

## RAM — verificado 2026-07-16

| | Total | Usado | Libre | Disponible |
|---|---|---|---|---|
| **Mem** | 15 Gi | 7.0 Gi | 298 Mi | 8.6 Gi |
| **Swap** | 19 Gi | 5.7 Gi | 13 Gi | — |

> Swap con 5.7 Gi usados. Sistema bajo presion de memoria. Monitorizar.

---

## Disco — SMART verificado 2026-07-16

| Check | Resultado |
|---|---|
| **SMART overall-health** | ✅ PASSED |
| **Riesgo inmediato** | 🟢 No |
| **Issue asociado** | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) HAL-005 ~28.000h — monitorizar |

---

## Puerto 21 FTP — verificado 2026-07-16

| Check | Resultado |
|---|---|
| `ss -tlnp \| grep :21` | ✅ Sin output — NO escucha en Madre |
| **Conclusion** | Issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) es a nivel router Digi |

---

## Mapa de puertos activos — verificado 2026-07-16

| Puerto | Servicio | Contenedor | Notas |
|---|---|---|---|
| 22 | SSH | sshd (host) | Acceso SSH Madre |
| 2222 | Gitea SSH | gitea | docker-proxy |
| 3000 | Grafana UI | grafana | **OCUPA puerto que necesita yggdrasil-mcp** |
| 3003 | Gitea Web | gitea | Gitea HTTP |
| 21 | FTP | — | ✅ No escucha en Madre |

---

## Contenedores Docker — estado final 2026-07-16

| Contenedor | Estado final | Isla |
|---|---|---|
| `thdora` | ✅ healthy | THDORA |
| `thdora-bot` | ✅ healthy (verificado 16:21) | THDORA |
| `local_tripwire` | 🟡 health: starting (8min) | Seguridad |
| `radar_backup` | ✅ Up 2d | Seguridad |
| `guardian_bot` | ✅ healthy | Seguridad |
| `yggdrasil_watchdog` | ✅ healthy | Seguridad |
| `network_radar` | ✅ healthy | Seguridad |
| `log_guardian_bot` | ✅ healthy | Seguridad |
| `tailscale_monitor` | ✅ healthy | Seguridad |
| `grafana` | ✅ Up 2d | Infra |
| `prometheus` | ✅ Up 2d | Infra |
| `yggdrasil-mcp` | 🔴 Created/Error | MCP — [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) |
| `open-webui` | 🟡 unhealthy (falso positivo) | IA-Local |
| `qdrant` | 🟡 unhealthy (falso positivo) | IA-Local — [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |
| `ollama` | ✅ healthy | IA-Local |
| `ollama-embeddings` | ✅ healthy | IA-Local |
| `kali-pentest` | ✅ Up 2d | Labs |
| `spiderfoot` | ✅ Up 2d | Labs |
| `code-server` | ✅ Up 2d | Infra |
| `n8n` | ✅ Up 2d | Infra |
| `gitea` | ✅ Up 2d | Infra |
| `uptime-kuma` | ✅ healthy | Infra |
| `portainer` | ✅ Up 2d | Infra |

**Total: 23** · 19 healthy/up · 2 unhealthy (falsos positivos) · 1 starting · 1 error

---

## yggdrasil-mcp — ERROR documentado

| Campo | Valor |
|---|---|
| **Error** | `Bind for 0.0.0.0:3000 failed: port is already allocated` |
| **Causa** | `grafana` ocupa el puerto 3000 |
| **Fix** | Cambiar puerto yggdrasil-mcp a 3001 (u otro libre) en su compose |
| **Issue** | [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) |

```bash
# Fix rapido — cambiar mapeo de puerto en compose de yggdrasil-mcp:
# ports:
#   - "3001:3000"   # era 3000:3000
```

---

## Mapa de rutas compose verificado 2026-07-16

| Stack | Ruta compose |
|---|---|
| thdora | `/home/varopc/Projects/thdora/docker-compose.yml` |
| yggdrasil-secops | `/home/varopc/yggdrasil-secops/docker-compose.maestro.yml` |
| secops blue-team | `/home/varopc/yggdrasil-secops/docker-compose.blue-team.yml` |
| spiderfoot | `/home/varopc/spiderfoot/docker-compose.yml` |
| batcueva-nueva | `/home/varopc/docker/batcueva-nueva/docker-compose.yml` |
| raiz | `/home/varopc/docker-compose.yml` |

> Pendiente: localizar compose de grafana/prometheus/gitea/n8n/ollama/open-webui/qdrant — issue [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43)

---

## Issues activos

| Issue | Descripcion | Estado |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 HDD ~28.000h | 🟡 SMART PASSED — monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP | 🟡 En router Digi, no en Madre |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | Mapear stacks restantes | 🔵 Pendiente |
| [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) | HAL-006 yggdrasil-mcp puerto 3000 | 🔴 Pendiente fix |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant telemetria bloqueada | 🟡 Fix pendiente |

---

_Actualizado: 2026-07-16 16:21 CEST · Auditoria SSH completa · Perplexity MCP_
