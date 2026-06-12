# VNC sobre Tailscale — Madre → Acer

> Solución activa de escritorio remoto tras abandonar Input Leap.
> Última actualización: 12 junio 2026

---

## Arquitectura

| Rol | Máquina | Software | IP Tailscale |
|---|---|---|---|
| **Servidor** | Madre | `wayvnc` (nativo Wayland) | `100.91.112.32` |
| **Cliente** | Acer | `tigervnc` | `100.86.119.102` |

> Transporte: Tailscale ✅ — cifrado extremo a extremo, sin abrir puertos.

---

## Quick-Start

### En Madre (servidor)

```bash
# Matar instancias previas
killall wayvnc

# Lanzar servidor nativo Wayland
wayvnc --address=0.0.0.0 --port=5900 --cursor-face=hidden --format=hevc
```

### En Acer (cliente)

```bash
vncviewer -shared 100.91.112.32:5900
```

---

## Por qué VNC en vez de Input Leap

| Criterio | Input Leap | wayvnc |
|---|---|---|
| Compatibilidad Hyprland | ❌ Bloqueos D-Bus | ✅ Nativo Wayland |
| Portales requeridos | `InputCapture` / `RemoteDesktop` | Ninguno |
| Uso | Compartir perificos | Escritorio completo |
| Latencia con Tailscale | N/A (no funcionó) | Baja con `--format=hevc` |

---

## Lessons Learned

- **Wayland/Hyprland** — los protocolos tipo input-leap fallan por la seguridad estricta de los `RemoteDesktop Portals`
- **`--format=hevc`** — reduce drásticamente la latencia sobre Tailscale
- **`--cursor-face=hidden`** — evita el cursor duplicado/transparente en el cliente
- **`-shared`** en vncviewer — permite múltiples conexiones simultáneas

---

## Automatización (opcional — Fase siguiente)

Si se quiere arranque automático en Madre:

```ini
# ~/.config/systemd/user/wayvnc.service
[Unit]
Description=wayvnc server
After=graphical-session.target

[Service]
ExecStart=/usr/bin/wayvnc --address=0.0.0.0 --port=5900 --cursor-face=hidden --format=hevc
Restart=on-failure

[Install]
WantedBy=default.target
```

```bash
systemctl --user enable --now wayvnc.service
```

> Pendiente: probar estabilidad antes de habilitar el arranque automático.

---

_Ver historial completo: `setup/servidor/README_CONNECT.md`_
