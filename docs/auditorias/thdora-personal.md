---
tipo: auditoria
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-09 15:53 CEST
ruta: docs/auditorias/thdora-personal.md
tags: [auditoria, thdora, docker, madre, ecosistema]
status: verificado
---

# Auditoría — thdora-personal

> Ficha de integración en el ecosistema Yggdrasil.
> Verificada en vivo el 2026-07-09 con `docker inspect` + `git remote -v`.
> Plantilla usada: [PLANTILLA-REPO-ONBOARDING.md](../canon/PLANTILLA-REPO-ONBOARDING.md)

---

## Identificación del repo

| Campo | Valor |
|---|---|
| **Nombre GitHub** | `alvarofernandezmota-tech/thdora-personal` |
| **URL** | https://github.com/alvarofernandezmota-tech/thdora-personal |
| **Visibilidad** | 🔴 Privado |
| **Isla en el ecosistema** | THDORA |
| **Propósito** | Bot Telegram personal — asistente, diario, automatización |

---

## Ubicación física en Madre

| Campo | Valor |
|---|---|
| **Ruta física real** | `/home/varopc/Projects/thdora` |
| **Symlink operativo** | `~/repos/thdora` → `/home/varopc/Projects/thdora` |
| **Symlink creado** | 2026-07-09 |
| **Branch activo** | `main` (último commit verificado: `fd5e8a2`) |
| **Remote confirmado** | `git@github.com:alvarofernandezmota-tech/thdora-personal.git` |

> ⚠️ Excepción a la convención estándar: la carpeta física NO vive en `~/repos`.
> Motivo: proyecto preexistente antes de adoptar `~/repos` como estándar.

---

## Stack Docker

| Campo | Valor |
|---|---|
| **Compose file activo** | `/home/varopc/Projects/thdora/docker-compose.yml` |
| **Compose project** | `thdora` |
| **Archivo de entorno** | `/home/varopc/Projects/thdora/.env` (permisos `600`, no en repo) |

### Contenedores

| Contenedor | Estado (2026-07-09) | Notas |
|---|---|---|
| `thdora` | Healthy | Recreado tras rotación token Telegram |
| `thdora-bot` | Started | Recreado tras rotación token Telegram |
| `prometheus` | Started | Monitoring |
| `grafana` | Started | Monitoring |

---

## Incidentes registrados

| HAL | Descripción | Estado |
|---|---|---|
| [HAL-001](../hallazgos/HAL-001-token-telegram-thdora.md) | Token Telegram expuesto por primera vez | ✅ Rotado |
| [HAL-003](../hallazgos/HAL-003-token-telegram-segunda-exposicion.md) | Segunda exposición token Telegram | ✅ Rotado |
| HAL nuevo (sin número) | Tercera exposición — `.env` completo pegado en chat | 🔴 Sin abrir |

---

## Conexión con el ecosistema

| Documento | Enlace |
|---|---|
| Ownership matrix | [docs/canon/ownership-matrix.md](../canon/ownership-matrix.md) |
| Mapa físico Madre | [WIKI: MAPA-REPOS-MADRE.md](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/docs/infra/MAPA-REPOS-MADRE.md) |
| Diario verificación | [docs/diarios/2026-07-09.md](../diarios/2026-07-09.md) |

---

## Checklist de onboarding al ecosistema

- [x] Ruta física real verificada con `docker inspect`
- [x] Remote GitHub confirmado con `git remote -v`
- [x] Symlink creado en `~/repos/`
- [x] Entrada en `ownership-matrix.md`
- [x] Entrada en `MAPA-REPOS-MADRE.md` (WIKI)
- [x] Esta ficha de auditoría creada
- [ ] `README.md` del repo actualizado con referencia al ecosistema
- [ ] `CONTEXT.md` / `AGENT.md` del repo con ruta física real
- [ ] Labels Docker con `yggdrasil.layer` y `yggdrasil.role`

---

_Creado: 2026-07-09 · Perplexity MCP · verificado en vivo_
