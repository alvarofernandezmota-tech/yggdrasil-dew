# VNC — Escritorio remoto Madre → Acer

> Última actualización: 12 junio 2026
> **Estado: OPERATIVO en LAN ✅ | Acceso externo (Tailscale) ⏳ pendiente**

---

## ⚠️ Corrección importante

Gemini documentó esto indicando que el transporte es Tailscale. **Eso es incorrecto.**

| Afirmación de Gemini | Realidad confirmada |
|---|---|
| “Tailscale proporciona conectividad” | Tailscale está activo pero **no es el transporte VNC** |
| “Acceso desde cualquier red” | **Falso** — solo funciona en LAN local |
| `vncviewer 100.91.112.32:5900` | Esa es la IP Tailscale — **usar IP LAN de Madre** |

> La IP `100.91.112.32` es la IP de Tailscale. VNC conecta por la IP LAN del router.
> Para saber la IP LAN de Madre: `ip a` en Madre.

---

## Arquitectura real

| Capa | Tecnología | Estado |
|---|---|---|
| **Red local (LAN)** | Router doméstico | ✅ Transporte VNC activo |
| **VPN mesh** | Tailscale | ✅ Activo, pero NO usado para VNC todavía |
| **Servidor VNC** | `wayvnc` (Wayland nativo) | ✅ Operativo |
| **Cliente VNC** | `tigervnc` / `vncviewer` | ✅ Operativo |
| **VNC desde exterior** | SSH tunnel + Tailscale | ⏳ Pendiente |

---

## Quick-Start (en casa, misma LAN)

```bash
# MADRE — lanzar servidor
killall wayvnc; wayvnc --address=0.0.0.0 --port=5900 --cursor-face=hidden --format=hevc

# ACER — conectar (usar IP LAN de Madre, no Tailscale)
vncviewer -shared <IP_LAN_MADRE>:5900
# Ej: vncviewer -shared 192.168.1.XX:5900
```

---

## Acceso externo (pendiente — próxima sesión)

Para VNC desde fuera de casa hay que tunelizar sobre Tailscale:

```bash
# Abrir túmel SSH desde Acer
ssh -L 5900:localhost:5900 varo@100.91.112.32

# Luego conectar a localhost
vncviewer localhost:5900
```

Esto sí pasaría por Tailscale de forma cifrada.

---

## Por qué VNC en vez de Input Leap

| Criterio | Input Leap | wayvnc |
|---|---|---|
| Compatibilidad Hyprland | ❌ Bloqueos D-Bus | ✅ Nativo Wayland |
| Portales requeridos | `InputCapture` / `RemoteDesktop` | Ninguno |
| Uso | Compartir periféricos | Escritorio completo |

---

_Historial Input Leap: `README_CONNECT.md` · Red: `lan.md`_
