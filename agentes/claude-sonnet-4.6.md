---
tags: [agente, claude, anthropic, mcp, codigo, arquitectura, refactor]
fecha-creacion: 2026-06-22
fecha-actualizacion: 2026-06-23
version: claude-sonnet-4.6
proveedor: Anthropic
contexto-tokens: 200000
uso-principal: codigo · refactor · arquitectura · MCP
wikilink: agentes/claude-sonnet-4.6
---

# 🤖 Claude Sonnet 4.6 — El Arquitecto del Código

> Modelo de razonamiento y ejecución técnica. Especialista en refactorización,
> arquitectura de software y cumplimiento estricto de reglas de diseño.

## Ficha técnica

| Campo | Valor |
|---|---|
| Proveedor | Anthropic |
| Versión activa | claude-sonnet-4.6 |
| Contexto efectivo | 200k tokens |
| Acceso | API + claude.ai |
| MCP support | ✅ nativo |
| Coste | Pro plan / API por token |

## Cuándo usarlo vs Gemini 2.5 Pro

**Usa Claude cuando:**
- Necesites escribir código limpio o refactorizar repos estructurados
- Diseñar flujos lógicos con dependencias críticas (docker-compose, scripts bash)
- Cumplir sintaxis específicas sin margen de error
- Ejecutar cambios directos en GitHub vía MCP archivo por archivo
- Lógica pura, cohesión de scripts, validación estricta de formato

**Evítalo cuando:**
- Tengas que auditar volcados masivos de texto plano (+150 páginas)
- Necesites Deep Research con búsqueda web simultánea
- El contexto supere los 200k tokens (usa Gemini)

## Integración MCP — Model Context Protocol

Claude es el agente principal para operaciones directas sobre el repositorio.
Con acceso MCP puede:

- Leer/escribir archivos directamente en GitHub sin copiar/pegar
- Inspeccionar estructuras de directorios y proponer cambios en diff
- Crear ramas, commits, PRs con mensajes descriptivos
- Actuar como linter antes de confirmar cambios en main
- Ejecutar secuencias de tareas: leer → modificar → commit → siguiente archivo

**Setup MCP en este ecosistema:**
```
Repo cerebro: alvarofernandezmota-tech/yggdrasil-dew
Repo bot: alvarofernandezmota-tech/thdora
Acceso: token GitHub con permisos repo
```

## Protocolo de prompts efectivos

Estructura óptima para tareas de repo o código:

```
[ROL]: Ingeniero de Software Senior
[CONTEXTO]: Operando sobre [[HOME]] del cerebro yggdrasil-dew
[LEYES]:
  1. Nunca duplicar — usar wikilinks [[archivo]]
  2. Infraestructura != Producto
  3. Todo nuevo entra por inbox/ primero
[RESTRICCIONES]: NO tocar agentes/ — es referencia perfecta
[TAREA]: [descripción concreta con output esperado]
```

## Aprendizajes de uso real

### Sesión 2026-06-23
- Excelente ejecutando tareas encadenadas archivo por archivo con confirmación entre pasos
- Propone jerarquías planas y limpias — evita sobre-categorización
- Superior a Gemini para empaquetar specs JSON y configs sin romper formato
- Con MCP: crea repos, sube archivos, hace commits en secuencia sin intervención manual
- Punto débil: actúa a ciegas sin MCP — necesita contexto vía texto igual que Gemini
- Ideal para: crear `docker-compose.yml` completo, `Makefile`, `README.md` profesional

### Flujo óptimo Claude + Gemini
```
Gemini → auditoría masiva, clasificación, análisis cruzado
Claude → ejecución concreta, commits, código, MCP directo
Perplexity → contexto real-time, documentar sesiones, guardar en repo
```

## Casos de uso en este ecosistema

| Tarea | Claude | Gemini |
|---|---|---|
| Crear docker-compose completo | ✅ ideal | ⚠️ posible |
| Auditar 30 archivos inbox | ⚠️ lento | ✅ ideal |
| Commit directo en GitHub | ✅ vía MCP | ❌ sin acceso |
| Refactor carpeta completa | ✅ ideal | ⚠️ posible |
| Deep Research web | ❌ | ✅ ideal |
| Contexto >200k tokens | ❌ | ✅ 2M tokens |

## Ver también

- [[agentes/gemini-2.5-pro]] — para contexto masivo y auditorías
- [[agentes/perplexity]] — para documentar sesiones en tiempo real
- [[agentes/AGENT-SCRIPT]] — protocolo de uso de agentes
- [[inbox/2026-06-23-prompt-claude-refactor-repo]] — prompt refactor repo
- [[inbox/2026-06-23-prompt-claude-ecosistema-docker]] — prompt Docker

---
_Actualizado: 2026-06-23 · Fuente: uso real sesión arquitectura yggdrasil-dew_
