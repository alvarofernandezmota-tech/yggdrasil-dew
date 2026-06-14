# Hyprland — Config Dual Monitor

> Configuración de monitores, workspaces y keybinds en Madre.
> **Frecuencia de actualización: al cambiar hardware o reorganizar workspaces.**
> Última actualización: 14 junio 2026

---

## Monitores conectados (datos reales)

| Monitor | Conector | Posición física | Resolución | Scale actual |
|---|---|---|---|---|
| **LG TV** | `DP-1` | Izquierda (principal) | 1440x900@59.89Hz | 2.0 (pendiente bajar a 1.0) |
| **Sharp HDMI** | `HDMI-A-1` | Derecha (secundario) | 1280x720@60Hz | 1.0 |

> ⚠️ El LG tiene `scale=2` en el config actual de Omarchy — esto provoca que el contenido se corte en los bordes. Hay que bajarlo a `1`.

---

## Config monitores objetivo (`~/.config/hypr/monitors.conf`)

```ini
# LG (izquierda) — DP-1
monitor=DP-1,1440x900@59.89,0x0,1
env = GDK_SCALE,1

# Sharp (derecha) — HDMI-A-1
monitor=HDMI-A-1,1280x720@60,1440x0,1
```

> Config actual (Omarchy default): `monitor=DP-1,preferred,0x0,2` + `monitor=,preferred,auto,auto`

---

## Workspaces objetivo (pares/impares por monitor)

```ini
# Impares — LG (DP-1)
workspace = 1, monitor:DP-1
workspace = 3, monitor:DP-1
workspace = 5, monitor:DP-1
workspace = 7, monitor:DP-1
workspace = 9, monitor:DP-1

# Pares — Sharp (HDMI-A-1)
workspace = 2, monitor:HDMI-A-1
workspace = 4, monitor:HDMI-A-1
workspace = 6, monitor:HDMI-A-1
workspace = 8, monitor:HDMI-A-1
workspace = 10, monitor:HDMI-A-1
```

> Config actual en `hyprland.conf`: workspaces 1-5 en DP-1, 6-10 en HDMI-A-1 (pendiente cambiar a pares/impares)

---

## Keybinds workspaces objetivo (`~/.config/hypr/bindings.conf`)

```ini
# Impares — LG (DP-1)
bind = $mainMod, 1, focusmonitor, DP-1
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 3, focusmonitor, DP-1
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 5, focusmonitor, DP-1
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 7, focusmonitor, DP-1
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 9, focusmonitor, DP-1
bind = $mainMod, 9, workspace, 9

# Pares — Sharp (HDMI-A-1)
bind = $mainMod, 2, focusmonitor, HDMI-A-1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 4, focusmonitor, HDMI-A-1
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 6, focusmonitor, HDMI-A-1
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 8, focusmonitor, HDMI-A-1
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 0, focusmonitor, HDMI-A-1
bind = $mainMod, 0, workspace, 10
```

---

## Comportamiento dual monitor

- Cada monitor tiene sus propios workspaces — son independientes
- Impares siempre en LG (DP-1), pares siempre en Sharp (HDMI-A-1)
- Mover ventana al otro monitor: `Super+Shift+flecha`
- Un workspace compartiendo dos monitores físicamente **no es posible en Hyprland**

---

## ⏸️ Estado (pausado 14 jun 2026)

| Item | Estado | Acción pendiente |
|---|---|---|
| Posición monitores | ⏳ Pendiente | Aplicar config monitors.conf objetivo |
| Scale LG | ⏳ Pendiente | Cambiar de 2.0 a 1.0 para corregir bordes cortados |
| Workspaces pares/impares | ⏳ Pendiente | Reemplazar bloques en `hyprland.conf` |
| Keybinds 1-0 | ⏳ Pendiente | Añadir a `bindings.conf` (ver `bindings.conf` actual primero) |
| Bordes Sharp | ⏳ Pendiente | Revisar después de aplicar monitors.conf |

---

_Ver hardware en [`setup/equipos.md`](../equipos.md)_
