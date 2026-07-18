---
tipo: runbook
author: Alvaro Fernandez Mota
fecha: 2026-07-18
ruta: docs/runbooks/protocolo-ejecucion-madre-2026-07-18.md
tags: [runbook, madre, protocolo, ejecucion, critico]
status: pendiente
---

# Protocolo Ejecución Madre — 2026-07-18

> Ejecutar en orden. Marcar cada paso completado. Tiempo total estimado: ~90 min.

---

## FASE 0 — Conexión (2 min)

```bash
ssh alvaro@madre
echo "=== FECHA ==="; date
echo "=== DOCKER ==="; docker ps --format 'table {{.Names}}\t{{.Status}}' | sort
echo "=== DISCO ==="; df -h /
```

**Objetivo:** confirmar que Madre está viva y el stack visible.

---

## FASE 1 — Rotar secretos [Issue #74] 🔴 CRITICO (15 min)

### 1a. Token Telegram (BotFather)
```
1. Telegram → @BotFather
2. /mybots → seleccionar THDORA
3. API Token → Revoke current token → copiar nuevo token
```

### 1b. Actualizar .env en Madre
```bash
cd ~/Projects/thdora
cp .env .env.bak.$(date +%Y%m%d)
nano .env
# Sustituir TELEGRAM_BOT_TOKEN= por el nuevo
```

### 1c. Rotar GROQ_API_KEY
```
1. console.groq.com → API Keys
2. Create new key → copiar
3. nano .env → actualizar GROQ_API_KEY=
```

### 1d. Reiniciar THDORA y verificar
```bash
docker compose down && docker compose up -d
sleep 10
docker logs thdora --tail 30
# Debe aparecer: "Bot started" o similar SIN errores de auth
```

### 1e. Test funcional
```
1. Telegram → enviar /start a THDORA
2. Confirmar respuesta
3. Cerrar Issue #74 en GitHub
```

---

## FASE 2 — Fix log_guardian + local_tripwire [Issue #46] 🔴 CRITICO (15 min)

```bash
# Ver logs reales
docker logs --tail 200 log_guardian_bot 2>&1
docker logs --tail 200 local_tripwire 2>&1

# Ver variables de entorno que recibe
docker inspect log_guardian_bot | grep -A 20 'Env'

# Si el problema es el token (probáblemente):
# Ya resuelto en FASE 1 — reiniciar directamente
docker restart log_guardian_bot local_tripwire
sleep 30

# Verificar estado
docker ps --format 'table {{.Names}}\t{{.Status}}' | grep -E 'log_guardian|tripwire'
# Esperado: "healthy"
```

**Criterio de cierre:** ambos en `healthy` durante 30 min sin reinicio.

---

## FASE 3 — Fix qdrant telemetría [Issue #71] 🟡 (10 min)

```bash
# Localizar compose de qdrant
find /home/varopc -name 'docker-compose*' 2>/dev/null | xargs grep -l 'qdrant' 2>/dev/null

# Editar compose — añadir bajo el servicio qdrant:
# environment:
#   - QDRANT__TELEMETRY_DISABLED=true

# Ejemplo:
nano /ruta/al/docker-compose-qdrant.yml
# Añadir bajo el servicio:
#   environment:
#     - QDRANT__TELEMETRY_DISABLED=true

# Recrear contenedor
cd /ruta/al/directorio/qdrant
docker compose down && docker compose up -d
sleep 15

# Verificar que el healthcheck pasa
docker ps | grep qdrant
# Esperado: "healthy"

# Verificar logs limpios (sin errores de telemetría)
docker logs qdrant --tail 30
```

---

## FASE 4 — Puerto MCP 3000→3001 [Issue #75] 🟡 (10 min)

