---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-17 22:43 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-17 22:43 CEST

---

## ⛳ Checkpoint sesión 2026-07-17 tarde/noche

**Qué se hizo en sesión 2026-07-16 (tarde):**
- ✅ **Auditoría Madre vía SSH** — inventario real de contenedores y estado
- ✅ **#70 HAL-006 diagnosticado** — `yggdrasil-mcp` en estado `Created`, ExitCode 128, puerto 3000 ocupado
- ✅ **#71 qdrant unhealthy** — diagnosticado como falso positivo (telemetría bloqueada, fix: `QDRANT__TELEMETRY_DISABLED=true`)
- ✅ **Issues #70, #71, #75 creados** con runbooks listos para ejecutar con terminal
- ✅ **Protocolos Madre/infra creados** (APERTURA-MADRE, ACTUALIZACION-MADRE, NUEVO-AGENTE, DESPLIEGUE-CONTENEDOR)
- ✅ **PROTOCOLO-APERTURA-SESION v3.0** — rama Madre integrada
- ✅ **PROTOCOLO-CIERRE-SESION v3.0** — rama Madre integrada  
- ✅ **AUDITORIA-MADRE v1.1** — puerto 3001 confirmado, patrón PYTHONUNBUFFERED
- ✅ **INDEX v7.0** — 49 protocolos, sección NIVEL 2 MADRE·INFRA

**Qué se hizo en sesión 2026-07-17 noche:**
- ✅ **Análisis backlog completo** — 35 issues open auditados y priorizados
- ✅ **Plan sesión definido** — Opción A (terminal) vs Opción B (solo MCP)
- ⚠️ Sin acceso a terminal Madre esta sesión → pendiente Opción A

---

## ⛳ Checkpoint sesión 2026-07-13 tarde (CIERRE)

**Qué se resolvió:**
- ✅ **#44 HAL-007** — `.env` de THDORA corregido
- ✅ **#45 HAL-008** — Token `TELEGRAM_BOT_TOKEN` rotado
- ✅ **#46 HAL-009** — `thdora-bot` recreado con `docker compose up -d --force-recreate bot` → `healthy`
- ✅ **THDORA stack completo** — `thdora` + `thdora-bot` ambos `Up (healthy)`
- ✅ **Inventario real de Madre confirmado**
- ✅ **secops stack** — `guardian_bot`, `log_guardian_bot`, `local_tripwire` todos `Up (healthy)` tras restart

**Causa raíz incidente thdora-bot:**
> El `.env` leído por el contenedor era `/home/varopc/Projects/thdora/.env`. El token viejo seguía activo tras la rotación. `docker restart` no refresca variables — hay que usar `docker compose up -d --force-recreate --no-deps <servicio>`.

