# Plan Maestro — Torre Madre + Portátil Acer

> Documento de referencia inviolable. Cualquier IA o sesión nueva debe leer esto primero.
> Última actualización: 12 junio 2026, 20:31 CEST

---

## Entorno base

| Dato | Valor |
|---|---|
| OS / WM | Arch Linux / Hyprland (Wayland) — ambos equipos |
| Protocolo input sharing | `input-leap-git` ✅ instalado desde AUR |
| VPN mesh | Tailscale (`100.91.112.32` Madre, `100.86.119.102` Acer) |
| Pantallas Madre | 2 monitores externos |
| Pantalla Acer | 1 pantalla integrada |
| Gestor AUR | `yay` ✅ `/usr/bin/yay` |

---

## Fase 1 — Limpieza ✅ COMPLETADA

- Sistema limpio: servicio detenido, `/tmp` purgado, procesos residuales eliminados
- Error documentado con versión estable: `No such interface org.freedesktop.portal.InputCapture`

---

## Fase 2 — Instalación y configuración ✅ COMPLETADA

- `input-leap-git` compilado e instalado desde AUR (`yay -S input-leap-git`)
- `~/.config/input-leap/input-leap.conf` creado en Madre — topología: madre izquierda, acer derecha
- `~/.config/systemd/user/input-leap.service` creado y habilitado en Madre
- `~/.config/hypr/hyprland.conf` modificado: `exec-once = /usr/lib/xdg-desktop-portal-hyprland`
- Ambos equipos reiniciados limpio

---

## Fase 3 — Verificación remota ⚡ EN CURSO

**Objetivo:** confirmar servicio activo y portal expuesto vía SSH.

```bash
# Desde exterior (parque / móvil)
ssh varo@100.91.112.32
systemctl --user status input-leap.service
busctl --user introspect org.freedesktop.portal.Desktop \
  /org/freedesktop/portal/desktop | grep InputCapture
```

### Si el portal NO aparece en busctl

```bash
WAYLAND_DISPLAY=wayland-1 /usr/lib/xdg-desktop-portal-hyprland &
systemctl --user restart input-leap.service
journalctl --user -u input-leap.service -f
```

### Si hay error InvalidArgs en D-Bus

```bash
# Diagnosticar con hyprctl
hyprctl dispatch -- inputcapture
busctl --user call org.freedesktop.portal.Desktop \
  /org/freedesktop/portal/desktop \
  org.freedesktop.portal.InputCapture CreateSession '{}'
```

---

## Fase 4 — Validación física ⏳ Pendiente (al volver)

**Criterio de éxito:**
> El ratón salta limpiamente entre los 2 monitores de Madre y la pantalla de Acer, sin errores en los logs.

---

## Fases siguientes

### Fase 5 — SSH seguro
- [ ] Claves Ed25519 Madre ↔ Acer
- [ ] Deshabilitar auth por password en sshd
- [ ] Test acceso remoto desde fuera de LAN

### Fase 6 — Servicios (Dockerización)
- [ ] Auditoría Docker preexistente en Acer
- [ ] PostgreSQL dockerizado en Acer
- [ ] THDORA migrado a Acer
- [ ] Ollama + Open WebUI en Madre (GTX 1060)
- [ ] Pi-hole en Acer

### Fase 7 — Sincronización
- [ ] dotfiles / omarchy Madre ↔ Acer
- [ ] Headscale self-hosted
- [ ] MacBook como tercer nodo Input Leap

---

## Regla de oro

> **No improvisar.** Si algo falla → documentar el error exacto y no saltar pasos.

---

_Ver también: `setup/servidor/README.md` · `diarios/2026/2026-06-12.md`_
