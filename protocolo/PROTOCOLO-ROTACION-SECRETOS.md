---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, secretos, seguridad, rotacion]
status: vigente
---

# Protocolo Rotación Periódica de Secretos

> Frecuencia: cada 3 meses. Revisar en auditoría mensual.
> Ver también `PROTOCOLO-SECRETOS.md` para gestión del día a día.

## Calendario de rotación

| Secreto | Plataforma | Cada | Próxima rotación |
|---|---|---|---|
| `TELEGRAM_BOT_TOKEN` | BotFather | 3 meses | Oct 2026 |
| `N8N_ENCRYPTION_KEY` | n8n settings | 6 meses | Ene 2027 |
| `LITELLM_MASTER_KEY` | LiteLLM | 3 meses | Oct 2026 |
| `CODE_SERVER_PASSWORD` | code-server | 6 meses | Ene 2027 |
| SSH keys GitHub | GitHub Settings | 1 año | Jul 2027 |

## Procedimiento de rotación

```bash
# 1. Backup del .env actual
cp /home/varopc/.env /home/varopc/.env.bak-$(date +%Y%m%d)

# 2. Revocar secreto viejo en la plataforma origen
# (BotFather, n8n UI, LiteLLM admin...)

# 3. Generar nuevo secreto
# (en la plataforma correspondiente)

# 4. Actualizar .env
nano /home/varopc/.env

# 5. Reiniciar el servicio afectado
docker restart <servicio>

# 6. Verificar que funciona
docker logs --tail 20 <servicio>

# 7. Actualizar Vaultwarden con el nuevo valor

# 8. Borrar backup .env
rm /home/varopc/.env.bak-$(date +%Y%m%d)
```

## Tras rotar

- Actualizar fecha de próxima rotación en este protocolo
- Anotar en diario del día

## Refs
- HAL-008 (#45) — origen de este protocolo
- `PROTOCOLO-SECRETOS.md` — gestión día a día
- Issue #60 F7.1 — `.env.template` pendiente

---
_Creado: 2026-07-13 · Perplexity MCP_
