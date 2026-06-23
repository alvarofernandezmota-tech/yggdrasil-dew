---
tags: [ollama, qwen2.5, 7b, llm, local, general]
fecha: 2026-06-23
estado: pendiente-descargar
modelo: qwen2.5:7b
tipo: llm
ruta-obsidian: agentes/ollama/2026-06-23-ollama-qwen2.5-7b.md
fuente: inbox/2026-06-23-ollama-qwen2.5-7b.md
---

# qwen2.5:7b — LLM local uso general

## Ficha técnica

| Campo | Valor |
|---|---|
| Modelo | Qwen/Qwen2.5-7B-Instruct |
| VRAM | ~4.5GB |
| Velocidad | 🟡 Moderado |
| Calidad | Alta para uso general |

## Casos de uso óptimos

- Conversación larga y compleja
- Resumen de documentos
- Generación de contenido
- RAG con documentos extensos
- Agente migrador de inbox (decisiones complejas)

## Instalación

```bash
docker exec -it ollama ollama pull qwen2.5:7b
```

## Referencias
- [[agentes/ollama/2026-06-23-ollama-guia-seleccion]]
