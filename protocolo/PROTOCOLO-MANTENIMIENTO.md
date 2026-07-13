---
tipo: protocolo
author: Alvaro Fernandez Mota
movido: 2026-07-13
ruta: protocolo/PROTOCOLO-MANTENIMIENTO.md
tags: [protocolo, mantenimiento, infra]
status: vigente
---

# Protocolo de Mantenimiento

> Migrado desde yggdrasil-tracking/sistema/ — 2026-07-13

## Mantenimiento semanal (Madre)

1. `docker ps` — verificar que todos los servicios están `healthy`
2. `df -h` — espacio en disco
3. `smartctl -a /dev/sda` — salud del disco (#31)
4. Revisar logs watchdog
5. Actualizar ESTADO-SISTEMA.md si algo cambió

## Mantenimiento mensual

1. Actualizar imágenes Docker (`docker pull`)
2. Rotar secrets si toca (#45)
3. Revisar puertos expuestos (#15)
4. Backup de volúmenes críticos

---
_Actualizado: 2026-07-13 · Perplexity MCP_
