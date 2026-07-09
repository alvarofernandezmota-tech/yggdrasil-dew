---
tipo: hallazgo
fecha: 2026-07-10
author: Alvaro Fernandez Mota
status: abierto
ruta: docs/infra/madre/env-malformado-hal007.md
tags: [hallazgo, madre, env, docker, hal, seguridad]
hal: HAL-007
---

# HAL-007 — .env raíz malformado

## Detectado

2026-07-10 00:25 CEST durante auditoría de Madre.

## Error

```
failed to read /home/varopc/.env: line 7: key cannot contain a space
```

## Causa

El archivo `/home/varopc/.env` contiene comandos bash y múltiples variables en una misma línea:

| Línea | Problema |
|-------|----------|
| 2 | Dos variables en una línea: `CODE_SERVER_PASSWORD=x CODE_SERVER_SUDO=x` |
| 7 | Comando bash: `docker compose -f docker-compose.maestro.yml up -d` |
| 8 | Variables concatenadas con flags: `--force-recreateTS_CHECK_INTERVAL=60 ...` |

## Fix

```bash
# 1. Backup
cp /home/varopc/.env /home/varopc/.env.bak-2026-07-10

# 2. Editar manualmente
nano /home/varopc/.env

# Formato correcto — una variable por línea, sin comandos:
# N8N_ENCRYPTION_KEY=valor
# CODE_SERVER_PASSWORD=valor
# CODE_SERVER_SUDO=valor
# LITELLM_MASTER_KEY=valor
# TELEGRAM_BOT_TOKEN=valor
# TELEGRAM_USER_ID=valor
# TS_CHECK_INTERVAL=60
# TS_OFFLINE_UMBRAL=3
# NODO_madre=100.91.112.32
# NODO_iphone=100.81.187.99
# NODO_varo12f=100.86.119.102
# NODO_xiaomi=100.106.133.70

# 3. Validar
chmod 600 /home/varopc/.env
docker compose -f /home/varopc/docker-compose.yml config > /dev/null && echo OK
```

## Relación con otros hallazgos

El crash loop de `log_guardian_bot` (HAL-009, intento #971) puede estar causado por este `.env` malformado
si el contenedor depende de variables que no se están leyendo correctamente.

_Creado: 2026-07-10 · Perplexity-MCP_
