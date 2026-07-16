---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: docs/canon/ESTADO-SISTEMA.md
tags: [canon, estado, sistema, dashboard]
status: vigente
version: 2
---

# 📊 Estado del Sistema — Yggdrasil

> Snapshot del ecosistema. Actualizar al cierre de cada sesión.  
> Si la fecha de actualización tiene más de 48h → verificar antes de actuar.

**Última actualización:** 2026-07-16 18:53 CEST

---

## Números del ecosistema

| Métrica | Valor |
|---|---|
| Repos activos | 12 |
| ADRs registrados | ~13 |
| Islas wiki | ~23 |
| Issues abiertos DEW | ~15 (estimado post-sesión 2026-07-16) |
| Sesiones documentadas | activo desde 2026-07-13 |

---

## Repos canónicos y estado

| Repo | Estado | AGENT.md | CONTEXT.md | Última actividad |
|---|---|---|---|---|
| `yggdrasil-dew` | ✅ activo | ✅ | ✅ | 2026-07-16 |
| `WIKI---PERSONAL` | ✅ activo | ⚠️ pendiente | ⚠️ pendiente | 2026-07-16 |
| `yggdrasil-tracking` | ✅ activo | ⚠️ pendiente | ⚠️ pendiente | 2026-07-13 |
| `THDORA-PERSONAL` | ✅ activo | ⚠️ pendiente | ⚠️ pendiente | reciente |
| `madre-config` | ✅ activo | ❌ no tiene | ❌ no tiene | reciente |
| `yggdrasil-secops` | ✅ activo | ❌ no tiene | ❌ no tiene | reciente |
| `local-brain` | ⚠️ standby | ❌ no tiene | ❌ no tiene | - |
| `yggdrasil-scripts` | ✅ activo | ❌ no tiene | ❌ no tiene | reciente |
| `yggdrasil-formacion` | ✅ activo | ❌ no tiene | ❌ no tiene | reciente |
| `acer-config` | ⚠️ standby | ❌ no tiene | ❌ no tiene | - |
| `dev-labs` | ⚠️ standby | ❌ no tiene | ❌ no tiene | - |

---

## Servicios Docker en Madre

| Servicio | Estado | Puerto | Notas |
|---|---|---|---|
| n8n | ✅ | 5678 | Automatización |
| Qdrant | ✅ | 6333 | Vector DB para RAG |
| Ollama | ✅ | 11434 | LLM local |
| LiteLLM | ✅ | 4000 | Proxy LLM |
| Tailscale | ✅ | - | VPN mesh |

---

## HALs activos

| HAL | Severidad | Estado | Descripción breve |
|---|---|---|---|
| *(sin HALs críticos activos en 2026-07-16)* | - | - | - |

---

## Protocolos disponibles en `docs/canon/`

| Protocolo | Archivo | Estado |
|---|---|---|
| Inicio de sesión | `PROTOCOLO-INICIO-SESION.md` | ✅ v4 |
| Cierre de sesión | `PROTOCOLO-CIERRE-SESION.md` | ✅ v1 (2026-07-16) |
| Auditoría | `PROTOCOLO-AUDITORIA.md` | ✅ v1 (2026-07-16) |
| Alineación ecosistema | `PROTOCOLO-ALINEACION.md` | ✅ v1 (2026-07-16) |
| Entrada nueva isla | `NORMA-ENTRADA-NUEVA-ISLA.md` | ✅ vigente |
| Normas Tridente | `NORMAS-TRIDENTE.md` | ✅ vigente |

---

## Plantillas disponibles en `docs/canon/`

| Plantilla | Archivo | Estado |
|---|---|---|
| AGENT.md | `AGENT-template.md` | ✅ v1 (2026-07-16) |
| CONTEXT.md | `CONTEXT-template.md` | ✅ v1 (2026-07-16) |
| ADR | `PLANTILLA-ADR.md` | ✅ vigente |
| Protocolo | `PLANTILLA-PROTOCOLO.md` | ✅ vigente |
| Isla wiki | `PLANTILLA-ISLA-WIKI.md` | ✅ vigente |
| Estado isla | `PLANTILLA-ESTADO-ISLA.md` | ✅ vigente |
| Diario DEW | `PLANTILLA-DIARIO-DEW.md` | ✅ vigente |
| Diario tracking | `PLANTILLA-DIARIO-TRACKING.md` | ✅ vigente |
| Apunte formación | `PLANTILLA-APUNTE-FORMACION.md` | ✅ vigente |

---

## Próxima acción prioritaria

> Instanciar `AGENT.md` y `CONTEXT.md` en `WIKI---PERSONAL`, `yggdrasil-tracking`, `THDORA-PERSONAL`.

---

_v2 — 2026-07-16 · Actualizado post-sesión alineación completa · Perplexity MCP_
