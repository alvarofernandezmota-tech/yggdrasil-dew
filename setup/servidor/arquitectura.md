# Arquitectura del ecosistema — Mapa vivo

> Este archivo es la fuente de verdad de la arquitectura completa.
> Se actualiza cada vez que se añade, elimina o cambia un servicio o app.
> Última actualización: 13 junio 2026

---

## Diagrama del ecosistema

```
┌───────────────────────────────────────────────────────┐
│                   INTERNET                         │
└────────────────────────┼───────────────────────────┘
                          │ Tailscale VPN mesh
          ╒══════════════════════════════════════════════╕
          ║              RED TAILSCALE                  ║
          ║   100.91.112.32          100.86.119.102     ║
          ║                                             ║
  ┌───────────────┐     SSH/VNC     ┌─────────────────┐
  │    MADRE         │───────────│     ACER          │
  │  (Servidor)      │            │   (Cliente)       │
  │                  │            │                   │
  │  sshd :22        │←─SSH──────│ VSCode Remote     │
  │  wayvnc :5900    │←─VNC──────│ vncviewer         │
  │  Ollama :11434   │←─API──────│ Open WebUI        │
  │  PostgreSQL :5432│←─DB───────│ DBeaver           │
  │  Pi-hole :53/:80 │            │ whisrs (STT)      │
  │  Uptime Kuma:3001│←─web──────│ btop              │
  │  THDORA (bot)    │→─Telegram──│                   │
  │  UFW + fail2ban  │            │ UFW activo        │
  └───────────────┘            └─────────────────┘
          ║                                             ║
          ╙══════════════════════════════════════════════╖

                        ↑ MacBook (futuro nodo)
```

---

## Inventario completo de archivos

> Actualizar esta tabla cada vez que se cree o elimine un archivo en `setup/servidor/`.

### Protocolos y planificación

| Archivo | Contenido |
|---|---|
| [README.md](README.md) | Índice general por categorías |
| [arquitectura.md](arquitectura.md) | Este archivo — mapa vivo |
| [plan-maestro.md](plan-maestro.md) | Tareas P1/P2/P3 por estado |
| [rescate.md](rescate.md) | Protocolo de recuperación de acceso |
| [herramientas.md](herramientas.md) | Comparativa open source |
| [incidencia-acceso-madre.md](incidencia-acceso-madre.md) | Post-mortem: sin SSH — causa raíz + resolución |

### Acceso y red

| Archivo | App | Host |
|---|---|---|
| [tailscale.md](tailscale.md) | Tailscale | Madre + Acer |
| [ssh.md](ssh.md) | sshd | Madre |
| [vnc.md](vnc.md) | wayvnc / vncviewer | Madre / Acer |
| [lan.md](lan.md) | Red LAN | Router |

### Seguridad

| Archivo | App | Host |
|---|---|---|
| [ufw.md](ufw.md) | UFW firewall | Acer ✅ / Madre 🔴 |
| [fail2ban.md](fail2ban.md) | fail2ban | Madre |

### Servicios

| Archivo | App | Host |
|---|---|---|
| [ollama.md](ollama.md) | Ollama + Open WebUI | Madre |
| [uptime-kuma.md](uptime-kuma.md) | Uptime Kuma | Madre |

### Desarrollo

| Archivo | App | Host |
|---|---|---|
| [vscode.md](vscode.md) | VSCode Remote SSH | Acer → Madre |
| [dbeaver.md](dbeaver.md) | DBeaver | Acer → Madre |
| [github-setup.md](github-setup.md) | Git + SSH GitHub | Madre |
| [colab-aistudio.md](colab-aistudio.md) | Google Colab / AI Studio | Cloud |

### Descartadas

| Archivo | App | Motivo |
|---|---|---|
| [input-leap.md](input-leap.md) | Input Leap | Bloqueo Wayland — 12 jun 2026 |
| [barrier.md](barrier.md) | Barrier | Alternativa descartada |

### Scripts

| Archivo | Qué hace |
|---|---|
| [scripts/README.md](scripts/README.md) | Índice de scripts |
| [scripts/bootstrap-madre.sh](scripts/bootstrap-madre.sh) | Instalación completa Madre (6 fases) |

---

## Regla de mantenimiento

> Cada vez que se crea un archivo nuevo en `setup/servidor/`:
> 1. Añadir fila en la tabla de este archivo
> 2. Añadir fila en `setup/servidor/README.md`
> 3. Entrada en `CHANGELOG.md`
> 4. Si afecta al estado del sistema, actualizar `CONTEXT.md`

---

_Ver también: [plan-maestro.md](plan-maestro.md) · [README.md](README.md)_
_Volver al índice raíz: [README.md](../../README.md)_
