# Input Leap — KVM (abandonado)

> Última actualización: 12 junio 2026
> **Estado: ABANDONADO ❌ — incompatible con Hyprland**

---

## Por qué se abandonó

Input Leap moderno depende de portales D-Bus (`InputCapture`, `RemoteDesktop`) que Hyprland no implementa de forma estable.

| Problema | Causa |
|---|---|
| `input-leaps` falla | `org.freedesktop.portal.InputCapture` no disponible |
| Wrapper GUI genera `/tmp/` en bucle | Ignora config estática |
| `input-leapc` se autotermina | `RemoteDesktop` portal ausente |
| Truco `env -u` | Sin efecto en servidor |

---

## Alternativa activa

**VNC** — ver [vnc.md](vnc.md)

## Alternativas pendientes de evaluar

- `lan-mouse` — nativo libei, sin portales D-Bus
- `barrier-git` — fork maduro

---

_Volver al índice: [README.md](README.md)_
