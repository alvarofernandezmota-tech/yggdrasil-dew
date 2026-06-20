---
tags: [madre, servidor, infra, pendiente, seguridad]
fecha: 2026-06-20
destino: setup/madre.md
---

# 🖥️ Madre — Pendientes infraestructura

## Urgente
- [ ] Conectar SSH: `ssh alvaro@100.91.112.32`
- [ ] Verificar bot con `/start` en Telegram
- [ ] Documentar ruta exacta repo thdora en Madre
- [ ] Instalar tmux en Madre: `sudo apt install tmux` o equivalente

## Hardware pendiente de documentar
- [ ] `inxi -F` en Madre → pegar resultado en [[setup/madre]]
- [ ] `df -h` → espacio en disco
- [ ] `free -h` → RAM disponible

## Seguridad (Fase 2 roadmap)
- [ ] UFW: `sudo ufw enable` + reglas básicas
- [ ] fail2ban: instalar y configurar
- [ ] wayvnc autostart

## Servicios por instalar (Fase 3)
- [ ] Open WebUI (RAG sobre yggdrasil-dew)
- [ ] Uptime Kuma (monitoreo)
- [ ] Pi-hole (DNS)
- [ ] n8n (automatización / diario nocturno)
- [ ] PostgreSQL

_→ mover a [[setup/madre]] cuando se ejecute_
