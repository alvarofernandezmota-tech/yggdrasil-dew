---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-16 15:32 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-16 15:32 CEST.
> Actualizar al inicio y cierre de cada sesion.

---

## Regla canon DEW / Tracking

> - `yggdrasil-dew/docs/diarios/` -> diarios de **trabajo tecnico**
> - `yggdrasil-tracking/diarios/` -> diarios **personales** (que vivo, que pienso)
> - Ningun agente viola esta separacion.

---

## Estado de Fases

| Fase | Descripcion | Estado | Notas |
|---|---|---|---|
| **F0** | Seguridad repos | ⚪ Parcial | SSH/puerto21 pendiente terminal |
| **F1** | Canon ADRs (001-013) | ✅ CERRADA | 13 ADRs + INDEX correcto |
| **F2** | Unificar indices WIKI | ✅ CERRADA | README + HOME + INDEX.md OK |
| **F3** | Purga WIKI | ⚪ PENDIENTE | Sesion dedicada con Alvaro |
| **F4** | Consolidar MCP | ✅ CERRADA | wiki/islas/mcp.md verificado |
| **F5** | CI enforcement | ✅ CERRADA | gitleaks + validate-canon + markdownlint |
| **F6** | Ritual semanal | 📌 DEFINIDO | Primera ejecucion: domingo 19-Jul |
| **F7** | GitOps/Observabilidad | 🔵 PARCIAL | healthchecks docker + Loki pendientes terminal |
| **F8** | VIDAPERSONAL a tracking | ✅ CERRADA | ADR-011 + #48 cerrado |
| **F9** | Protocolo cierre/inicio/ADR | ✅ CERRADA | Protocolos canon vigentes |
| **F10** | Protocolo naming + borrado | ✅ CERRADA | PROTOCOLO-NOMBRES v2.0 + PROTOCOLO-BORRADO v1.0 |
| **F11** | Separacion DEW/tracking diarios | ✅ CERRADA | Regla canon desde 2026-07-15 |
| **F12** | fix #65 consistencia nombres repos | ✅ CERRADA | DEW (10 archivos) + WIKI (3 islas) 2026-07-16 |
| **F13** | Protocolos contexto x4 repos | ✅ CERRADA | CONTEXTO-DEW/WIKI/TRACKING/FORMACION 2026-07-16 |
| **F14** | Protocolos auditoria x4 repos | ✅ CERRADA | AUDITORIA-DEW/WIKI/TRACKING/FORMACION 2026-07-16 |
| **F15** | Sistema completo de protocolos | ✅ CERRADA | 36 protocolos + INDEX v4.0 + 5 atomos + ACTUALIZACION x4 + DOCUMENTACION 2026-07-16 |
| **F16** | Islas de contenido personal | ⚪ CONCEPTUAL | Hip Hop / Whisky / Vida |

---

## Canon de protocolos — estado real 2026-07-16

### NIVEL 1 — Globales

