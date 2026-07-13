---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, secretos, seguridad, env]
status: vigente
---

# Protocolo de Gestión de Secretos

> Nacido de HAL-008: secretos expuestos al imprimir `.env` en el chat.

## Reglas absolutas

- ❌ NUNCA `cat .env` en un chat con IA
- ❌ NUNCA `nl .env` en un chat con IA
- ❌ NUNCA copiar el contenido de `.env` en un mensaje
- ✅ Para contar líneas: `wc -l .env`
- ✅ Para ver claves sin valores: `grep -o '^[^=]*' .env`
- ✅ Para verificar que una variable existe: `grep -c 'VARIABLE_NAME' .env`

## Al crear un nuevo secreto

1. Añadirlo a `.env` en Madre (nunca commitear el valor)
2. Añadir la clave (sin valor) a `.env.template` en `yggdrasil-dew`
3. Documentar en `docs/runbooks/` qué servicio lo usa
4. Guardar en Vaultwarden

## Rotación periódica (cada 3 meses)

| Secreto | Acción |
|---|---|
| `TELEGRAM_BOT_TOKEN` | Revocar en BotFather → generar nuevo → actualizar `.env` → reiniciar THDORA |
| `N8N_ENCRYPTION_KEY` | Rotar en n8n settings → actualizar `.env` |
| `LITELLM_MASTER_KEY` | Regenerar → actualizar `.env` → reiniciar LiteLLM |
| `CODE_SERVER_PASSWORD` | Cambiar en code-server → actualizar `.env` |

## Al rotar un secreto

1. Revocar el secreto viejo en la plataforma origen
2. Generar el nuevo
3. Actualizar `.env` en Madre: `nano /home/varopc/.env`
4. Reiniciar el servicio afectado: `docker restart <servicio>`
5. Verificar que funciona
6. Actualizar Vaultwarden

## Refs
- HAL-008 (#45) — causa raíz de este protocolo
- Issue #60 F7.1 — `.env.template` pendiente

---
_Creado: 2026-07-13 · Perplexity MCP_
