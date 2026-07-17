---
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/runbooks/RUNBOOK-MCP-ARRANQUE.md
tags: [runbook, mcp, docker, terminal]
status: vigente
issue: "#75"
---

# Runbook: Arrancar yggdrasil-mcp — Issue #75

> Tiempo estimado: 5-10 minutos.
> Requiere: SSH a Madre.

---

## Problema

yggdrasil-mcp no arranca. Puerto 3000 (o 3001) inaccesible.
Perplexity y agentes no pueden conectar con herramientas GitHub/Telegram vía MCP.

---

## Diagnóstico previo

```bash
ssh varopc@100.91.112.32

# Ver si el proceso existe
ps aux | grep mcp

# Ver si el puerto está escuchando
ss -tlnp | grep 300

# Ver logs del contenedor (si es Docker)
docker ps -a | grep mcp
docker logs yggdrasil-mcp --tail 50
```

---

## Arranque — opción A: Docker

```bash
cd /ruta/yggdrasil-mcp   # ajustar ruta real
docker compose up -d
docker ps --filter 'name=mcp'
docker logs yggdrasil-mcp --tail 20

# Verificar puerto
curl http://localhost:3000/health
# o
curl http://localhost:3001/health
```

## Arranque — opción B: Proceso Node.js directo

```bash
cd /ruta/yggdrasil-mcp
npm install
npm start
# o si usa pm2:
pm2 start
pm2 logs yggdrasil-mcp
```

---

## Conflicto de puerto

```bash
# Si puerto 3000 ocupado:
ss -tlnp | grep 3000
kill -9 <PID>

# O cambiar a 3001 en config/env
```

---

## Verificación final

```bash
# Desde Madre
curl http://localhost:3000/health

# Desde Acer via Tailscale
curl http://100.91.112.32:3000/health
```

---

## Post-fix

1. Cerrar issue #75 en DEW
2. Actualizar ESTADO-SISTEMA.md con puerto real (3000 o 3001)
3. Actualizar wiki/islas/mcp.md con estado ✅

---

_Creado: 2026-07-18 · Perplexity-MCP · F22_
