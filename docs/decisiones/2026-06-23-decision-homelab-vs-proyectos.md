---
tags: [decision, homelab, batcueva, proyectos, arquitectura]
fecha: 2026-06-23
estado: decision-tomada
tipo: decision
ruta-obsidian: docs/decisiones/2026-06-23-decision-homelab-vs-proyectos.md
fuente: inbox/2026-06-23-decision-homelab-vs-proyectos.md
---

# Decisión — Homelab vs Proyectos

> Sesión 2026-06-23

## Pregunta

¿Batcueva es un proyecto o es infraestructura?

## Decisión: Batcueva = homelab = setup/

### Batcueva va en `setup/`, NO en `proyectos/`

Motivo: Batcueva es la infraestructura sobre la que corren los proyectos.
No es un proyecto en sí mismo — es el entorno.

```
setup/servidor/     ← Batcueva, Madre, Docker, red
proyectos/          ← cosas que SE construyen SOBRE Batcueva
```

### Proyectos = cosas que construyes

Un proyecto tiene:
- Objetivo concreto (resolver un problema)
- Código propio
- Repo GitHub separado
- Fecha de inicio y (posible) fin

### Homelab = infraestructura

Batcueva tiene:
- Servidores y equipos
- Servicios corriendo (Docker, systemd)
- Red (Tailscale, IPs)
- Nunca "termina" — evoluciona

## Consecuencias

- `proyectos/batcueva/` → mover a `setup/servidor/`
- `proyectos/` solo tendrá proyectos reales con repo propio

## Referencias
- [[setup/servidor/README]]
- [[docs/decisiones/2026-06-23-decision-arquitectura-proyectos]]
