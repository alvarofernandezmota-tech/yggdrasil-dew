---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-13 10:46 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-13 10:46 CEST

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ Gobernanza activa · branch protection · Plan Maestro Fase 7 añadida | 2026-07-13 |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ 25 islas · GRAFO-ECOSISTEMA · branch protection | 2026-07-13 |
| `yggdrasil-secops` | 🔒 Privado | ✅ Privado · auditoría fase 1 pendiente (#37) | 2026-07-12 |
| `THDORA-PERSONAL` | 🔒 Privado | 🟡 Auditoría pendiente (#36) · bot pendiente recrear | 2026-07-12 |
| `madre-config` | 🔒 Privado | 🔴 IaC pendiente versionar (#43) · 16 docker-compose sin commitear | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Canon migrado · diario 2026-07-13 creado | 2026-07-13 |
| `yggdrasil-scripts` | 🔒 Privado | 🟡 Creado 2026-07-13 · pendiente poblar scripts | 2026-07-13 |
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
| **Plan Maestro** | `PLAN-MAESTRO-2026-07.md` | ✅ VIGENTE — documento único · Fase 7 GitOps añadida 2026-07-13 |
| Plan Alineación (Dew/WIKI) | `PLAN-ALINEACION-2026-07.md` | 🗄️ Archivado — supersedido por Plan Maestro |
| Plan Alineación (secops) | `PLAN-ALINEACION-SECOPS-2026-07.md` | 🗄️ Archivado — supersedido por Plan Maestro |
| Plan Deuda Técnica | `PLAN-DEUDA-TECNICA-2026-07.md` | 🗄️ Archivado — supersedido por Plan Maestro |
| DRP | `docs/runbooks/DRP.md` | 🟡 Esqueleto creado — completar con datos reales desde terminal |

---

## Servidores

| Servicio | Estado |
|---|---|
| Madre (Torre Arch Linux) | ✅ Operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ Operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 (Blink) | ✅ Perplexity MCP activo · SSH Madre vía Tailscale |
| Xiaomi | ✅ IP Tailscale `100.106.133.70` |
| Tailscale | ✅ Madre + Acer + iPhone + Xiaomi conectados |
| Docker (Madre) | 🔴 `.env` pendiente validar · `docker compose config` sin ejecutar |
| `thdora-bot` | 🔴 Pendiente recrear tras fix `.env` |
| `log_guardian_bot` | 🔴 Unhealthy — crash loop · bloqueado por #44 + #45 |
| `local_tripwire` | 🔴 Unhealthy — crash loop · bloqueado por #44 + #45 |
| `yggdrasil_watchdog` | 🔴 Unhealthy — pendiente restart |
| Ollama (Madre) | ✅ Operativo :11434 — exposición internet SIN VERIFICAR |
| Portainer | ✅ Activo |
| Grafana + Prometheus | ✅ Activo |
| Nextcloud + Vaultwarden | ✅ Activo |
| Pi-hole + Unbound | ✅ Activo |

---

## 🔐 Seguridad — issues activos

### Tier 1 — Crítico · resolver antes de cualquier despliegue

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-007 | [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | `.env` malformado — bloquea todos los servicios | 🔴 Pendiente `docker compose config` |
| HAL-008 | [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | Tokens expuestos en chat — rotación urgente | 🔴 Pendiente rotar en `.env` |
| HAL-009 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | `log_guardian_bot` + `local_tripwire` crash loop | 🔴 Bloqueado por #44 + #45 |

### Tier 2 — Alta · esta semana

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-006 | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto en router | 🔴 Pendiente cerrar |
| — | — | Ollama :11434 exposición internet | ⚠️ Sin verificar |
| — | — | SSH puerto 22 público | 🔴 Pendiente cerrar |

### Tier 3 — Media · este mes

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-001/003 | — | Token Telegram en historial git | 🟡 Token revocado · historial pendiente limpiar con git filter-repo |
| CI-001 | [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | Secret-scanning no detecta IPs ni emails | 🔴 Pendiente ampliar regex |
| CI-002 | [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | Confirmar gitleaks corre en push automático | ⚠️ Sin verificar |

---

## 📋 Fases del Plan Maestro — estado

| Fase | Descripción | Estado |
|------|-------------|--------|
| F0 | Seguridad — WIKI privado, secops privado | 🟡 WIKI: verificar; secops: ✅ |
| F1 | Canon ADR — indexar ADR-005/006 | ⏳ Pendiente |
| F2 | Unificar índices de islas (README + HOME → INDEX) | ⏳ Pendiente |
| F3 | Purga docs/ WIKI (279 → <80 archivos) | ⏳ Sesión larga |
| F4 | Consolidar MCP/agentes (6 ficheros → 1) | ⏳ Pendiente |
| F5 | CI enforcement (IPv4 + emails en validate-canon) | ⏳ Pendiente |
| F6 | Ritual semanal con verificación visibilidad repos | 🔄 Permanente |
| F7 | GitOps Real + Runbooks + Healthchecks + Observabilidad | 🟡 Documentado · pendiente ejecutar |

---

## 🗂️ Auditorías de islas — estado

| Auditoría | Issue | Estado |
|---|---|---|
| AUDIT-002 — yggdrasil-dew | [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | 🟡 Pendiente ejecutar |
| AUDIT-003 — thdora-personal | [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | 🟡 Prereq: cerrar HAL-007+HAL-008 |
| AUDIT-004 — yggdrasil-secops | [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | 🟡 Pendiente fase 1 |
| AUDIT-005 — agentes/MCP | [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | 🟡 Pendiente |
| AUDIT-006 — VIDAPERSONAL | [#48](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/48) | 🟡 Limpieza carpetas pendiente |

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

## Próximo bloque operativo

**Terminal (Alvaro en Madre) — por orden:**
1. Rotar tokens `TELEGRAM_BOT_TOKEN` + `LITELLM_API_KEY` en `.env`
2. `docker compose config` — validar sin errores
3. `docker restart log_guardian_bot local_tripwire yggdrasil_watchdog`
4. `cd /home/varopc/Projects/thdora && docker compose up -d`
5. `sudo smartctl -a /dev/sda | grep -E "Reallocated|Pending|Uncorrectable|Power_On_Hours"`
6. Cerrar puerto 21 en router Digi

**MCP (próxima sesión) — sin terminal:**
1. Completar `docs/runbooks/DRP.md` con datos reales
2. Crear `docs/secrets.md`
3. Fase 1: añadir ADR-005/006 al índice
4. Fase 2: unificar índices de islas en WIKI

---

_Actualizado: 2026-07-13 10:46 CEST · Perplexity-MCP_
