---
tags: [adr, arquitectura, ssh, github, seguridad]
fecha: 2026-06-25
estado: aceptado
---

# ADR-003: Clave SSH GitHub sin Passphrase en Madre

## Contexto

La clave `id_ed25519_github` tenía passphrase. Esto bloqueaba scripts automatizados (`bc push`, cron jobs, n8n workflows con GitHub API) que necesitan autenticar sin intervención humana.

## Opciones consideradas

| Opción | Seguridad | Automatización |
|--------|-----------|----------------|
| **Sin passphrase + permisos 600** | Media | Total |
| Con passphrase + ssh-agent | Alta | Parcial (se pierde en reboot) |
| GitHub PAT en variable de entorno | Media | Total |
| GitHub App | Alta | Total (complejo) |

## Decisión

Eliminar passphrase de `id_ed25519_github`. Mitigación: permisos `600`, disco cifrado en Madre, acceso físico restringido.

## Justificación

- Madre es un servidor en red local (no expuesto directamente a internet)
- Acceso remoto solo vía Tailscale (red privada cifrada)
- Automatización de `bc push` y futuros cron jobs requiere clave sin passphrase
- Riesgo asumible dado el modelo de amenaza del homelab

## Consecuencias

- Si alguien accede físicamente a Madre, tiene acceso al repo GitHub
- Mitigado con: Tailscale, sin puerto SSH expuesto a internet, disco cifrado
- La clave `id_madre_github` (nueva, generada el mismo día) queda como backup

---
_Decidido por: alvarofernandezmota-tech | Fecha: 2026-06-25_