**Lección operativa:**
> Cada proyecto Compose tiene su propio `.env`. No existe `.env` global de Madre. Ver inventario en `docs/inventario-madre.md`.

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ Gobernanza activa · Plan Maestro · 49 protocolos · INDEX v7.0 | 2026-07-17 |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ 25 islas · GRAFO-ECOSISTEMA · branch protection | 2026-07-13 |
| `yggdrasil-secops` | 🔒 Privado | ✅ Privado · auditoría fase 1 pendiente (#37) | 2026-07-13 |
| `THDORA-PERSONAL` | 🔒 Privado | ⚠️ Token Telegram pendiente renovar (#74) · AGENT.md falta (#72) | 2026-07-17 |
| `madre-config` | 🔒 Privado | 🔴 IaC pendiente versionar (#43) · 16 docker-compose sin commitear | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Canon migrado · diario activo | 2026-07-13 |
| `yggdrasil-scripts` | 🔒 Privado | 🟡 Creado · pendiente poblar scripts | 2026-07-13 |
| `yggdrasil-tracking` | 🔒 Privado | 🟡 AGENT.md + CONTEXT.md pendientes (#72) | 2026-07-17 |
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
| Docker (Madre) | ✅ Stack operativo · inventariado 2026-07-16 |
| `thdora-bot` | ⚠️ Token pendiente renovar (#74) — estado desconocido desde 13 jul |
| `thdora` (API) | ✅ Up (healthy) — confirmado 13 jul |
| `log_guardian_bot` | ⚠️ Crash loop #971 reportado (#46) — sin confirmar estado actual |
| `local_tripwire` | ⚠️ Crash loop #486 reportado (#46) — sin confirmar estado actual |
| `guardian_bot` | ✅ Up (healthy) — confirmado 13 jul |
| `n8n` | ✅ Up — confirmado 13 jul |
| `yggdrasil-mcp` | 🔴 Created/ExitCode 128 — puerto 3000 ocupado (#70) · runbook en #75 |
| `qdrant` | 🟡 Unhealthy falso positivo — fix: `QDRANT__TELEMETRY_DISABLED=true` (#71) |
| Ollama (Madre) | ✅ Operativo :11434 — exposición internet SIN VERIFICAR |
| Portainer | ✅ Activo |
| Grafana + Prometheus | ✅ Activo |
| Nextcloud + Vaultwarden | ✅ Activo |
| Pi-hole + Unbound | ✅ Activo |

---

## 🔐 Seguridad — issues activos

### Tier 1 — Crítico · pendiente

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-006 | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP abierto en router | 🔴 Pendiente — requiere acceso router |
| — | — | Ollama :11434 exposición internet | ⚠️ Sin verificar — requiere terminal |
| — | — | SSH puerto 22 público | 🔴 Pendiente |
| HAL-005 | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD Madre 28k+ horas — riesgo fallo | 🔴 Sin datos smartctl — requiere terminal |

### Tier 2 — Alta · en curso

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-new | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) | Token Telegram THDORA caducado | 🔴 Runbook listo · requiere BotFather + terminal |
| — | [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) | yggdrasil-mcp no arranca — puerto 3000 | 🔴 Runbook en #75 · requiere terminal |
| — | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant unhealthy falso positivo | 🟡 Fix trivial · requiere terminal |
| — | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | log_guardian_bot + local_tripwire crash loop | ⚠️ Estado actual desconocido · requiere terminal |

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
| F4 | Consolidar MCP/agentes — AUDIT-005 (#42) | ⏳ Pendiente |
| F5 | CI enforcement (IPv4 + emails en validate-canon) | ⏳ Pendiente |
| F6 | Ritual semanal con verificación visibilidad repos | 🔄 Permanente |
| F7 | GitOps Real + Runbooks + Healthchecks + Observabilidad | 🟡 Runbooks creados · protocolos Madre añadidos · pendiente healthchecks + Loki |
| F22 | Crear repo yggdrasil-orquestador | ⏳ Issue #76 abierto · listo para ejecutar MCP |

---

## 🗂️ Auditorías de islas — estado

| Auditoría | Issue | Estado |
|---|---|---|
| AUDIT-002 — yggdrasil-dew | [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | 🟡 Pendiente |
| AUDIT-003 — thdora-personal | [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | 🟡 Prereq: renovar token (#74) |
| AUDIT-004 — yggdrasil-secops | [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | 🟡 Pendiente |
| AUDIT-005 — agentes/MCP | [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | 🟡 Protocolos creados · consolidación pendiente |
| AUDIT-007 — Orquestador (THDORA) | [#49](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/49) | 🟡 Prereq: token (#74) + terminal |
| AUDIT-012 — IA Local (Ollama) | [#55](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/55) | 🟡 MEDIA · prereq terminal Madre |

---

## 📋 Backlog MCP — sin terminal, ejecutable ahora

| Issue | Qué | Tiempo est. |
|---|---|---|
| [#72](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/72) | AGENT.md + CONTEXT.md en yggdrasil-tracking + THDORA-PERSONAL | 15 min |
| [#73](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/73) | Renombrar ownership-matrix.md → OWNERSHIP-MATRIX.md | 5 min |
| [#76](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/76) | Crear repo yggdrasil-orquestador con estructura base | 30 min |
| F1 | Indexar ADR-005/006 en canon | 10 min |

---

## 📋 Backlog terminal — próxima sesión con Madre

**Orden de ejecución recomendado:**
1. `docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'` — snapshot estado real
2. Fix qdrant (#71) — `QDRANT__TELEMETRY_DISABLED=true` + recrear
3. Fix yggdrasil-mcp (#75) — cambiar puerto `3001:3000` + `docker compose up -d`
4. Renovar token THDORA (#74) — BotFather + `.env` + force-recreate
5. `sudo smartctl -a /dev/sda` — salud HDD (#31)
6. Cerrar puerto 21 en router (#15)
7. Verificar Ollama :11434 exposición
8. Versionar docker-compose en madre-config (#43)

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

## 📥 Investigación externa — Gemini 2026-07-13

| Propuesta | Archivo objetivo | Estado |
|---|---|---|
| `env-checker.sh` | `scripts/env-checker.sh` | ✅ Creado |
| `DRP.md` | `docs/runbooks/DRP.md` | ✅ Esqueleto · completar datos reales |
| `healthcheck` en docker-compose | `madre-config/docker/` | ⏳ F7 pendiente |
| `secrets.md` — ciclo de vida tokens | `docs/secrets.md` | ⏳ Pendiente crear |
| Promtail + Loki | `madre-config/docker/monitoring/` | ⏳ F7 pendiente |
| `git filter-repo` limpiar historial | historial git THDORA/DEW | ⏳ Tier 3 pendiente |
| `alias ygg-check` en `.bashrc` | `.bashrc` local | ⏳ Pendiente |

---

_Actualizado: 2026-07-17 22:43 CEST · Perplexity-MCP · sesión noche · sin acceso terminal · backlog priorizado_
