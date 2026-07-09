---
tipo: hallazgo
id: HAL-006
author: Alvaro Fernandez Mota
creado: 2026-07-05
actualizado: 2026-07-06
ruta: docs/hallazgos/HAL-006-ssh-expuesto-internet.md
tags: [hallazgo, seguridad, ssh, madre, red, tailscale]
severidad: alta
status: PENDIENTE
---

# 🟡 HAL-006 — SSH puerto 22 abierto a internet en Madre

## Descripción

El puerto 22 (SSH) de Madre está accesible desde internet público. Todos los demás servicios del ecosistema son exclusivamente accesibles vía Tailscale (ADR-002 capa 1), pero SSH es la excepción no intencional.

Esto crea una superficie de ataque innecesaria: cualquier escaner de internet puede detectar el puerto abierto y realizar ataques de fuerza bruta o explotar vulnerabilidades en el demonio SSH.

## Evidencia

Detectado durante auditoría del 2026-07-05. `nmap` externo confirma puerto 22 abierto. UFW tiene `deny incoming` por defecto pero SSH tiene regla de excepción.

## Impacto

- Superficie de ataque activa en el servidor principal del ecosistema
- Los logs de Madre probablemente tienen miles de intentos de login fallidos por día (bots de internet)
- Si hay una vulnerabilidad 0-day en openssh, Madre queda expuesta antes de que se parchee
- Contradice el principio de diseño del ecosistema: **acceso solo por Tailscale** (ADR-001)

## Plan de remediación

### Opción A — Mover SSH a Tailscale (recomendada)
```bash
# 1. Verificar que SSH vía Tailscale ya funciona
ssh varo@100.91.112.32  # desde Acer o iPhone con Tailscale activo

# 2. Si funciona, cerrar el puerto 22 en UFW
sudo ufw delete allow 22
sudo ufw delete allow ssh
sudo ufw reload
sudo ufw status

# 3. Verificar que el acceso por Tailscale sigue funcionando
ssh varo@100.91.112.32
```

### Opción B — Cambiar puerto + fail2ban (solución parcial)
```bash
# Cambiar SSH a puerto no estándar (ej. 2222)
# Más complejo de mantener y no elimina el riesgo completamente
# NO recomendada si Tailscale funciona
```

**Recomendación: Opción A.** Si Tailscale ya da acceso SSH desde iPhone y Acer, el puerto 22 público no aporta nada y sí añade riesgo.

## Verificación post-remediación

```bash
# Desde internet (no desde Tailscale)
curl -v telnet://IP_PUBLICA_MADRE:22  # debe dar Connection refused

# Desde Tailscale
ssh varo@100.91.112.32  # debe seguir funcionando
```

## Referencias

- ADR de seguridad: [ADR-002](../canon/ADR-002-seguridad-ecosistema.md)
- Mapa de red: [wiki/islas/infra.md](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/infra.md)
- Índice de hallazgos: [INDICE-HALLAZGOS.md](./INDICE-HALLAZGOS.md)

---
_Creado: 2026-07-05 · Documentado: 2026-07-06 · Perplexity-MCP_
