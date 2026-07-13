# Runbook: HAL-008 — Rotación de tokens expuestos

**Issue:** [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45)  
**Tiempo estimado:** 15 min  
**Prioridad:** EJECUTAR ANTES DE CUALQUIER OTRA ACCIÓN

---

## Tokens afectados

| Variable | Servicio | Estado |
|---|---|---|
| `TELEGRAM_BOT_TOKEN` | BotFather | ✅ Revocado 2026-07-13 |
| `LITELLM_MASTER_KEY` | LiteLLM dashboard | ⏳ Pendiente verificar |
| `CODE_SERVER_PASSWORD` | code-server | ⏳ Pendiente cambiar |
| `CODE_SERVER_SUDO` | code-server | ⏳ Pendiente cambiar |
| `N8N_ENCRYPTION_KEY` | n8n | ⏳ Pendiente rotar |
| `TELEGRAM_USER_ID` | — | ✅ No es secreto |

---

## Pasos por servicio

### Telegram (✅ HECHO)
```
BotFather → /mybots → seleccionar bot → API Token → Revoke
Actualizar TELEGRAM_BOT_TOKEN en /home/varopc/.env
Reiniciar: docker restart thdora_bot
```

### LiteLLM
```
Entrar al dashboard de LiteLLM
Generar nueva LITELLM_MASTER_KEY
Actualizar en /home/varopc/.env
Reiniciar: docker restart litellm
```

### code-server
```bash
# Cambiar en .env
nano /home/varopc/.env
# Actualizar CODE_SERVER_PASSWORD y CODE_SERVER_SUDO
docker restart code-server
```

### n8n
```
Ojo: cambiar N8N_ENCRYPTION_KEY rompe los workflows existentes si ya tienen credenciales cifradas.
Evaluar si el riesgo de exposición justifica la rotación vs el coste de reconfigurar workflows.
Decisión documentada aquí: [COMPLETAR]
```

---

## Verificación final

```bash
# Todos los contenedores afectados en estado healthy
docker ps --format 'table {{.Names}}\t{{.Status}}'
```

---

## Regla permanente

> NUNCA imprimir el contenido de `.env` en un chat.  
> Para verificar que una variable existe: `grep -c 'TELEGRAM_BOT_TOKEN' .env`  
> Para contar líneas: `wc -l .env`
