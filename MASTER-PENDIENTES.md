---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 01:20 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-18 01:20 CEST.
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
| **F15** | AGENT.md + CONTEXT.md x4 repos tridente | ✅ CERRADA | dew/wiki/tracking/formacion 2026-07-16 |
| **F16** | Protocolos Madre x3 | ✅ CERRADA | madre-config/secops/ollama-stack 2026-07-16 |
| **F17** | PROTOCOLO-NUEVO-DIARIO-TRACKING | ✅ CERRADA | Protocolo verificado + issue #69 cerrado 2026-07-18 |
| **F18** | BOOTSTRAP.md orquestador | ✅ CERRADA | BOOTSTRAP.md v1.1 completo 2026-07-18 |
| **F19** | AGENT.md repos secundarios | ✅ CERRADA | yggdrasil-scripts + acer-config creados 2026-07-18 |
| **F20** | Hardware Madre documentar | ⚪ PENDIENTE | dmidecode CPU/placa pendiente terminal |
| **F21** | Fusion islas WIKI (21 → 16) | ✅ CERRADA | 5 fusiones: ia-local, agentes-personales, seguridad+osint, infra+madre · 2026-07-18 |
| **F22** | Runbooks terminal | ✅ CERRADA | RUNBOOK-THDORA, RUNBOOK-MCP, RUNBOOK-CRITICOS · 2026-07-18 |
| **F23** | Diario sesion 2026-07-18 | ✅ CERRADA | docs/sesiones/2026-07-18.md · 2026-07-18 |

---

## Issues pendientes por tipo

### Requieren TERMINAL (no MCP)

| Issue | Descripcion | Prioridad | Runbook |
|---|---|---|---|
| #74 | Token THDORA caducado | 🔴 Critico | RUNBOOK-THDORA-TOKEN.md |
| #75 | yggdrasil-mcp caido | 🔴 Critico | RUNBOOK-MCP-ARRANQUE.md |
| #15 | Puerto 21 FTP router | 🔴 Critico | RUNBOOK-CRITICOS-TERMINAL.md |
| #71 | Qdrant unhealthy | ⚠️ Infra | RUNBOOK-CRITICOS-TERMINAL.md |
| #31 | HDD 28k+ horas | ⚠️ Hardware | RUNBOOK-CRITICOS-TERMINAL.md |
| #77 | Auditoria ADR-002 suelto | 🟡 Canon | — |
| F20 | dmidecode hardware | 🟡 Infra | RUNBOOK-CRITICOS-TERMINAL.md |

### Requieren sesion dedicada con Alvaro

| Issue | Descripcion |
|---|---|
| #59/#3 | Purga WIKI — F3 |

---

## Proxima sesion recomendada

> Ver `docs/runbooks/RUNBOOK-CRITICOS-TERMINAL.md` para orden exacto y comandos.

1. 🔴 #74 — Token THDORA (5 min)
2. 🔴 #75 — yggdrasil-mcp (5-10 min)
3. ⚠️ #71 — Qdrant verificar (2 min)
4. 🔴 #15 — FTP puerto 21 cerrar (3 min)
5. 🟡 F20 — dmidecode (3 min)
6. ⚠️ #31 — S.M.A.R.T. HDD (5 min)

**Total estimado: ~30 minutos de terminal.**

_Actualizado: 2026-07-18 01:20 CEST · Cierre sesión · Perplexity-MCP_
