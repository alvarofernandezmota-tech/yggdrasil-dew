---
title: Estado Isla THDORA
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-12
ruta: docs/islas/ESTADO-ISLA-THDORA.md
tags: [isla, thdora, estado, bot, telegram]
status: pendiente-auditoria
---

# 🤖 Estado Isla THDORA

> Pendiente de auditoría. Tiene HALs activos que bloquean el cierre de la Isla Seguridad.
> Fuente de verdad: issues en [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL)

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟠 Bloqueada (depende de HAL-003 de Seguridad) |
| **Repo principal** | [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) |
| **Ruta física en Madre** | `/home/varopc/Projects/thdora` (symlink `~/repos/thdora`) |
| **Issues abiertos** | 10 |
| **Última auditoría** | 2026-07-09 (parcial) |

---

## Servicios conocidos

| Servicio | Estado | Notas |
|---|---|---|
| `thdora` | ⚪ Sin auditar completo | HAL-001, HAL-003 activos |
| `thdora-bot` | ⚪ Sin auditar completo | HAL-001, HAL-003 activos |

---

## HALs activos que bloquean

| HAL | Descripción | Bloqueante |
|---|---|---|
| HAL-001 | Token Telegram THDORA expuesto | Sí — cierre Isla Seguridad |
| HAL-003 | Token sin rotación periódica | Sí — cierre Isla Seguridad |

---

## Checklist de auditoría (rellenar en sesión)

- [ ] Rotar token Telegram en BotFather (`/revoke`)
- [ ] Confirmar `.env` en `.gitignore`
- [ ] Mover token a Vaultwarden
- [ ] Revisar los 10 issues abiertos
- [ ] Documentar estado de `thdora` y `thdora-bot`

---

_Creado: 2026-07-12 · Pendiente de sesión de auditoría · Perplexity MCP_
