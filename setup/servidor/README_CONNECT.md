# Conexión KVM — Madre + Acer (Wayland/Hyprland)

> Última actualización: 12 junio 2026, 21:16 CEST
> **Estado: Input Leap BLOQUEADO. Evaluando alternativas.**

---

## Diagnóstico definitivo

| Capa | Estado | Notas |
|---|---|---|
| **Red / Tailscale** | ✅ Funcional | `100.91.112.32` estable |
| **Input Leap** | ❌ Bloqueado | Protocolo incompatible con Hyprland |
| **Ratón saltando** | ❌ Sin resultado | Ni GUI ni CLI han funcionado |

### Por qué falla Input Leap en Hyprland

1. **Binario servidor** (`input-leaps`): busca `org.freedesktop.portal.InputCapture` — no disponible en Hyprland
2. **Wrapper GUI** (`input-leap`): ignora la config estática, genera `/tmp/InputLeap.*` volátiles en bucle
3. **Binario cliente** (`input-leapc`): depende de `org.freedesktop.portal.RemoteDesktop` — tampoco disponible
4. **Truco `env -u`**: elimina las variables de sesión Wayland, pero el servidor sigue sin exponer el servicio correctamente

> **Conclusión:** Input Leap en su estado actual no es compatible con Hyprland sin un portal `xdg-desktop-portal-hyprland` que implemente `InputCapture` de forma completa. Eso no existe todavía de forma estable.

---

## Alternativas a evaluar

### Opción A — `lan-mouse` ⭐ RECOMENDADA

```bash
yay -S lan-mouse
```

- Implementación nativa de **libei** — no depende de portales D-Bus
- Diseñada específicamente para Wayland moderno
- Compatible con Hyprland sin configuración extra de portales
- Más liviana que Input Leap

### Opción B — `barrier-git`

```bash
yay -S barrier-git
```

- Fork de Synergy, antecesor de Input Leap
- Más maduro en soporte Wayland que Input Leap en algunos entornos
- Misma arquitectura servidor/cliente

### Opción C — Forzar modo X11 (temporal)

```bash
# En Madre: lanzar servidor en modo XWayland
QT_QPA_PLATFORM=xcb DISPLAY=:0 input-leaps \
  -c ~/.config/input-leap/input-leap.conf \
  --address 0.0.0.0:24800 -f -n madre

# En Acer: cliente sin portales
env -u XDG_SESSION_TYPE -u XDG_CURRENT_DESKTOP -u WAYLAND_DISPLAY \
  DISPLAY=:0 /usr/bin/input-leapc -f -n acer 100.91.112.32:24800
```

> No es la solución limpia pero puede funcionar como puente mientras se consolida `lan-mouse`.

---

## Script rápido para Acer (guardar como `conectar.sh`)

```bash
#!/bin/bash
echo "Lanzando cliente KVM sin portales Wayland..."
env -u XDG_SESSION_TYPE -u XDG_CURRENT_DESKTOP -u WAYLAND_DISPLAY \
    /usr/bin/input-leapc -f -n acer 100.91.112.32:24800
```

```bash
chmod +x conectar.sh
./conectar.sh
```

---

## Historial de intentos

| Intento | Resultado |
|---|---|
| `input-leaps` CLI + `QT_QPA_PLATFORM=xcb` | Error: `InputCapture` no disponible |
| `input-leap` wrapper GUI | Bucle infinito `/tmp/InputLeap.*` |
| GUI servidor + `env -u` cliente | Sin error, sin resultado — ratón no salta |
| GUI servidor + GUI cliente | No aplicable |

---

_Siguiente paso: probar `lan-mouse` (Opción A)_
