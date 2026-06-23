---
tags: [ollama, ecosistema, preparacion, docker, madre]
fecha: 2026-06-23
estado: en-progreso
tipo: preparacion
ruta-obsidian: agentes/ollama/2026-06-23-ollama-ecosistema-prep.md
fuente: inbox/2026-06-23-ollama-ecosistema-prep.md
---

# Ecosistema Ollama — Preparación Madre

> Estado de preparación del stack Ollama en Madre. Actualizado 2026-06-23.

## Estado descargas

| Imagen | Estado |
|---|---|
| ollama/ollama:latest | ✅ Descargado (retry x3) |
| open-webui:main | ⏳ Descargando |
| qdrant/qdrant:latest | ⏳ Pendiente |

## Problema de red encontrado

`tls: bad record MAC` — corrupción TLS por WiFi inestable.
Solución: script retry con bucle `until`. Funciona.

## Problema de suspensión resuelto

Madre se suspendía y cortaba todo (Tailscale, Docker, SSH).
Solución aplicada:
```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

## Problema Tailscale

`tailscale.service not found` en Madre — no está instalado.
Pendiente: instalar Tailscale en Madre para acceso remoto desde Acer.
```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

## Próximos pasos cuando esté el stack

- [ ] `docker compose up -d`
- [ ] Pull modelos: qwen2.5:7b, qwen2.5:3b, bge-m3, nomic-embed-text
- [ ] Instalar Tailscale en Madre
- [ ] Test SSH Acer → Madre

## Referencias
- [[setup/2026-06-23-estado-descargas-madre]]
- [[setup/2026-06-23-systemd-plan]]
