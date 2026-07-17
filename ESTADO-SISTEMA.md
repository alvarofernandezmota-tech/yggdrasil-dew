---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 01:52 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, canon, sincronizacion]
status: vigente
---

# ESTADO DEL SISTEMA — Ecosistema Yggdrasil

> Última sincronización: **2026-07-18 01:52 CEST** · commit `12938f10`
> Actualizar al inicio y cierre de cada sesión.

---

## 📊 Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Fases cerradas | F1–F19 + F21+F22+F23 + F24+F24b+F25+F27 + **F28** = **27 fases** |
| Fases parciales | F0, F7 |
| Fases pendientes terminal | F20, F26 (ADR-015 local-brain) |
| Islas wiki — activas | **16** |
| Islas wiki — redirects | **6** |
| Repos con AGENT.md | **10/10** ✅ |
| Issues críticos abiertos | 6 (todos requieren terminal) |
| Runbooks disponibles | 4 |
| BOOTSTRAP.md | ✅ v2 operativo |
| ecosistema.md | ✅ actualizado F28 — estado real |

---

## 🖥️ Infraestructura

| Máquina | Estado | IP Tailscale | OS |
|---|---|---|---|
| **Madre** | ✅ Online 24/7 | `100.91.112.32` | Arch Linux (Omarchy) |
| **Acer** | ✅ Activo | `100.86.119.102` | Arch Linux + Hyprland |

### Servicios Docker Madre

| Servicio | Estado | Issue |
|---|---|---|
| Portainer | ✅ | — |
| Grafana + Prometheus | ✅ | — |
| Ollama + Open WebUI | ✅ | — |
| Nextcloud | ✅ | — |
| Vaultwarden | ✅ | — |
| Nginx + Let's Encrypt | ✅ | — |
| Pi-hole + Unbound | ✅ | — |
| nftables firewall | ✅ | — |
| yggdrasil-mcp | 🔴 Caído | [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) |
| THDORA (bot+api) | 🔴 Caído | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) |
| Qdrant | 🟡 Falso positivo | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |
| Wazuh SIEM | 🟡 En progreso | Fase 3 |
| Suricata IDS | 🟡 En progreso | Fase 4 |

---

## 🔴 Alertas activas

| Prioridad | Alerta | Acción | Runbook |
|---|---|---|---|
| 🔴 P0 | FTP puerto 21 EXPUESTO router Digi | `http://192.168.1.1` desactivar | RUNBOOK-CRITICOS-TERMINAL |
| 🔴 P1 | THDORA caído — token caducado | BotFather + .env + restart | RUNBOOK-THDORA-TOKEN |
| 🔴 P2 | yggdrasil-mcp caído | Puerto 3000/3001 verificar | RUNBOOK-MCP-ARRANQUE |
| ⚠️ | HDD 28k+ horas | S.M.A.R.T. → planificar sustitución | RUNBOOK-CRITICOS-TERMINAL |
| ⚠️ | SSH passwords | `PasswordAuthentication no` | Manual |

---

## 📚 Wiki

### Islas activas (contenido real)

| Isla | Status | Notas |
|---|---|---|
| ecosistema.md | ✅ | Actualizado F28 — mapa completo |
| infra.md | ✅ | Fusionada F21 — Madre + Acer |
| ia-local.md | ✅ | Fusionada F21 — Ollama + RAG |
| orquestador.md | ✅ | Actualizado F24 |
| thdora.md | ✅ | Creada F24b |
| seguridad.md | ✅ | Auditada |
| mcp.md | ✅ | Completo |
| tracking.md | ✅ | Completo |
| acer.md | ✅ | Completo |
| formacion.md | 🟡 | Parcial — pendiente completar |
| filosofia.md | 🟡 | Parcial — requiere input Álvaro |
| impresion3d.md | 🟡 | Parcial |
| conocimiento.md | 🟡 | Parcial |
| dev-labs.md | 🟡 | Parcial |
| scripts.md | 🟡 | Parcial |
| vida.md | 🟡 | Parcial |

### Islas redirect (fusionadas/eliminadas)

| Isla | Redirige a |
|---|---|
| agentes-personales.md | thdora.md |
| madre.md | infra.md |
| investigacion-ia.md | ia-local.md |
| ollama-stack.md | ia-local.md |
| osint.md | seguridad.md |
| thea.md | thdora.md (agentes-personales) |

---

## 📂 Repos del ecosistema

| Repo | Tipo | AGENT.md | Estado |
|---|---|---|---|
| `yggdrasil-dew` | Canon | ✅ | ✅ |
| `WIKI---PERSONAL` | Conocimiento | ✅ | ✅ |
| `yggdrasil-tracking` | Personal | ✅ | ✅ |
| `yggdrasil-formacion` | Formación | ✅ | ✅ |
| `madre-config` | Infra | ✅ | ✅ |
| `ollama-stack` | IA local | ✅ | ✅ |
| `yggdrasil-secops` | Seguridad | ✅ | ✅ |
| `yggdrasil-orquestador` | Orquestador | ✅ | ✅ |
| `yggdrasil-scripts` | Scripts | ✅ | ✅ |
| `acer-config` | Workstation | ✅ | ✅ |

---

## 📅 Historial de sincronizaciones

| Fecha | Commit | Qué se hizo |
|---|---|---|
| 2026-07-18 01:52 | `12938f10` | F28 — auditoría completa islas, ecosistema.md actualizado |
| 2026-07-18 01:45 | `aa3cb08c` | F24+F24b+F25+F27 + cierre sesión madrugada |
| 2026-07-18 01:20 | `241d3500` | F21 fusiones wiki + F22 runbooks + F23 diario |
| 2026-07-18 00:52 | `821bfab3` | F17+F18+F19 cerradas |
| 2026-07-16 19:00 | — | F12–F16 cerradas, 21 islas auditadas |
| 2026-07-15 | — | F11 — regla canon DEW/tracking |

---

_Actualizado: 2026-07-18 01:52 CEST · F28 auditoría completa · Perplexity-MCP_
