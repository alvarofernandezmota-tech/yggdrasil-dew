---
tags: [agente, ia, gemini, codigo, arquitectura]
fecha-actualizacion: 2026-06-20
---

# 🔵 Gemini — Código largo y arquitectura

## Qué es
IA de Google. Contexto enorme (1M tokens). Mejor para leer repos enteros y diseñar arquitecturas complejas.

## Para qué se usa
- Leer y entender repos completos de una vez
- Diseñar arquitectura de proyectos nuevos
- Refactorizaciones grandes (>500 líneas)
- Tareas donde el contexto >100k tokens importa

## Para qué NO se usa
- Escribir en GitHub → [[agentes/perplexity]]
- Datos frescos o investigación → [[agentes/grok]]
- Terminal / editor → [[agentes/opencode]]

## Protocolo
```
Gemini (diseña arquitectura) → Perplexity (sube al repo)
```

---
_Ver también: [[agentes/perplexity]] · [[agentes/grok]] · [[HOME]]_
