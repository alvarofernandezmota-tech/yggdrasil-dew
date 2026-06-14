# Hyprland — Config Dual Monitor

> Configuración de monitores, workspaces y keybinds en Madre.
> **Frecuencia de actualización: al cambiar hardware o reorganizar workspaces.**
> Última actualización: 14 junio 2026

---

## Monitores conectados

| Monitor | Conector | Posición | Workspaces asignados |
|---|---|---|---|
| **LG** | `HDMI-A-1` | Izquierda (principal) | 1 – 5 (`Super+1` a `Super+5`) |
| **Sharp** | `DP-1` | Derecha (secundario) | 6 – 10 (`Super+6` a `Super+0`) |

---

## Config monitores (`hyprland.conf`)

```ini
monitor = HDMI-A-1, preferred, 0x0, 1
monitor = DP-1, preferred, 1920x0, 1
```

---

## Workspaces fijos por monitor

```ini
workspace = 1, monitor:HDMI-A-1
workspace = 2, monitor:HDMI-A-1
workspace = 3, monitor:HDMI-A-1
workspace = 4, monitor:HDMI-A-1
workspace = 5, monitor:HDMI-A-1
workspace = 6, monitor:DP-1
workspace = 7, monitor:DP-1
workspace = 8, monitor:DP-1
workspace = 9, monitor:DP-1
workspace = 10, monitor:DP-1
```

---

## Keybinds workspaces

```ini
# LG (HDMI-A-1) — Super+1 a Super+5
bind = $mainMod, 1, focusmonitor, HDMI-A-1
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, focusmonitor, HDMI-A-1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, focusmonitor, HDMI-A-1
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, focusmonitor, HDMI-A-1
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, focusmonitor, HDMI-A-1
bind = $mainMod, 5, workspace, 5

# Sharp (DP-1) — Super+6 a Super+0
bind = $mainMod, 6, focusmonitor, DP-1
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, focusmonitor, DP-1
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, focusmonitor, DP-1
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, focusmonitor, DP-1
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, focusmonitor, DP-1
bind = $mainMod, 0, workspace, 10
```

---

## Comportamiento dual monitor

- Cada monitor tiene sus propios workspaces — son independientes
- `Super+1` siempre actúa sobre el LG sin importar dónde esté el foco
- `Super+6` siempre actúa sobre el Sharp sin importar dónde esté el foco
- Mover ventana al otro monitor: `Super+Shift+flecha`
- Un workspace compartiendo dos monitores físicamente **no es posible en Hyprland**

---

## Estado

| Item | Estado |
|---|---|
| Config monitores | ⏳ Pendiente aplicar en `~/.config/hypr/hyprland.conf` |
| Workspaces fijos | ⏳ Pendiente aplicar |
| Keybinds 1-0 | ⏳ Pendiente aplicar |

---

_Ver hardware en [`setup/equipos.md`](../equipos.md)_
