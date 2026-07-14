---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-14 18:21 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# 📋 MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-14 18:21 CEST. Cierre real de sesión.
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
| **F10** | Protocolo de naming + borrado | ✅ CERRADA | PROTOCOLO-NOMBRES v2.0 + PROTOCOLO-BORRADO v1.0 · 2026-07-14 |

---

## Canon de protocolos — estado real en disco

| Protocolo | Ruta | Estado |
|---|---|---|
| Apertura de sesión | `protocolo/PROTOCOLO-APERTURA-SESION.md` | ✅ v2.0 |
| Cierre de sesión | `protocolo/PROTOCOLO-CIERRE-SESION.md` | ✅ v2.0 |
| Nombres / Naming | `protocolo/PROTOCOLO-NOMBRES.md` | ✅ v2.0 · nuevo 2026-07-14 |
| Auditoría ecosistema | `protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md` | ✅ v1.0 · nuevo 2026-07-14 |
| Borrado en cascada | `protocolo/PROTOCOLO-BORRADO.md` | ✅ v1.0 · nuevo 2026-07-14 |

**Pendientes de recrear (22 protocolos borrados el 2026-07-14 sin PROTOCOLO-BORRADO):**
Ver `protocolo/INDEX.md` — sección "🚧 Pendientes de recrear" con prioridades asignadas.

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

## Pendiente corto plazo — próxima sesión

| Tarea | Prioridad | Notas |
|---|---|---|
| Renombrar `WIKI---PERSONAL` → `yggdrasil-wiki` en Madre | 🔴 Alta | `mv /home/varopc/WIKI---PERSONAL /home/varopc/yggdrasil-wiki` |
| Verificar/eliminar `yggdrasil-formacion-` de Madre | 🔴 Alta | `git status` primero, luego `rm -rf` si limpio |
| Clonar repos faltantes en Madre | 🟡 Media | tracking, scripts, madre-config, ollama-stack, THDORA... |
| Recrear protocolos alta prioridad (4) | 🔴 Alta | CONTEXTO-ECOSISTEMA, CONTEXTO-REPO, AUDITORIA-WIKI, SECRETOS |
| Actualizar rutas locales en ECOSYSTEM-ARCHITECTURE.md | 🟡 Media | Tras completar clonado en Madre |
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

_Actualizado: 2026-07-14 18:21 CEST · Cierre sesión · Perplexity MCP_
