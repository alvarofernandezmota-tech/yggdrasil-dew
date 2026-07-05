---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-05 20:55 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-05 (noche)

---

## Repos

| Repo | Estado | Último cambio |
|---|---|---|
| `yggdrasil-dew` | 🟢 organizado, docs/diarios/ activo | 2026-07-05 noche |
| `WIKI---PERSONAL` | 🟢 wiki/ estructurada, convenciones escritas | 2026-07-05 noche |
| `madre-config` | 🟡 README + scripts sesión creados, pendiente organizar más | 2026-07-05 |
| `yggdrasil-secops` | 🟡 HAL-001 FTP documentado, hallazgo pendiente remediar | 2026-07-05 |
| `formacion-tech` | 🟡 estructura 9 carpetas creada, contenido pendiente | 2026-07-05 |
| `THDORA-PERSONAL` | 🟡 Fase 10 multi-usuario bloqueada | 2026-07-03 |
| `acer-config` | 🔴 vacío — pendiente crear estructura | — |
| `ollama-stack` | 🔴 pendiente estructurar | — |
| `local-brain` | 🔴 pendiente estructurar | — |
| `investigacion-ia` | 🔴 pendiente crear estructura | — |
| `dev-labs` | 🔴 vacío sandbox | — |

---

## Servidores

| Servicio | Estado |
|---|---|
| Madre (Torre Arch Linux / Omarchy) | ✅ operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 | ✅ Perplexity MCP activo |
| Tailscale | ✅ Madre + Acer conectados |
| Docker (Madre) | ✅ corriendo |
| Ollama (Madre) | ✅ operativo |
| Portainer | ✅ activo |
| Grafana + Prometheus | ✅ activo |
| Nextcloud + Vaultwarden | ✅ activo |
| Pi-hole + Unbound | ✅ activo |
| `log_guardian_bot` | ⚠️ unhealthy — pendiente fix |
| `yggdrasil_watchdog` | ⚠️ unhealthy — pendiente fix |

---

## Seguridad

| Hallazgo | Estado | Referencia |
|---|---|---|
| HAL-001 FTP puerto 21 router Digi | 🔴 EXPUESTO — remediar urgente | `yggdrasil-secops/hallazgos/HAL-001` |
| SSH `PasswordAuthentication` | ⚠️ Pendiente deshabilitar | `madre-config/docs/ssh-hardening.md` |
| SSH `PermitRootLogin no` | ⚠️ Pendiente | `madre-config/docs/ssh-hardening.md` |

---

## GitHub

| Herramienta | Estado |
|---|---|
| CODEOWNERS (WIKI) | ✅ activo |
| PR template (WIKI) | ✅ activo |
| Issue forms (WIKI, 4 tipos) | ✅ activos |
| Actions: context-reminder | ✅ activo |
| Actions: lint-commits | ✅ activo |
| Actions: inbox-health | ✅ activo |
| Labels personalizados (22) | ❌ pendiente crear |
| Milestones | ❌ pendiente |
| Branch protection | ❌ pendiente |
| `WIKI---PERSONAL` privada | ❌ pendiente (hacer manual en Settings) |
| `VIDAPERSONAL` privada | ❌ pendiente (hacer manual en Settings) |

---

## Issues pendientes de transferir (desde terminal Madre)

```bash
# Desde ~/WIKI---PERSONAL
gh issue transfer 32 alvarofernandezmota-tech/yggdrasil-dew
gh issue transfer 29 alvarofernandezmota-tech/yggdrasil-dew

# Desde ~/yggdrasil-dew
gh issue close 4 --comment 'Resuelto: diary/ consolidado en docs/diarios/' --reason completed
```

---

_Actualizado: 2026-07-05 20:55 CEST · Perplexity-MCP_
