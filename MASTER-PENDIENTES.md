---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-13T19:08:00+02:00
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-13 19:08 CEST. Cierre real de sesión.
> Actualizar al inicio y cierre de cada sesión.

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

---

## Canon de protocolos — estado

| Protocolo | Ruta | Estado |
|---|---|---|
| Inicio de sesión | `docs/canon/PROTOCOLO-INICIO-SESION.md` | ✅ v3 |
| Cierre de sesión | `docs/canon/PROTOCOLO-CIERRE-SESION.md` | ✅ v3 |
| ADR | `docs/canon/PROTOCOLO-ADR.md` | ✅ v1 |
| Entrada nueva isla | `docs/canon/NORMA-ENTRADA-NUEVA-ISLA.md` | ✅ v1 |
| Normas Tridente | `docs/canon/NORMAS-TRIDENTE.md` | ✅ v1 |

**Pendientes de crear (baja urgencia):**
- `PROTOCOLO-AUDITORIA-REPO.md`
- `PROTOCOLO-ALINEACION-WIKI-DEW.md`
- `PROTOCOLO-RETRO-SEMANAL.md`
- `PROTOCOLO-INCIDENTE.md`

---

## Bloqueantes críticos — terminal (próxima sesión)

| Issue | Título | Tiempo est. |
|---|---|---|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HAL-005 — HDD Madre 28.000h | 5 min |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 — Token Telegram | 10 min |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto | 10 min |

---

## Pendiente MCP (sin terminal)

| Issue | Descripción |
|---|---|
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 — purga WIKI |
| [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 — healthchecks + Loki |
| [#61](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/61) | Unificar diarios VIDAPERSONAL (git mv local) |

---

## Pendiente largo plazo

| Tarea | Notas |
|---|---|
| 🚀 PRIMER PROYECTO REAL | Álvaro decide cuál — martes 14-Jul |
| Protocolos pendientes (4) | Baja urgencia — no bloquean nada |
| RAG sobre canon (Ollama + Qdrant) | Cuando canon esté 100% estable |
| THDORA ejecutando protocolos | Cuando RAG esté operativo |

---

_Actualizado: 2026-07-13 19:08 CEST · Cierre real · Perplexity MCP_
