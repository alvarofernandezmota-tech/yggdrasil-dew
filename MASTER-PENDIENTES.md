---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 00:29 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-18 00:29 CEST.
> Actualizar al inicio y cierre de cada sesion.

---

## Regla canon DEW / Tracking

> - `yggdrasil-dew/docs/sesiones/` -> diarios de **trabajo tecnico**
> - `yggdrasil-tracking/diarios/` -> diarios **personales**
> - Ningun agente viola esta separacion.

---

## Estado de Fases

| Fase | Descripcion | Estado | Notas |
|---|---|---|---|
| **F0** | Seguridad repos | ⚪ Parcial | SSH/puerto21 pendiente terminal |
| **F1** | Canon ADRs (001-013) | ✅ CERRADA | 13 ADRs + INDEX correcto |
| **F2** | Unificar indices WIKI | ✅ CERRADA | README + HOME + INDEX.md OK |
| **F3** | Purga WIKI | ⚪ PENDIENTE | Sesion dedicada con Alvaro — issue #59 |
| **F4** | Consolidar MCP | ✅ CERRADA | wiki/islas/mcp.md verificado |
| **F5** | CI enforcement | ✅ CERRADA | gitleaks + validate-canon + markdownlint |
| **F6** | Ritual semanal | ✅ CERRADA | PROTOCOLO-RITUAL-SEMANAL v1.0 |
| **F7** | GitOps/Observabilidad | 🔵 PARCIAL | healthchecks docker + Loki pendientes terminal |
| **F8** | VIDAPERSONAL a tracking | ✅ CERRADA | ADR-011 + #48 cerrado |
| **F9** | Protocolo cierre/inicio/ADR | ✅ CERRADA | Protocolos canon vigentes |
| **F10** | Protocolo naming + borrado | ✅ CERRADA | PROTOCOLO-NOMBRES v2.0 + PROTOCOLO-BORRADO v1.0 |
| **F11** | Separacion DEW/tracking diarios | ✅ CERRADA | Regla canon desde 2026-07-15 |
| **F12** | fix consistencia nombres repos | ✅ CERRADA | DEW (10 archivos) + WIKI (3 islas) 2026-07-16 |
| **F13** | Protocolos contexto x4 repos | ✅ CERRADA | CONTEXTO-DEW/WIKI/TRACKING/FORMACION 2026-07-16 |
| **F14** | Protocolos auditoria x4 repos | ✅ CERRADA | AUDITORIA-DEW/WIKI/TRACKING/FORMACION 2026-07-16 |
| **F15** | Sistema completo de protocolos | ✅ CERRADA | 36 protocolos + INDEX v4.0 + 5 atomos + ACTUALIZACION x4 + DOCUMENTACION 2026-07-16 |
| **F16** | Islas de contenido personal | ⚪ CONCEPTUAL | Hip Hop / Whisky / Vida |
| **F17** | Protocolos emergentes + auditoria | 🔵 EN PROGRESO | EMERGENCIA + RITUAL-SEMANAL + RENOMBRAR-REPO creados. Pendiente: NUEVO-DIARIO-TRACKING (#69) |
| **F18** | Auditoria Madre completa | ✅ CERRADA | SSH + 23 contenedores + islas actualizadas 2026-07-16 tarde |
| **F19** | Auditoria canon + AGENT.md ecosistema | ✅ CERRADA | PROTOCOLO-ALINEACION v2 + INICIO v5 + CIERRE v2 + tracking/THDORA operativos 2026-07-16 noche |
| **F20** | Documentar hardware Madre (CPU/placa) | ⚪ PENDIENTE TERMINAL | Gap detectado 2026-07-18 — requiere dmidecode en Madre |

---

## Canon de protocolos — estado real 2026-07-16

### NIVEL 1 — Globales (14)

| Protocolo | Estado |
|---|---|
| APERTURA-SESION | ✅ v2.0 |
| CIERRE-SESION | ✅ v3.0 |
| CONTEXTO-ECOSISTEMA | ✅ v1.0 |
| ACTUALIZACION-ECOSISTEMA | ✅ v1.0 |
| SINCRONIZACION-ECOSISTEMA | ✅ v1.0 |
| AUDITORIA-ECOSISTEMA | ✅ v1.0 |
| RITUAL-SEMANAL | ✅ v1.0 (F17) |
| NOMBRES | ✅ v2.0 |
| BORRADO | ✅ v1.0 |
| DEPRECAR-ARCHIVO | ✅ v1.0 |
| SECRETOS | ✅ v1.0 |
| DOCUMENTACION-ECOSISTEMA | ✅ v1.0 |
| EMERGENCIA | ✅ v1.0 (F17) |
| RENOMBRAR-REPO | ✅ v1.0 (F17) |
| VERIFICACION-COMMITS | ✅ v1.0 nuevo 2026-07-16 |
| INICIO-SESION | ✅ v5 actualizado 2026-07-16 |
| ALINEACION | ✅ v2 corregido 2026-07-16 |

### NIVEL 2 — Por repo (20)

| Protocolo | Estado |
|---|---|
| APERTURA x4 (DEW/WIKI/TRACKING/FORMACION) | ✅ v1.0 |
| CONTEXTO x4 | ✅ v1.0 |
| SINCRONIZACION x4 | ✅ v1.0 |
| AUDITORIA x4 | ✅ v1.0 |
| ACTUALIZACION x4 | ✅ v1.0 |

### NIVEL 3 — Atomos (9)

| Protocolo | Estado |
|---|---|
| NUEVO-ADR / NUEVA-ISLA / NUEVO-REPO | ✅ v1.0 |
| NUEVO-APUNTE / NUEVO-SCRIPT / NUEVO-DIARIO-DEW | ✅ v1.0 |
| NUEVO-PROTOCOLO / ENTRADA-TRACKING / DEPRECAR-ARCHIVO | ✅ v1.0 |
| NUEVO-DIARIO-TRACKING | ⚪ Pendiente F17 — issue #69 |

**TOTAL: 45 protocolos + INDEX v5.0**

---

## AGENT.md + CONTEXT.md por repo — estado real 2026-07-16

| Repo | AGENT.md | CONTEXT.md |
|---|---|---|
| `yggdrasil-dew` | ✅ | ✅ |
| `yggdrasil-wiki` | ✅ | ✅ |
| `yggdrasil-tracking` | ✅ 2026-07-16 | ✅ 2026-07-16 |
| `THDORA-PERSONAL` | ✅ 2026-07-16 | ✅ 2026-07-16 |
| `madre-config` | ❓ sin verificar | ❓ sin verificar |
| `yggdrasil-secops` | ❓ sin verificar | ❓ sin verificar |
| `ollama-stack` | ❓ sin verificar | ❓ sin verificar |

---

## Canon de plantillas — 2026-07-16

| Plantilla | Estado |
|---|---|
| PLANTILLA-DIARIO-DEW | ✅ v1.0 |
| PLANTILLA-DIARIO-TRACKING | ✅ v1.0 |
| PLANTILLA-ISLA-WIKI | ✅ v1.0 |
| PLANTILLA-APUNTE-FORMACION | ✅ v1.0 |
| PLANTILLA-ADR | ✅ v1.0 |
| PLANTILLA-PROTOCOLO | ✅ v1.0 |
| PLANTILLA-ESTADO-ISLA | ✅ v1.0 |
| PLANTILLA-WHISKY | ⚪ F16 |
| PLANTILLA-HIPHOP | ⚪ F16 |
| PLANTILLA-VIDA | ⚪ F16 |

---

## Bloqueantes criticos (requieren terminal)

| Issue | Titulo | Urgencia | Nota |
|---|---|---|---|
| [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) | HAL-008 Token Telegram THDORA | 🔴 Alta | Runbook listo en issue |
| [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) | HAL-006 puerto 3000 yggdrasil-mcp | 🔴 Alta | Runbook listo en issue |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 HDD Madre 28.000h | 🟡 Media | SMART PASSED — monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | 🟡 Media | Es router Digi, no Madre |

---

## Pendiente MCP

| Issue | Descripcion | Prioridad |
|---|---|---|
| [#69](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/69) | F17 NUEVO-DIARIO-TRACKING protocolo | 🟡 Media |
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 purga WIKI archivos deprecados | 🟡 Media |
| [#73](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/73) | Renombrar ownership-matrix.md | 🟡 Menor |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant telemetria falso positivo | 🟡 Baja |
| [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 healthchecks + Loki | 🔵 Baja |

---

## Diarios personales pendientes (TRACKING)

| Fecha | Estado |
|---|---|
| 2026-07-13 al 2026-07-16 | ⚠️ Completar en proxima sesion tracking |

---

## F16 — Islas de contenido personal (conceptual)

| Isla | Repo propuesto | Estado |
|---|---|---|
| Hip Hop / Rap | yggdrasil-hiphop | ⚪ Conceptual |
| Whisky | yggdrasil-whisky | ⚪ Conceptual |
| Vida personal | yggdrasil-tracking | ⚪ Conceptual |

---

## Largo plazo

| Tarea | Notas |
|---|---|
| RAG sobre canon (Ollama + Qdrant) | Cuando canon este estable |
| THDORA ejecutando protocolos | Cuando RAG este operativo + token resuelto |
| check-nombres.sh | Automatizar PROTOCOLO-NOMBRES |
| Auditoria ecosistema completa | Primer domingo agosto 2026 |
| Renombrar WIKI---PERSONAL -> yggdrasil-wiki en GitHub | PROTOCOLO-RENOMBRAR-REPO listo |
| AGENT.md en madre-config, secops, ollama-stack | Verificar y crear si no existen |
| Documentar CPU/placa Madre (F20) | Requiere terminal — dmidecode |

---

_Actualizado: 2026-07-18 00:29 CEST — F20 añadida (hardware Madre) — cierre sesion 2026-07-18 — Perplexity MCP_
