# Inbox — Cierre Acer + Inicio Madre · 20 junio 2026 ~18:30

> Tags: `#acer` `#madre` `#sesion` `#pendientes` `#tailscale` `#powertop` `#tlp`
> Estado: 🟡 En curso

---

## ✅ Lo que se hizo hoy en el Acer (varo12f)

### Sistema
- [x] Identificados hostnames reales: `varo12f` = Acer, `varpc` = Madre
- [x] Verificado Tailscale: Acer online `100.86.119.102`
- [x] Confirmado: `nano` no instalado → usar `nvim` siempre
- [x] Instalado: `btop`, `acpi`, `powertop`, `tlp`, `tlp-rdw`

### Batería BAT1
- [x] Diagnóstico completo: salud **67.8%** (2891/4267 mAh)
- [x] Confirmado: sin soporte de control de carga (charge_control_threshold)
- [x] TLP 1.10.0 activo, perfil `balanced/BAT`
- [x] `power-profiles-daemon` desactivado (conflicto con TLP resuelto)
- [x] `sudo powertop --auto-tune` ejecutado (warnings normales, sin caché previa)

### Servicios desactivados (persisten tras reboot)
- [x] `bluetooth`
- [x] `avahi-daemon`
- [x] `cups` + `cups-browsed`
- [x] `power-profiles-daemon`

### Resultado consumo
| Estado | Consumo |
|---|---|
| Inicio sesión | 772 mA / 8.7W |
| Tras optimización | **633 mA** y bajando |
| Ahorro | ~140 mA / ~1.5W / +20-25 min |

---

## 🔴 Pendientes Acer

- [ ] Hacer powertop persistente tras reboot:
  ```bash
  sudo nvim /etc/systemd/system/powertop.service
  ```
  Contenido:
  ```ini
  [Unit]
  Description=PowerTOP auto tune
  After=suspend.target
  After=hibernate.target
  After=hybrid-sleep.target

  [Service]
  Type=oneshot
  ExecStart=/usr/bin/powertop --auto-tune

  [Install]
  WantedBy=multi-user.target
  WantedBy=suspend.target
  WantedBy=hibernate.target
  WantedBy=hybrid-sleep.target
  ```
  Luego:
  ```bash
  sudo systemctl enable --now powertop
  ```

- [ ] Instalar `lm_sensors` + temperaturas CPU:
  ```bash
  sudo pacman -S lm_sensors --noconfirm
  sudo sensors-detect --auto
  sensors
  ```
- [ ] Fix tapa portátil (no suspender al cerrar):
  ```bash
  sudo nvim /etc/systemd/logind.conf
  # HandleLidSwitch=ignore
  # HandleLidSwitchExternalPower=ignore
  sudo systemctl restart systemd-logind
  ```
- [ ] Clonar yggdrasil-dew en Acer
- [ ] Fase 1 dashboard HTML

---

## 🟢 Madre (varpc · 100.91.112.32)

### Verificar al conectar
```bash
tailscale status
ssh 100.91.112.32
hostname && uptime
docker ps
git -C ~/repos/yggdrasil-dew pull
```

### Pendientes Madre
- [ ] Verificar Docker + contenedores
- [ ] Estado bot
- [ ] Estado thdora
- [ ] git pull en ygg
- [ ] CPU, RAM, disco

---

_Procesar a: `setup/acer-optimizacion.md` · `setup/madre.md` · `ECOSISTEMA.md`_
