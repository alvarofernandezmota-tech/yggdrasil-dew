---
tags: [tipo/ficha, estado/activo, infra/arch, infra/wifi]
fecha: 2026-06-27
---

# 🌐 Red Madre — AP WiFi (MadreAP) — Configuración definitiva

> Referencia permanente. Actualizar si cambia algo en producción.

## Arquitectura

```
Internet
  └── iPhone (hotspot) ──── enp0s20f0u3 (USB ethernet) ──── madre
                                                              └── wlan0 (AP: MadreAP 192.168.72.1/24)
                                                                    └── clientes WiFi (192.168.72.x)
```

| Elemento | Valor |
|---|---|
| SSID | MadreAP |
| Seguridad | WPA2-PSK |
| Canal | 6 (2.4GHz) |
| IP Madre (AP) | 192.168.72.1/24 |
| DHCP pool | 192.168.72.10 — .60 |
| DNS clientes | 1.1.1.1 |
| Acer (theodora) | 192.168.72.26 |
| SSH a Madre | siempre por Tailscale `100.91.112.32` |

## Servicios activos

| Servicio | Estado |
|---|---|
| `hostapd` | ✅ arranca solo tras reboot |
| `systemd-networkd` (wlan0) | ✅ DHCP activo |
| NAT / IPMasquerade | ✅ clientes tienen internet |
| UFW reglas wlan0 | ✅ permanentes |

## Configuraciones clave

### `/etc/systemd/network/10-wlan0-ap.network`
```ini
[Match]
Name=wlan0

[Network]
Address=192.168.72.1/24
DHCPServer=yes
IPv4Forwarding=yes
IPMasquerade=ipv4

[DHCPServer]
PoolOffset=10
PoolSize=50
DNS=1.1.1.1
EmitDNS=yes
EmitRouter=yes
```

### `/etc/hostapd/hostapd.conf`
```
interface=wlan0
driver=nl80211
ssid=MadreAP
hw_mode=g
channel=6
wpa=2
wpa_passphrase=<ver SOPS vault>
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
```

## Problemas resueltos — historial

| Problema | Causa | Fix |
|---|---|---|
| `wlan0` no existe al boot | `iwd` creaba la interfaz | `systemctl disable iwd --now` |
| hostapd no arrancaba | `iwd` tomaba el hardware WiFi | mismo fix |
| Clientes conectados sin IP | UFW bloqueaba puerto 67 (DHCP) | `ufw allow in on wlan0 to any port 67 proto udp` |
| Clientes sin internet | UFW no permitía routing wlan0 | `ufw route allow in/out on wlan0` |

## Mejoras pendientes

- [ ] HT40 en hostapd — `ht_capab=[HT40+]` para mayor velocidad
- [ ] DNS personalizado para clientes AP
- [ ] Mitmproxy / tcpdump en `wlan0`

---
_Diario de resolución: [[diarios/2026-06-27-madre-ap-wifi-resuelto]]_
_Ver: [[ESTADO-SISTEMA]] · [[MASTER-PENDIENTES]]_
