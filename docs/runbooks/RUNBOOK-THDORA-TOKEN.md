---
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/runbooks/RUNBOOK-THDORA-TOKEN.md
tags: [runbook, thdora, telegram, token, terminal]
status: vigente
issue: "#74"
---

# Runbook: Renovar Token THDORA — Issue #74

> Tiempo estimado: 5 minutos.
> Requiere: acceso a Telegram (BotFather) + SSH a Madre.

---

## Problema

Token Telegram de THDORA-PERSONAL caducado/revocado. Bot inoperativo.

---

## Pasos

### 1. Obtener nuevo token en Telegram

```
1. Abrir Telegram → buscar @BotFather
2. Enviar: /mybots
3. Seleccionar THDORA-PERSONAL
4. → "API Token" → "Revoke current token"
5. Copiar el nuevo token
```

### 2. Actualizar .env en Madre

```bash
# Conectar a Madre
ssh varopc@100.91.112.32

# Editar .env de THDORA
cd /ruta/thdora-personal   # ajustar ruta real
nano .env
# → Actualizar: TELEGRAM_BOT_TOKEN=<nuevo_token>
```

### 3. Reiniciar contenedores

```bash
docker compose down thdora-bot thdora-api
docker compose up -d thdora-bot thdora-api

# Verificar
docker ps --filter 'name=thdora'
docker logs thdora-bot --tail 20
```

### 4. Verificar en Telegram

```
Enviar /start al bot → debe responder
Enviar /status → verificar estado ecosistema
```

### 5. Cerrar issues

```bash
# Cerrar en DEW:
# Issue #74 — Token THDORA
# Issue #44 — HAL-007 (si .env fue corregido)
# Issue #45 — HAL-008 (token anterior revocado = resuelto)
```

---

## Si hay problemas

- `.env` no encontrado: `find / -name '.env' -path '*thdora*' 2>/dev/null`
- Contenedor no arranca: `docker logs thdora-bot` → revisar error
- Token inválido: verificar que no hay espacios en el .env

---

_Creado: 2026-07-18 · Perplexity-MCP · F22_
