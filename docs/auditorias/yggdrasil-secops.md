---
tipo: auditoria
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-09 15:53 CEST
ruta: docs/auditorias/yggdrasil-secops.md
tags: [auditoria, secops, docker, madre, ecosistema, seguridad]
status: verificado
---

# Auditoría — yggdrasil-secops

> Ficha de integración en el ecosistema Yggdrasil.
> Verificada en vivo el 2026-07-09 con `docker inspect` + `git remote -v`.
> Plantilla usada: [PLANTILLA-REPO-ONBOARDING.md](../canon/PLANTILLA-REPO-ONBOARDING.md)

---

## Identificación del repo

| Campo | Valor |
|---|---|
| **Nombre GitHub** | `alvarofernandezmota-tech/yggdrasil-secops` |
| **URL** | https://github.com/alvarofernandezmota-tech/yggdrasil-secops |
| **Visibilidad** | 🔴 Debe ser privado — **pendiente de cambio manual** |
| **Isla en el ecosistema** | Seguridad |
| **Propósito** | Stack completo de seguridad: monitoreo, watchdog, OSINT, firewall, blue team |

---

## Ubicación física en Madre

| Campo | Valor |
|---|---|
| **Ruta física real** | `/home/varopc/yggdrasil-secops` |
| **Symlink operativo** | `~/repos/yggdrasil-secops` → `/home/varopc/yggdrasil-secops` |
| **Symlink creado** | 2026-07-09 |
| **Branch activo** | `main` (último commit verificado: `c887ee4`) |
| **Remote confirmado** | `git@github.com:alvarofernandezmota-tech/yggdrasil-secops.git` |

> ⚠️ Excepción a la convención estándar: la carpeta física NO vive en `~/repos`.
> Motivo: proyecto preexistente antes de adoptar `~/repos` como estándar.

---

## Stack Docker

| Campo | Valor |
|---|---|
| **Compose file activo** | `/home/varopc/yggdrasil-secops/docker-compose.maestro.yml` |
| **Compose file blue-team** | `/home/varopc/yggdrasil-secops/docker-compose.blue-team.yml` |
| **Compose project** | `yggdrasil-secops` |
| **Archivo de entorno** | `/home/varopc/yggdrasil-secops/.env` (permisos `600`, no en repo) |

### Contenedores

| Contenedor | Servicio | `yggdrasil.layer` | `yggdrasil.role` | Estado |
|---|---|---|---|---|
| `yggdrasil_watchdog` | yggdrasil_watchdog | watchdog | watchdog | ⚠️ Unhealthy — pendiente revisar |
| `tailscale_monitor` | tailscale_monitor | network-vpn | monitor | Running |
| `log_guardian_bot` | log_guardian | firewall | monitor | Running |
| `guardian_bot` | guardian_bot | command | control | Running |
| `local_tripwire` | local_tripwire | filesystem | monitor | Running |
| `network_radar` | network_radar | network-local | monitor | Running |
| `radar_backup` | radar_backup | data | backup | Running |

---

## Incidentes registrados

| HAL | Descripción | Estado |
|---|---|---|
| HAL-001💥 | Colisión ID: HAL-001 = Telegram (Dew) Y FTP puerto 21 (secops) | 🔴 Sin resolver |
| HAL-004 | tailscale crashloop | 🟡 Ver hallazgos |
| HAL-005 | HDD Madre en riesgo — smartctl pendiente | 🔴 Urgente |
| — | Repo público con IP real router `79.116.247.44` expuesta | 🔴 Pendiente privado |
| — | `docs/pentesting/` y `docs/seguridad/` perdidos (untracked, rm -rf) | 🟡 Irrecuperable — documentado |
| — | `SEC-001-ref.md` apunta a ruta inexistente | 🟡 Fase 1 secops |

---

## Conexión con el ecosistema

| Documento | Enlace |
|---|---|
| Ownership matrix | [docs/canon/ownership-matrix.md](../canon/ownership-matrix.md) |
| Mapa físico Madre | [WIKI: MAPA-REPOS-MADRE.md](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/docs/infra/MAPA-REPOS-MADRE.md) |
| Plan alineación secops | [PLAN-ALINEACION-SECOPS-2026-07.md](../../PLAN-ALINEACION-SECOPS-2026-07.md) |
| Diario verificación | [docs/diarios/2026-07-09.md](../diarios/2026-07-09.md) |

---

## Checklist de onboarding al ecosistema

- [x] Ruta física real verificada con `docker inspect`
- [x] Remote GitHub confirmado con `git remote -v`
- [x] Symlink creado en `~/repos/`
- [x] Entrada en `ownership-matrix.md`
- [x] Entrada en `MAPA-REPOS-MADRE.md` (WIKI)
- [x] Esta ficha de auditoría creada
- [ ] Repo puesto en **privado** en GitHub
- [ ] `README.md` del repo actualizado con referencia al ecosistema
- [ ] `CONTEXT.md` / `AGENT.md` del repo con ruta física real
- [ ] Resolver colisión HAL-001
- [ ] Revisar `yggdrasil_watchdog` unhealthy

---

_Creado: 2026-07-09 · Perplexity MCP · verificado en vivo_
