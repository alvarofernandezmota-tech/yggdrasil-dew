---
tags: [ollama, qwen2.5, 3b, llm, local, rapido]
fecha: 2026-06-23
estado: pendiente-descargar
modelo: qwen2.5:3b
tipo: llm
ruta-obsidian: agentes/ollama/2026-06-23-ollama-qwen2.5-3b.md
fuente: inbox/2026-06-23-ollama-qwen2.5-3b.md
---

# qwen2.5:3b — LLM local rápido

## Ficha técnica

| Campo | Valor |
|---|---|
| Modelo | Qwen/Qwen2.5-3B-Instruct |
| VRAM | ~2GB |
| Velocidad | 🟢 Rápido |
| Calidad | Buena para tareas simples |

## Casos de uso óptimos

- Agente inbox: decidir destino de archivos
- Queries RAG rápidas
- Etiquetado automático de notas
- Respuestas cortas en thdora

## Instalación

```bash
docker exec -it ollama ollama pull qwen2.5:3b
```

## Referencias
- [[agentes/ollama/2026-06-23-ollama-guia-seleccion]]
