---
tags: [ollama, modelo, qwen, ligero, cli, bot]
fecha: 2026-06-23
tipo: ficha-modelo
categoria: ligero
estado: pendiente-instalar
comando: ollama pull qwen2.5:3b
ruta-obsidian: ollama/modelos/qwen2.5-3b.md
---

# qwen2.5:3b — Modelo ligero para CLI y bot

> Movido desde inbox/ · Ver [[inbox/2026-06-23-ollama-qwen2.5-3b]]

## Para qué sirve

Modelo ligero para tareas rápidas. Ideal cuando la velocidad importa más
que la profundidad de razonamiento.

## Uso en el ecosistema

- Respuestas rápidas desde TOKI (bot Telegram)
- Comandos CLI desde terminal
- Tareas simples: clasificar, resumir, responder
- Menor consumo GPU — útil cuando Madre está ocupada

## Comandos

```bash
ollama pull qwen2.5:3b
ollama run qwen2.5:3b
```

## Ver también
- [[ollama/modelos/qwen2.5-7b]]
- [[agentes/toki-bot]]
