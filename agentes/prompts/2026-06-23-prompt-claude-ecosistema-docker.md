---
tags: [prompt, claude, docker, ecosistema, ollama, qdrant, webui]
fecha: 2026-06-23
estado: listo-para-ejecutar
tipo: prompt-agente
agente: claude-sonnet
prioridad: INMEDIATA
ruta-obsidian: agentes/prompts/2026-06-23-prompt-claude-ecosistema-docker.md
fuente: inbox/2026-06-23-prompt-claude-ecosistema-docker.md
---

# Prompt Claude — Ecosistema Docker paso a paso

> Usar con Claude + acceso MCP a repos GitHub.
> Crea `ollama-stack` + documenta en cerebro + plan post-instalación.

## RAW PROMPT — COPIAR COMPLETO

```
Eres un ingeniero de software senior con experiencia en homelab, Docker y sistemas de IA local.
Tienes acceso MCP completo a mis repos de GitHub. Trabaja directamente sobre ellos.

MI ECOSISTEMA:
- Servidor: "Madre" — Linux, GPU NVIDIA, corriendo en casa
- Cerebro: repo alvarofernandezmota-tech/yggdrasil-dew
- Philosophy: docs-as-code, separation of concerns, inbox-first

TAREA 1 — CREAR REPO ollama-stack:
Crea alvarofernandezmota-tech/ollama-stack con:
1. docker-compose.yml: Ollama (GPU, :11434) + Open WebUI (:3000) + Qdrant (:6333)
2. .env.example con todas las variables
3. README.md profesional (instalación en 3 comandos)
4. Makefile: up, down, logs, pull-models, status
5. scripts/pull-models.sh
6. .gitignore correcto

TAREA 2 — DOCUMENTAR EN CEREBRO:
1. ollama/README.md — enlace ollama-stack + estado
2. setup/servidor/docker-stack.md — tabla servicios + puertos
3. proyectos/ollama-stack/README.md — ficha proyecto

TAREA 3 — PLAN POST-INSTALACIÓN:
Crea inbox/2026-06-23-post-instalacion-ollama.md con comandos exactos para:
- Pull modelos: qwen2.5:7b, qwen2.5:3b, bge-m3, nomic-embed-text
- Configurar Open WebUI
- Crear colección Qdrant RAG
- Test end-to-end

RESTRICCIONES:
- Commits descriptivos
- Nunca duplicar entre repos
- Todo por inbox/ primero
- Wikilinks [[]] en el cerebro
- docker compose up -d sin modificación

Empieza por TAREA 1. Confírmame cada paso.
```

## Referencias
- [[agentes/claude-sonnet-4.6]]
- [[setup/servidor/docker-stack]]
- [[proyectos/ollama-stack/README]]
