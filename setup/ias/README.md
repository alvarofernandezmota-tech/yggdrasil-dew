# IAs del Ecosistema — Rotación y Gestión
*Última actualización: 15 junio 2026*

Este directorio documenta todas las IAs disponibles, sus límites, cuándo se agotan y quién cubre cuando una cae. El objetivo es nunca perder una sesión de trabajo por quedarse sin tokens.

## Filosofía de uso

1. **Distribuir por fortaleza** — cada IA tiene un rol claro
2. **Rotar al agotar** — registrar aquí con fecha y hora
3. **Perspectivas mútiples** — la misma pregunta a dos IAs = insight más rico
4. **Documentar antes de cerrar** — nunca cerrar una sesión sin hacer push al repo

## Estado actual (15 jun 2026)

| IA | Archivo | Estado | Reset | Mejor uso |
|----|---------|--------|-------|-----------|
| **Claude** (Sonnet 4.6) | [claude.md](./claude.md) | 🟢 Activa | Cada ~4 horas | Análisis profundo, documentación, push al repo |
| **ChatGPT** (GPT-4o) | [chatgpt.md](./chatgpt.md) | 🟢 Activa | Día siguiente | Memoria persistente, archivos, branding |
| **Mistral** | [mistral.md](./mistral.md) | 🟢 Activa | Sin límite aún | OCR notas, embeddings, perspectiva europea |
| **Gemini** | [gemini.md](./gemini.md) | 🟢 Activa | Diario (API) | Investigación, contexto largo (1M tokens) |
| **Copilot** | [copilot.md](./copilot.md) | 🟡 Activar | Sin límite | Autocompletado IDE, revisión PRs |
| **Ollama** (local) | [ollama.md](./ollama.md) | 🔴 Por instalar | Sin límite | Privacidad total, fallback sin coste |

## 📓 Registro de Agotamientos

> Cuando una IA se agota: añade fila con fecha, hora, tarea en curso y quién la cubre.

| Fecha | IA | Hora | Tarea en curso | Reset estimado | Cubierta por |
|-------|----|------|----------------|----------------|---------------|
| — | — | — | — | — | — |

## Regla de oro

> **Antes de que Claude se agote (~4h), hacer push de todo al repo.**
> Al retomar: pegar CONTEXT.md o README del proyecto como primer mensaje.
