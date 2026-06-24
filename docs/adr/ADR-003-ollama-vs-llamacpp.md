# ADR-003: Ollama vs llama.cpp como runtime de modelos locales

> **Estado:** DECIDIDO  
> **Fecha:** 2026-06-24  
> **Decidido por:** Álvaro (con debate Gemini/Grok documentado)

---

## Contexto

El ecosistema Yggdrasil necesita un runtime para ejecutar LLMs localmente en la Madre (Arch Linux).  
Las dos opciones principales son Ollama y llama.cpp directo.

## Opciones consideradas

### Opción A: Ollama
- Daemon que gestiona modelos, API REST compatible OpenAI
- Gestión de VRAM automática
- Pull de modelos simple (`ollama pull modelo`)
- Buena integración con n8n, LiteLLM, Open WebUI

### Opción B: llama.cpp directo
- Mayor control fino sobre parámetros
- Mejor rendimiento en algunos benchmarks (Markov chains, inferencia pura)
- Sin daemon, ejecución directa
- Más complejo de integrar con el ecosistema

## Debate registrado

Debate completo en:
- `inbox/2026-06-24-BITACORA-FINAL-OLLAMA-VS-LLAMACPP.md`
- `inbox/2026-06-24-DEBATE-GROK-OLLAMA-VS-LLAMACPP.md`
- `inbox/2026-06-24-BITACORA-GEMINI-TURNO3-LLAMACPP-MARKOV.md`

## Decisión

**✅ OLLAMA** como runtime principal.

Razones:
1. Integración limpia con todo el stack (n8n → LiteLLM → Ollama)
2. API compatible OpenAI → no cambiar código cliente
3. Gestión automática de modelos y VRAM
4. Modelfiles para personalización de agentes (Erika, etc.)
5. Comunidad activa, actualizaciones frecuentes

llama.cpp puede usarse puntualmente para benchmarks o modelos no soportados.

## Consecuencias

- Ollama corre como systemd service en la Madre
- Modelos: qwen2.5:3b (ligero), qwen2.5:7b (balance), bge-m3 (embeddings)
- LiteLLM actúa como proxy entre Ollama y el resto del stack

---

*Registrado: 2026-06-25 | Basado en debate 2026-06-24*
