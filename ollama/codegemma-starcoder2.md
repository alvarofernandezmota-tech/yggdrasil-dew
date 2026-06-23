---
tags: [ollama, llm-local, codigo, codegemma, starcoder2, autocompletado]
fecha-actualizacion: 2026-06-23
ruta-obsidian: ollama/codegemma-starcoder2.md
---

# CodeGemma + StarCoder2 — Especialistas en Código

Modelos especializados en autocompletado y generación de código. Alternativa local a GitHub Copilot.

## Hardware
- VRAM mínima: 4-7 GB ✔️ Acer + Madre
- Velocidad: ~3-6 tok/s (suficiente para sugerencias inline)

## Cuándo usarlos
- Autocompletado en Neovim / VS Code
- Generación de funciones sin enviar código a la nube
- Fill-in-the-Middle (FIM): sabe qué hay arriba y abajo del cursor

## Peor para
- Conversaciones generales
- Documentación no técnica

```bash
ollama pull codegemma
ollama pull starcoder2
```

## Ver también
- [[ollama/README]]
- [[cli-tools/opencode]] — usa estos modelos como backend
