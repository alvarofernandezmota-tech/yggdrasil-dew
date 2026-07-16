---
tipo: context
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
repo: yggdrasil-dew
ecosistema: yggdrasil
status: vigente
---

# 🌊 CONTEXT.md — yggdrasil-dew

> Estado actual del DEW (Daily Execution Workspace). Este fichero es la fuente de verdad operacional del ecosistema Yggdrasil. Se actualiza al inicio y cierre de cada sesión.

---

## ¿Qué es yggdrasil-dew?

El DEW es el repo de trabajo activo del ecosistema. Aquí van:
- **Issues** — todo el trabajo pendiente, bloqueantes, HALs, AUDITs
- **Protocolos** — cómo arrancar y cerrar sesiones en cada repo
- **Estado del ecosistema** — qué está corriendo, qué está roto, qué está pendiente

**Regla fundamental:** Si algo necesita hacerse en el ecosistema, tiene un issue aquí.

---

## Estado del ecosistema (2026-07-16)

### 🟢 Running

| Servicio | Host | Puerto | Notas |
|---|---|---|---|
| n8n | Madre | 5678 | Running, sin auditar |
| Ollama | Madre | 11434 | Modelos activos |
| Qdrant | Madre | 6333 | Vector DB activo |
| Wazuh | Madre | 443/1515 | SIEM activo |
| Postgres (THDORA) | Madre | 5432 | Running |

### 🔴 Caído / Bloqueado

| Servicio | Bloqueante | Issue |
|---|---|---|
| thdora-bot | HAL-007 .env malformado | [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) |
| thdora-api | HAL-007 mismo bloqueo | [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) |
| Token Telegram | HAL-008 a rotar | [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) |

### 🟡 Pendiente auditar

| Área | Issue |
|---|---|
| Flujos n8n activos | [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) AUDIT-003 |
| Documentación MCP/agentes | [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) AUDIT-005 |
| Alertas FTP Wazuh | [DEW #46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) |

---

## Issues bloqueantes (P0)

| Issue | Título | Estado |
|---|---|---|
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007 — .env THDORA malformado | 🔴 Abierto |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 — Rotar token Telegram | 🔴 Abierto |

## Issues activos (P1)

| Issue | Título | Estado |
|---|---|---|
| [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | AUDIT-003 — thdora-personal completo | 🟡 Pendiente |
| [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | AUDIT-005 — MCP/agentes | 🟡 Pendiente |
| [#49](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/49) | Thea x IA local | 🟡 Pendiente |

---

## Última sesión

**Fecha:** 2026-07-16  
**Agente:** Perplexity-MCP  
**Acciones:** Sync completo del ecosistema — estructuración de los 4 repos principales con protocolos de sesión homogéneos.

---

_Actualizado: 2026-07-16 · Perplexity-MCP_
