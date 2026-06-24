---
tags: [agente, gemini, google, investigacion, contexto-largo, ia-externa]
nombre: Gemini 2.5 Pro
proveedor: Google DeepMind
acceso: https://aistudio.google.com
estado: activo
rol-en-ecosistema: investigacion-profunda · contexto-1M · analisis-repos-completos
fecha: 2026-06-24
---

# Gemini 2.5 Pro — Ficha de agente

## Qué es

Gemini 2.5 Pro es el modelo de Google con **ventana de contexto de 1 millón de tokens** (el mayor disponible públicamente). Ideal para tareas que requieren leer repos enteros, documentos largos, o múltiples ficheros a la vez sin perder contexto.

---

## Rol en el ecosistema de Álvaro

| Tarea | Por qué Gemini y no otra IA |
|---|---|
| Investigación profunda (Modelfiles, LoRA, RAG) | Contexto 1M permite meter todo el repo + papers |
| Análisis de repos completos | Lee todos los ficheros de una vez sin truncar |
| Generación de código largo (compose, scripts) | Menos errores en ficheros grandes |
| Auditoría nocturna automática | Procesa inbox entero + genera resumen |
| Fine-tuning y entrenamiento LLM | Experto en ai-toolkit / LoRA / QLoRA |

**Protocolo del ecosistema:**
> Grok investiga noticias frescas → Gemini investiga en profundidad → Perplexity valida + sube al repo vía MCP

---

## Cómo usar Gemini para este ecosistema

### Acceso
1. `https://aistudio.google.com` → seleccionar `gemini-2.5-pro`
2. Subir ficheros directamente o pegar contenido
3. Para repos: pegar contenido de múltiples ficheros en el prompt

### Patrón de prompt óptimo
```
CONTEXTO DEL SISTEMA:
[pegar ECOSISTEMA.md]
[pegar ESTADO-SISTEMA.md]
[pegar ficheros relevantes]

TAREA:
[descripción clara]

FORMATO DE RESPUESTA:
- Todo en markdown
- Comandos ejecutables
- Guardar resultado en: [ruta del repo]
```

---

## Prompts preparados

### 🔍 Investigación Modelfiles + especialización LLM
Ver: [[inbox/2026-06-24-prompt-gemini-modelfiles]]

Cubre:
- Modelfiles óptimos para qwen2.5:3b especializado
- RAM real por modelo en CPU-only
- RAG vs Modelfile vs LoRA — cuándo usar cada uno
- Fine-tuning sin GPU (Colab / AI Studio)
- Flujo nocturno n8n automatizado
- Plan de 7 días de implementación

Resultado esperado → guardar en: `ollama/GUIA-ESPECIALIZACION.md`

### 🏛️ Auditoría nocturna de repos
Prompt rápido:
```
Audita estos ficheros del inbox de yggdrasil-dew y díme:
1. Cuáles están completos y listos para migrar a su destino
2. Cuáles necesitan más trabajo
3. Dónde va cada uno según CONVENCIONES.md
[pegar contenido del inbox]
```

### 📊 Análisis de repo completo
Prompt rápido:
```
Analiza este repo completo y dame:
1. Ficheros duplicados o redundantes
2. Ficheros que faltan según la estructura definida
3. Inconsistencias entre ESTADO-SISTEMA.md y la realidad
[pegar estructura del repo]
```

---

## Limitaciones a tener en cuenta

- **No tiene MCP** — no puede subir al repo directamente (lo hace Perplexity)
- **Sin acceso a internet en tiempo real** — para noticias frescas usar Grok
- **Contexto no es infinito** — 1M tokens ≈ 750.000 palabras ≈ 3-4 repos medianos
- **Gratis con límites** en AI Studio — para uso intensivo revisar quota diaria

---

## Descargas relacionadas

No requiere descarga local. Acceso web en `https://aistudio.google.com`.

Si se quiere modelo local similar: `gemma3:12b` o `gemma3:27b` en Ollama
(cuando Madre tenga más RAM o GPU).

---

_Actualizado: 24 jun 2026 05:43 CEST_
_Ver: [[agentes/README]] · [[agentes/perplexity]] · [[agentes/grok-3]]_