| Protocolo | Ruta | Estado |
|---|---|---|
| APERTURA-SESION | `protocolo/PROTOCOLO-APERTURA-SESION.md` | ✅ v2.0 |
| CIERRE-SESION | `protocolo/PROTOCOLO-CIERRE-SESION.md` | ✅ v2.0 |
| CONTEXTO-ECOSISTEMA | `protocolo/PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | ✅ v1.0 |
| ACTUALIZACION-ECOSISTEMA | `protocolo/PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md` | ✅ v1.0 |
| SINCRONIZACION-ECOSISTEMA | `protocolo/PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md` | ✅ v1.0 |
| AUDITORIA-ECOSISTEMA | `protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md` | ✅ v1.0 |
| NOMBRES | `protocolo/PROTOCOLO-NOMBRES.md` | ✅ v2.0 |
| BORRADO | `protocolo/PROTOCOLO-BORRADO.md` | ✅ v1.0 |
| DEPRECAR-ARCHIVO | `protocolo/PROTOCOLO-DEPRECAR-ARCHIVO.md` | ✅ v1.0 |
| SECRETOS | `protocolo/PROTOCOLO-SECRETOS.md` | ✅ v1.0 |
| DOCUMENTACION-ECOSISTEMA | `protocolo/PROTOCOLO-DOCUMENTACION-ECOSISTEMA.md` | ✅ v1.0 |

### NIVEL 2 — Por repo

| Protocolo | Ruta | Estado |
|---|---|---|
| APERTURA-DEW | `protocolo/PROTOCOLO-APERTURA-DEW.md` | ✅ v1.0 |
| APERTURA-WIKI | `protocolo/PROTOCOLO-APERTURA-WIKI.md` | ✅ v1.0 |
| APERTURA-TRACKING | `protocolo/PROTOCOLO-APERTURA-TRACKING.md` | ✅ v1.0 |
| APERTURA-FORMACION | `protocolo/PROTOCOLO-APERTURA-FORMACION.md` | ✅ v1.0 |
| CONTEXTO-DEW | `protocolo/PROTOCOLO-CONTEXTO-DEW.md` | ✅ v1.0 |
| CONTEXTO-WIKI | `protocolo/PROTOCOLO-CONTEXTO-WIKI.md` | ✅ v1.0 |
| CONTEXTO-TRACKING | `protocolo/PROTOCOLO-CONTEXTO-TRACKING.md` | ✅ v1.0 |
| CONTEXTO-FORMACION | `protocolo/PROTOCOLO-CONTEXTO-FORMACION.md` | ✅ v1.0 |
| SINCRONIZACION-DEW | `protocolo/PROTOCOLO-SINCRONIZACION-DEW.md` | ✅ v1.0 |
| SINCRONIZACION-WIKI | `protocolo/PROTOCOLO-SINCRONIZACION-WIKI.md` | ✅ v1.0 |
| SINCRONIZACION-TRACKING | `protocolo/PROTOCOLO-SINCRONIZACION-TRACKING.md` | ✅ v1.0 |
| SINCRONIZACION-FORMACION | `protocolo/PROTOCOLO-SINCRONIZACION-FORMACION.md` | ✅ v1.0 |
| AUDITORIA-DEW | `protocolo/PROTOCOLO-AUDITORIA-DEW.md` | ✅ v1.0 |
| AUDITORIA-WIKI | `protocolo/PROTOCOLO-AUDITORIA-WIKI.md` | ✅ v1.0 |
| AUDITORIA-TRACKING | `protocolo/PROTOCOLO-AUDITORIA-TRACKING.md` | ✅ v1.0 |
| AUDITORIA-FORMACION | `protocolo/PROTOCOLO-AUDITORIA-FORMACION.md` | ✅ v1.0 |
| ACTUALIZACION-DEW | `protocolo/PROTOCOLO-ACTUALIZACION-DEW.md` | ✅ v1.0 |
| ACTUALIZACION-WIKI | `protocolo/PROTOCOLO-ACTUALIZACION-WIKI.md` | ✅ v1.0 |
| ACTUALIZACION-TRACKING | `protocolo/PROTOCOLO-ACTUALIZACION-TRACKING.md` | ✅ v1.0 |
| ACTUALIZACION-FORMACION | `protocolo/PROTOCOLO-ACTUALIZACION-FORMACION.md` | ✅ v1.0 |

### NIVEL 3 — Atomos

| Protocolo | Ruta | Estado |
|---|---|---|
| NUEVO-ADR | `protocolo/PROTOCOLO-NUEVO-ADR.md` | ✅ v1.0 |
| NUEVA-ISLA | `protocolo/PROTOCOLO-NUEVA-ISLA.md` | ✅ v1.0 |
| NUEVO-REPO | `protocolo/PROTOCOLO-NUEVO-REPO.md` | ✅ v1.0 |
| NUEVO-APUNTE | `protocolo/PROTOCOLO-NUEVO-APUNTE.md` | ✅ v1.0 |
| NUEVO-SCRIPT | `protocolo/PROTOCOLO-NUEVO-SCRIPT.md` | ✅ v1.0 |
| ENTRADA-TRACKING | `protocolo/PROTOCOLO-ENTRADA-TRACKING.md` | ✅ v1.0 |
| NUEVO-DIARIO-DEW | `protocolo/PROTOCOLO-NUEVO-DIARIO-DEW.md` | ✅ v1.0 |
| NUEVO-PROTOCOLO | `protocolo/PROTOCOLO-NUEVO-PROTOCOLO.md` | ✅ v1.0 |
| DEPRECAR-ARCHIVO | `protocolo/PROTOCOLO-DEPRECAR-ARCHIVO.md` | ✅ v1.0 |

---

## Canon de plantillas — estado real 2026-07-16

| Plantilla | Ruta | Estado |
|---|---|---|
| PLANTILLA-DIARIO-DEW | `docs/canon/PLANTILLA-DIARIO-DEW.md` | ✅ v1.0 |
| PLANTILLA-DIARIO-TRACKING | `docs/canon/PLANTILLA-DIARIO-TRACKING.md` | ✅ v1.0 |
| PLANTILLA-ISLA-WIKI | `docs/canon/PLANTILLA-ISLA-WIKI.md` | ✅ v1.0 |
| PLANTILLA-APUNTE-FORMACION | `docs/canon/PLANTILLA-APUNTE-FORMACION.md` | ✅ v1.0 |
| PLANTILLA-ADR | `docs/canon/PLANTILLA-ADR.md` | ✅ v1.0 |
| PLANTILLA-PROTOCOLO | `docs/canon/PLANTILLA-PROTOCOLO.md` | ✅ v1.0 |
| PLANTILLA-ESTADO-ISLA | `docs/canon/PLANTILLA-ESTADO-ISLA.md` | ✅ v1.0 |
| PLANTILLA-WHISKY | `docs/canon/PLANTILLA-WHISKY.md` | ⚪ F16 |
| PLANTILLA-HIPHOP | `docs/canon/PLANTILLA-HIPHOP.md` | ⚪ F16 |
| PLANTILLA-VIDA | `docs/canon/PLANTILLA-VIDA.md` | ⚪ F16 |

---

## Bloqueantes criticos (requieren terminal)

| Issue | Titulo | Urgencia |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 HDD Madre 28.000h | 🔴 Alta |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 Token Telegram | 🔴 Alta |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | 🔴 Alta |

---

## Pendiente MCP (sin terminal)

| Issue | Descripcion | Prioridad |
|---|---|---|
| [#65](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/65) | fix #65 cerrar issue formalmente | 🟡 Media |
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 purga WIKI | 🟡 Media |
| [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 healthchecks + Loki | 🔵 Baja |

---

## Diarios personales pendientes (TRACKING)

| Fecha | Estado |
|---|---|
| 2026-07-13 | ⚠️ Completar |
| 2026-07-14 | ⚠️ Completar |
| 2026-07-15 | ⚠️ Completar |
| 2026-07-16 | ⚠️ Pendiente hoy |

---

## F16 — Islas de contenido personal (conceptual)

| Isla | Repo propuesto | Plantilla | Estado |
|---|---|---|---|
| Hip Hop / Rap | yggdrasil-hiphop | PLANTILLA-HIPHOP.md | ⚪ Conceptual |
| Whisky | yggdrasil-whisky | PLANTILLA-WHISKY.md | ⚪ Conceptual |
| Vida personal | yggdrasil-tracking | PLANTILLA-VIDA.md | ⚪ Conceptual |

---

## Largo plazo

| Tarea | Notas |
|---|---|
| RAG sobre canon (Ollama + Qdrant) | Cuando canon este 100% estable |
| THDORA ejecutando protocolos | Cuando RAG este operativo |
| check-nombres.sh | Automatizar PROTOCOLO-NOMBRES |
| Auditoria ecosistema completa | Primera ejecucion: cierre julio 2026 |

---

_Actualizado: 2026-07-16 15:32 CEST - F15 CERRADA - 36 protocolos completos 4 niveles - Perplexity MCP_
