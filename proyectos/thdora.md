---
tags: [proyecto, thdora, bot, telegram, docker, activo, produccion]
fecha-actualizacion: 2026-06-20
estado: produccion
---

# 🤖 thdora — Bot TOKI en producción

## Qué es

Bot de Telegram personal. Nombre del bot: **TOKI**.
Stack: Python + LangGraph + FastAPI + PostgreSQL + Docker.
Corre 24/7 en [[setup/madre]].

## Estado actual

- Versión: **v0.22.1**
- Stack Docker: 6/6 contenedores ✅
- API FastAPI (puerto 8000): ✅ healthy
- Bot Telegram: ⚠️ verificar — pend. fix restart loop (`git pull + docker compose up --build`)
- CI/CD: ✅ auto-deploy en push a `main`

## Acceso rápido

```bash
# Conectar
ssh alvaro@100.91.112.32

# Estado
docker compose ps

# Fix bot (si está en restart loop)
git pull && docker compose up -d --build

# Logs
docker compose logs --tail=50 thdora-bot

# Verificar salud
docker inspect thdora-bot --format='{{json .State.Health}}'
```

## Inbox del proyecto

> Todo lo nuevo sobre thdora → primero a `proyectos/thdora/inbox/`
> Desde ahí → se decide dónde va (docs, handlers, fixes)

Notas en inbox ahora:
- [[inbox/thdora-estado-stack]] → mover aquí cuando se confirme estado

## Documentación técnica

Ver plan completo: [[proyectos/thdora-docs]]

## Handlers TOKI — estado

| Handler | Estado | Prioridad |
|---|---|---|
| `/start` | ✅ existe | — |
| `/help` | ✅ existe | — |
| `/inbox <texto>` | ⏳ diseñado | 🔴 primera |
| `/diario <texto>` | ⏳ diseñado | 🔴 primera |
| `/tarea <texto>` | ⏳ pendiente | 🟡 |
| `/estado` | ⏳ pendiente | 🟡 |
| `/deploy` | ⏳ pendiente | 🟡 |
| `/logs` | ⏳ pendiente | 🟢 |

## Servicios Docker

| Servicio | Puerto | Estado |
|---|---|---|
| thdora API (FastAPI) | 8000 | ✅ |
| thdora-bot (Telegram) | — | ⚠️ verificar |
| PostgreSQL | 5432 | ✅ |
| Prometheus | 9090 | ✅ |
| Grafana | 3000 | ✅ |
| Ollama | 11434 | ✅ |

## Próximos pasos

- [ ] SSH Madre → `git pull + docker compose up --build` → fix bot
- [ ] Probar `/start` en Telegram
- [ ] Implementar handler `/inbox` (más sencillo — empezar aquí)
- [ ] Implementar handler `/diario`
- [ ] Crear `thdora/docs/DEPLOY.md`
- [ ] Crear `thdora/docs/SERVIDOR_MADRE.md`

---

_Ver también: [[proyectos/thdora-docs]] · [[agentes/toki-bot]] · [[setup/madre]] · [[HOME]]_
