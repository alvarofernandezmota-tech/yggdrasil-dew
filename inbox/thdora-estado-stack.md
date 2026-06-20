---
tags: [thdora, docker, produccion, pendiente]
fecha: 2026-06-20
destino: proyectos/thdora.md
---

# 🤖 THDORA — Estado stack y pendientes

## Stack actual
- 6/6 contenedores healthy en Madre ✅
- API FastAPI puerto 8000 ✅
- Bot Telegram (polling) ✅
- Prometheus + Grafana ✅

## Pendiente urgente
- [ ] Verificar `/start` en Telegram — confirmar que TOKI responde
- [ ] `git pull` + rebuild en Madre si no está actualizado
- [ ] Documentar ruta exacta del repo en Madre (`find ~ -name docker-compose.yml`)

## Pendiente importante
- [ ] `docs/DEPLOY.md` — guía paso a paso con comandos reales
- [ ] `docs/SERVIDOR_MADRE.md` — IP, usuario, rutas
- [ ] `docs/TROUBLESHOOTING.md` — errores conocidos
- [ ] PostgreSQL en producción (sustituir SQLite)
- [ ] Handler `/diario` — escribir en yggdrasil-dew desde Telegram

_→ mover a [[proyectos/thdora]] cuando se ejecute_
