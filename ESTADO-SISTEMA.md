---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-06 21:48 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-06 (cierre de sesión)

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ Fases 0-5 completadas · gobernanza activa · branch protection | 2026-07-06 21:48 CEST |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ Organizado · purga completada · branch protection | 2026-07-06 |
| `yggdrasil-secops` | ⚠️ PÚBLICO | 🔴 DEBE SER PRIVADO — pendiente mañana | 2026-07-06 |
| `THDORA-PERSONAL` | 🔒 Privado | ⚠️ HAL-001+003 pendiente rotación token | 2026-07-06 |
| `madre-config` | 🔒 Privado | 🟡 README + scripts, pendiente organizar | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Privado | 2026-07-06 |
| `formacion-tech` | 🔒 Privado | 🟡 estructura 9 carpetas, contenido pendiente | 2026-07-05 |
| `acer-config` | 🔒 Privado | 🔴 vacío — pendiente estructura | — |
| `ollama-stack` | 🔒 Privado | 🔴 pendiente estructurar | — |
| `local-brain` | 🔒 Privado | 🔴 pendiente estructurar | — |
| `investigacion-ia` | 🔒 Privado | 🔴 pendiente crear estructura | — |
| `dev-labs` | 🔒 Privado | 🔴 vacío sandbox | — |

---

## Planes activos

| Plan | Ruta | Estado |
|---|---|---|
| Plan de Alineación (Dew/WIKI) | `PLAN-ALINEACION-2026-07.md` | ✅ Fases 0-5 COMPLETADAS |
| Plan de Alineación (secops) | `PLAN-ALINEACION-SECOPS-2026-07.md` | 🟡 Fase 0 pendiente |
| Plan Deuda Técnica | `PLAN-DEUDA-TECNICA-2026-07.md` | 🔴 Tier 1+2 urgentes |
| Mantenimiento continuo | `docs/canon/FASE6-MANTENIMIENTO.md` | ♾️ Permanente |

---

## Servidores

| Servicio | Estado |
|---|---|
| Madre (Torre Arch Linux) | ✅ operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 (Blink) | ✅ Perplexity MCP activo · acceso SSH Madre vía Tailscale |
| Tailscale | ✅ Madre + Acer + iPhone conectados |
| Docker (Madre) | ✅ corriendo |
| Ollama (Madre) | ✅ operativo · :11434 — exposición internet SIN VERIFICAR |
| Portainer | ✅ activo |
| Grafana + Prometheus | ✅ activo |
| Nextcloud + Vaultwarden | ✅ activo |
| Pi-hole + Unbound | ✅ activo |
| `log_guardian_bot` | ⚠️ unhealthy — pendiente fix |
| `yggdrasil_watchdog` | ⚠️ unhealthy — pendiente fix |

---

## Seguridad

| ID | Hallazgo | Estado | Prioridad |
|---|---|---|---|
| HAL-001 | Token Telegram THDORA en historial git | 🔴 PENDIENTE ROTACIÓN | Tier 1 — mañana |
| HAL-003 | Segunda exposición token Telegram | 🔴 PENDIENTE ROTACIÓN | Tier 1 — mañana |
| HAL-006 | Puerto 21 FTP abierto en router | 🔴 ABIERTO | Tier 2 — esta semana |
| T-007 | Ollama :11434 exposición internet | ⚠️ SIN VERIFICAR | Tier 2 — esta semana |
| T-012 | SSH puerto 22 público abierto | 🔴 PENDIENTE CERRAR | Tier 2 — esta semana |
| T-009 | Thdora sin logging estructurado | 🟡 Tier 3 | Este mes |

---

## Gobernanza GitHub (post-Fase 4)

| Herramienta | Dew | WIKI | secops |
|---|---|---|---|
| Branch protection `main` | ✅ activo | ✅ activo | ✅ activo |
| CI validate-canon | ✅ activo | ✅ activo | ✅ activo |
| CI gitleaks | ✅ activo | ✅ activo | ✅ activo |
| CODEOWNERS | ✅ activo | — | — |
| Dependabot | ✅ lunes 09:00 | — | — |
| Issue templates | ✅ ADR+HAL+tarea | — | ✅ hal.yml |
| PR template | ✅ activo | — | — |

---

_Actualizado: 2026-07-06 21:48 CEST · Perplexity-MCP · Cierre de sesión_
