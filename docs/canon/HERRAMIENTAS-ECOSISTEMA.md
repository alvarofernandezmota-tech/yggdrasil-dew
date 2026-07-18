---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/canon/HERRAMIENTAS-ECOSISTEMA.md
tags: [canon, herramientas, agentes, mcp, perplexity]
status: vigente
---

# Herramientas del Ecosistema Yggdrasil

> Registro canónico de todas las herramientas IA y de terminal activas.
> Actualizar cuando se añada o retire una herramienta.

---

## Agentes IA activos

| Herramienta | Rol | Acceso MCP | Cuándo usarla |
|---|---|---|---|
| **Perplexity MCP** | Agente principal — opera repos vía GitHub MCP | ✅ GitHub MCP directo | Sesiones de desarrollo, documentación, issues, commits |
| **Claude** | Análisis profundo de código y arquitectura | ❌ Solo texto | Revisiones técnicas, ADRs complejos |
| **OpenCode** | Edición de código en terminal | ❌ CLI local | Cuando se necesita editar código directamente en Madre/Acer |
| **THDORA** | Bot Telegram — interfaz conversacional personal | ❌ API Telegram | Consultas rápidas, recordatorios, alertas |
| **Ollama (local)** | LLM local — privacidad total | ❌ API local 11434 | Datos sensibles, uso offline, RAG local |

---

## Perplexity MCP — Reglas de uso

### Qué puede hacer
- Leer y escribir archivos en cualquier repo del ecosistema
- Crear/cerrar issues, PRs, commits
- Crear ramas, push de múltiples archivos en un commit
- Leer estado del ecosistema y alinearlo
- Ejecutar auditorías completas vía lectura de repos

### Qué NO puede hacer
- Conectarse a Madre por SSH (requiere terminal real)
- Ejecutar comandos bash en Madre
- Ver datos en tiempo real de Docker/servicios
- Acceder a secretos o `.env` reales

### Protocolo de inicio de sesión con Perplexity
1. Perplexity lee `BOOTSTRAP.md` en `yggdrasil-orquestador`
2. Perplexity lee `ESTADO-SISTEMA.md` en `yggdrasil-dew`
3. Perplexity lee `AGENT.md` del repo objetivo
4. Opera según protocolos de `docs/canon/protocolos/`
5. Al cierre: actualiza `ESTADO-SISTEMA.md` con la fase ejecutada

### Dónde vive el contexto de Perplexity
```
yggdrasil-orquestador/
  BOOTSTRAP.md          ← contexto de arranque para cualquier agente
yggdrasil-dew/
  ESTADO-SISTEMA.md     ← estado vivo del ecosistema
  docs/canon/           ← reglas que Perplexity debe respetar
  docs/canon/HERRAMIENTAS-ECOSISTEMA.md  ← este archivo
  docs/sesiones/        ← histórico de sesiones
```

> Perplexity no tiene memoria persistente entre sesiones.
> Su contexto se reconstruye leyendo estos archivos al inicio de cada sesión.
> Por eso BOOTSTRAP.md y ESTADO-SISTEMA.md son críticos.

---

## OpenCode — Reglas de uso

- Solo en terminal local (Madre o Acer)
- Para edición de código real: scripts bash, docker-compose, configs
- No para documentación — eso es Perplexity
- Confirmar cambios con `git diff` antes de commit

---

## Ollama — Modelos activos en Madre

| Modelo | Puerto | Uso |
|---|---|---|
| (verificar con `ollama list` en Madre) | 11434 | LLM local |

> Pendiente: ejecutar `ollama list` en Madre y documentar modelos reales — Issue #55

---

## THDORA — Estado

- **Estado actual**: 🔴 Caído — token Telegram caducado
- **Issue**: [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74)
- **Fix**: BotFather → revocar token → nuevo token → `.env` en Madre → `docker compose restart`

---

_Creado: 2026-07-18 03:05 CEST · F29 cierre sesión · Perplexity-MCP_
