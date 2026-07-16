---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-16 14:35 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-16 14:35 CEST.
> Actualizar al inicio y cierre de cada sesión.

---

## 📌 Separación definitiva DEW / Tracking

> **Regla canon desde 2026-07-15:**
> - `yggdrasil-dew/docs/diarios/` → diarios de **trabajo técnico**
> - `yggdrasil-tracking/diarios/` → diarios **personales** (QUÉ vivo, QUÉ pienso, QUÉ soy)
> - El protocolo de apertura debe respetar esta separación. Ningún agente la viola.

---

## Estado de Fases

| Fase | Descripcion | Estado | Notas |
|---|---|---|---|
| **F0** | Seguridad repos | ⚪ Parcial | SSH/puerto21 pendiente terminal |
| **F1** | Canon ADRs (001→012) | ✅ CERRADA | 12 ADRs · INDEX correcto |
| **F2** | Unificar índices WIKI | ✅ CERRADA | README + HOME + INDEX.md OK |
| **F3** | Purga WIKI 279→80 archivos | ⚪ PENDIENTE | Sesión dedicada con Álvaro |
| **F4** | Consolidar MCP | ✅ CERRADA | wiki/islas/mcp.md verificado |
| **F5** | CI enforcement | ✅ CERRADA | gitleaks + validate-canon + markdownlint |
| **F6** | Ritual semanal | 📌 DEFINIDO | Primera ejecución: domingo 19-Jul |
| **F7** | GitOps/Observabilidad | 🔵 PARCIAL | healthchecks docker ❌ · Loki ❌ |
| **F8** | VIDAPERSONAL → tracking | ✅ CERRADA | ADR-011 · #48 cerrado |
| **F9** | Protocolo cierre/inicio/ADR | ✅ CERRADA | 5 protocolos canon vigentes |
| **F10** | Protocolo de naming + borrado | ✅ CERRADA | PROTOCOLO-NOMBRES v2.0 + PROTOCOLO-BORRADO v1.0 |
| **F11** | Separación DEW/tracking diarios | ✅ CERRADA | Ejecutado 2026-07-15 · regla canon documentada |
| **F12** | fix #65 — consistencia nombres repos | 🔵 EN PROGRESO | 7/16 archivos corregidos · sesión 2026-07-16 |
| **F13** | Protocolos de contexto (4 repos) | ⚪ PENDIENTE | PROTOCOLO-CONTEXTO-DEW/WIKI/TRACKING/FORMACION |
| **F14** | Protocolos de auditoría (4 repos) | ⚪ PENDIENTE | PROTOCOLO-AUDITORIA-DEW/WIKI/TRACKING/FORMACION |

---

## Canon de protocolos — estado real

> ⚠️ Estado post-borrado 2026-07-14: se borraron 22 protocolos. Los siguientes se recrearon en sesión 2026-07-15.

