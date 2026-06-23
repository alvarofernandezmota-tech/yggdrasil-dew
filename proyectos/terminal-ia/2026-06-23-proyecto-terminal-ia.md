---
tags: [proyecto, terminal, ia, cli, ollama]
fecha: 2026-06-23
estado: concepto
tipo: proyecto
ruta-obsidian: proyectos/terminal-ia/2026-06-23-proyecto-terminal-ia.md
fuente: inbox/2026-06-23-proyecto-terminal-ia.md
---

# Proyecto terminal-ia

> Terminal con IA integrada. Comandos naturales + autocompletado inteligente.

## Concepto

Una terminal que entiende lenguaje natural:
- `¿qué procesos consumen más RAM?` → ejecuta `ps aux --sort=-%mem | head`
- `busca en el cerebro todo sobre ollama` → query RAG
- `crea una nota de inbox sobre X` → git commit automático

## Stack

- Shell: zsh con plugin custom
- LLM: qwen2.5:3b (rápido, local)
- Integración: Ollama API local

## Dependencias
- Ollama funcionando en Madre
- yggdrasil-dew clonado en Madre

## Referencias
- [[proyectos/local-brain/README]]
- [[ollama/README]]
