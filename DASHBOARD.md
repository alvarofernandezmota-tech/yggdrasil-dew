---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-16 17:00 CEST
ruta: DASHBOARD.md
tags: [dashboard, operativo]
status: vigente
---

# 🧭 DASHBOARD YGGDRASIL-DEW — 2026-07-16

---

## 🚦 Estado general

| Dimensión | Estado |
|---|---|
| Infraestructura | 🟢 OPERATIVA |
| Seguridad | 🟡 TIER-1 RESUELTO · Tier-2 pendiente |
| Documentación | 🟢 Wiki purga completada · AGENT+CONTEXT alineados |
| GitOps | 🟡 PARCIAL — sin IaC en madre-config |
| Bot THDORA | 🔴 CAÍDO — HAL-007 + HAL-008 (ver abajo) |
| SecOps stack | 🟢 HEALTHY |
| Protocolos IA | 🟡 EN MARCHA — plantillas + orquestador pendientes |

---

## 🔥 Issues críticos activos

| # | Repo | Título | Prioridad | Estado |
|---|---|---|---|---|
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | dew | Puerto 21 FTP router abierto | 🔴 CRÍTICA | Pendiente |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | dew | IaC docker-compose madre-config | ALTA | Pendiente |
| [wiki#58](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/issues/58) | wiki | Plantillas AGENT+CONTEXT + isla orquestador | ALTA | 🟡 En marcha |

---

## ✅ Cerrado en sesión 2026-07-16

| Qué | Resultado |
|---|---|
| Purga wiki | 3 archivos deprecados borrados (`VIDAPERSONAL.md`, `cerebro.md`, `labs.md`) |
| Repos alineados | `yggdrasil-wiki`, `THDORA-PERSONAL`, `yggdrasil-formacion`, `yggdrasil-tracking` corregidos en todos los ficheros |
| `AGENT.md` actualizado | Repos reales, Fase 0 = 100%, regla 9 (purga = norma) |
| `CONTEXT.md` actualizado | Estado real 2026-07-16, pendientes documentados |
| Fase 0 cerrada | Wiki estructurada al 100% — 23 islas limpias |
| Issue #58 creada | Plan documentado: plantillas + orquestador |

---

## 🐳 Contenedores Madre — inventario real

| Contenedor | Proyecto Compose | Ruta `.env` | Estado |
|---|---|---|---|
| `thdora` | `thdora` | `/home/varopc/Projects/thdora/.env` | 🔴 caído (HAL-007+008) |
| `thdora-bot` | `thdora` | `/home/varopc/Projects/thdora/.env` | 🔴 caído |
| `guardian_bot` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | ✅ healthy |
| `log_guardian_bot` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | ✅ healthy |
| `local_tripwire` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | 🟡 verificar |
| `n8n` | — | — | ✅ Up |

> ⚠️ **Regla crítica:** Para rotar secretos en cualquier proyecto, editar el `.env` de **ese proyecto** (no un `.env` global) y ejecutar `docker compose up -d --force-recreate --no-deps <servicio>`. `docker restart` NO refresca variables de entorno.

---

## 🗺️ Plan de fases — estado completo

| Fase | Nombre | Estado | Próximo paso |
|---|---|---|---|
| **0** | Repo limpio + wiki estructurada | ✅ 100% — cerrada 2026-07-16 | — |
| **0.5** | Protocolos IA operativos | 🟡 EN MARCHA | Plantillas + orquestador (wiki#58) |
| **1** | Tailscale + acceso remoto | ✅ 100% | — |
| **2** | SSH hardening completo | 🔴 Pendiente | `PasswordAuthentication no` en Madre |
| **3** | Wazuh SIEM | 🟡 En progreso | Agentes + reglas |
| **4** | Suricata IDS + reglas | 🟡 En progreso | Reglas custom |
| **5** | GitHub Actions automatización | 🔴 No iniciado | Labels + milestones + branch protection |
| **6** | Cursor + MCP en Thdora/Acer | 🔴 Pendiente | Token `repo` full + `~/.cursor/mcp.json` |
| **7** | Ollama agentes + workflows IA | 🔴 No iniciado | Depende Fase 0.5 + 6 |

### Fase 0.5 — Protocolos IA (detalle)

| Tarea | Issue | Estado |
|---|---|---|
| Plantilla `AGENT-template.md` | [wiki#58](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/issues/58) | Pendiente |
| Plantilla `CONTEXT-template.md` | [wiki#58](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/issues/58) | Pendiente |
| `wiki/plantillas/README.md` | [wiki#58](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/issues/58) | Pendiente |
| `wiki/islas/orquestador.md` completo | [wiki#58](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/issues/58) | Pendiente |
| Verificar `yggdrasil-dew` tiene AGENT+CONTEXT | — | Pendiente |

---

## 🗺️ Tridente — estado

| Pilar | Repo | Estado |
|---|---|---|
| 🧠 DEW (infra/docs/ops) | `yggdrasil-dew` | ✅ Gobernanza completa |
| 📚 WIKI (conocimiento) | `yggdrasil-wiki` | ✅ 23 islas · Fase 0 cerrada 2026-07-16 |
| 🌱 VIDA | `yggdrasil-tracking` | ✅ Canon migrado · diario activo |

---

## 📅 Historial de sesiones

| Fecha | Sesión | Resultado |
|---|---|---|
| 2026-07-16 tarde | Purga wiki + alineación ecosistema + Fase 0 cierre | AGENT+CONTEXT sincronizados · 3 archivos borrados · repos corregidos · issue #58 creada |
| 2026-07-13 tarde | Fix HAL-007 #45 #46 + THDORA recovery | ✅ Stack operativo · inventario real documentado |
| 2026-07-13 mañana | Auditoría Gemini + issues WIKI | Issues creados |

---

_Actualizado: 2026-07-16 17:00 CEST · Fase 0 cerrada · protocolos en marcha · Perplexity-MCP_