| Protocolo | Ruta | Estado |
|---|---|---|
| Apertura de sesión | `protocolo/PROTOCOLO-APERTURA-SESION.md` | ✅ v2.0 |
| Cierre de sesión | `protocolo/PROTOCOLO-CIERRE-SESION.md` | ✅ v2.0 |
| Nombres / Naming | `protocolo/PROTOCOLO-NOMBRES.md` | ✅ v2.0 |
| Auditoría ecosistema | `protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md` | ✅ v1.0 |
| Borrado en cascada | `protocolo/PROTOCOLO-BORRADO.md` | ✅ v1.0 |
| CONTEXTO-ECOSISTEMA | `protocolo/PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | ⚪ Pendiente #68 |
| CONTEXTO-REPOS | `protocolo/PROTOCOLO-CONTEXTO-REPOS.md` | ⚪ Pendiente #68 |
| AUDITORIA-WIKI | `protocolo/PROTOCOLO-AUDITORIA-WIKI.md` | ⚪ Pendiente #68 |
| SECRETOS | `protocolo/PROTOCOLO-SECRETOS.md` | ⚪ Pendiente #68 |
| CONTEXTO-DEW | `protocolo/PROTOCOLO-CONTEXTO-DEW.md` | ⚪ Pendiente F13 |
| CONTEXTO-WIKI | `protocolo/PROTOCOLO-CONTEXTO-WIKI.md` | ⚪ Pendiente F13 |
| CONTEXTO-TRACKING | `protocolo/PROTOCOLO-CONTEXTO-TRACKING.md` | ⚪ Pendiente F13 |
| CONTEXTO-FORMACION | `protocolo/PROTOCOLO-CONTEXTO-FORMACION.md` | ⚪ Pendiente F13 |
| AUDITORIA-DEW | `protocolo/PROTOCOLO-AUDITORIA-DEW.md` | ⚪ Pendiente F14 |
| AUDITORIA-TRACKING | `protocolo/PROTOCOLO-AUDITORIA-TRACKING.md` | ⚪ Pendiente F14 |
| AUDITORIA-FORMACION | `protocolo/PROTOCOLO-AUDITORIA-FORMACION.md` | ⚪ Pendiente F14 |

---

## Bloqueantes críticos — terminal (próxima sesión con Madre)

| Issue | Título | Tiempo est. |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 — HDD Madre 28.000h | 5 min |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 — Token Telegram | 10 min |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | 10 min |

---

## Pendiente MCP (sin terminal)

| Issue | Descripción | Prioridad |
|---|---|---|
| [#68](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/68) | Recrear protocolos alta prioridad (CONTEXTO, AUDITORIA-WIKI, SECRETOS) | 🔴 Alta |
| [#65](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/65) | fix #65 consistencia nombres — 7/16 hecho | 🟡 Media |
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 — purga WIKI | 🟡 Media |
| [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 — healthchecks + Loki | 🔵 Baja |

---

## Pendiente tracking — diarios personales

| Archivo | Estado | Acción |
|---|---|---|
| `tracking/diarios/2026/07-julio/2026-07-13.md` | ⚠️ Plantilla | Completar: estado personal + ritual vela |
| `tracking/diarios/2026/07-julio/2026-07-14.md` | ⚠️ Plantilla | Completar: estado personal del martes |
| `tracking/diarios/2026/07-julio/2026-07-15.md` | ⚠️ Plantilla | Completar: estado personal del miércoles |
| `tracking/diarios/2026/07-julio/2026-07-16.md` | ⚠️ Pendiente | Completar: estado personal del jueves |

> Volver a tracking en próxima sesión dedicada.

---

## Pendiente corto plazo — próxima sesión

| Tarea | Prioridad | Notas |
|---|---|---|
| Renombrar `WIKI---PERSONAL` → `yggdrasil-wiki` en Madre | 🔴 Alta | `mv /home/varopc/WIKI---PERSONAL /home/varopc/yggdrasil-wiki` |
| Verificar/eliminar `yggdrasil-formacion-` de Madre si existe | 🔴 Alta | `ls -la` primero para confirmar |
| Clonar repos faltantes en Madre | 🟡 Media | tracking, scripts, madre-config, ollama-stack, THDORA... |
| Recrear protocolos alta prioridad (F13+F14) | 🔴 Alta | CONTEXTO-DEW/WIKI/TRACKING/FORMACION + AUDITORIA x4 |
| Completar fix #65 — 9 archivos WIKI/TRACKING pendientes | 🔴 Alta | wiki/islas/VIDAPERSONAL, tracking.md, formacion.md |
| Definir primer proyecto real | 🔴 Alta | Álvaro decide cuál |

---

## Pendiente largo plazo

| Tarea | Notas |
|---|---|
| RAG sobre canon (Ollama + Qdrant) | Cuando canon esté 100% estable |
| THDORA ejecutando protocolos | Cuando RAG esté operativo |
| `check-nombres.sh` script nivel 1 | Automatizar PROTOCOLO-NOMBRES |
| Auditoría ecosistema completa (7 fases) | Primera ejecución: cierre de julio |

---

_Actualizado: 2026-07-16 14:35 CEST · fix #65 en progreso · F13+F14 protocolos contexto pendientes · Perplexity MCP_
