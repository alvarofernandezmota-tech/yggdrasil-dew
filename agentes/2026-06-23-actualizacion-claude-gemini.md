---
tags: [agentes, claude, gemini, investigacion, rag]
fecha: 2026-06-23
estado: migrado
ruta-obsidian: agentes/2026-06-23-actualizacion-claude-gemini.md
---

# Actualización Fichas Claude + Gemini — Sesión RAG 2026-06-23

> Migrar a `agentes/claude-sonnet-4.6.md` y `agentes/gemini-2.5-pro.md`
> cuando se revisen y validen los cambios.

---

## Claude Sonnet 4.6 — Cambios a incorporar

### Nuevo campo: Capacidades demostradas en investigación técnica

En la sesión de hoy Claude demostró capacidad de análisis técnico profundo para hardware específico:
- Analizó trade-offs de LLMs para GTX 1060 6GB con tabla comparativa real
- Identificó bug crítico de BM25 (no persiste entre reinicios) que Gemini no mencionó
- Dio solución con código concreto (pickle persistencia)
- Recomendó Groq API como modo potente (aprovechando key existente en thdora)
- Identificó RRF como fusión correcta vs extend() directo

### Cuadro comparativo vs Gemini (RAG)

| Aspecto | Claude | Gemini | Quién acertó |
|---|---|---|---|
| LLM recomendado | qwen2.5:3b | qwen2.5:3b | Ambos ✅ |
| Embeddings | bge-m3 | nomic (por VRAM) | Gemini más práctico ✅ |
| ChromaDB | Quedarse | Migrar a LanceDB | Claude más conservador ✅ |
| Bug BM25 | Sí lo detectó | No lo mencionó | Claude ✅ |
| Modo potente | Groq API | qwen2.5:14b offload | Claude más eficiente ✅ |

---

## Gemini 2.5 Pro — Cambios a incorporar

- Analizó correctamente el impacto de VRAM en la elección de embedding model
- Introdujo LanceDB como alternativa a ChromaDB
- Propuso Markdown-Aware Chunking con inyección de metadata como prefijo
- Recomendó qwen2.5:14b con layer offloading para modo potente local

---

## Flujo de investigación paralela

```
Misma pregunta → Claude + Gemini simultáneo
        ↓
Sintetizar diferencias (Perplexity)
        ↓
Inbox con síntesis
        ↓
Código actualizado en repo
```

## Checklist de migración

- [ ] Actualizar `agentes/claude-sonnet-4.6.md` con apartado investigación RAG
- [ ] Actualizar `agentes/gemini-2.5-pro.md` con apartado investigación RAG
- [ ] Añadir tabla comparativa Claude vs Gemini en `agentes/README.md`
