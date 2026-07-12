---
title: Estado Isla Seguridad
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-12
ruta: docs/islas/ESTADO-ISLA-SEGURIDAD.md
tags: [isla, seguridad, estado, secops]
status: en-auditoria
---

# 🛡️ Estado Isla Seguridad

> Snapshot actualizable del estado real de la isla. Se actualiza al cerrar cada fase de auditoría.
> Fuente de verdad: issues en [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) + ownership-matrix.md

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 En auditoría |
| **Repo principal** | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) |
| **Ruta física en Madre** | `/home/varopc/yggdrasil-secops` (symlink desde `~/repos/yggdrasil-secops`) |
| **Compose activo** | `docker-compose.maestro.yml` |
| **Última auditoría** | 2026-07-12 |
| **Issues abiertos** | 6 |
| **HALs activos** | HAL-001, HAL-002, HAL-003, HAL-004, HAL-005 |

---

## Servicios de la isla

| Servicio | Capa | Estado real | Notas |
|---|---|---|---|
| `yggdrasil_watchdog` | watchdog | ⚪ Sin auditar | Sin issues ni HALs — verificar si está activo |
| `tailscale_monitor` | network-vpn | 🟢 Healthy | Up 3d+ sin restarts. HAL-004 pendiente de cerrar |
| `log_guardian_bot` | firewall | 🔴 Bug activo | Healthcheck roto (`pgrep` no existe). Issue [#2](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/2) |
| `network_radar` | network-local | ⚪ Sin auditar | Sin issues ni HALs — verificar si está activo |
| `local_tripwire` | filesystem | ⚪ Sin auditar | Sin issues ni HALs — verificar si está activo |
| `guardian_bot` | command | ⚪ Sin auditar | Sin issues ni HALs — verificar si está activo |
| `radar_backup` | data/backup | 🔴 En riesgo | Depende de HDD con ~28.000h. HAL-005, Issue [#7](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/7) |

---

## Issues activos por prioridad

| # | Título | Severidad | Bloqueado por |
|---|---|---|---|
| [#7](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/7) | HAL-005: HDD WD 1TB ~28.000h — fallo inminente | 🔴🔴 Crítica | — |
| [#3](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/3) | HAL-001: Puerto 21 FTP abierto en router Digi | 🔴 Alta | — |
| [#4](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/4) | HAL-002: Vaultwarden — auditar exposición | 🔴 Alta | — |
| [#5](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/5) | HAL-003: Token Telegram THDORA sin rotación | 🔴 Alta | Isla THDORA |
| [#2](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/2) | Crash-loop log_guardian_bot (healthcheck roto) | ⚠️ Bug | #7 (disco) |
| [#8](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/8) | MCP conector intermitente | ℹ️ Backlog | — |

---

## Plan de cierre de isla

### Fase 1 — Fixes críticos (bloqueantes)
- [ ] Ejecutar `smartctl -a /dev/sda` en Madre y documentar resultado en issue #7
- [ ] Si `Reallocated_Sector_Ct > 0` → backup inmediato y planificar compra de disco
- [ ] Cerrar puerto 21 FTP en router Digi + verificar con `nmap -p 21 <IP>` → cerrar issue #3

### Fase 2 — Fixes de servicio
- [ ] Fix Dockerfile `log_guardian_bot`: cambiar healthcheck por `python -c "import os; os.getpid()"` → rebuild → verificar healthy → cerrar issue #2
- [ ] Auditar Vaultwarden: solo accesible via Tailscale + `/admin` deshabilitado → cerrar issue #4

### Fase 3 — Auditar servicios sin estado
- [ ] Verificar si `yggdrasil_watchdog`, `network_radar`, `local_tripwire`, `guardian_bot` están corriendo
- [ ] Para cada uno: documentar estado (activo / parado / placeholder) en este documento
- [ ] Decidir: mantener / refactorizar / apagar

### Fase 4 — Dependencias cruzadas
- [ ] HAL-003 (token Telegram): coordinar fix con isla THDORA → cerrar issue #5
- [ ] Revisar HAL-004 (tailscale): si lleva >7d healthy → cerrar

### Fase 5 — Cierre formal
- [ ] Actualizar tabla de servicios con estado final
- [ ] Marcar isla como `auditada` en `MAPA-ISLAS-DEPENDENCIAS.md`
- [ ] Actualizar `PLAN-MAESTRO-2026-07.md` con resultado

---

## Dependencias con otras islas

| Dependencia | Isla destino | Issue/HAL | Tipo |
|---|---|---|---|
| `radar_backup` depende del HDD de Madre | Infra | HAL-005 / #7 | Infraestructura compartida |
| Token Telegram THDORA sin rotación | THDORA | HAL-003 / #5 | Fix requiere acción en otra isla |
| Vaultwarden gestiona credenciales del ecosistema | Todas | HAL-002 / #4 | Servicio transversal |

---

_Creado: 2026-07-12 · Auditoría sesión Isla Seguridad · Perplexity MCP_
