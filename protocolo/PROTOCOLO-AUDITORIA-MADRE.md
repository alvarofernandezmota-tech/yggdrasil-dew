---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-AUDITORIA-MADRE.md
tags: [protocolo, auditoria, madre, docker, infra, ssh]
status: vigente
version: 1.1
---

# PROTOCOLO-AUDITORIA-MADRE v1.1

> Ejecutar periodicamente (semanal en RITUAL-SEMANAL, o ante sospecha de problemas).
> Tiempo estimado: 5-10 min con terminal abierta en Madre.
> Acceso: `ssh varopc@100.91.112.32`

---

## Fase 1: Bloque de auditoria rapida

```bash
echo "=== HOSTNAME ==="
hostname && uname -r

echo "=== RAM ==="
free -h

echo "=== DISCO ==="
df -h / && sudo smartctl -H /dev/sda | grep -E "overall|PASSED|FAILED"

echo "=== CONTENEDORES ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"

echo "=== PUERTOS ACTIVOS ==="
sudo ss -tlnp | grep -E "LISTEN"

echo "=== PUERTOS DOCKER ==="
docker ps --format "table {{.Names}}\t{{.Ports}}" | grep -v "^NAMES"
```

---

## Fase 2: Verificar contenedores con problemas

```bash
# Ver unhealthy / exited / error
docker ps -a --format "table {{.Names}}\t{{.Status}}" | grep -vE "Up.*healthy|Up.*minute|Up.*hour|Up.*day|Up.*week"

# Logs del contenedor con problema (sustituir NOMBRE)
docker logs --tail 30 NOMBRE
docker inspect NOMBRE | grep -E '"Status"|"Error"|"ExitCode"'
```

---

## Fase 3: Diagnostico de logs — patrones conocidos

| Patron en logs | Diagnostico | Accion |
|---|---|---|
| `telemetry_reporting: Failed` | Qdrant falso positivo | Ignorar o QDRANT__TELEMETRY_DISABLED=true |
| `Bind for X.X.X.X:PUERTO failed` | Conflicto de puerto | `docker ps --format table` para identificar quien lo usa |
| `CORS_ALLOW_ORIGIN IS SET TO '*'` | Open-WebUI advertencia | Aceptable en red privada |
| `UNEXPECTED: embeddings.position_ids` | Modelo cargado desde arch diferente | Ignorar si funciona |
| `health: starting` tras reinicio | Normal hasta 5-10 min | Esperar y volver a verificar |
| `ExitCode: 128` | Container no arranco | Ver campo `Error` en docker inspect |
| Logs vacios (Python) | PYTHONUNBUFFERED no seteado | Anadir `PYTHONUNBUFFERED=1` al env |

---

## Fase 4: Localizar compose de un servicio

```bash
# Buscar todos los composes disponibles
find /srv /home/varopc -name "docker-compose*" 2>/dev/null | grep -v nvim

# Ver cual compose gestiona un contenedor
grep -rl "nombre-servicio" /srv /home/varopc --include="docker-compose*" 2>/dev/null
```

---

## Fase 5: Mapa de puertos criticos

| Puerto | Servicio | Contenedor | Notas |
|---|---|---|---|
| 22 | SSH Madre | sshd (host) | Acceso principal |
| 2222 | Gitea SSH | gitea | |
| 3000 | Grafana | grafana | |
| 3001 | yggdrasil-mcp | yggdrasil-mcp | MCP server — stdio, no HTTP |
| 3003 | Gitea Web | gitea | |
| 6333 | Qdrant API | qdrant | |
| 8080 | Open-WebUI | open-webui | |
| 11434 | Ollama API | ollama | |

> Actualizar esta tabla cuando cambien asignaciones de puertos.

---

## Fase 6: Documentar hallazgos

```
[ ] Actualizar docs/islas/ESTADO-ISLA-INFRA.md con fecha y estado
[ ] Actualizar docs/inventario-madre.md si hay cambios en contenedores
[ ] Crear issue en yggdrasil-dew si se descubre problema nuevo
[ ] Anotar en diario DEW del dia si es sesion de trabajo
```

---

## Issues conocidos — referencia rapida

| Issue | Problema | Estado |
|---|---|---|
| [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) | yggdrasil-mcp: conflicto puerto 3000 con grafana | Resuelto — puerto 3001 |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant telemetria | Pendiente: QDRANT__TELEMETRY_DISABLED=true |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD /dev/sda ~28.000h | SMART PASSED 2026-07-16, monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP | En router Digi, no en Madre |

---

_Actualizado: 2026-07-17 v1.1 · fix puerto mcp 3001 confirmado + patrón PYTHONUNBUFFERED · Perplexity MCP_
