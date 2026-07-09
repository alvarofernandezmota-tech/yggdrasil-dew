---
tipo: plan-sesion
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-09 23:10 CEST
ruta: docs/plan/PLAN-MANANA-2026-07-10.md
tags: [plan, sesion, manana, prioridades]
status: pendiente
---

# Plan de Trabajo — 2026-07-10

> Preparado al cierre del 2026-07-09.
> Ejecutar en orden. No saltar a Fase 2 si Fase 1 no está hecha.

---

## 🔴 FASE 1 — Crítico (requiere terminal Madre)

Estas tres tareas son **bloqueos de seguridad reales**. Se hacen primero, sin excepción.

| # | Tarea | Comando de arranque |
|---|---|---|
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Cerrar puerto 21 FTP | Panel router → port forwarding |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | smartctl HDD Madre | `sudo smartctl -a /dev/sda` |
| [#30](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/30) | HAL-006 .env expuesto | Revisar `.env` en thdora-personal |

---

## 🟡 FASE 2 — CI/Seguridad (sin terminal, desde MCP)

| # | Tarea |
|---|---|
| [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | Añadir regex IPv4 y email a `validate-canon.yml` |
| [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | Verificar `secret-scan.yml` en push + añadir markdownlint |
| [#32](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/32) | `docker logs yggdrasil_watchdog` + restart |

---

## 🟠 FASE 3 — Auditorías (desde MCP)

| # | Tarea |
|---|---|
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | AUDIT-002 Dew completo |
| [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | AUDIT-005 agentes/MCP — fusionar 6 archivos dispersos |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | AUDIT-004 secops Fase 1 |
| [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | AUDIT-003 thdora-personal |

---

## 🔵 FASE 4 — Wiki y islas (desde MCP)

Las islas WIKI están vacías. Hay que crearlas una a una.

| Isla | Carpeta | Estado |
|---|---|---|
| ecosistema.md | `wiki/islas/` | ✅ Creada |
| madre.md | `wiki/islas/` | ❌ Pendiente |
| agentes.md | `wiki/islas/` | ❌ Pendiente |
| seguridad.md | `wiki/islas/` | ❌ Pendiente |
| thdora.md | `wiki/islas/` | ❌ Pendiente |
| mcp.md | `wiki/islas/` | ❌ Pendiente |

Cada isla: mapa conceptual — NO documentación técnica (eso va en Dew).

---

## 🔵 FASE 5 — VIDAPERSONAL repo

- Auditar estructura actual de `vidapersonal`
- Alinear con convenciones del ecosistema
- Crear diario 2026-07-09 en vidapersonal si procede

---

## Notas de contexto

- Trabajas desde **Acer** via `ssh madre` (Tailscale)
- 15 issues abiertas en Dew al inicio del día
- Diarios del día: `2026-07-09.md`, `2026-07-09-tarde.md`, `2026-07-09-noche.md`, `2026-07-09-completo.md`
- HAL-001 colisión de IDs (Dew vs secops) — sin resolver

---

_Plan generado: 2026-07-09 23:10 CEST · Perplexity-MCP_
