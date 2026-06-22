---
tags: [setup, red, hotspot, samsung, internet]
fecha-actualizacion: 2026-06-22
---

# 📱 Hotspot Samsung — Punto de Entrada Internet

> El móvil Samsung es la puerta de entrada a internet de toda la red doméstica.
> Es el dispositivo más crítico de la red — si falla, todo pierde internet.

---

## Rol en el ecosistema

```
INTERNET (datos móvil)
        ↓
  SAMSUNG (hotspot)
        ↓
  ┌───────────┐
  │ Madre (WiFi) │
  │ Acer (WiFi)  │
  │ varopc       │
  │ iPhone 11    │
  └───────────┘
```

---

## Configuración actual

| Parámetro | Valor |
|---|---|
| Tipo conexión | Datos móvil (4G/5G) |
| Hotspot WiFi | ✅ Activo |
| Tethering USB | ✅ Activo (Madre — `enp0s20f0u3`) |
| IP gateway | `192.168.43.1` |
| Rango DHCP | `192.168.43.x` |

---

## 🔒 Seguridad del hotspot (pendiente reforzar)

```
⚠️ El hotspot es el punto de entrada — si alguien se cuela, está dentro de tu red.
```

### Checklist seguridad
- [ ] Contraseña WiFi larga y compleja (≥20 caracteres, sin palabras reales)
- [ ] WPA3 activado si el Samsung lo soporta (ajustes hotspot)
- [ ] Revisar lista de dispositivos conectados regularmente
- [ ] Desactivar hotspot cuando no se use
- [ ] Nombre del hotspot (SSID) sin información personal

### Ver dispositivos conectados ahora mismo
```bash
# Desde cualquier máquina conectada al hotspot
arp -a

# O con nmap (más detallado)
nmap -sn 192.168.43.0/24
```

### Ver tu conexión al hotspot desde Linux
```bash
# Ver interfaz WiFi conectada al hotspot
nmcli device show wlan0

# Ver IP que te dio el hotspot
ip addr show wlan0

# Ver gateway (IP del hotspot)
ip route | grep default

# Velocidad actual de la conexión
nload wlan0
```

---

## 📡 Tethering USB al Madre

```bash
# En el Madre — interfaz USB del móvil
ip link show enp0s20f0u3

# Pedir IP por DHCP
sudo dhcpcd enp0s20f0u3

# Ver IP asignada
ip addr show enp0s20f0u3

# Hacer permanente — añadir a /etc/dhcpcd.conf:
# interface enp0s20f0u3
# metric 100
```

---

## ⚠️ Puntos críticos

- Si el Samsung se queda sin batería → toda la red pierde internet
- Si Tailscale está activo en Madre, sobrevive a cortes cortos (reconecta solo)
- Tener siempre el Samsung cargando cuando hace de hotspot

---

_Ver también: [[setup/madre]] · [[setup/red]] · [[setup/iphone]] · [[setup/dashboard]]_
