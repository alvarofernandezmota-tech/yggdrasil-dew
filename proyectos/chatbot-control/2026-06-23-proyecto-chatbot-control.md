---
tags: [proyecto, chatbot, control, ia-local, ollama]
fecha: 2026-06-23
estado: concepto
tipo: proyecto
ruta-obsidian: proyectos/chatbot-control/2026-06-23-proyecto-chatbot-control.md
fuente: inbox/2026-06-23-proyecto-chatbot-control.md
---

# Proyecto chatbot-control

> Chatbot de control personal con IA local. Evolución de thdora.

## Concepto

Un chatbot que:
- Consulta el cerebro (yggdrasil-dew) via RAG
- Ejecuta acciones en Madre (docker, git, scripts)
- Accesible desde Telegram y terminal
- Corre 100% local con Ollama

## Stack técnico

| Componente | Tecnología |
|---|---|
| LLM | qwen2.5:7b via Ollama |
| RAG | Qdrant + bge-m3 |
| Interface | Telegram bot + CLI |
| Backend | Python FastAPI |

## Dependencias
- Proyecto local-brain completo
- Stack Docker (Ollama + Qdrant) funcionando
- thdora como base del bot Telegram

## Referencias
- [[proyectos/local-brain/README]]
- [[proyectos/thdora/README]]
- [[ollama/README]]
