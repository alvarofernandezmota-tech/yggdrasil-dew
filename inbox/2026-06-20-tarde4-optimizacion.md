# Inbox — Optimización Acer · 20 junio 2026 ~17:50

> Tags: `#acer` `#bateria` `#tlp` `#servicios` `#optimizacion` `#varopc`
> Estado: ✅ Aplicado y funcionando

---

## ✅ Servicios desactivados (disable --now = persiste tras reboot)

| Servicio | Motivo |
|---|---|
| `bluetooth` | Sin periféricos BT, consumo innecesario |
| `avahi-daemon` | mDNS/descubrimiento red local, no se usa |
| `cups` + `cups-browsed` | Sin impresora |
| `power-profiles-daemon` | Conflicto con TLP, TLP es mejor opción |

**Para reactivar cualquiera:**
```bash
sudo systemctl enable --now bluetooth
```

---

## 📊 Consumo real medido

| Momento | Consumo |
|---|---|
| Antes (22 servicios) | 772 mA / 8.7W |
| Tras optimización | 647 mA |
| TLP ajustando (2min) | **633 mA** ↓ |
| Ahorro real | ≈ −140 mA / −1.5W |
| Autonomia extra estimada | +20-25 min |

> TLP sigue ajustando — puede bajar algo más con el tiempo.

---

## 🛠️ Stack actual Acer (17 servicios)

Servicios corriendo (mínimo necesario):
- `dbus-broker` — bus sistema
- `iwd` — WiFi
- `polkit` — autorizaciones sudo
- `rtkit-daemon` — audio en tiempo real
- `sddm` — login manager Hyprland
- `sshd` — acceso remoto
- `systemd-*` — núcleo sistema
- `tailscaled` — red ecosistema
- `udisks2` — gestor discos
- `upower` — gestión energía

---

## 🔋 Batería BAT1 — resumen final

- Fabricante: LGC / AP18C8K
- Salud: **67.8%** (2891 mAh de 4267 mAh originales)
- Control de carga: ❌ No disponible en este modelo
- TLP: ✅ Activo, perfil `balanced/BAT`
- power-profiles-daemon: ❌ Desactivado

---

## 📝 Pendientes batería

- [ ] Monitorizar consumo tras 10-15 min con TLP estabilizado
- [ ] Instalar `lm_sensors` para temperaturas CPU
- [ ] Ejecutar `sudo powertop --auto-tune` para optimización extra
- [ ] Documentar en `setup/acer-optimizacion.md`

---

_Procesar a: `setup/acer-optimizacion.md` · `hardware/acer-bateria.md`_
