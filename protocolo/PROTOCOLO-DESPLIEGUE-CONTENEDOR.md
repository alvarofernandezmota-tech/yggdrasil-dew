---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-DESPLIEGUE-CONTENEDOR.md
tags: [protocolo, docker, contenedor, despliegue, madre, infra]
status: vigente
version: 1.0
---

# PROTOCOLO-DESPLIEGUE-CONTENEDOR v1.0

> Checklist para desplegar o actualizar un contenedor Docker en Madre de forma segura.
> Usar siempre que se ejecute `docker compose up` en Madre por primera vez
> o tras un cambio significativo en el compose.

---

## Pre-vuelo

```bash
# 1. Verificar que el puerto objetivo no esta ocupado
sudo ss -tlnp | grep PUERTO_OBJETIVO
docker ps --format "table {{.Names}}\t{{.Ports}}" | grep PUERTO_OBJETIVO

# 2. Verificar espacio en disco — alarma si > 85%
df -h / | tail -1

# 3. Si es imagen nueva: pull antes de bajar el servicio
docker pull IMAGEN:TAG
```

---

## Despliegue

```bash
cd /srv/[proyecto]/[servicio]

# Primera vez
docker compose up -d

# Actualizacion (pull ya hecho en pre-vuelo)
docker compose down
docker compose up -d
```

---

## Verificacion post-despliegue (obligatoria)

```bash
# 1. Contenedor arrancado
docker ps | grep [nombre]

# 2. Logs iniciales — buscar errores fatales
docker logs --tail 40 [nombre]

# 3. Inspeccion de estado
docker inspect [nombre] | grep -E '"Status"|"Health"|"ExitCode"|"Error"'

# 4. Puerto respondiendo (si aplica — ver nota MCP stdio abajo)
curl -s http://localhost:PUERTO/health || echo "sin health endpoint"
```

Criterio de exito:
- `Status: running`
- `ExitCode: 0`
- Sin errores FATAL en logs (advertencias aceptables segun PROTOCOLO-AUDITORIA-MADRE)
- Puerto accesible si el servicio es HTTP

---

## Diagnostico de fallos comunes

| Sintoma | Causa probable | Accion |
|---|---|---|
| `port is already allocated` | Puerto ocupado | `docker ps --format table` para identificar quien lo usa |
| `ExitCode: 1` sin mensaje claro | Error en CMD / entrypoint | `docker logs [nombre]` completo |
| `ExitCode: 128` | Imagen no encontrada o permisos | Verificar imagen y rebuild |
| Arranca y muere inmediatamente | CMD no es proceso foreground | Revisar CMD en Dockerfile |
| `health: starting` > 10 min | Health check falla | `docker inspect` para ver config de healthcheck |
| Logs vacios (Python) | PYTHONUNBUFFERED no seteado | Anadir `PYTHONUNBUFFERED=1` al env |

---

## Caso especial: MCP con transporte stdio

Si el contenedor es un servidor MCP con transporte **stdio** (no HTTP):

- `curl localhost:PUERTO` fallara aunque el contenedor este corriendo correctamente — es normal
- No tiene health endpoint HTTP
- El puerto mapeado en compose puede ser irrelevante si el cliente usa stdin/stdout
- La verificacion real es conectar desde el cliente MCP

```bash
# Verificacion correcta para MCP stdio
docker ps | grep [nombre]     # debe estar Up
docker logs --tail 20 [nombre] # no debe crashear al arrancar
# El test definitivo es conectar desde el cliente MCP
```

---

## Post-despliegue: documentar

```
[ ] Actualizar docs/inventario-madre.md con el contenedor
[ ] Si cambio de puerto: actualizar tabla en PROTOCOLO-AUDITORIA-MADRE
[ ] Commit en el repo del servicio con el compose final
[ ] Anotar en diario DEW del dia
[ ] Cerrar issue asociado si lo habia
```

---

_Creado: 2026-07-17 v1.0 · motivado por despliegue yggdrasil-mcp · Perplexity MCP_