```bash
# Localizar compose de yggdrasil-mcp
find ~/docker -name 'docker-compose*' 2>/dev/null | xargs grep -l 'yggdrasil-mcp\|mcp' 2>/dev/null

# Editar compose:
nano /ruta/al/docker-compose.yml
# ANTES: ports: ["3000:3000"]
# DESPUÉS: ports: ["3001:3000"]

# Reiniciar
docker compose down && docker compose up -d
docker ps | grep mcp
curl -s http://localhost:3001/health || echo "endpoint verificar manualmente"

# Actualizar referencias (MCP puede hacer esto):
# - docs/canon/OWNERSHIP-MATRIX.md — puerto 3000 → 3001
```

---

## FASE 5 — Versionar IaC docker-compose [Issue #43] 🔴 CRITICO (30 min)

```bash
# Listar todos los compose activos
find /home/varopc -name 'docker-compose*' -not -name '*.bak' -not -name '*.obsoleto' 2>/dev/null
find /home/varopc/docker -name 'docker-compose*' 2>/dev/null

# Para cada servicio, copiar a madre-config respetando esta estructura:
# madre-config/
# ├── docker/
# │   ├── ia/           ← ollama, open-webui, qdrant
# │   ├── dev/          ← thdora, code-server, n8n
# │   ├── monitoring/   ← grafana, prometheus, uptime-kuma, portainer
# │   └── secops/       ← log_guardian, local_tripwire, spiderfoot

# Para cada compose:
cp /ruta/compose.yml ~/repos/madre-config/docker/CATEGORIA/servicio/docker-compose.yml

# Crear .env.example (sin valores reales):
grep -E '^[A-Z_]+=.' .env | sed 's/=.*/=/' > .env.example

# Verificar que .env real está en .gitignore:
cat .gitignore | grep .env

# Commit final:
cd ~/repos/madre-config
git add -A
git commit -m 'feat(iac): versionar docker-compose de todos los servicios Madre — closes #43'
git push origin main
```

---

## FASE 6 — Verificar watchdog [Issue #32] (5 min)

```bash
docker logs --tail 100 yggdrasil_watchdog 2>&1
docker restart yggdrasil_watchdog
sleep 20
docker logs --tail 30 yggdrasil_watchdog
docker ps | grep watchdog
```

**Criterio:** arranca limpio sin errores continuos.

---

## FASE 7 — Verificar docker-compose.yml raíz [Issue #34] (5 min)

```bash
cat /home/varopc/docker-compose.yml
docker compose -f /home/varopc/docker-compose.yml ps
```

**Decidir:** ¿está activo o es obsoleto?
- Activo → documentar en `docs/infra/docker/`
- Obsoleto → `mv /home/varopc/docker-compose.yml /home/varopc/docker-compose.yml.obsoleto`

---

## FASE 8 — Reestructurar Tridente (decide tú) (15 min MCP)

Estos cambios los puede hacer MCP con tu confirmación:

1. `VIDAPERSONAL` → `yggdrasil-tracking` (renombrar repo)
2. Mover diarios a estructura canónica — Issue #61
3. Actualizar referencias en DEW + WIKI

**Díselo a Perplexity:** "Ejecuta la reestructuración del tridente, renombra VIDAPERSONAL a yggdrasil-tracking y cierra el issue #61"

---

## Checklist de cierre

```
[ ] FASE 0 — Madre conectada, stack visible
[ ] FASE 1 — Secretos rotados, THDORA responde
[ ] FASE 2 — log_guardian + local_tripwire healthy
[ ] FASE 3 — qdrant healthy, sin errores telemetría
[ ] FASE 4 — MCP en puerto 3001
[ ] FASE 5 — IaC versionado en madre-config
[ ] FASE 6 — watchdog limpio
[ ] FASE 7 — docker-compose.yml raíz auditado
[ ] FASE 8 — Tridente reestructurado (cuando quieras)
```

---

## Issues a cerrar tras ejecutar

| Issue | Se cierra en |
|---|---|
| [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) | FASE 1 |
| [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | FASE 2 |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | FASE 3 |
| [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) | FASE 4 |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | FASE 5 |
| [#32](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/32) | FASE 6 |
| [#34](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/34) | FASE 7 |
| [#61](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/61) | FASE 8 |

---

_Protocolo generado: 2026-07-18 05:05 CEST · Perplexity MCP_
