---
tipo: operativo
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17
ruta: docs/secrets.md
tags: [seguridad, tokens, secretos, ciclo-vida]
status: vigente
---

# Ciclo de vida de secretos — Yggdrasil

> Registro de todos los secretos del ecosistema, su origen, ubicación y cuándo rotar.
> **NUNCA escribir valores reales aquí.** Solo metadata y ubicaciones.

---

## Principios

1. **Ningún secreto en git** — `.env` siempre en `.gitignore`
2. **Rotación tras exposición** — si aparece en un chat o log, rotar inmediatamente
3. **Un `.env` por proyecto** — no existe `.env` global de Madre
4. **Vaultwarden como fuente de verdad** — todos los secretos vivos deben estar ahí
5. **NUNCA usar `cat .env` en sesión compartida** — usar `grep -c '=' .env` para contar líneas

---

## Inventario de secretos activos

| Secreto | Proyecto | Archivo | Ubicación en Madre | Última rotación | Próxima rotación | Estado |
|---|---|---|---|---|---|---|
| `TELEGRAM_BOT_TOKEN` (THDORA) | THDORA-PERSONAL | `.env` | `/home/varopc/Projects/thdora/.env` | 2026-07-13 | Cada 90 días | ✅ Rotado |
| `N8N_ENCRYPTION_KEY` | n8n | `.env` | `/home/varopc/.env` | ⚠️ Expuesto 2026-07-10 | URGENTE | 🔴 Pendiente rotar |
| `CODE_SERVER_PASSWORD` | code-server | `.env` | `/home/varopc/.env` | ⚠️ Expuesto 2026-07-10 | URGENTE | 🔴 Pendiente rotar |
| `CODE_SERVER_SUDO` | code-server | `.env` | `/home/varopc/.env` | ⚠️ Expuesto 2026-07-10 | URGENTE | 🔴 Pendiente rotar |
| `LITELLM_MASTER_KEY` | LiteLLM | `.env` | `/home/varopc/.env` | ⚠️ Expuesto 2026-07-10 | URGENTE | 🔴 Pendiente rotar |
| SSH key Madre | Madre | `~/.ssh/` | Madre + Acer + iPhone | — | Al comprometer | ✅ OK |

---

## Protocolo de rotación de emergencia

```bash
# 1. Identificar el secreto expuesto
# 2. Revocar en el servicio origen (BotFather, panel admin, etc.)
# 3. Generar nuevo valor
# 4. Actualizar en .env del proyecto afectado
#    nano /ruta/proyecto/.env
# 5. Recrear el contenedor (NO solo restart)
#    docker compose up -d --force-recreate --no-deps <servicio>
# 6. Verificar que el servicio arranca limpio
# 7. Actualizar fecha en esta tabla
# 8. Abrir issue HAL en yggdrasil-dew si hubo exposición
```

---

## Secretos pendientes de mover a Vaultwarden

- [ ] `N8N_ENCRYPTION_KEY` — rotar primero, luego a Vaultwarden
- [ ] `CODE_SERVER_PASSWORD` + `CODE_SERVER_SUDO` — rotar primero
- [ ] `LITELLM_MASTER_KEY` — rotar primero
- [ ] Credenciales Nextcloud admin
- [ ] Credenciales Portainer admin
- [ ] Credenciales Grafana admin

---

## Issues relacionados

- [#45 HAL-008](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) — exposición `.env` en chat 2026-07-10
- [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) — renovar token Telegram THDORA
- [#60 F7](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) — GitOps real: `.env.template` + `env-checker.sh`

---

_Creado: 2026-07-17 · propuesta Gemini 2026-07-13 · Perplexity-MCP_
