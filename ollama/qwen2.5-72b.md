---
tags: [ollama, llm-local, qwen, potente, madre]
fecha-actualizacion: 2026-06-23
ruta-obsidian: ollama/qwen2.5-72b.md
---

# Qwen2.5-72B — Potente, Solo Madre con Mucha RAM

Modelo grande de Alibaba. Requiere mucha RAM, no apto para uso casual.

## Hardware
- VRAM/RAM necesaria: +40 GB ❌ Solo Madre con mucha RAM
- Con offloading: lento (~2-3 tok/s)

## Cuándo usarlo
- Tareas que requieren máximo razonamiento local sin conexión
- Solo cuando los modelos 3B-7B no son suficientes

```bash
ollama pull qwen2.5:72b
```

## Ver también
- [[ollama/README]]
- [[ollama/llama3.2-3b]] — alternativa ligera
