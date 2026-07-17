---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-17
ruta: docs/canon/OWNERSHIP-MATRIX.md
tags: [canon, servicios, ownership, madre, docker]
status: vigente
---

# Ownership Matrix — Servicios Madre

> Registro de todos los servicios Docker corriendo en Madre.
> Actualizar tras `docker ps` en Madre. Verificar con #40.

> ⚠️ Renombrado de `ownership-matrix.md` → `OWNERSHIP-MATRIX.md` el 2026-07-17 — convención canon (closes #73)

---

## Servicios activos (inventario 2026-07-16)

| Servicio | Stack | Puerto host | Criticidad | Dueño | SLA | Backup | Estado |
|---|---|---|---|---|---|---|---|
| **Ollama** | IA | 11434 | Alta | Alvaro | Best effort | No | 🟢 Running |
| **Open WebUI** | IA | 3000 | Media | Alvaro | Best effort | No | 🟢 Running |
| **LiteLLM** | IA | 4000 | Alta | Alvaro | Best effort | No | 🟢 Running |
| **Qdrant** | IA | 6333 | Media | Alvaro | Best effort | No | 🟡 Unhealthy — falso positivo (#71) |
| **n8n** | Dev | 5678 | Alta | Alvaro | Best effort | Pendiente | 🟢 Running |
| **thdora-bot** | Dev | — | Alta | Alvaro | Best effort | No | ⚠️ Token pendiente renovar (#74) |
| **thdora-api** | Dev | — | Alta | Alvaro | Best effort | No | 🟢 Running |
| **code-server** | Dev | 8080 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Gitea** | Dev | 3001 | Media | Alvaro | Best effort | No | 🟢 Running |
| **yggdrasil-mcp** | Agentes | 3001→3000 | Alta | Alvaro | Best effort | No | 🔴 Created/ExitCode 128 — puerto (#70/#75) |
| **Grafana** | Monitoring | 3002 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Prometheus** | Monitoring | 9090 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Uptime Kuma** | Monitoring | 3003 | Baja | Alvaro | Best effort | No | 🟢 Running |
| **Portainer** | Monitoring | 9443 | Baja | Alvaro | Best effort | No | 🟢 Running |
| **SpiderFoot** | SecOps | 5009 | Baja | Alvaro | Best effort | No | ⚪ Sin verificar |
| **log_guardian_bot** | SecOps | — | Alta | Alvaro | Best effort | No | ⚠️ Crash loop — estado actual desconocido (#46) |
| **local_tripwire** | SecOps | — | Alta | Alvaro | Best effort | No | ⚠️ Crash loop — estado actual desconocido (#46) |
| **yggdrasil_watchdog** | SecOps | — | Alta | Alvaro | Best effort | No | 🟡 Sin verificar (#32) |
| **Kali VNC** | SecOps | 6080 | Baja | Alvaro | Best effort | No | ⚪ Sin verificar |
| **network-radar** | SecOps | — | Media | Alvaro | Best effort | No | ⚪ Sin verificar |

---

## Leyenda

| Estado | Significado |
|---|---|
| 🟢 Running | Verificado en `docker ps` |
| 🔴 Caído | Contenedor no operativo |
| ⚠️ Degradado | Corre pero con problemas conocidos |
| 🟡 Sin verificar | Corre pero no se ha comprobado salud |
| ⚪ Desconocido | Estado sin auditar |

---

## Pendiente para cierre de #40

```bash
# Ejecutar en Madre para actualizar tabla completa
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
```

---

_Actualizado: 2026-07-17 · #73 renombrado a OWNERSHIP-MATRIX.md · Perplexity-MCP_
