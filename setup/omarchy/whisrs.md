# whisrs — Dictado por voz offline

> Última actualización: 12 junio 2026

---

## Qué es

Dictado por voz 100% offline para Wayland/Hyprland.
Pulsa hotkey, hablas, el texto aparece donde esté el cursor.

| Dato | Valor |
|---|---|
| Backend | whisper.cpp (local) |
| Conexión | Sin internet ✅ |
| Wayland | Nativo ✅ |
| Hyprland | Compatible ✅ |
| RAM (modelo base) | ~388 MB |

---

## Instalación

```bash
yay -S whisrs
whisrs setup
# → elegir: Local → whisper.cpp
```

---

## Hotkey en Hyprland

Añadir en `~/.config/hypr/hyprland.conf`:

```bash
bind = SUPER, V, exec, whisrs toggle
```

---

## Modelos disponibles

| Modelo | Tamaño | Precisión | Velocidad |
|---|---|---|---|
| `tiny` | 75 MB | Baja | Muy rápida |
| `base` | 142 MB | Media | Rápida |
| `small` | 466 MB | Alta | Normal |
| `medium` | 1.5 GB | Muy alta | Lenta |

> Recomendado para Madre (GTX 1060): `small` con aceleración GPU.

---

_Volver al índice: [README.md](README.md)_
