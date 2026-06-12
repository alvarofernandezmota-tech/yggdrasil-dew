# Plan Maestro — Torre Madre + Portátil Acer

> Documento de referencia inviolable. Cualquier IA o sesión nueva debe leer esto primero.
> Última actualización: 12 junio 2026, 18:46 CEST

---

## Entorno base

| Dato | Valor |
|---|---|
| OS / WM | Arch Linux / Hyprland (Wayland) |
| Protocolo input sharing | Input Leap (objetivo: `input-leap-git`) |
| VPN mesh | Tailscale (`100.91.112.32` Madre, `100.86.119.102` Acer) |
| Pantallas Madre | 2 monitores externos |
| Pantalla Acer | 1 pantalla integrada |
| Gestor AUR | `yay` ✅ confirmado en `/usr/bin/yay` |

---

## Fase 1 — KVM Local ⚠️ EN CURSO

**Objetivo:** Torre (Madre, 2 pantallas) + Portátil (Acer, 1 pantalla) como una sola estación de trabajo fluida.

### Problema identificado

El servicio `input-leaps` (versión estable) intenta acceder a `org.freedesktop.portal.InputCapture`, interfaz **no disponible** en la versión actual del portal de Hyprland. Resultado: error fatal + reinicio en bucle de systemd.

### Estado actual del sistema (Madre)

| Componente | Estado |
|---|---|
| `input-leaps` estable | Detenido y deshabilitado |
| Systemd service | `daemon-reload` + `reset-failed` ejecutados ✅ |
| `/tmp/InputLeap.*` | Purgado ✅ |
| Procesos residuales | Ninguno (`killall` confirmó no process found) ✅ |
| `input-leap.conf` | Validado y limpio ✅ |
| `yay` | ✅ disponible en `/usr/bin/yay` |

### Plan de parcheo — Opción A

```
Paso 1 — Confirmar gestor AUR     ✅ COMPLETADO
  which yay  →  /usr/bin/yay

Paso 2 — Instalar input-leap-git  ⏳ SIGUIENTE
  yay -S input-leap-git
  # compilar desde AUR, incluye parches libei/InputCapture

Paso 3 — Verificar conexión Acer (antes de continuar)
  ping 100.86.119.102
  ssh varo@100.86.119.102 'systemctl --user status input-leapc.service'
  # confirmar que el cliente de Acer sigue activo

Paso 4 — Verificación manual en Madre (sin systemd)
  input-leaps -c ~/.config/input-leap/input-leap.conf \
    --address 0.0.0.0:24800 -f -n madre
  # capturar errores D-Bus en bruto

Paso 5 — Despliegue (si Paso 4 OK)
  # Reconstruir .service con variables:
  Environment=QT_QPA_PLATFORM=wayland
  Environment=WAYLAND_DISPLAY=wayland-1
  systemctl --user enable --now input-leaps.service
```

### Criterio de validación

> El ratón salta limpiamente entre los 2 monitores de Madre y la pantalla de Acer, sin errores en los logs.

---

## Fase 2 — SSH + Acceso Remoto ⏳ Pendiente

**Objetivo:** Acceder desde Acer a Madre cuando estés fuera de casa.

- [ ] Claves SSH Ed25519 Madre ↔ Acer
- [ ] Deshabilitar auth por password en sshd
- [ ] Verificar tunel Tailscale como transporte SSH (ya operativo)
- [ ] Test de acceso remoto desde fuera de la LAN

---

## Fase 3 — Documentación y Mantenimiento ⏳ Pendiente

- [ ] Configs systemd finales bajo `setup/servidor/`
- [ ] `.gitignore` con claves privadas y datos sensibles
- [ ] `setup/servidor/barrier.md` con unit files finales
- [ ] Sincronización dotfiles / omarchy Madre ↔ Acer

---

## Regla de oro

> **No saltar de fase.** Fase 1 debe estar 100% validada antes de tocar Fase 2.
> Si algo no funciona, documentar el bloqueo aquí y no improvisar.

---

_Ver también: `setup/servidor/README.md` · `diarios/2026/2026-06-12.md`_
