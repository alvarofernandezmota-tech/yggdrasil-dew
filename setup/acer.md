# Acer Aspire — Servidor 24/7 y Backup

> Máquina secundaria. Corre 24/7. Rol: redundancia y servicios ligeros.
> Última actualización: 14 junio 2026

---

## Hardware

| Componente | Detalle |
|---|---|
| Modelo | Acer Aspire |
| CPU | AMD Ryzen 5 5500U |
| RAM | 8 GB |
| OS | Arch Linux (sin escritorio) |
| Hostname | `acer` / `theodora` |
| IP LAN | `10.176.119.171` |
| IP Tailscale | `100.86.119.102` |

---

## Rol en el ecosistema

- **Backup y redundancia** — si Madre peta, Acer sigue vivo
- **Servidor 24/7** — siempre encendido, siempre accesible
- **Sin GPU** — no sirve para inferencia local pesada
- **Acceso desde Madre:** `ssh acer` (clave Ed25519, sin contraseña)

> **Principio:** Madre produce. Acer resiste.

---

## Software instalado

| Software | Estado | Notas |
|---|---|---|
| Arch Linux | ✅ | Sin escritorio |
| zsh | ✅ | Shell principal |
| Starship | ✅ | Prompt `theodora` |
| Tailscale | ✅ | IP `100.86.119.102` |
| fail2ban | ✅ | jail sshd activo |
| whisrs | ✅ | Keybind Super+V (Hyprland) |
| SSH server (sshd) | ✅ | Accesible desde Madre |
| UFW | ✅ | Activo |
| tmux | ⏳ Pendiente | |

---

## Acceso

```bash
# Desde Madre
ssh acer

# Por Tailscale desde cualquier red
ssh varopc@100.86.119.102
```

---

## Pendiente

- [ ] tmux instalado y configurado
- [ ] Alias `acer` en `~/.zshrc` de Madre
- [ ] PostgreSQL (base de datos centralizada)
- [ ] Pi-hole
- [ ] Headscale (Tailscale self-hosted)

---

_Ver `madre.md` para la máquina principal._
