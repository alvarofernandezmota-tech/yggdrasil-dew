---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16 16:24 CEST
ruta: protocolo/PROTOCOLO-AUDITORIA-MADRE.md
tags: [protocolo, auditoria, madre, docker, infra, ssh]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-MADRE v1.0

> Ejecutar periodicamente (semanal en RITUAL-SEMANAL, o ante sospecha de problemas).
> Tiempo estimado: 5-10 min con terminal abierta en Madre.
> Acceso: `ssh varopc@100.91.112.32`

---

## Fase 1: Bloque de auditoria rapida

Copiar y ejecutar en un solo bloque:

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
| `Bind for X.X.X.X:PUERTO failed: port is already allocated` | Conflicto de puerto | `docker ps --format "table {{.Names}}\t{{.Ports}}" \| grep PUERTO` |
| `CORS_ALLOW_ORIGIN IS SET TO '*'` | Open-WebUI advertencia | Aceptable en red privada |
| `UNEXPECTED: embeddings.position_ids` | Modelo embedding cargado desde arch diferente | Ignorar si funciona |
| `health: starting` tras reinicio | Normal hasta 5-10 min | Esperar y volver a verificar |
| `ExitCode: 128` | Container no arranco | Ver campo `Error` en docker inspect |

---

## Fase 4: Localizar compose de un servicio

```bash
# Buscar todos los composes disponibles
find /home/varopc -name "docker-compose*" 2>/dev/null | grep -v nvim

# Ver cual compose gestiona un contenedor (buscar por nombre de servicio)
grep -rl "nombre-servicio" /home/varopc --include="docker-compose*" 2>/dev/null
```

---

## Fase 5: Mapa de puertos criticos — referencia rapida

| Puerto | Servicio | Contenedor | Notas |
|---|---|---|---|
| 22 | SSH Madre | sshd (host) | Acceso principal |
| 2222 | Gitea SSH | gitea | |
| 3000 | Grafana | grafana | Ocupado - yggdrasil-mcp usa 3001 (pendiente fix) |
| 3003 | Gitea Web | gitea | |
| 8080 | Open-WebUI | open-webui | Verificar |
| 6333 | Qdrant API | qdrant | Verificar |
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

| Issue | Problema | Fix |
|---|---|---|
| [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) | yggdrasil-mcp: puerto 3000 ocupado por grafana | Cambiar a 3001 en su compose |
| [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) | qdrant telemetria | QDRANT__TELEMETRY_DISABLED=true |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | HDD /dev/sda ~28.000h | SMART PASSED 2026-07-16, monitorizar |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP | En router Digi, no en Madre |

---

_Creado: 2026-07-16 v1.0 · basado en auditoria SSH real sesion 2026-07-16 · Perplexity MCP_
