---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, docker, deploy, madre, infra]
status: vigente
---

# Protocolo Docker Deploy en Madre

> Para cualquier cambio en servicios Docker de Madre.

## Antes de tocar producción

1. Verificar que el `docker-compose.yml` está versionado en `madre-config` (#43)
2. Verificar que `.env` tiene todas las variables necesarias: `grep -c '=' .env`
3. Si es un servicio nuevo → seguir `PROTOCOLO-NUEVO-SERVICIO.md`

## Deploy de un cambio

```bash
# 1. Ir al directorio del stack
cd ~/stacks/<stack>

# 2. Verificar config antes de aplicar
docker compose config

# 3. Aplicar cambio
docker compose up -d --no-deps <servicio>

# 4. Verificar estado
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'

# 5. Ver logs inmediatos
docker logs --tail 50 <servicio>
```

## Rollback

```bash
# Si algo falla
docker compose down <servicio>
git checkout HEAD~1 -- docker-compose.yml
docker compose up -d <servicio>
```

## Reglas

- Nunca `docker compose up` sin `-d` en producción
- Nunca editar `.env` sin hacer backup previo: `cp .env .env.bak`
- Cualquier cambio de configuración → commit en `madre-config` antes de aplicar
- Si el healthcheck falla 3 veces → abrir issue HAL

## Refs
- Issue #43 — IaC Madre pendiente
- Issue #60 F7.3 — healthchecks pendientes
- `PROTOCOLO-INCIDENTE.md`

---
_Creado: 2026-07-13 · Perplexity MCP_
