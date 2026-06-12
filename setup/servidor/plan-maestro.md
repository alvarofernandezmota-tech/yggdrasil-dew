# Plan Maestro — Torre Madre + Portátil Acer

> Documento de referencia inviolable. Cualquier IA o sesión nueva debe leer esto primero.
> Última actualización: 12 junio 2026, 19:23 CEST

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

- Sistema limpio: servicio detenido, /tmp purgado, procesos residuales eliminados
- Error confirmado con versión estable: `No such interface org.freedesktop.portal.InputCapture`

---

## Fase 2 — Instalación ✅ COMPLETADA

- `input-leap-git` compilado e instalado desde AUR con `yay -S input-leap-git`
- `input-leap.conf` creado en `~/.config/input-leap/` en Madre
- Servicio `systemd` creado y habilitado en Madre (arranque automático)
- `xdg-desktop-portal-hyprland` configurado en `hyprland.conf` para exponer `InputCapture`
- **Ambos equipos reiniciados** para aplicar cambios limpios

---

## Fase 3 — Verificación remota ⚡ EN CURSO (desde el parque)

**Objetivo:** confirmar que el servidor funciona de forma autónoma vía SSH.

### Pasos desde el parque (MacBook / móvil)

```bash
# 1. Conectar a Madre por SSH
ssh varo@100.91.112.32

# 2. Verificar que el servidor Input Leap está vivo
systemctl --user status input-leap.service

# 3. Comprobar si el portal InputCapture está expuesto tras el reinicio
busctl --user introspect org.freedesktop.portal.Desktop \
  /org/freedesktop/portal/desktop | grep InputCapture
```

### Si el portal NO aparece en busctl

```bash
# Relanzar el portal manualmente desde SSH
WAYLAND_DISPLAY=wayland-1 /usr/lib/xdg-desktop-portal-hyprland &

# Reiniciar el servicio Input Leap
systemctl --user restart input-leap.service

# Ver logs en directo
journalctl --user -u input-leap.service -f
```

### Si el ratón no salta al llegar a casa

```bash
systemctl --user restart input-leap.service
journalctl --user -u input-leap.service -f
```

---

## Fase 4 — Validación física ⏳ Pendiente (al volver del parque)

**Criterio de éxito:**
> El ratón salta limpiamente entre los 2 monitores de Madre y la pantalla de Acer, sin errores en los logs.

---

## Fases siguientes (después de validar KVM)

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
> No saltarse fases.

---

_Ver también: `setup/servidor/README.md` · `diarios/2026/2026-06-12.md`_
