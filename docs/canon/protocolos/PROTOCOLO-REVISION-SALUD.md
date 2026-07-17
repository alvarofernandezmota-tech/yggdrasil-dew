---
tipo: protocolo
version: 1
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/canon/protocolos/PROTOCOLO-REVISION-SALUD.md
tags: [protocolo, salud, sistema, servicios, docker]
status: vigente
---

# PROTOCOLO — Revisión de Salud del Sistema

> Revisión rápida del estado de salud de Madre y sus servicios.
> Ejecutar antes de trabajar sobre infraestructura o cuando algo falla.

---

## Cuándo ejecutar

- Al inicio de cualquier sesión que toque infraestructura
- Cuando THDORA no responde
- Cuando un servicio parece caído
- Revisión semanal de rutina

---

## Nivel 1 — Revisión rápida (2 min)

```bash
# Estado de todos los contenedores
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'

# Identificar caídos o en crash loop
docker ps -a --filter 'status=exited' --format 'table {{.Names}}\t{{.Status}}'

# Uso de recursos
docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}'
```

**Resultado esperado:** todos los servicios críticos en `Up (healthy)`

---

## Nivel 2 — Revisión estándar (5 min)

```bash
# Ver logs últimas 50 líneas de servicios críticos
docker logs --tail 50 thdora_bot 2>&1 | grep -i 'error\|warn\|fatal'
docker logs --tail 50 yggdrasil-mcp 2>&1 | grep -i 'error\|warn\|fatal'
docker logs --tail 50 qdrant 2>&1 | grep -i 'error\|warn\|fatal'

# Espacio en disco
df -h / /home

# Memoria disponible
free -h

# Carga del sistema
uptime
```

---

## Nivel 3 — Revisión profunda (15 min)

```bash
# Puertos en uso
sudo ss -tlnp | grep -E ':[0-9]+'

# Verificar que nada sensible está expuesto
sudo ss -tlnp | grep -v '127.0.0.1\|::1' | grep -E ':(21|22|23|3000|8080|9090)'

# S.M.A.R.T. del disco
sudo smartctl -a /dev/sda | grep -E 'Health|Hours|Reallocated|Pending'

# Ver servicios con restart automático
docker inspect $(docker ps -q) | grep -A2 '"RestartPolicy"'

# Verificar Tailscale
tailscale status
```

---

## Servicios críticos y su verificación

| Servicio | Puerto | Verificación | Criticidad |
|---|---|---|---|
| Portainer | 9000 | `curl -s http://localhost:9000/api/status` | Media |
| Ollama | 11434 | `curl -s http://localhost:11434/api/tags` | Alta |
| Open WebUI | 3000/8080 | `curl -s http://localhost:8080/health` | Media |
| Qdrant | 6333 | `curl -s http://localhost:6333/` | Alta |
| n8n | 5678 | `curl -s http://localhost:5678/healthz` | Alta |
| Vaultwarden | 8000 | `curl -s http://localhost:8000/alive` | Alta |
| Pi-hole | 80 | `curl -s http://localhost/admin/` | Alta |
| yggdrasil-mcp | 3001 | `curl -s http://localhost:3001/health` | Media |
| THDORA | — | Telegram `/start` | Alta |
| Grafana | 3000 | `curl -s http://localhost:3000/api/health` | Baja |

---

## Resultado de revisión

Documentar en `docs/sesiones/YYYY-MM-DD-revision-salud.md`:

```markdown
## Revisión salud YYYY-MM-DD HH:MM

### Servicios
- [x] Servicio X — OK
- [ ] Servicio Y — CAÍDO — issue #XX abierto

### Recursos
- Disco: XX% usado
- RAM: XX disponible
- CPU load: X.XX

### Acciones tomadas
- ...
```

---

## Issues relacionados

- [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) — Qdrant unhealthy
- [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) — THDORA caído
- [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) — MCP puerto
- [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) — log_guardian crash

---

_Creado: 2026-07-18 · Perplexity-MCP_
