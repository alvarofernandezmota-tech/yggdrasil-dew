---
title: Service Ownership Matrix
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-09
ruta: docs/canon/ownership-matrix.md
tags: [canon, ownership, servicios, islas, repos]
status: vigente
---

# 🎯 Service Ownership Matrix

> **¿Para qué sirve este documento?**  
> Para saber, sin ambigüedad, qué repo es responsable de qué servicio o contenedor, quién es el dueño humano y dónde se registran sus incidencias. Cuando algo falla, este documento es el punto de partida: "El servicio X falla → repo Y → HAL o issue". Sin esta matriz, cuando hay un problema no siempre está claro dónde documentarlo ni quién actúa.

---

## Contenedores y servicios

| Servicio / Contenedor | Isla | Repo dueño | Ruta física en Madre | Issues | HALs activos |
|---|---|---|---|---|---|
| `yggdrasil_watchdog` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | — |
| `tailscale_monitor` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | [HAL-004](../hallazgos/HAL-004-tailscale-crashloop.md) |
| `log_guardian_bot` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | HAL-005 |
| `network_radar` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | — |
| `local_tripwire` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | — |
| `guardian_bot` | Seguridad | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | `~/repos/yggdrasil-secops` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues) | — |
| `uptime-kuma` | Infra | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | `~/repos/madre-config` | [issues](https://github.com/alvarofernandezmota-tech/madre-config/issues) | — |
| `grafana` | Infra | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | `~/repos/madre-config` | [issues](https://github.com/alvarofernandezmota-tech/madre-config/issues) | — |
| `prometheus` | Infra | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | `~/repos/madre-config` | [issues](https://github.com/alvarofernandezmota-tech/madre-config/issues) | — |
| `portainer` | Infra | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | `~/repos/madre-config` | [issues](https://github.com/alvarofernandezmota-tech/madre-config/issues) | — |
| `radar_backup` | Infra | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | `~/repos/madre-config` | [issues](https://github.com/alvarofernandezmota-tech/madre-config/issues) | [HAL-002](../hallazgos/HAL-002-hdd-vida-util.md) |
| `n8n` | Cerebro | [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | `/srv/yggdrasil-dew/` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues) | — |
| `gitea` | Cerebro | [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | `/srv/yggdrasil-dew/` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues) | — |
| `code-server` | Cerebro | [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | `/srv/yggdrasil-dew/` | [issues](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues) | — |
| `thdora` | THDORA | [thdora-personal](https://github.com/alvarofernandezmota-tech/thdora-personal) | `/home/varopc/Projects/thdora` ⚠️ ver nota | [issues](https://github.com/alvarofernandezmota-tech/thdora-personal/issues) | [HAL-001](../hallazgos/HAL-001-token-telegram-thdora.md) [HAL-003](../hallazgos/HAL-003-token-telegram-segunda-exposicion.md) |
| `thdora-bot` | THDORA | [thdora-personal](https://github.com/alvarofernandezmota-tech/thdora-personal) | `/home/varopc/Projects/thdora` ⚠️ ver nota | [issues](https://github.com/alvarofernandezmota-tech/thdora-personal/issues) | [HAL-001](../hallazgos/HAL-001-token-telegram-thdora.md) [HAL-003](../hallazgos/HAL-003-token-telegram-segunda-exposicion.md) |
| `ollama` | IA Local | [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | — | [issues](https://github.com/alvarofernandezmota-tech/ollama-stack/issues) | — |
| `open-webui` | IA Local | [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | — | [issues](https://github.com/alvarofernandezmota-tech/ollama-stack/issues) | — |
| `kali-pentest` | Labs | [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | `/home/varopc/docker-compose.yml` | [issues](https://github.com/alvarofernandezmota-tech/dev-labs/issues) | — |
| `spiderfoot` | Labs | [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | `/home/varopc/docker-compose.yml` | [issues](https://github.com/alvarofernandezmota-tech/dev-labs/issues) | — |

> ⚠️ **Nota THDORA**: La carpeta física de `thdora` y `thdora-bot` **NO está en `~/repos`**. Vive en `/home/varopc/Projects/thdora` y está expuesta por symlink en `~/repos/thdora`. Verificado con `git remote -v` el 2026-07-09. Detalle completo: [WIKI: docs/infra/MAPA-REPOS-MADRE.md](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/docs/infra/MAPA-REPOS-MADRE.md)

---

## Repos y propietario humano

Todos los repos del ecosistema son propiedad de **Alvaro Fernandez Mota** (`@alvarofernandezmota-tech`).

| Repo | Visibilidad | Propósito |
|---|---|---|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | 🟢 público | Canon técnico, ADRs, hallazgos, portafolio |
| [WIKI---PERSONAL](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL) | 🔴 privado | Mapa personal del ecosistema, wiki, contexto IA |
| [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | 🔴 privado | Seguridad, monitoreo, watchdog |
| [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | 🔴 privado | Configuración y scripts de Madre |
| [thdora-personal](https://github.com/alvarofernandezmota-tech/thdora-personal) | 🔴 privado | Bot Telegram personal — ruta física: `/home/varopc/Projects/thdora` |
| [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | 🔴 privado | Stack IA local (Ollama + Open WebUI) |
| [formacion-tech](https://github.com/alvarofernandezmota-tech/formacion-tech) | 🔴 privado | Apuntes técnicos y formación |
| [investigacion-ia](https://github.com/alvarofernandezmota-tech/investigacion-ia) | 🔴 privado | I+D sobre IA y automatización |
| [VIDAPERSONAL](https://github.com/alvarofernandezmota-tech/VIDAPERSONAL) | 🔴 privado | Vida personal, salud, finanzas |
| [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | 🔴 privado | Laboratorio y experimentos |
| [acer-config](https://github.com/alvarofernandezmota-tech/acer-config) | 🔴 privado | Configuración del Acer |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | 🔴 privado | Herramientas OSINT |
| [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) | 🔴 privado | RAG y memoria local del ecosistema |

---

_Actualizado: 2026-07-09 · Perplexity-MCP — rutas físicas Madre verificadas_
