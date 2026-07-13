---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, docker, servicio, madre, infra]
status: vigente
---

# Protocolo Nuevo Servicio en Madre

> Al añadir cualquier servicio nuevo al stack de Madre.

## Checklist

### Antes de desplegar
- [ ] Decidir en qué stack vive: `ia/` `dev/` `monitoring/` `secops/`
- [ ] Definir puerto — verificar que no hay conflicto: `docker ps --format '{{.Ports}}'`
- [ ] Crear `docker-compose.yml` del servicio en `madre-config/docker/<stack>/`
- [ ] Añadir variables necesarias a `.env` y a `.env.template` (sin valores)
- [ ] Añadir `healthcheck` + `restart: unless-stopped`
- [ ] Verificar que el puerto NO está expuesto a internet sin auth (#15)

### Al desplegar
- [ ] `docker compose config` — verificar sin errores
- [ ] `docker compose up -d <servicio>`
- [ ] Verificar `healthy` en `docker ps`
- [ ] Ver logs 5 minutos: `docker logs -f <servicio>`

### Post-deploy
- [ ] Commit `madre-config` con el nuevo compose
- [ ] Crear o actualizar isla en `WIKI---PERSONAL` si el servicio es importante
- [ ] Añadir a `docs/canon/ownership-matrix.md` en DEW (#40)
- [ ] Si tiene Tailscale o está expuesto → documentar en isla `madre.md`

## Refs
- Issue #43 — IaC Madre
- Issue #40 — ownership-matrix
- `PROTOCOLO-DOCKER-DEPLOY.md`

---
_Creado: 2026-07-13 · Perplexity MCP_
