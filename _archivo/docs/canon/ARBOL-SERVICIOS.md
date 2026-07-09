---
title: Árbol de Servicios del Ecosistema
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-05
ruta: docs/canon/ARBOL-SERVICIOS.md
tags: [canon, servicios, docker, arquitectura, service-ownership]
status: vigente
---

# 🌳 Árbol de Servicios del Ecosistema

> Vista rápida de todos los servicios, su isla y su estado.
> Detalle de decisiones → [`ADR-001-platform-stack.md`](./ADR-001-platform-stack.md)
> Mapa visual → [`wiki/islas/infra.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/infra.md)

---

## Servicios por isla

### 🛡️ Seguridad → `yggdrasil-secops`

| Servicio | Tipo | Estado | HAL |
|---|---|---|---|
| `yggdrasil_watchdog` | Docker | ✅ healthy | — |
| `tailscale_monitor` | Docker | ✅ healthy | HAL-004 ✅ |
| `log_guardian_bot` | Docker | ⚠️ unhealthy | HAL-002 |
| `network_radar` | Docker | ✅ healthy | — |
| `local_tripwire` | Docker | 🔄 starting | — |
| `guardian_bot` | Docker | ✅ healthy | — |
| UFW | Sistema | ✅ activo | HAL-006 |
| fail2ban | Sistema | ✅ activo | — |
| SSH | Sistema | ✅ `PermitRootLogin no` | HAL-006 |

### 🏗️ Infraestructura → `madre-config`

| Servicio | Tipo | Estado |
|---|---|---|
| `uptime-kuma` | Docker | ✅ healthy |
| `grafana` | Docker | ✅ running |
| `prometheus` | Docker | ✅ running |
| `portainer` | Docker | ✅ running |
| `radar_backup` | Docker | ✅ running |

### 🧠 Cerebro → `yggdrasil-dew`

| Servicio | Tipo | Estado |
|---|---|---|
| `n8n` | Docker | ✅ running |
| `gitea` | Docker | ✅ running |
| `code-server` | Docker | ✅ running |
| `yggdrasil-mcp` | Docker | ⚠️ created/none |

### 🤖 THDORA → `thdora`

| Servicio | Tipo | Estado | HAL |
|---|---|---|---|
| `thdora` | Docker | ✅ healthy | HAL-001/003 |
| `thdora-bot` | Docker | ✅ healthy | HAL-001/003 |

### 🧪 Labs → uso puntual

| Servicio | Tipo | Estado |
|---|---|---|
| `kali-pentest` | Docker | ✅ running |
| `spiderfoot` | Docker | ✅ running |

---

## Regla de ownership

Cada servicio tiene un único repo canónico responsable.
Si hay un bug en un servicio → el issue va al repo de su isla.
Si hay un hallazgo de seguridad → HAL en `yggdrasil-secops`.

---

_Última actualización: 2026-07-05 23:46 CEST · Perplexity-MCP_
