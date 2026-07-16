---
title: Estado Isla THDORA
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:06 CEST
ruta: docs/islas/ESTADO-ISLA-THDORA.md
tags: [isla, thdora, estado, bot, telegram]
status: parcialmente-auditada
---

# 🤖 Estado Isla THDORA

> Auditada parcialmente en sesión 2026-07-16 vía SSH directo a Madre.
> Fuente de verdad: issues en [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL)

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 Parcialmente auditada |
| **Repo principal** | [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) |
| **Ruta física en Madre** | `/home/varopc/Projects/thdora` |
| **Issues abiertos** | 10 |
| **Última auditoría** | 2026-07-16 16:06 CEST |

---

## Servicios — estado real verificado 2026-07-16

| Servicio | Estado real | Notas |
|---|---|---|
| `thdora` | ✅ Up 2d healthy | Operativo |
| `thdora-bot` | 🟡 Up (health: starting) | Recién reiniciado al momento de auditoría — monitorizar |

> `thdora-bot` llevaba 6 segundos arriba en el momento del `docker ps`. Verificar que pasa a `healthy` tras unos minutos.

---

## HALs activos que bloquean

| HAL | Descripción | Estado 2026-07-16 |
|---|---|---|
| HAL-001 | Token Telegram THDORA expuesto | 🔴 Pendiente rotación |
| HAL-003 | Token sin rotación periódica | 🔴 Pendiente |

---

## Checklist de auditoría

- [ ] Confirmar que `thdora-bot` pasa a `healthy` tras arranque
- [ ] Rotar token Telegram en BotFather (`/revoke`)
- [ ] Confirmar `.env` en `.gitignore`
- [ ] Mover token a Vaultwarden
- [ ] Revisar los 10 issues abiertos
- [ ] Documentar comando de recreación de bot tras rotación de token

**Comando canónico para rotar token (sin secretos):**
```bash
cd /home/varopc/Projects/thdora
nano .env                          # actualizar BOT_TOKEN
docker compose up -d --force-recreate --no-deps bot
docker logs --tail 30 thdora-bot   # verificar arranque limpio
```

---

## Dependencias con otras islas

| Dependencia | Isla destino | Issue/HAL | Tipo |
|---|---|---|---|
| Token Telegram — bloquea cierre isla Seguridad | Seguridad | HAL-003 | Bloqueante |

---

_Actualizado: 2026-07-16 16:06 CEST · Auditoría SSH directa · Perplexity MCP_
