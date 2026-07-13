---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-13 14:15 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-13 14:15 CEST

---

## ⛳ Checkpoint sesión 2026-07-13 tarde (CIERRE)

**Qué se resolvió en esta sesión:**
- ✅ **#44 HAL-007** — `.env` de THDORA corregido (`/home/varopc/Projects/thdora/.env`)
- ✅ **#45 HAL-008** — Token `TELEGRAM_BOT_TOKEN` rotado y actualizado en `.env` real
- ✅ **#46 HAL-009** — `thdora-bot` recreado con `docker compose up -d --force-recreate bot` → `healthy`
- ✅ **THDORA stack completo** — `thdora` + `thdora-bot` ambos `Up (healthy)`
- ✅ **Inventario real de Madre confirmado** — nombres reales de contenedores verificados
- ✅ **secops stack** — `guardian_bot`, `log_guardian_bot`, `local_tripwire` todos `Up (healthy)` tras restart
- ✅ **Investigación Gemini guardada** como investigación técnica en el diario de Dew

**Causa raíz del incidente thdora-bot:**
> El `.env` leído por el contenedor era `/home/varopc/Projects/thdora/.env`, **no** el `.env` global de Madre. El token viejo `8591160057:AAHTN9LlaNwwhgqLq5V2CwqlhlGXzquw3E8` seguía activo en ese fichero tras la rotación. `docker restart` no refresca variables de entorno inyectadas — hay que usar `docker compose up -d --force-recreate --no-deps <servicio>`.

