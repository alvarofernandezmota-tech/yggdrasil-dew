---
tipo: estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05 12:00 CEST
actualizado: 2026-07-17 23:05 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, operativo]
status: vigente
---

# 📊 ESTADO DEL SISTEMA — 2026-07-17 23:05 CEST

---

## ⛳ Checkpoint sesión 2026-07-17 noche (23:05)

**Qué se hizo en esta sesión:**
- ✅ **Auditoría profunda de docs/canon/** — 7 problemas detectados y documentados
- ✅ **13 ADRs verificados** — count real confirmado
- ✅ **Protocolo real leído** — `PROTOCOLO-INICIO-SESION.md` v5 (no `APERTURA-SESION`)
- ✅ **Issue #77** abierto — auditoría y alineación protocolos
- ✅ **Issue #78** creado y cerrado — orquestador actualizado con nombres reales
- ✅ **Issue #79** abierto — BOOTSTRAP.md v2 con datos terminal
- ✅ **Diario sesión** `docs/sesiones/2026-07-17-diario.md` creado
- ✅ **BOOTSTRAP.md v1** creado en yggdrasil-orquestador
- ✅ **protocols/boot.md v1.1** actualizado con CONTRATO AGENTE IA real
- ✅ **ADR-014** creado — documenta decisión de crear yggdrasil-orquestador
- ✅ **INDEX ADRs v8** — 14 ADRs ahora
- ✅ **PROTOCOLO-NUEVO-DIARIO-TRACKING.md** movido a docs/canon/ (issue #77 parcial)
- ⚠️ **Pendiente con terminal**: borrar redirects, renombrar inventario-madre.md, mover ADR-002 suelto

---

## ⛳ Checkpoint sesión 2026-07-17 tarde/noche

**Qué se hizo en sesión 2026-07-16 (tarde):**
- ✅ **Auditoría Madre vía SSH** — inventario real de contenedores y estado
- ✅ **#70 HAL-006 diagnosticado** — `yggdrasil-mcp` en estado `Created`, ExitCode 128, puerto 3000 ocupado
- ✅ **#71 qdrant unhealthy** — diagnosticado como falso positivo (telemetría bloqueada, fix: `QDRANT__TELEMETRY_DISABLED=true`)
- ✅ **Issues #70, #71, #75 creados** con runbooks listos para ejecutar con terminal
- ✅ **Protocolos Madre/infra creados** (APERTURA-MADRE, ACTUALIZACION-MADRE, NUEVO-AGENTE, DESPLIEGUE-CONTENEDOR)
- ✅ **PROTOCOLO-INICIO-SESION v5** — rama Madre integrada (anteriormente llamado APERTURA-SESION)
- ✅ **PROTOCOLO-CIERRE-SESION v3.0** — rama Madre integrada
- ✅ **INDEX v7.0** — 49 protocolos, sección NIVEL 2 MADRE·INFRA

---

## Repos

| Repo | Visibilidad | Estado | Último cambio |
|---|---|---|---|
| `yggdrasil-dew` | 🟢 Público | ✅ 14 ADRs · 49 protocolos · INDEX v7.0 · auditoría activa #77 | 2026-07-17 |
| `yggdrasil-orquestador` | 🟢 Público | ✅ BOOTSTRAP.md v1 · boot.md v1.1 · 15 archivos | 2026-07-17 |
| `WIKI---PERSONAL` | 🔒 Privado | ✅ 25 islas · GRAFO-ECOSISTEMA · branch protection | 2026-07-13 |
| `yggdrasil-secops` | 🔒 Privado | ✅ Privado · auditoría fase 1 pendiente (#37) | 2026-07-13 |
| `THDORA-PERSONAL` | 🔒 Privado | ⚠️ Token Telegram pendiente renovar (#74) · AGENT.md ✅ | 2026-07-17 |
| `madre-config` | 🔒 Privado | 🔴 IaC pendiente versionar (#43) · 16 docker-compose sin commitear | 2026-07-05 |
| `VIDAPERSONAL` | 🔒 Privado | ✅ Canon migrado · diario activo | 2026-07-13 |
| `yggdrasil-scripts` | 🔒 Privado | 🟡 Creado · pendiente poblar scripts | 2026-07-13 |
| `yggdrasil-tracking` | 🔒 Privado | ✅ AGENT.md + CONTEXT.md ✅ | 2026-07-17 |
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
| Madre (Torre Debian 12) | ✅ Operativa · IP Tailscale `100.91.112.32` |
| Acer (Arch Linux + Hyprland) | ✅ Operativo · IP Tailscale `100.86.119.102` |
| iPhone 11 (Blink) | ✅ Perplexity MCP activo · SSH Madre vía Tailscale |
| Xiaomi | ✅ IP Tailscale `100.106.133.70` |
| Tailscale | ✅ Madre + Acer + iPhone + Xiaomi conectados |
| Docker (Madre) | ✅ Stack operativo · inventariado 2026-07-16 |
| `thdora-bot` | ⚠️ Token pendiente renovar (#74) |
| `thdora` (API) | ✅ Up (healthy) — confirmado 2026-07-13 |
| `log_guardian_bot` | ⚠️ Estado desconocido — verificar terminal |
| `local_tripwire` | ⚠️ Estado desconocido — verificar terminal |
| `guardian_bot` | ✅ Up (healthy) — confirmado 2026-07-13 |
| `n8n` | ✅ Up — confirmado 2026-07-13 |
| `yggdrasil-mcp` | 🔴 Created/ExitCode 128 — puerto 3000 ocupado (#70) · runbook en #75 |
| `qdrant` | 🟡 Unhealthy falso positivo — fix: `QDRANT__TELEMETRY_DISABLED=true` (#71) |
| Ollama | ✅ Operativo :11434 — exposición internet SIN VERIFICAR |
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
| HAL-005 | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD Madre 28k+ horas | 🔴 Sin datos smartctl — requiere terminal |

### Tier 2 — Alta · en curso

| ID | Issue | Hallazgo | Estado |
|---|---|---|---|
| HAL-new | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) | Token Telegram THDORA caducado | 🔴 Runbook listo · requiere terminal |
| — | [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) | yggdrasil-mcp no arranca | 🔴 Runbook en #75 · requiere terminal |
| — | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant unhealthy falso positivo | 🟡 Fix trivial · requiere terminal |
| — | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | log_guardian_bot + local_tripwire crash loop | ⚠️ Estado desconocido · requiere terminal |

---

## 📋 Niveles de protocolo

| Nivel | Tipo | Ubicación | Cantidad |
|---|---|---|---|
| 0 | ADRs — decisiones | `docs/adr/` | 14 |
| 1 | Protocolos de sesión | `docs/canon/` | 5 principales |
| 2 | Protocolos de isla | `docs/islas/` | pendiente poblar |
| 3 | Runbooks operacionales | `docs/runbooks/` | en construcción |
| 4 | Scripts y automaciones | `yggdrasil-scripts/` | pendiente |

---

## 📋 Fases del Plan Maestro

| Fase | Descripción | Estado |
|------|-------------|--------|
| F0 | Seguridad — WIKI privado, secops privado | 🟡 WIKI: verificar; secops: ✅ |
| F1 | Canon ADR — indexar ADR-005/006 | ⏳ Pendiente |
| F2 | Unificar índices de islas | ⏳ Pendiente |
| F3 | Purga docs/ WIKI (279 → <80 archivos) | ⏳ Sesión larga |
| F4 | Consolidar MCP/agentes — AUDIT-005 (#42) | ⏳ Pendiente |
| F5 | CI enforcement (IPv4 + emails) | ⏳ Pendiente |
| F6 | Ritual semanal verificación repos | 🔄 Permanente |
| F7 | GitOps Real + Runbooks + Healthchecks | 🟡 Runbooks creados · healthchecks pendiente |
| F22 | Crear repo yggdrasil-orquestador | ✅ Creado 2026-07-17 · BOOTSTRAP.md v1 |

---

## 📋 Backlog MCP — ejecutable sin terminal

| Issue | Qué | Prioridad |
|---|---|---|
| [#77](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/77) | Auditoría protocolos — correcciones físicas parciales hechas | 🟡 Resto requiere terminal |
| [#79](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/79) | BOOTSTRAP.md v2 con datos terminal | ⏳ Pendiente terminal |
| F1 | Indexar ADR-005/006 en canon | 🟡 Media |

---

## 📋 Backlog terminal — próxima sesión con Madre

**Orden recomendado:**
1. `docker ps` — snapshot estado real
2. Fix qdrant (#71) — `QDRANT__TELEMETRY_DISABLED=true` + recrear
3. Fix yggdrasil-mcp (#75) — puerto + `docker compose up -d`
4. Renovar token THDORA (#74)
5. `sudo smartctl -a /dev/sda` — salud HDD (#31)
6. Borrar redirects zombie en docs/canon/ (issue #77)
7. Renombrar `docs/inventario-madre.md` → `INVENTARIO-MADRE.md`
8. Mover `docs/ADR-002-alineacion-tridente.md` → `docs/adr/`
9. Cerrar puerto 21 en router (#15)

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

_Actualizado: 2026-07-17 23:05 CEST · Perplexity-MCP · sesión noche · sin terminal · ADR-014 creado · 14 ADRs_
