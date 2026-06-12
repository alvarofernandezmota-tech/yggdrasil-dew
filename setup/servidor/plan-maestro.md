# Plan Maestro — Torre Madre + Portátil Acer

> Última actualización: 12 junio 2026, 21:29 CEST

---

## Entorno base

| Dato | Valor |
|---|---|
| OS / WM | Arch Linux / Hyprland (Wayland) — ambos |
| VPN | Tailscale ✅ (`100.91.112.32` Madre, `100.86.119.102` Acer) |
| KVM / Escritorio remoto | **wayvnc + tigervnc** ✅ operativo |

---

## Fases KVM

| Fase | Descripción | Estado |
|---|---|---|
| 1 | Limpieza sistema | ✅ |
| 2 | Input Leap instalado y configurado | ✅ |
| 3 | Input Leap — bloqueo definitivo | ❌ Abandonado |
| 4 | **VNC sobre Tailscale (wayvnc + tigervnc)** | ✅ **OPERATIVO** |
| 5 | Automatizar wayvnc con systemd | ⏳ Opcional |

---

## Fases siguientes

### Fase 6 — SSH seguro
- [ ] Claves Ed25519 Madre ↔ Acer
- [ ] Deshabilitar auth por password

### Fase 7 — Servicios
- [ ] Auditoría Docker Acer
- [ ] PostgreSQL + THDORA + Ollama + Pi-hole

### Fase 8 — Sincronización
- [ ] dotfiles / omarchy
- [ ] Headscale self-hosted
- [ ] MacBook tercer nodo

---

## Regla de oro

> No improvisar. Si algo falla → documentar, pivotar, buscar alternativa.

---

_VNC: `setup/servidor/vnc.md` · Historial: `setup/servidor/README_CONNECT.md`_