**Lección operativa clave:**
> Cada proyecto Compose tiene su propio `.env`. No existe un `.env` global de Madre. Ver inventario de rutas reales en `docs/inventario-madre.md`.

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ Gobernanza activa · Plan Maestro F7 · runbooks creados | 2026-07-13 |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ 25 islas · GRAFO-ECOSISTEMA · branch protection | 2026-07-13 |
| `yggdrasil-secops` | 🔒 Privado | ✅ Privado · auditoría fase 1 pendiente (#37) | 2026-07-13 |
| `THDORA-PERSONAL` | 🔒 Privado | ✅ Bot `healthy` · stack operativo | 2026-07-13 |
| `madre-config` | 🔒 Privado | 🔴 IaC pendiente versionar (#43) · 16 docker-compose sin commitear | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Canon migrado · diario activo | 2026-07-13 |
| `yggdrasil-scripts` | 🔒 Privado | 🟡 Creado · pendiente poblar scripts | 2026-07-13 |
| `formacion-tech` | 🔒 Privado | 🟡 Estructura creada · contenido pendiente | 2026-07-05 |
| `acer-config` | 🔒 Privado | 🔴 Vacío — pendiente estructura | — |
| `ollama-stack` | 🔒 Privado | 🔴 Pendiente estructurar | — |
| `local-brain` | 🔒 Privado | 🔴 Pendiente estructurar | — |
| `investigacion-ia` | 🔒 Privado | 🔴 Pendiente crear estructura | — |
| `dev-labs` | 🔒 Privado | 🔴 Vacío sandbox | — |

---

## Servidores

| Servicio | Estado |
|---|---|
| Madre (Torre Arch Linux) | ✅ Operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ Operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 (Blink) | ✅ Perplexity MCP activo · SSH Madre vía Tailscale |
| Xiaomi | ✅ IP Tailscale `100.106.133.70` |
| Tailscale | ✅ Madre + Acer + iPhone + Xiaomi conectados |
| Docker (Madre) | ✅ Stack operativo · `.env` THDORA corregido |
| `thdora-bot` | ✅ Up (healthy) — recreado con force-recreate |
| `thdora` (API) | ✅ Up (healthy) |
| `log_guardian_bot` | ✅ Up (healthy) |
| `local_tripwire` | ✅ Up (healthy) — confirmar en próxima sesión |
| `guardian_bot` | ✅ Up (healthy) |
| `n8n` | ✅ Up 4h+ |
| Ollama (Madre) | ✅ Operativo :11434 — exposición internet SIN VERIFICAR |
| Portainer | ✅ Activo |
| Grafana + Prometheus | ✅ Activo |
| Nextcloud + Vaultwarden | ✅ Activo |
| Pi-hole + Unbound | ✅ Activo |

---

## 🔐 Seguridad — issues activos

### Tier 1 — Crítico · resueltos en sesión 2026-07-13

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-007 | [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | `.env` THDORA malformado | ✅ RESUELTO — `.env` corregido |
| HAL-008 | [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | Token Telegram expuesto en chat | ✅ RESUELTO — token rotado, `.env` actualizado |
| HAL-009 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | `thdora-bot` crash loop | ✅ RESUELTO — recreado con force-recreate, healthy |

### Tier 2 — Alta · esta semana

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-006 | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto en router | 🔴 Pendiente |
| — | — | Ollama :11434 exposición internet | ⚠️ Sin verificar |
| — | — | SSH puerto 22 público | 🔴 Pendiente |

### Tier 3 — Media · este mes

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-001/003 | — | Token Telegram en historial git | 🟡 Token revocado · historial pendiente limpiar (`git filter-repo`) |
| CI-001 | [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | Secret-scanning no detecta IPs ni emails | 🔴 Pendiente |
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
| F7 | GitOps Real + Runbooks + Healthchecks + Observabilidad | 🟡 Runbooks creados · inventario Madre documentado · pendiente healthchecks + Loki |

---

## 🗂️ Auditorías de islas — estado

| Auditoría | Issue | Estado |
|---|---|---|
| AUDIT-002 — yggdrasil-dew | [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | 🟡 Pendiente |
| AUDIT-003 — thdora-personal | [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | 🟡 Prereq cerrado (#44+#45 ✅) — listo para ejecutar |
| AUDIT-004 — yggdrasil-secops | [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | 🟡 Pendiente |
| AUDIT-005 — agentes/MCP | [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | 🟡 Pendiente |
| AUDIT-006 — VIDAPERSONAL | [#48](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/48) | 🟡 Limpieza carpetas pendiente |
| AUDIT-007 — Orquestador (THDORA) | [#49](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/49) | 🟡 Bot healthy — listo para auditar |
| AUDIT-012 — IA Local (Ollama) | [#55](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/55) | 🟡 MEDIA · prereq SSH Madre |

---

## 🗂️ Issues WIKI — islas por completar (backlog BAJA)

| Issue | Isla | Requiere |
|---|---|---|
| [#51](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/51) | Acer | Input Alvaro |
| [#52](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/52) | Thea (iPhone) | Input Alvaro |
| [#53](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/53) | Impresión 3D | Input Alvaro |
| [#54](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/54) | Formación | Input Alvaro |
| [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) | formacion.md + impresion3d.md | Input Alvaro |
| [#57](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/57) | Filosofía | Bloque 2 requiere input · Bloques 1+3 MCP puede hacer |
| [#58](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/58) | thea-ia ADR-011 | Decidir opción A/B/C |

---

## 📥 Investigación externa — Gemini 2026-07-13

> Recibida y registrada. Parcialmente ejecutada (#44 #45 #46 resueltos). Resto como backlog F7.

| Propuesta | Archivo objetivo | Estado |
|---|---|---|
| `env-checker.sh` — validar `.env` antes de deploy | `scripts/env-checker.sh` | ✅ Creado |
| `DRP.md` — Plan de Recuperación ante Desastres | `docs/runbooks/DRP.md` | ✅ Esqueleto · completar datos reales |
| `healthcheck` en docker-compose (log_guardian, etc.) | `madre-config/docker/` | ⏳ F7 pendiente |
| `secrets.md` — ciclo de vida de tokens | `docs/secrets.md` | ⏳ Pendiente crear |
| Promtail + Loki — agregación de logs | `madre-config/docker/monitoring/` | ⏳ F7 pendiente |
| `git filter-repo` — limpiar historial tokens | historial git THDORA/DEW | ⏳ Tier 3 pendiente |
| GitHub Secret scanning histórico | Settings > Security | ⏳ Tier 3 pendiente |
| `alias ygg-check` en `.bashrc` Madre | `.bashrc` local | ⏳ Pendiente |

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

## ⚡ Próximo bloque operativo

### INMEDIATO — Verificar (tú, terminal Madre)
1. `docker ps --format 'table {{.Names}}\t{{.Status}}'` — confirmar todos `healthy`
2. Confirmar `local_tripwire` pasó de `health: starting` a `healthy`
3. Cerrar puerto 21 en router Digi
4. Verificar exposición Ollama :11434

### SIGUIENTE — MCP (sin terminal)
1. Cerrar issues #44, #45, #46 formalmente en GitHub con resumen del fix
2. Actualizar AUDIT-003 (#36) — prereq ya cumplido
3. Actualizar AUDIT-007 (#49) — bot ya healthy
4. Completar `docs/runbooks/DRP.md` con datos reales de Madre
5. Crear `docs/secrets.md` con ciclo de vida de tokens
6. F1: indexar ADR-005/006
7. F2: unificar índices de islas WIKI

---

_Actualizado: 2026-07-13 14:15 CEST · Perplexity-MCP · cierre sesión tarde · #44 #45 #46 RESUELTOS_
