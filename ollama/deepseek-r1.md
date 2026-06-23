---
tags: [ollama, llm-local, deepseek, razonamiento, madre, acer]
fecha-actualizacion: 2026-06-23
ruta-obsidian: ollama/deepseek-r1.md
---

# DeepSeek-R1 — Razonamiento Profundo Local

Modelo de razonamiento con cadena de pensamiento explícita `<think>...</think>`.
Disponible en variantes 8B (Acer/Madre) y 32B (solo Madre con mucha RAM).

## Hardware

| Variante | VRAM/RAM | Máquina |
|---|---|---|
| deepseek-r1:8b | 6-8 GB ✔️ | Acer + Madre |
| deepseek-r1:32b | 22-24 GB | Solo Madre |

## Cuándo usarlo
- Deducción lógica y auditorías paso a paso
- Depuración con razonamiento visible
- Problemas algorítmicos complejos

## Peor para
- Respuestas rápidas (el modelo “piensa” antes de responder)
- Conversaciones simples

```bash
ollama pull deepseek-r1:8b
ollama run deepseek-r1:8b
```

## Ver también
- [[ollama/README]]
- [[ollama/llama3.2-3b]] — LLM principal RAG
