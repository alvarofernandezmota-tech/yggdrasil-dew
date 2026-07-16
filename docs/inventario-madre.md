---
tipo: referencia
author: Alvaro Fernandez Mota
creado: 2026-07-13 14:15 CEST
actualizado: 2026-07-16 16:06 CEST
ruta: docs/inventario-madre.md
tags: [madre, docker, inventario, infraestructura]
status: vigente
---

# 🗺️ Inventario Real de Madre — Docker & Proyectos

> Fuente de verdad para nombres reales de contenedores, rutas de proyectos y `.env` por stack.
> Verificado en sesión 2026-07-16 vía SSH + `docker ps -a`.

---

## Nodo Madre

| Parámetro | Valor |
|---|---|
| Hostname | `varpc` |
| OS | Arch Linux kernel 7.0.9-arch2-1 |
| IP Tailscale | `100.91.112.32` |
| Usuario principal | `varopc` |
| Home | `/home/varopc/` |
| Proyectos | `/home/varopc/Projects/` |
| RAM total | 15 Gi |
| Swap total | 19 Gi |
| SMART /dev/sda | PASSED (2026-07-16) |

## Acceso SSH canónico

```bash
ssh varopc@100.91.112.32
```

---

## Inventario completo de contenedores — 2026-07-16

| Contenedor | Estado | Imagen | Stack/Isla |
|---|---|---|---|
| `thdora` | ✅ Up 2d healthy | thdora-thdora | THDORA |
| `thdora-bot` | 🟡 health: starting | thdora-bot | THDORA |
| `local_tripwire` | 🟡 health: starting | yggdrasil-secops | Seguridad |
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
| `kali-pentest` | ✅ Up 2d | kasmweb/kali-rolling-desktop:1.16.0 | Labs |
| `spiderfoot` | ✅ Up 2d | spiderfoot | Labs |
| `code-server` | ✅ Up 2d | linuxserver/code-server:latest | Infra |
| `n8n` | ✅ Up 2d | n8nio/n8n:latest | Infra |
| `gitea` | ✅ Up 2d | gitea/gitea:latest | Infra |
| `uptime-kuma` | ✅ Up 2d healthy | louislam/uptime-kuma:1 | Infra |
| `portainer` | ✅ Up 2d | portainer/portainer-ce:latest | Infra |

**Total: 23 contenedores** · 18 healthy/up · 2 unhealthy · 2 health:starting · 1 created

---

## Stacks Docker activos

### Stack THDORA

| Parámetro | Valor |
|---|---|
| Ruta `docker-compose.yml` | `/home/varopc/Projects/thdora/docker-compose.yml` |
| Ruta `.env` | `/home/varopc/Projects/thdora/.env` |

**Comando canónico recreación bot (tras rotación token):**
```bash
cd /home/varopc/Projects/thdora
nano .env
docker compose up -d --force-recreate --no-deps bot
docker logs --tail 30 thdora-bot
```

> ⚠️ `docker restart thdora-bot` NO funciona para cambios de `.env`.

### Stack yggdrasil-secops

| Parámetro | Valor |
|---|---|
| Ruta `docker-compose.yml` | `/home/varopc/Projects/yggdrasil-secops/docker-compose.yml` |
| Compose activo | `docker-compose.maestro.yml` |

---

## Puertos activos verificados 2026-07-16

| Puerto | Servicio | Notas |
|---|---|---|
| 22 | sshd | Acceso SSH normal |
| 2222 | docker-proxy (Gitea) | Gitea SSH |
| 21 | — | ✅ NO escucha en Madre — es issue de router Digi |

---

## 📋 Pendiente documentar (#43)

- [ ] Rutas reales de todos los stacks (n8n, Portainer, Grafana, Prometheus, etc.)
- [ ] Versionar todos los `docker-compose.yml` en `madre-config`
- [ ] Versionar todos los `.env.template` (sin secretos) en `madre-config`
- [ ] Mapa completo de redes Docker internas
- [ ] Diagnosticar `open-webui` + `qdrant` unhealthy
- [ ] Arrancar o investigar `yggdrasil-mcp` (estado: Created)

---

_Actualizado: 2026-07-16 16:06 CEST · Auditoría SSH directa · docker ps verificado · Perplexity MCP_
