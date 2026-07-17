---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 00:52 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, alineacion, roadmap]
status: vigente
---

# MASTER-PENDIENTES — Ecosistema Yggdrasil

> Estado real al 2026-07-18 00:52 CEST.
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

---

## Issues pendientes por tipo

### Requieren TERMINAL (no MCP)

| Issue | Descripcion | Prioridad |
|---|---|---|
| #15 | Puerto 21 FTP router | 🔴 Critico |
| #31 | HDD 28k+ horas | ⚠️ Hardware |
| #71 | Qdrant unhealthy | ⚠️ Infra |
| #74 | Token THDORA caducado | 🔴 Critico |
| #75 | yggdrasil-mcp caido | 🔴 Critico |
| #77 | Auditoria completa ADR-002 suelto | 🟡 Canon |
| F20 | dmidecode hardware | 🟡 Infra |

### Requieren sesion dedicada con Alvaro

| Issue | Descripcion |
|---|---|
| #59/#3 | Purga WIKI — F3 |

---

## Proxima sesion recomendada

1. 🔴 Arreglar #75 yggdrasil-mcp (puerto 3001) — terminal
2. 🔴 Renovar token THDORA #74 — terminal
3. ⚠️ Verificar Qdrant #71 — terminal
4. 🟡 Ejecutar dmidecode F20 — terminal
5. 🟡 Auditoria #77: mover ADR-002, renombrar inventario-madre.md — terminal

_Al finalizar terminal: actualizar ESTADO-SISTEMA.md con datos reales de hardware y servicios._
