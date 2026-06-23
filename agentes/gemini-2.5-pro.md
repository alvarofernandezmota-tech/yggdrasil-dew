---
tags: [agente, gemini, google, deep-research, contexto-masivo, auditoria]
fecha-creacion: 2026-06-22
fecha-actualizacion: 2026-06-23
version: gemini-2.5-pro
proveedor: Google DeepMind
contexto-tokens: 2000000
uso-principal: auditoria · deep-research · contexto-masivo · clasificacion
wikilink: agentes/gemini-2.5-pro
---

# 🤖 Gemini 2.5 Pro — El Analista de Contexto Masivo

> Modelo de ingesta masiva y Deep Research. Especialista en auditorías globales,
> procesamiento de sesiones completas y correlación cruzada de múltiples fuentes.

## Ficha técnica

| Campo | Valor |
|---|---|
| Proveedor | Google DeepMind |
| Versión activa | gemini-2.5-pro |
| Contexto efectivo | 2,000,000 tokens |
| Acceso | gemini.google.com / API |
| Deep Research | ✅ activable en chat |
| MCP support | ❌ no nativo en chat |
| Coste | Gemini Advanced / API |

## Cuándo usarlo vs Claude Sonnet 4.6

**Usa Gemini cuando:**
- Tengas volcados masivos de sesión (+150 páginas, logs kilométricos)
- Necesites auditar 30+ archivos cruzando datos simultáneamente
- Deep Research: búsqueda web + síntesis en un solo paso
- Contexto supere 200k tokens (Gemini aguanta 2M)
- Clasificar grandes volúmenes de notas sin perder el hilo de las leyes del sistema
- Investigación técnica externa (hardware, redes, documentación de herramientas)

**Evítalo cuando:**
- Busques ejecución directa de código en producción sin revisión
- Necesites commits directos en GitHub (no tiene MCP en chat)
- El formato de salida requiera rigidez extrema en JSON complejo

## Estrategia de ingesta: Serialización por Bloques

Sin acceso directo a GitHub, el protocolo óptimo es alimentarlo con texto:

```
--- INICIO ARCHIVO: [[ruta/del/archivo.md]] ---
[Contenido íntegro del archivo]
--- FIN ARCHIVO: [[ruta/del/archivo.md]] ---
```

Este formato permite a Gemini:
- Indexar internamente la estructura del repo
- Resolver dependencias cruzadas vía [[wikilinks]]
- No confundir límites entre documentos
- Mantener las leyes del sistema activas durante toda la sesión

**Alternativa rápida:** dar el inventario clasificado (nombre + tipo + descripción una línea)
y dejar que Gemini proponga el plan antes de ejecutar.

## Deep Research — cómo activarlo

1. Abrir gemini.google.com con Gemini Advanced
2. Activar Deep Research (icono lupa/investigación)
3. Dar el prompt con contexto completo del repo
4. Gemini lanza búsquedas web + sintetiza en un informe
5. Revisar fuentes antes de integrar en el cerebro

**Ideal para:** ronda 2 LLM (7 fichas nuevas en agentes/), investigación de herramientas OSINT, benchmarks de modelos locales.

## Protocolo de prompts efectivos

```
[ROL]: Ingeniero de Software Senior / Guardián de arquitectura del conocimiento
[LEYES]:
  1. Nunca duplicar — wikilinks [[archivo]]
  2. Todo nuevo entra por inbox/ primero
  3. Infraestructura != Producto
[CONTEXTO]: [inventario completo o bloques serializados]
[RESTRICCIONES]: NO tocar agentes/ — referencia perfecta
[TAREA]: [descripción + output esperado + confirmación antes de ejecutar]
```

## Aprendizajes de uso real

### Sesión 2026-06-23
- Sin MCP actúa a ciegas — necesita contexto vía texto serializado
- Cuando recibe el inventario clasificado, propone plan de 4 fases ordenado y coherente
- Respeta las 3 leyes del sistema cuando se las das explícitamente en el prompt
- Propone tablas de migración detalladas con origen → destino → tipo
- Punto fuerte: correlaciona 37 archivos de inbox con estado de 15 carpetas en un solo paso
- Tono: formal-técnico, usa emojis de estado, estructura sus respuestas en secciones claras
- Pide confirmación antes de ejecutar cambios — buena práctica de seguridad

### Output de calidad en esta sesión
- Plan de 4 fases de limpieza y reestructuración
- Tabla completa de migración inbox → ollama/modelos/
- Fichas mejoradas claude-sonnet-4.6.md y gemini-2.5-pro.md
- Propuesta de subcarpetas ollama/modelos/ y ollama/arquitectura/

### Flujo óptimo Gemini + Claude
```
Gemini → auditoría masiva, plan, clasificación, research
Claude → ejecución concreta, commits, código, MCP
Perplexity → tiempo real, guardar sesión en repo, contexto vivo
```

## Casos de uso en este ecosistema

| Tarea | Gemini | Claude |
|---|---|---|
| Auditar 30+ archivos inbox | ✅ ideal | ⚠️ lento |
| Deep Research herramientas OSINT | ✅ ideal | ❌ |
| Ronda LLM (7 fichas nuevas) | ✅ ideal | ⚠️ posible |
| Commit directo GitHub | ❌ sin MCP | ✅ vía MCP |
| Análisis logs docker/systemd | ✅ ideal | ⚠️ posible |
| Contexto >200k tokens | ✅ 2M | ❌ |

## Ver también

- [[agentes/claude-sonnet-4.6]] — para ejecución y código
- [[agentes/perplexity]] — para documentar sesiones en tiempo real
- [[agentes/AGENT-SCRIPT]] — protocolo de uso de agentes
- [[inbox/2026-06-23-prompt-gemini-auditoria-inbox]] — prompt auditoría completo

---
_Actualizado: 2026-06-23 · Fuente: uso real sesión arquitectura yggdrasil-dew_
