---
tipo: referencia
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13 14:15 CEST
actualizado: 2026-07-13 14:15 CEST
ruta: docs/inventario-madre.md
tags: [madre, docker, inventario, infraestructura]
status: vigente
---

# 🗺️ Inventario Real de Madre — Docker & Proyectos

> Fuente de verdad para nombres reales de contenedores, rutas de proyectos y `.env` por stack.
> Verificado en sesión 2026-07-13 tarde vía SSH + `docker inspect`.

---

## Nodo Madre

| Parámetro | Valor |
|---|---|
| OS | Arch Linux |
| IP Tailscale | `100.91.112.32` |
| Usuario principal | `varopc` |
| Home | `/home/varopc/` |
| Proyectos | `/home/varopc/Projects/` |

---

## Stacks Docker activos

### Stack THDORA

| Parámetro | Valor |
|---|---|
| Proyecto Compose | `thdora` |
| Ruta `docker-compose.yml` | `/home/varopc/Projects/thdora/docker-compose.yml` |
| Ruta `.env` | `/home/varopc/Projects/thdora/.env` |
| Working dir | `/home/varopc/Projects/thdora/` |
| Versión Compose | `5.1.4` |

| Contenedor | Servicio Compose | Estado verificado | Red |
|---|---|---|---|
| `thdora` | `thdora` | ✅ healthy | `thdora_thdora-net` |
| `thdora-bot` | `bot` | ✅ healthy (recreado 2026-07-13) | `thdora_thdora-net` |

**Comando de recreación de secretos (canónico):**
```bash
cd /home/varopc/Projects/thdora
nano .env                          # editar el token/secreto
docker compose up -d --force-recreate --no-deps bot
docker logs --tail 30 thdora-bot   # verificar arranque limpio
```

> ⚠️ `docker restart thdora-bot` NO funciona para cambios de `.env` — no refresca variables de entorno.

---

### Stack yggdrasil-secops

| Parámetro | Valor |
|---|---|
| Proyecto Compose | `yggdrasil-secops` |
| Ruta `docker-compose.yml` | `/home/varopc/Projects/yggdrasil-secops/docker-compose.yml` (verificar) |
| Ruta `.env` | `/home/varopc/Projects/yggdrasil-secops/.env` (verificar) |

| Contenedor | Servicio | Estado verificado | Imagen |
|---|---|---|---|
| `guardian_bot` | `guardian_bot` | ✅ healthy | `yggdrasil-secops-guardian_bot` |
| `log_guardian_bot` | `log_guardian` | ✅ healthy | `yggdrasil-secops-log_guardian` |
| `local_tripwire` | `local_tripwire` | 🟡 verificar (quedó `health: starting`) | `yggdrasil-secops-local_tripwire` |

---

### Otros contenedores activos

| Contenedor | Imagen | Estado verificado |
|---|---|---|
| `n8n` | `n8nio/n8n:latest` | ✅ Up 4h+ |

> Los proyectos Compose de n8n, Portainer, Grafana, Prometheus, Nextcloud, Vaultwarden, Pi-hole y Unbound están pendientes de mapear en `madre-config` (issue [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43)).

---

## 🔑 Regla operativa: secretos por proyecto

**No existe un `.env` global de Madre.** Cada stack tiene su propio `.env` en la carpeta del proyecto.

Cuando un token se rota:
1. Identificar qué proyecto usa ese token (`docker inspect <contenedor> | grep config_files`)
2. Editar el `.env` del proyecto correcto
3. Recrear el servicio con `docker compose up -d --force-recreate --no-deps <servicio>`
4. Verificar logs y estado healthy

---

## 📋 Pendiente documentar (#43)

- [ ] Rutas reales de todos los stacks (n8n, Portainer, Grafana, Prometheus, etc.)
- [ ] Versionar todos los `docker-compose.yml` en `madre-config`
- [ ] Versionar todos los `.env.template` (sin secretos) en `madre-config`
- [ ] Mapa completo de redes Docker internas

---

_Creado: 2026-07-13 14:15 CEST · Perplexity-MCP · verificado en sesión tarde via SSH_
