# Conexión KVM / Escritorio Remoto — Madre + Acer

> Última actualización: 12 junio 2026
> **Estado: VNC operativo ✅ | Input Leap abandonado ❌**

---

## Solución activa

**wayvnc (servidor) + tigervnc (cliente) sobre Tailscale.**
Ver quick-start completo en: `setup/servidor/vnc.md`

---

## Historial de intentos — Input Leap

### Por qué falló

| # | Problema | Causa |
|---|---|---|
| 1 | `input-leaps` busca `InputCapture` | Portal no disponible en Hyprland |
| 2 | Wrapper GUI genera `/tmp/InputLeap.*` en bucle | Ignora config estática |
| 3 | `input-leapc` se autotermina | `RemoteDesktop` portal no activo |
| 4 | Truco `env -u` | Sin efecto en el servidor |

### Comandos intentados

```bash
# CLI directo — Error InputCapture
QT_QPA_PLATFORM=xcb input-leaps -c ~/.config/input-leap/input-leap.conf --address 0.0.0.0:24800 -f -n madre

# Cliente sin portales — sin efecto
env -u XDG_SESSION_TYPE -u XDG_CURRENT_DESKTOP -u WAYLAND_DISPLAY \
    /usr/bin/input-leapc -f -n acer 100.91.112.32:24800
```

> **Conclusión:** Input Leap moderno no es compatible con Hyprland. Requiere portales D-Bus que Hyprland no implementa todavía.

---

_Solución activa: `setup/servidor/vnc.md`_
