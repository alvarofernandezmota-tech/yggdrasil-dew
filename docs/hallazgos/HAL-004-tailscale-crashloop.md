---
tipo: hallazgo
id: HAL-004
author: Alvaro Fernandez Mota
creado: 2026-07-05 21:56 CEST
actualizado: 2026-07-05 21:56 CEST
ruta: docs/hallazgos/HAL-004-tailscale-crashloop.md
tags: [hallazgo, madre, docker, tailscale, crashloop, unhealthy]
severidad: alta
status: PENDIENTE
---

# 🔴 HAL-004 — tailscale_monitor: crashloop infinito

## Descripción

El contenedor `tailscale_monitor` arranca y muere inmediatamente de forma repetida.
Se ha observado >774 reinicios en ~3 días (1 reinicio cada ~6 minutos con backoff 300s).
El log solo muestra `[*] Tailscale Monitor starting...` en bucle — el script muere antes de ejecutar ninguna lógica.

## Evidencia

```
[*] Tailscale Monitor starting...
[*] Tailscale Monitor starting...
[*] Tailscale Monitor starting...
... (>100 líneas idénticas sin ningún error posterior)
```

`docker ps -a` mostraba: `Up 3 days (unhealthy)` con imagen `yggdrasil-secops-yggdrasil_watchdog`.

## Impacto

- El monitor de Tailscale no funciona → Madre puede perder conectividad Tailscale sin alerta
- Consumo de CPU/memoria por crashloop continuo
- Logs de Docker saturados con líneas inútiles
- El sistema de vigilancia de seguridad está parcialmente ciego

## Causas probables (por orden)

1. Variable de entorno faltante (`TAILSCALE_API_KEY` u otra)
2. Dependencia de red no disponible al arrancar
3. Import de Python fallando silenciosamente
4. Volumen o archivo de configuración no montado correctamente

## Comandos de diagnóstico

```bash
# Parar el crashloop mientras se investiga
docker stop tailscale_monitor

# Ver variables de entorno
docker inspect tailscale_monitor | python3 -c "import sys,json; d=json.load(sys.stdin)[0]; [print(e) for e in d['Config']['Env']]"

# Ver el docker-compose
cd ~/yggdrasil-secops && grep -A 20 tailscale_monitor docker-compose.yml

# Extraer y revisar el script
docker cp tailscale_monitor:/app/. /tmp/tailscale_monitor_debug/
head -50 /tmp/tailscale_monitor_debug/monitor.py

# Ejecutar manualmente para ver el traceback real
docker run --rm --env-file ~/yggdrasil-secops/.env \
  $(docker inspect tailscale_monitor --format '{{.Config.Image}}') \
  python monitor.py 2>&1 | head -30
```

## Plan de remediación

1. Parar el contenedor
2. Revisar el script y las variables requeridas
3. Completar el `.env` o el `docker-compose.yml`
4. Reiniciar y verificar que arranca sin crashloop
5. Cerrar este hallazgo con evidencia de resolución

## Referencias

- Diario: [2026-07-05-noche-6.md](../diarios/2026-07-05-noche-6.md)
- Relacionado: HAL-005 (log_guardian_bot mismo patrón)

---
_Creado: 2026-07-05 21:56 CEST · Perplexity MCP_
