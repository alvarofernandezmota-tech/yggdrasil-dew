---
tags: [proyecto, thdora, telegram, bot, python]
fecha: 2026-06-23
estado: activo
tipo: proyecto
ruta-obsidian: proyectos/thdora/2026-06-23-proyecto-thdora.md
fuente: inbox/2026-06-23-proyecto-thdora.md
---

# Proyecto thdora — Bot Telegram TOKI

> Bot de control personal en Telegram. Corre en Madre via Docker.

## Estado actual

- ✅ Bot desplegado en Madre
- ✅ `/start` funcionando
- 🔴 Handlers avanzados pendientes

## Handlers pendientes

| Comando | Función |
|---|---|
| `/diario <texto>` | Escribe en diarios/ del cerebro |
| `/inbox <texto>` | Crea nota en inbox/ |
| `/tarea <texto>` | Añade tarea al MASTER-PENDIENTES |
| `/estado` | Muestra `docker ps` de Madre |
| `/pull` | Hace `git pull` del cerebro |

## Docs a crear

- [ ] `docs/DEPLOY.md`
- [ ] `docs/SERVIDOR_MADRE.md`
- [ ] `docs/TROUBLESHOOTING.md`

## Referencias
- [[setup/servidor/docker-stack]]
- [[diarios/]]
