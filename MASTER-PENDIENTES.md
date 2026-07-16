---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-16 14:53 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-16 14:53 CEST.
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
| **F1** | Canon ADRs (001→013) | ✅ CERRADA | 13 ADRs · INDEX correcto |
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
| **F12** | fix #65 — consistencia nombres repos | ✅ CERRADA | DEW (10 archivos) + WIKI (3 islas) corregidos · 2026-07-16 |
| **F13** | Protocolos de contexto (4 repos) | ✅ CERRADA | PROTOCOLO-CONTEXTO-DEW/WIKI/TRACKING/FORMACION creados · 2026-07-16 |
| **F14** | Protocolos de auditoría (4 repos) | ✅ CERRADA | PROTOCOLO-AUDITORIA-DEW/WIKI/TRACKING/FORMACION creados · 2026-07-16 |
| **F15** | Sistema plantillas + protocolo actualización | 🔵 EN PROGRESO | ADR-013 + 7 plantillas + PROTOCOLO-ACTUALIZACION-ECOSISTEMA + INDEX protocolos · 2026-07-16 |

---

## Canon de protocolos — estado REAL post-sesión 2026-07-16

| Protocolo | Ruta | Estado |
|---|---|---|
| Apertura de sesión | `docs/canon/PROTOCOLO-INICIO-SESION.md` | ✅ v1.0 (pendiente mover a protocolo/ v2.0) |
| Cierre de sesión | `protocolo/PROTOCOLO-CIERRE-SESION.md` | ✅ v2.0 |
| Nombres / Naming | `protocolo/PROTOCOLO-NOMBRES.md` | ✅ v2.0 |
| Auditoría ecosistema | `protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md` | ✅ v1.0 |
| Borrado en cascada | `protocolo/PROTOCOLO-BORRADO.md` | ✅ v1.0 |
| CONTEXTO-DEW | `protocolo/PROTOCOLO-CONTEXTO-DEW.md` | ✅ v1.0 (F13) |
| CONTEXTO-WIKI | `protocolo/PROTOCOLO-CONTEXTO-WIKI.md` | ✅ v1.0 (F13) |
| CONTEXTO-TRACKING | `protocolo/PROTOCOLO-CONTEXTO-TRACKING.md` | ✅ v1.0 (F13) |
| CONTEXTO-FORMACION | `protocolo/PROTOCOLO-CONTEXTO-FORMACION.md` | ✅ v1.0 (F13) |
| AUDITORIA-DEW | `protocolo/PROTOCOLO-AUDITORIA-DEW.md` | ✅ v1.0 (F14) |
| AUDITORIA-WIKI | `protocolo/PROTOCOLO-AUDITORIA-WIKI.md` | ✅ v1.0 (F14) |
| AUDITORIA-TRACKING | `protocolo/PROTOCOLO-AUDITORIA-TRACKING.md` | ✅ v1.0 (F14) |
| AUDITORIA-FORMACION | `protocolo/PROTOCOLO-AUDITORIA-FORMACION.md` | ✅ v1.0 (F14) |
| ACTUALIZACION-ECOSISTEMA | `protocolo/PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md` | ✅ v1.0 (F15) |
| INDEX protocolos | `protocolo/INDEX.md` | ✅ v1.0 (F15) |
| CONTEXTO-ECOSISTEMA | `protocolo/PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | ⚪ Pendiente — F15 |
| SECRETOS | `protocolo/PROTOCOLO-SECRETOS.md` | ⚪ Pendiente — F15 |
| ACTUALIZACION-DEW | `protocolo/PROTOCOLO-ACTUALIZACION-DEW.md` | ⚪ Pendiente — F15 |
| ACTUALIZACION-WIKI | `protocolo/PROTOCOLO-ACTUALIZACION-WIKI.md` | ⚪ Pendiente — F15 |
| ACTUALIZACION-TRACKING | `protocolo/PROTOCOLO-ACTUALIZACION-TRACKING.md` | ⚪ Pendiente — F15 |
| ACTUALIZACION-FORMACION | `protocolo/PROTOCOLO-ACTUALIZACION-FORMACION.md` | ⚪ Pendiente — F15 |
| DOCUMENTACION-ECOSISTEMA | `protocolo/PROTOCOLO-DOCUMENTACION-ECOSISTEMA.md` | ⚪ Pendiente — F15 |
| APERTURA-SESION v2.0 | `protocolo/PROTOCOLO-APERTURA-SESION.md` | ⚪ Pendiente — F15 |

---

## Canon de plantillas — estado REAL post-sesión 2026-07-16

| Plantilla | Ruta | Para qué | Estado |
|---|---|---|---|
| PLANTILLA-DIARIO-DEW | `docs/canon/PLANTILLA-DIARIO-DEW.md` | Diarios técnicos sesión | ✅ v1.0 |
| PLANTILLA-DIARIO-TRACKING | `docs/canon/PLANTILLA-DIARIO-TRACKING.md` | Diarios personales | ✅ v1.0 |
| PLANTILLA-ISLA-WIKI | `docs/canon/PLANTILLA-ISLA-WIKI.md` | Islas nuevas en WIKI | ✅ v1.0 |
| PLANTILLA-APUNTE-FORMACION | `docs/canon/PLANTILLA-APUNTE-FORMACION.md` | Apuntes HTB/cursos/labs | ✅ v1.0 |
| PLANTILLA-ADR | `docs/canon/PLANTILLA-ADR.md` | ADRs en docs/adr/ | ✅ v1.0 |
| PLANTILLA-PROTOCOLO | `docs/canon/PLANTILLA-PROTOCOLO.md` | Protocolos nuevos | ✅ v1.0 |
| PLANTILLA-ESTADO-ISLA | `docs/canon/PLANTILLA-ESTADO-ISLA.md` | ESTADO-ISLA-*.md en DEW | ✅ v1.0 |
| PLANTILLA-README-ISLA | dentro de NORMA-ENTRADA-NUEVA-ISLA.md | README mínimo nueva isla | ✅ vigente |
| PLANTILLA-WHISKY | `docs/canon/PLANTILLA-WHISKY.md` | Fichas de whisky | ⚪ Pendiente — F16 |
| PLANTILLA-HIPHOP | `docs/canon/PLANTILLA-HIPHOP.md` | Fichas rap / hip hop | ⚪ Pendiente — F16 |
| PLANTILLA-VIDA | `docs/canon/PLANTILLA-VIDA.md` | Notas de vida personal | ⚪ Pendiente — F16 |

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
| [#65](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/65) | fix #65 — verificar TRACKING + cerrar issue | 🟡 Media |
| [#68](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/68) | Protocolos alta prioridad pendientes (SECRETOS, CONTEXTO-ECOSISTEMA) | 🟡 Media |
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

## F15 — Pendiente (próxima sesión MCP)

| Tarea | Prioridad | Notas |
|---|---|---|
| PROTOCOLO-APERTURA-SESION v2.0 | 🔴 Alta | Mover de docs/canon/ a protocolo/ + actualizar |
| PROTOCOLO-CONTEXTO-ECOSISTEMA | 🔴 Alta | Protocolo global de contexto |
| PROTOCOLO-SECRETOS | 🔴 Alta | Pendiente desde #68 |
| PROTOCOLO-ACTUALIZACION-DEW/WIKI/TRACKING/FORMACION | 🟡 Media | Variantes por repo del protocolo global |
| PROTOCOLO-DOCUMENTACION-ECOSISTEMA | 🟡 Media | Entrada formal de elementos nuevos |
| Actualizar ESTADO-SISTEMA.md | 🟡 Media | Sincronizar con estado real post-sesión |
| Renombrar WIKI---PERSONAL → yggdrasil-wiki en Madre | 🔴 Alta | `mv` en terminal |

---

## F16 — Islas de contenido personal (futuro)

> Islas que representan dominios de vida de Álvaro — cada una con su plantilla y protocolo propio.

| Isla | Repo (propuesto) | Plantilla | Estado |
|---|---|---|---|
| Hip Hop / Rap | `yggdrasil-hiphop` | PLANTILLA-HIPHOP.md | ⚪ Conceptual |
| Whisky | `yggdrasil-whisky` | PLANTILLA-WHISKY.md | ⚪ Conceptual |
| Vida personal | dentro de yggdrasil-tracking | PLANTILLA-VIDA.md | ⚪ Conceptual |

> Antes de crear cualquier isla F16: ejecutar NORMA-ENTRADA-NUEVA-ISLA.md + PROTOCOLO-ACTUALIZACION TIPO B.

---

## Pendiente largo plazo

| Tarea | Notas |
|---|---|
| RAG sobre canon (Ollama + Qdrant) | Cuando canon esté 100% estable |
| THDORA ejecutando protocolos | Cuando RAG esté operativo |
| `check-nombres.sh` script nivel 1 | Automatizar PROTOCOLO-NOMBRES |
| Auditoría ecosistema completa (7 fases) | Primera ejecución: cierre de julio |

---

_Actualizado: 2026-07-16 14:53 CEST · F12 ✅ F13 ✅ F14 ✅ F15 en progreso · ADR-013 + 7 plantillas + PROTOCOLO-ACTUALIZACION + INDEX · Perplexity MCP_
