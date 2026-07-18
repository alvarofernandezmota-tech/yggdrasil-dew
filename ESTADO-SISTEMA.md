---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 03:03 CEST
ruta: ESTADO-SISTEMA.md
tags: [estado, sistema, canon, sincronizacion]
status: vigente
---

# ESTADO DEL SISTEMA — Ecosistema Yggdrasil

> Última sincronización: **2026-07-18 03:03 CEST** · F29 cierre sesión madrugada
> Actualizar al inicio y cierre de cada sesión.

---

## 📊 Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Fases cerradas | F1–F19 + F21–F29 = **28 fases** |
| Fases parciales | F0, F7 |
| Fases pendientes terminal | F20, F26 (ADR-015 local-brain) |
| Islas wiki — activas | **16** |
| Islas wiki — redirects | **6** |
| Repos con AGENT.md | **10/10** ✅ |
| Issues críticos abiertos | **6** (todos requieren terminal SSH Madre) |
| Runbooks disponibles | 4 |
| BOOTSTRAP.md | ✅ v2 operativo |
| Scripts disponibles | `env-checker.sh` ✅ · `ygg-madre.sh` ✅ |

---

## 🖥️ Infraestructura

| Máquina | Estado | IP Tailscale | OS | SSH |
|---|---|---|---|---|
| **Madre** | ✅ Online 24/7 | `100.91.112.32` | Arch Linux (Omarchy) | `varopc@100.91.112.32` |
| **Acer** | ✅ Activo | `100.86.119.102` | Arch Linux + Hyprland | — |

> 🔑 Acceso SSH Madre desde Terminus: `ssh varopc@100.91.112.32` (solo clave pública)

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
| Qdrant | 🟡 Falso positivo telemetría | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |
| log_guardian_bot | 🔴 Crash loop #971 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) |
| local_tripwire | 🔴 Crash loop #486 | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) |
| Wazuh SIEM | 🟡 En progreso | Fase 3 |
| Suricata IDS | 🟡 En progreso | Fase 4 |

---

## 🔴 Alertas activas — Orden de prioridad

| Pri | Alerta | Acción | Dónde |
|---|---|---|---|
| 🔴 P0 | **FTP puerto 21 EXPUESTO** router Digi | Panel router → cerrar port 21 | `http://192.168.1.1` |
| 🔴 P1 | **THDORA caído** — token Telegram caducado | BotFather → revocar → nuevo token → .env Madre → restart | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) |
| 🔴 P2 | **yggdrasil-mcp caído** — conflicto puerto 3000/3001 | Editar compose → puerto 3001 → restart | [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) |
| 🔴 P3 | **log_guardian + tripwire** crash loop | Dependiente de P1 (token) | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) |
| ⚠️ P4 | **HDD Madre 28k+ horas** | `smartctl -a /dev/sda` → decisión | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) |
| ⚠️ P5 | **Qdrant unhealthy** (falso positivo) | Añadir `QDRANT__TELEMETRY_DISABLED=true` | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |

> Todos requieren terminal SSH a Madre. Comando: `ssh varopc@100.91.112.32`

---

## 🛠️ Scripts disponibles

| Script | Repo | Uso |
|---|---|---|
| `env-checker.sh` | yggdrasil-dew/scripts/ | Valida `.env` contra `.env.template` antes de deploy |
| `ygg-madre.sh` | yggdrasil-dew/scripts/ | Maestro Terminus→Madre: setup SSH, check, connect, audit, health, logs |

```bash
# Uso rápido desde Terminus:
curl -O https://raw.githubusercontent.com/alvarofernandezmota-tech/yggdrasil-dew/main/scripts/ygg-madre.sh
chmod +x ygg-madre.sh
./ygg-madre.sh setup   # configura alias SSH madre
./ygg-madre.sh check   # verifica conectividad
./ygg-madre.sh connect # conecta shell interactiva
./ygg-madre.sh audit   # auditoría FASE 4 remota
./ygg-madre.sh health  # health-check Docker rápido
```

---

## 📚 Wiki — Islas

### Activas (contenido real)

| Isla | Status | Notas |
|---|---|---|
| ecosistema.md | ✅ | Actualizado F28 |
| infra.md | ✅ | Fusionada F21 — Madre + Acer |
| ia-local.md | ✅ | Fusionada F21 — Ollama + RAG |
| orquestador.md | ✅ | Actualizado F24 |
| thdora.md | ✅ | Creada F24b |
| seguridad.md | ✅ | Auditada |
| mcp.md | ✅ | Completo |
| tracking.md | ✅ | Completo |
| acer.md | ✅ | Completo |
| formacion.md | 🟡 | Parcial — input Álvaro |
| filosofia.md | 🟡 | Parcial — input Álvaro (Bloque 2) |
| impresion3d.md | 🟡 | Parcial — input Álvaro |
| conocimiento.md | 🟡 | Parcial |
| dev-labs.md | 🟡 | Parcial |
| scripts.md | 🟡 | Parcial |
| vida.md | 🟡 | Parcial |

### Redirects (fusionadas)

| Isla | Redirige a |
|---|---|
| agentes-personales.md | thdora.md |
| madre.md | infra.md |
| investigacion-ia.md | ia-local.md |
| ollama-stack.md | ia-local.md |
| osint.md | seguridad.md |
| thea.md | thdora.md |

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

### Consolidación pendiente (plan aprobado sesión 2026-07-18)

| Fusión | Estado |
|---|---|
| `ollama-stack` absorbe `local-brain` | 🟡 Pendiente |
| `yggdrasil-dew` wiki absorbe `WIKI---PERSONAL` duplicidad | 🟡 Pendiente |
| `yggdrasil-secops` absorbe `osint-stack` | 🟡 Pendiente |
| `ai-toolkit` absorbe `investigacion-ia` | 🟡 Pendiente |
| Archivar `dev-labs` → `yggdrasil-scripts` | 🟡 Pendiente |

---

## 📅 Historial de sincronizaciones

| Fecha | Fase | Qué se hizo |
|---|---|---|
| 2026-07-18 03:03 | **F29** | Sesión madrugada: ygg-madre.sh, SSH Terminus setup, plan consolidación repos, estado alineado |
| 2026-07-18 01:52 | F28 | Auditoría completa islas, ecosistema.md actualizado |
| 2026-07-18 01:45 | F24–F27 | Cierre sesión madrugada anterior |
| 2026-07-18 01:20 | F21–F23 | Fusiones wiki + runbooks + diario |
| 2026-07-18 00:52 | F17–F19 | Fases cerradas |
| 2026-07-16 19:00 | F12–F16 | 21 islas auditadas |
| 2026-07-15 | F11 | Regla canon DEW/tracking |

---

_Actualizado: 2026-07-18 03:03 CEST · F29 cierre sesión madrugada · Perplexity-MCP_
