# Madre — Workstation Principal

> Máquina principal. Workstation + GPU + servidor + dos monitores.
> Última actualización: 14 junio 2026

---

## Hardware

| Componente | Detalle |
|---|---|
| CPU | Intel Core i5-8400 |
| RAM | 16 GB |
| GPU | NVIDIA GTX 1060 6GB |
| OS | Arch Linux / Omarchy (Hyprland + Wayland) |
| Hostname | `madre` / `varopc` |
| IP LAN | pendiente IP fija |
| IP Tailscale | `100.91.112.32` |

---

## Monitores

| ID | Nombre | Modelo | Resolución activa | Conexión | Rol |
|---|---|---|---|---|---|
| 0 | `HDMI-A-1` | Sharp HDMI (82cm x 46cm) | 1280x720@50Hz | HDMI | Secundario |
| 1 | `DP-1` | LG TV (115cm x 65cm) | 1440x900@60Hz | DisplayPort | Principal (focused) |

**Nota:** DP-1 tiene scale 2.0. Soporta hasta 1920x1080@60Hz.
Si se quiere cambiar resolución del LG a 1080p:
```bash
wlr-randr --output DP-1 --mode 1920x1080@60Hz
# o en hyprland.conf:
monitor=DP-1,1920x1080@60,0x0,2
```

---

## Workspaces Hyprland

**Config aplicada** en `~/.config/hypr/hyprland.conf`:

```
workspace = 1, monitor:DP-1
workspace = 2, monitor:DP-1
workspace = 3, monitor:DP-1
workspace = 4, monitor:DP-1
workspace = 5, monitor:DP-1
workspace = 6, monitor:HDMI-A-1
workspace = 7, monitor:HDMI-A-1
workspace = 8, monitor:HDMI-A-1
workspace = 9, monitor:HDMI-A-1
workspace = 10, monitor:HDMI-A-1
```

| Monitor | Workspaces | Uso sugerido |
|---|---|---|
| DP-1 (LG, principal) | 1–5 | Trabajo principal: editor, terminal, browser |
| HDMI-A-1 (Sharp, secundario) | 6–10 | Referencia, documentación, música, dashboards |

**Para recargar sin reiniciar:**
```bash
hyprctl reload
```

---

## Software instalado

| Software | Estado | Notas |
|---|---|---|
| Omarchy (Hyprland + Wayland) | ✅ | OS base |
| zsh | ✅ | Shell principal |
| Starship | ✅ | Prompt |
| Tailscale | ✅ | IP `100.91.112.32` |
| fail2ban | ✅ | jail sshd activo |
| whisrs | ✅ | Dictado por voz, keybind Super+V |
| SSH server (sshd) | ✅ | Accesible desde Acer |
| Docker | ⏳ Pendiente | Para desplegar thdora |
| Ollama + Open WebUI | ⏳ Pendiente | GPU GTX 1060 |
| UFW firewall | ⏳ Pendiente | |

---

## Rol en el ecosistema

- **Produce y sirve** — todo el trabajo ocurre aquí
- **GPU disponible** para Ollama (inferencia local)
- **Servidor de servicios** — thdora, futuros contenedores Docker
- Si Madre peta → Acer sigue vivo, GitHub tiene todo

---

## Pendiente

- [ ] IP fija en LAN
- [ ] UFW firewall
- [ ] `sshd_config` hardening (`PasswordAuthentication no`)
- [ ] Docker instalado
- [ ] thdora desplegado con `docker compose up -d`
- [ ] Ollama + Open WebUI con GTX 1060
- [ ] Cambiar resolución DP-1 a 1920x1080 si se desea
- [ ] Workspaces config aplicada y probada

---

_Ver `acer.md` para la máquina de backup._
_Ver `setup/servidor/` para servicios desplegados._
