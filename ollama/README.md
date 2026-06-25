---
tags: [ollama, modelos, modelfile, rag, embeddings]
fecha-actualizacion: 2026-06-25
relacionado: [[setup/servidor/ollama]] [[setup/servidor/docker-compose.yml]]
---

# ollama/ — Modelos y configuración LLM local

> Directorio para Modelfiles, perfiles de sistema y documentación de modelos.
> Stack activo en Madre: 2 instancias de Ollama (chat + embeddings)

---

## Estructura

```
ollama/
├── README.md          ← este archivo
├── modelos.md         ← tabla completa de modelos + decisión de uso
└── Modelfiles/        ← perfiles custom (pendiente crear)
    ├── pentester      ← qwen2.5:7b con system prompt ofensivo
    └── researcher     ← qwen2.5:14b para investigación profunda
```

---

## Instancias activas

| Contenedor | Puerto | Uso | Modelo por defecto |
|---|---|---|---|
| `ollama` | :11434 | Chat · thdora · Open WebUI | qwen2.5:7b |
| `ollama-embeddings` | :11435 | RAG · Qdrant · local-brain | bge-m3 (pendiente) |

---

## Cuándo usar cada modelo

| Tarea | Modelo | Por qué |
|---|---|---|
| Chat rápido / thdora | `qwen2.5:3b` | Respuesta < 5s en CPU |
| Uso diario / análisis | `qwen2.5:7b` | Equilibrio velocidad/calidad |
| Investigación profunda | `qwen2.5:14b` | Máximo razonamiento disponible |
| Scripts pentest / CVEs | `qwen2.5-coder:7b` | Especializado en código |
| Embeddings RAG | `bge-m3` | Multilingüe, mejor calidad |
| Embeddings rápidos | `nomic-embed-text` | Ligero, para pruebas |

---

## Pendiente

- [ ] Descargar `qwen2.5-coder:7b` en contenedor `ollama`
- [ ] Descargar `bge-m3` en contenedor `ollama-embeddings`
- [ ] Crear Modelfile `pentester` con system prompt ofensivo
- [ ] Crear Modelfile `researcher` para investigaciones largas
- [ ] Conectar `ollama-embeddings` con Qdrant vía local-brain
