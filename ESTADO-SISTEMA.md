---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-13 09:05 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-13 (sesión mañana)

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ Gobernanza activa · branch protection | 2026-07-13 |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ Organizado · branch protection | 2026-07-06 |
| `yggdrasil-secops` | 🔒 Privado | ✅ Privado · auditoría fase 1 pendiente (#37) | 2026-07-12 |
| `THDORA-PERSONAL` | 🔒 Privado | 🟡 Auditoría pendiente (#36) · ruta repo en Madre no existe aún | 2026-07-12 |
| `madre-config` | 🔒 Privado | 🟡 IaC pendiente versionar (#43) | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Canon migrado · diario 2026-07-13 creado | 2026-07-13 |
| `formacion-tech` | 🔒 Privado | 🟡 Estructura creada · contenido pendiente | 2026-07-05 |
| `acer-config` | 🔒 Privado | 🔴 Vacío — pendiente estructura | — |
| `ollama-stack` | 🔒 Privado | 🔴 Pendiente estructurar | — |
| `local-brain` | 🔒 Privado | 🔴 Pendiente estructurar | — |
| `investigacion-ia` | 🔒 Privado | 🔴 Pendiente crear estructura | — |
| `dev-labs` | 🔒 Privado | 🔴 Vacío sandbox | — |

---

## Planes activos

| Plan | Ruta | Estado |
|---|---|---|
| Plan de Alineación (Dew/WIKI) | `PLAN-ALINEACION-2026-07.md` | ✅ Fases 0-5 COMPLETADAS |
| Plan de Alineación (secops) | `PLAN-ALINEACION-SECOPS-2026-07.md` | 🟡 Fase 0 pendiente |
| Plan Deuda Técnica | `PLAN-DEUDA-TECNICA-2026-07.md` | 🔴 Tier 1+2 urgentes |
| Auditorías islas | Issues #35 #36 #37 #48 | 🟡 En curso — próximo bloque |
| Mantenimiento continuo | `docs/canon/FASE6-MANTENIMIENTO.md` | ♾️ Permanente |

---

## Servidores

| Servicio | Estado |
|---|---|
| Madre (Torre Arch Linux) | ✅ Operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ Operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 (Blink) | ✅ Perplexity MCP activo · SSH Madre vía Tailscale |
| Xiaomi | ✅ IP Tailscale `100.106.133.70` |
| Tailscale | ✅ Madre + Acer + iPhone + Xiaomi conectados |
| Docker (Madre) | 🟡 `.env` reparado · pendiente `docker compose config` validar |
| `thdora-bot` | 🔴 Pendiente recrear tras fix `.env` |
| `log_guardian_bot` | 🔴 Unhealthy — crash loop #971 · depende de HAL-007+HAL-008 (#44 #45 #46) |
| `local_tripwire` | 🔴 Unhealthy — crash loop #486 · depende de HAL-007+HAL-008 |
| `yggdrasil_watchdog` | ⚠️ Unhealthy — pendiente fix |
| Ollama (Madre) | ✅ Operativo :11434 — exposición internet SIN VERIFICAR (T-007) |
| Portainer | ✅ Activo |
| Grafana + Prometheus | ✅ Activo |
| Nextcloud + Vaultwarden | ✅ Activo |
| Pi-hole + Unbound | ✅ Activo |

---

## 🔐 Seguridad — issues agrupadas

> Todas las issues de seguridad viven en yggdrasil-dew y yggdrasil-secops.
> No se duplican. Se referencian desde aquí.

### Tier 1 — Crítico · resolver antes de siguiente despliegue

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-007 | [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | `.env` raíz malformado — comandos bash mezclados | 🟡 Fix en curso — pendiente validar con `docker compose config` |
| HAL-008 | [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | Secretos reales expuestos en chat — rotación urgente | 🟡 Tokens revocados · pendiente rotar todos los valores en `.env` |
| HAL-009 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | `log_guardian_bot` + `local_tripwire` crash loop | 🔴 Bloqueado por HAL-007 + HAL-008 |

### Tier 2 — Alta · esta semana

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-006 | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto en router | 🔴 Pendiente cerrar |
| T-007 | — | Ollama :11434 exposición internet | ⚠️ Sin verificar |
| T-012 | — | SSH puerto 22 público abierto | 🔴 Pendiente cerrar |

### Tier 3 — Media · este mes

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-001/003 | — | Token Telegram THDORA en historial git | 🟡 Token revocado · historial pendiente limpiar con BFG |
| T-009 | — | THDORA sin logging estructurado | 🟡 Pendiente |
| CI-001 | [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | Secret-scanning no detecta IPs ni emails | 🔴 Pendiente ampliar regex |
| CI-002 | [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | Confirmar gitleaks corre en push automático | ⚠️ Sin verificar |

---

## 🗂️ Auditorías de islas — estado

| Auditoría | Issue | Estado |
|---|---|---|
| AUDIT-002 — yggdrasil-dew | [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | 🟡 Pendiente ejecutar |
| AUDIT-003 — thdora-personal | [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | 🟡 Pendiente · prereq: cerrar HAL-006 |
| AUDIT-004 — yggdrasil-secops | [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | 🟡 Pendiente fase 1 |
| AUDIT-005 — agentes/MCP | [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | 🟡 Pendiente |
| AUDIT-006 — VIDAPERSONAL | [#48](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/48) | 🟡 En curso — limpieza carpetas pendiente |

---

## Gobernanza GitHub

| Herramienta | Dew | WIKI | secops |
|---|---|---|---|
| Branch protection `main` | ✅ | ✅ | ✅ |
| CI validate-canon | ✅ | ✅ | ✅ |
| CI gitleaks | ✅ | ✅ | ✅ |
| CODEOWNERS | ✅ | — | — |
| Dependabot | ✅ lunes 09:00 | — | — |
| Issue templates | ✅ ADR+HAL+tarea | — | ✅ hal.yml |
| PR template | ✅ | — | — |

---

## Próximo bloque

1. ✅ `.env` limpio → validar con `docker compose config` → recrear `thdora-bot`
2. Auditoría AUDIT-003 (thdora-personal) — siguiente isla
3. Cerrar HAL-009 cuando `log_guardian_bot` y `local_tripwire` estén healthy
4. Puerto 21 FTP — cerrar en router (HAL-006 #15)
5. Triángulo ecosistema: VIDAPERSONAL ↔ DEW ↔ WIKI (#47)

---

_Actualizado: 2026-07-13 09:05 CEST · Perplexity-MCP · Sesión mañana_
