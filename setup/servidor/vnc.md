# VNC sobre LAN — Madre → Acer

> Solución activa de escritorio remoto tras abandonar Input Leap.
> Última actualización: 12 junio 2026

---

## Arquitectura real

| Rol | Máquina | Software | Transporte |
|---|---|---|---|
| **Servidor** | Madre | `wayvnc` (nativo Wayland) | LAN local (router) |
| **Cliente** | Acer | `tigervnc` | LAN local (router) |

> ⚠️ **IMPORTANTE:** La conexión VNC funciona a través de la **red local (LAN/router)**, NO sobre Tailscale.
> Tailscale está activo en ambos equipos pero **no es el transporte** de esta conexión.
> Usar IP LAN de Madre para conectar (ver `lan.md` para la IP actual).

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
# Conectar por IP LAN de Madre (no por Tailscale)
vncviewer -shared <IP_LAN_MADRE>:5900
```

> Obtener IP LAN de Madre: `ip a` o ver en router.
> Pendiente: fijar IP LAN de Madre por MAC en el router para que no cambie.

---

## Victoria vs Fallo del día

| | Resultado | Detalle |
|---|---|---|
| 🏆 **Victoria** | VNC funciona | `wayvnc` + `tigervnc` sobre LAN operativo |
| ❌ **Fallo documentado** | Tailscale NO es el transporte | Asumimos que iba por Tailscale, pero va por LAN |
| ⚠️ **Pendiente** | VNC fuera de casa | Para acceso externo hay que tunelizar VNC sobre Tailscale |

---

## Por qué VNC en vez de Input Leap

| Criterio | Input Leap | wayvnc |
|---|---|---|
| Compatibilidad Hyprland | ❌ Bloqueos D-Bus | ✅ Nativo Wayland |
| Portales requeridos | `InputCapture` / `RemoteDesktop` | Ninguno |
| Uso | Compartir periféricos | Escritorio completo |
| Red | N/A (no funcionó) | LAN local ✅ |

---

## Lessons Learned

- **wayvnc** — nativo Wayland, sin dependencias de portal D-Bus
- **`--format=hevc`** — reduce latencia
- **`--cursor-face=hidden`** — evita cursor duplicado en el cliente
- **El transporte es LAN**, no Tailscale — no funcionará desde fuera de casa sin tunelizar

---

## Siguiente paso — VNC desde fuera de casa

Para usar VNC remotamente (fuera de la LAN):

```bash
# Opción: tunel SSH sobre Tailscale
ssh -L 5900:localhost:5900 varo@100.91.112.32
# Luego conectar a localhost:5900 desde Acer
```

---

## Automatización (opcional)

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

> Pendiente: probar estabilidad antes de habilitar arranque automático.

---

_Historial Input Leap: `setup/servidor/README_CONNECT.md`_
