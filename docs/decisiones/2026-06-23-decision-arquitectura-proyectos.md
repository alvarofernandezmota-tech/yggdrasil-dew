---
tags: [decision, arquitectura, proyectos, repos, estructura]
fecha: 2026-06-23
estado: decision-tomada
tipo: decision
ruta-obsidian: docs/decisiones/2026-06-23-decision-arquitectura-proyectos.md
fuente: inbox/2026-06-23-decision-arquitectura-proyectos.md
---

# Decisión — Arquitectura de proyectos

> Sesión 2026-06-23

## Pregunta

¿Los proyectos van dentro de yggdrasil-dew o en repos separados?

## Decisión: repos separados

Cada proyecto activo tiene su propio repo GitHub:

| Proyecto | Repo |
|---|---|
| Stack Docker Batcueva | `alvarofernandezmota-tech/ollama-stack` |
| Stack OSINT | `alvarofernandezmota-tech/osint-stack` |
| Cerebro IA local | `alvarofernandezmota-tech/local-brain` |
| Chatbot control | `alvarofernandezmota-tech/chatbot-control` |
| Terminal IA | `alvarofernandezmota-tech/terminal-ia` |
| Bot Telegram | `alvarofernandezmota-tech/thdora` (ya existe) |

## Regla

> `yggdrasil-dew/proyectos/<nombre>/` = documentación, decisiones, contexto
> Repo separado = código, implementación, docker-compose

## Referencias
- [[docs/adr/2026-06-23-adr-docs-as-code-repos-cerebro]]
- [[docs/decisiones/2026-06-23-decision-homelab-vs-proyectos]]
