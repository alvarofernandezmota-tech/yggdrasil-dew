---
tags: [setup, systemd, servidor, madre, servicios]
fecha: 2026-06-23
estado: pendiente-ejecutar
ruta-obsidian: setup/2026-06-23-systemd-plan.md
fuente: inbox/2026-06-23-systemd-plan.md
---

# Plan systemd — Madre

> Objetivo: todos los servicios críticos arrancan solos con el sistema.

## Servicios a habilitar

```bash
# Docker — ya debería estar habilitado
sudo systemctl enable --now docker

# Tailscale
sudo systemctl enable --now tailscale

# SSH
sudo systemctl enable --now sshd

# Deshabilitar suspensión
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

## Verificación

```bash
systemctl is-enabled docker tailscale sshd
systemctl status docker tailscale sshd
```

## Servicios Docker — arranque automático

```bash
# Configurar docker compose para arrancar con el sistema
docker compose up -d

# Verificar restart policy en docker-compose.yml
# Cada servicio debe tener: restart: unless-stopped
```

## Referencias
- [[setup/servidor/docker-stack]]
- [[setup/servidor/red]]
