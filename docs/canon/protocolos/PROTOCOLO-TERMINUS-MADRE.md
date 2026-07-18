---
tipo: protocolo
status: activo
actualizado: 2026-07-18
nivel: 3
version: "1.0"
tags: [terminus, madre, infra, ssh, tailscale]
---

# PROTOCOLO-TERMINUS-MADRE

> **Versión:** 1.0 · **Creado:** 2026-07-18 · **Autor:** Perplexity-MCP  
> **Nivel:** 3 — Protocolo de infraestructura  
> **Referenciado desde:** `PROTOCOLO-AUDITORIA-COMPLETA.md` — FASE 4

---

## Propósito

Este protocolo define cómo conectar Terminus (cliente) a Madre (servidor homelab) de forma segura para ejecutar tareas de administración, auditoría de servicios Docker, y operaciones de infraestructura. Es el punto de entrada canónico para cualquier operación sobre producción.

---

## Regla de oro

> **Madre es producción. Nunca se actúa sobre Madre sin un runbook documentado.**  
> Cada comando ejecutado en Madre debe estar precedido por una verificación del estado.

---

## Requisitos previos

```
☐ Tailscale activo en Terminus
☐ Tailscale activo en Madre
☐ SSH habilitado en Madre (puerto canónico documentado en OWNERSHIP-MATRIX.md)
☐ Clave SSH de Terminus autorizada en Madre (~/.ssh/authorized_keys)
☐ Usuario de Madre conocido (ver OWNERSHIP-MATRIX.md — sección accesos)
```

---

## PASO 1 — Verificar Tailscale en Terminus

```bash
# Verificar que Tailscale está corriendo
tailscale status

# Debe mostrar Madre en la lista de peers
# Ejemplo: madre    100.x.x.x    linux   -
```

Si Madre no aparece:
- Verificar que Tailscale está activo en Madre
- Comprobar que ambos dispositivos están en la misma tailnet
- Si hay problema: `tailscale up --reset`

---

## PASO 2 — Conectar por SSH

```bash
# Conexión estándar via Tailscale IP
ssh <usuario>@<tailscale-ip-madre>

# Alternativa con alias (si está configurado en ~/.ssh/config)
ssh madre

# Configuración recomendada en ~/.ssh/config de Terminus:
# Host madre
#   HostName 100.x.x.x       ← IP Tailscale de Madre
#   User <usuario>
#   IdentityFile ~/.ssh/id_ed25519
#   ServerAliveInterval 60
```

---

## PASO 3 — Verificación de estado al conectar

Al conectar, ejecutar siempre estos comandos de verificación antes de hacer nada:

```bash
# 1. Estado de contenedores Docker
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'

# 2. Contenedores con problemas
docker ps -a --filter 'status=exited' --filter 'status=restarting'

# 3. Uso de disco
df -h /

# 4. Carga del sistema
uptime && free -h

# 5. Logs recientes de servicios críticos (últimas 20 líneas)
docker logs --tail 20 <nombre-servicio-critico>
```

---

## PASO 4 — Operaciones permitidas desde Terminus

### ✅ Operaciones seguras (no requieren confirmación adicional)
```bash
docker ps                          # ver estado
docker logs <servicio>             # ver logs
docker stats --no-stream           # métricas de recursos
tailscale status                   # estado red
cat /proc/meminfo                  # memoria
```

### ⚠️ Operaciones que requieren runbook previo
```bash
docker restart <servicio>          # reiniciar servicio
docker compose up -d               # levantar stack
docker compose down                # bajar stack
systemctl restart <servicio>       # reiniciar servicio del sistema
```

### 🔴 Operaciones que requieren confirmación explícita del usuario
```bash
docker rm / docker rmi             # eliminar contenedor/imagen
docker compose down --volumes      # DESTRUYE datos de volúmenes
rm -rf                             # NUNCA sin verificación triple
reboot / shutdown                  # reinicio del servidor
```

---

## PASO 5 — Auditoría FASE 4 desde Terminus

Cuando se ejecuta `PROTOCOLO-AUDITORIA-COMPLETA` FASE 4:

```bash
# Script de auditoría rápida (ejecutar en Madre)
echo "=== ESTADO DOCKER ==="
docker ps --format 'table {{.Names}}\t{{.Status}}'

echo "=== CONTENEDORES CAÍDOS ==="
docker ps -a --filter 'status=exited' --format '{{.Names}} — {{.Status}}'

echo "=== PUERTOS EXPUESTOS ==="
ss -tlnp | grep LISTEN

echo "=== DISCO ==="
df -h /

echo "=== TAILSCALE ==="
tailscale status --peers=false
```

Copiar el output y registrarlo en `ESTADO-SISTEMA.md` → sección `## Infra Madre`.

---

## PASO 6 — Desconexión segura

```bash
# Antes de salir: verificar que no dejaste nada a medias
docker ps -a --filter 'status=restarting'   # nada en crash loop

# Salir
exit
```

Registrar en `ESTADO-SISTEMA.md` la hora de desconexión y el estado observado.

---

## Troubleshooting rápido

| Problema | Causa probable | Solución |
|---|---|---|
| SSH timeout | Tailscale caído en Madre | Reiniciar Tailscale en Madre vía panel web |
| `Connection refused` | SSH no activo | Acceso físico o panel de Madre |
| Docker no responde | Daemon caído | `sudo systemctl restart docker` |
| Disco lleno | Logs o imágenes | `docker system prune -f` |
| Contenedor en loop | Error de config | `docker logs <servicio> --tail 50` |

---

## Relacionado

- `PROTOCOLO-AUDITORIA-COMPLETA.md` — FASE 4 usa este protocolo
- `PROTOCOLO-REVISION-SALUD.md` — checklist de salud de servicios
- `docs/canon/OWNERSHIP-MATRIX.md` — IPs, puertos y usuarios canónicos
- `madre-config` repo — docker-compose de todos los servicios
- ADR-008 — decisión de arquitectura homelab
