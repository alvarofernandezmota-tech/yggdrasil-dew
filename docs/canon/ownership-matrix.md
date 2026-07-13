---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-13
ruta: docs/canon/ownership-matrix.md
tags: [canon, servicios, ownership, madre, docker]
status: vigente
---

# Ownership Matrix — Servicios Madre

> Registro de todos los servicios Docker corriendo en Madre.
> Actualizar tras `docker ps` en Madre. Verificar con #40.

---

## Servicios activos (16 confirmados)

| Servicio | Stack | Puerto | Criticidad | Dueño funcional | SLA | Backup | Estado |
|---|---|---|---|---|---|---|---|
| **Ollama** | IA | 11434 | Alta | Alvaro | Best effort | No | 🟢 Running |
| **Open WebUI** | IA | 3000 | Media | Alvaro | Best effort | No | 🟢 Running |
| **LiteLLM** | IA | 4000 | Alta | Alvaro | Best effort | No | 🟢 Running |
| **Qdrant** | IA | 6333 | Media | Alvaro | Best effort | No | 🟢 Running |
| **n8n** | Dev | 5678 | Alta | Alvaro | Best effort | Pendiente | 🟢 Running |
| **thdora-bot** | Dev | — | Alta | Alvaro | Best effort | No | 🔴 Caído (HAL-007) |
| **thdora-api** | Dev | — | Alta | Alvaro | Best effort | No | 🔴 Caído (HAL-007) |
| **code-server** | Dev | 8080 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Gitea** | Dev | 3001 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Grafana** | Monitoring | 3002 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Prometheus** | Monitoring | 9090 | Media | Alvaro | Best effort | No | 🟢 Running |
| **Uptime Kuma** | Monitoring | 3003 | Baja | Alvaro | Best effort | No | 🟢 Running |
| **Portainer** | Monitoring | 9443 | Baja | Alvaro | Best effort | No | 🟢 Running |
| **SpiderFoot** | SecOps | 5009 | Baja | Alvaro | Best effort | No | ⚪ Sin verificar |
| **log_guardian_bot** | SecOps | — | Alta | Alvaro | Best effort | No | 🔴 Crash loop (HAL-009) |
| **local_tripwire** | SecOps | — | Alta | Alvaro | Best effort | No | 🔴 Crash loop (HAL-009) |
| **yggdrasil_watchdog** | SecOps | — | Alta | Alvaro | Best effort | No | 🟡 Sin verificar |
| **Kali VNC** | SecOps | 6080 | Baja | Alvaro | Best effort | No | ⚪ Sin verificar |
| **network-radar** | SecOps | — | Media | Alvaro | Best effort | No | ⚪ Sin verificar |

---

## Leyenda

| Estado | Significado |
|---|---|
| 🟢 Running | Verificado en `docker ps` |
| 🔴 Caído | Contenedor no operativo |
| 🟡 Sin verificar | Corre pero no se ha comprobado salud |
| ⚪ Sin verificar | Estado desconocido, pendiente de auditar |

---

## Pendiente para cierre de #40

```bash
# Ejecutar en Madre para verificar todos los servicios
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
# Pegar output aquí y actualizar la tabla
```

---

_Actualizado: 2026-07-13 · Avance #40 · Perplexity-MCP_
