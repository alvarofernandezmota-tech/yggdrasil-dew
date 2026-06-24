---
id: 202406242255
fecha: 2026-06-24
tipo: proyecto
status: activo
repo: thdora
tags: [proyecto, #repo/thdora, telegram, bot, fastapi, python]
sync: true
---

# Proyecto: thdora

- **Repo**: [thdora](https://github.com/alvarofernandezmota-tech/thdora) — público
- **Descripción**: Bot Telegram TOKI + FastAPI + Ollama local
- **Lenguaje**: Python

## Stack Docker
| Contenedor | Puerto | Rol |
|---|---|---|
| thdora-bot | — | Bot principal Python |
| redis | 6379 | Cache + estado sesiones |

## Handlers implementados
- ✅ Comandos base
- ⚠️ Pendiente: /estado, /cierre, /inbox, /pendientes, /ollama

## Estado
- 🔧 Activo, 12 issues abiertos
- ⚠️ Handlers IA pendientes (integracion Ollama)
- ⚠️ Handler /cierre → sync automático yggdrasil-dew

## Links
- [[ECOSISTEMA]] · [[inbox/2026-06-24-PENDIENTES-THDORA-COMANDOS-Y-DOCKER]] · [[proyectos/ollama-stack/README]]
