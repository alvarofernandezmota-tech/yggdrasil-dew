---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-ACTUALIZACION-MADRE.md
tags: [protocolo, actualizacion, madre, docker, infra, ssh]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-MADRE v1.0

> Ejecutar cuando se modifica la infra de Madre: nuevo contenedor, cambio de compose,
> actualizacion de imagen, cambio de puertos o cualquier alteracion del ecosistema Docker.
> Siempre ejecutar PROTOCOLO-APERTURA-MADRE primero.

---

## Paso 0: Clasificar el cambio

| Tipo de cambio | Protocolo a seguir |
|---|---|
| Nuevo contenedor / agente | PROTOCOLO-NUEVO-AGENTE + PROTOCOLO-DESPLIEGUE-CONTENEDOR |
| Actualizar imagen existente | Este protocolo — Fase 1 |
| Cambiar variables de entorno | Este protocolo — Fase 2 |
| Cambiar puertos | Este protocolo — Fase 3 |
| Eliminar contenedor | PROTOCOLO-BORRADO |

---

## Fase 1: Actualizar imagen de contenedor existente

```bash
# Localizar el compose del servicio
find /srv -name "docker-compose*" 2>/dev/null | xargs grep -l "nombre-servicio"

# Pull, down y up
cd /ruta/al/compose
docker compose pull
docker compose down
docker compose up -d

# Verificar
docker ps | grep nombre-servicio
docker logs --tail 20 nombre-servicio
```

---

## Fase 2: Cambiar variables de entorno

```bash
# Editar .env o el compose
nano /ruta/al/compose/.env

# Reiniciar solo el contenedor afectado
docker compose down nombre-servicio && docker compose up -d nombre-servicio

# Verificar que la variable esta activa
docker inspect nombre-servicio | grep -A5 '"Env"'
```

---

## Fase 3: Cambiar puertos

```bash
# 1. Verificar que el puerto destino esta libre
sudo ss -tlnp | grep PUERTO

# 2. Editar compose
nano /ruta/al/docker-compose.yml
# Cambiar: "VIEJO:CONTENEDOR" → "NUEVO:CONTENEDOR"

# 3. Reiniciar
docker compose down nombre-servicio && docker compose up -d nombre-servicio
```

> Regla obligatoria: despues de cualquier cambio de puerto actualizar
> la tabla "Mapa de puertos criticos" en PROTOCOLO-AUDITORIA-MADRE.md.

---

## Paso final: Documentar

```
[ ] Commit en el repo del servicio con descripcion del cambio
[ ] Si cambio de puertos: actualizar tabla en PROTOCOLO-AUDITORIA-MADRE
[ ] Actualizar docs/inventario-madre.md si cambia la lista de contenedores
[ ] Cerrar issue asociado si lo habia
[ ] Anotar en diario DEW del dia
```

---

_Creado: 2026-07-17 v1.0 · Perplexity MCP_
