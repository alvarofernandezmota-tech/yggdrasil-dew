# Plan Maestro — Torre Madre + Portátil Acer

> Última actualización: 12 junio 2026, 21:16 CEST

---

## Entorno base

| Dato | Valor |
|---|---|
| OS / WM | Arch Linux / Hyprland (Wayland) — ambos equipos |
| VPN mesh | Tailscale (`100.91.112.32` Madre, `100.86.119.102` Acer) ✅ |
| Pantallas Madre | 2 monitores externos |
| Pantalla Acer | 1 pantalla integrada |
| Gestor AUR | `yay` ✅ |

---

## Fase 1 — Limpieza ✅ COMPLETADA
## Fase 2 — Instalación input-leap-git ✅ COMPLETADA
## Fase 3 — Input Leap ❌ BLOQUEADO DEFINITIVAMENTE

Input Leap no es compatible con Hyprland en su estado actual.
Ver diagnóstico completo: `setup/servidor/README_CONNECT.md`

---

## Fase 4 — Alternativas KVM ⚡ SIGUIENTE

### Opción A — lan-mouse ⭐ PROBAR PRIMERO

```bash
yay -S lan-mouse
```

- Nativo libei, sin dependencias de portal D-Bus
- Diseñado para Wayland / Hyprland
- Más ligero que Input Leap

### Opción B — barrier-git

```bash
yay -S barrier-git
```

### Opción C — X11 forzado (parche temporal)

Ver `README_CONNECT.md` para comandos.

---

## Fases siguientes (después de resolver KVM)

### Fase 5 — SSH seguro
- [ ] Claves Ed25519 Madre ↔ Acer
- [ ] Deshabilitar auth por password

### Fase 6 — Servicios
- [ ] Docker Acer auditado
- [ ] PostgreSQL + THDORA + Ollama + Pi-hole

### Fase 7 — Sincronización
- [ ] dotfiles / omarchy
- [ ] Headscale
- [ ] MacBook tercer nodo

---

## Regla de oro

> No improvisar. Si algo falla → documentar y buscar alternativa. No seguir golpeando la misma pared.

---

_Detalles técnicos: `setup/servidor/README_CONNECT.md`_
