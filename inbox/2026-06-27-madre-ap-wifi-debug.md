# Sesión debug: MadreAP WiFi — 2026-06-27

**Estado:** 🔄 En progreso — AP emite y autentica, DHCP pendiente de fix final  
**Máquina:** `madre` (varpc, Arch Linux)  
**Adaptador WiFi:** RTL8188FTV (rtl8xxxu) — USB, 2.4GHz only  
**Objetivo:** madre emite AP `MadreAP`, da internet por NAT a clientes WiFi

---

## Arquitectura de red

```
Internet
  └── iPhone (hotspot) ──── enp0s20f0u3 (USB ethernet) ──── madre
                                                               └── wlan0 (AP: MadreAP 192.168.72.1/24)
                                                                     └── clientes WiFi (192.168.72.x)
```

- SSH a madre: siempre por **Tailscale** (`100.91.112.32`) → no se corta aunque cambie el WiFi
- El Acer (theodora) usa iPhone hotspot para hablar con Perplexity mientras se debuggea el AP

---

## Lo que funciona ✅

- `hostapd` arranca y emite el SSID `MadreAP`
- Clientes se autentican correctamente (WPA2/RSN handshake completo):
  ```
  wlan0: AP-STA-CONNECTED e0:0a:f6:b6:02:13
  wlan0: EAPOL-4WAY-HS-COMPLETED e0:0a:f6:b6:02:13
  wlan0: WPA: pairwise key handshake completed (RSN)
  ```
- `systemd-networkd` aplica config `10-wlan0-ap.network`
- Puerto DHCP escuchando en `wlan0:67`:
  ```
  UNCONN 0  0   0.0.0.0%wlan0:67   0.0.0.0:*   users:(("systemd-network"...))
  ```
- IP `192.168.72.1` asignada a `wlan0`
- `IPMasquerade=ipv4` configurado (NAT hacia `enp0s20f0u3`)

---

## Lo que falla ❌

### Fallo principal: `Offered DHCP leases: none`
El servidor DHCP de madre está activo pero **ningún cliente recibe IP**.

### Causa raíz identificada
`iwd` en el Acer (theodora) gestiona la conexión WiFi pero **no dispara el cliente DHCP** de `systemd-networkd` al conectar. La interfaz `wlan0` queda en estado "conectada a nivel WiFi" pero sin petición DHCP.

Evidencia:
- El Acer conecta a MadreAP (`AP-STA-CONNECTED` en hostapd)
- `ip addr show wlan0` en el Acer muestra solo IPv6 link-local, sin IPv4
- En los logs de madre: cero peticiones DHCP recibidas en `wlan0`
- Al hacer `networkctl reconfigure wlan0` en el Acer, vuelve a coger IP del iPhone (`172.20.10.3`) en vez de pedir al AP

### Problema secundario: MAC `00:00:00:00:00:00`
```
Wi-Fi access point: MadreAP (00:00:00:00:00:00)
```
Indica que `iwd` interfiere con `wlan0` incluso en Madre — no suelta completamente la interfaz a hostapd.

### Warning deprecado en `.network` (menor)
```
IPForward= setting is deprecated
```
→ Corregido usando `IPv4Forwarding=yes` en el `.network`

---

## Ficheros de configuración actuales

### `/etc/systemd/network/10-wlan0-ap.network` (en madre)
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

### `/etc/hostapd/hostapd.conf` (en madre)
```
interface=wlan0
driver=nl80211
ssid=MadreAP
hw_mode=g
channel=6
wpa=2
wpa_passphrase=MadreClaveFuerte123
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
```

---

## Fix pendiente de aplicar

### En el Acer (theodora) — fix iwd
El problema del Acer es que `iwd` tiene `EnableNetworkConfiguration` activo por defecto, lo que hace que intente gestionar la IP él solo y falla. Fix:

```bash
sudo mkdir -p /etc/iwd
sudo tee /etc/iwd/main.conf > /dev/null << 'EOF'
[General]
EnableNetworkConfiguration=false

[Network]
NameResolvingService=systemd
EOF

sudo systemctl restart iwd
sudo systemctl restart systemd-networkd
sleep 2
iwctl station wlan0 connect "MadreAP" --passphrase "MadreClaveFuerte123"
sleep 5
ip addr show wlan0
```

### NAT permanente (en madre)
Las reglas iptables no sobreviven reboot. Hacer permanente:
```bash
sudo iptables -t nat -A POSTROUTING -s 192.168.72.0/24 -o enp0s20f0u3 -j MASQUERADE
# Guardar con iptables-persist o nftables
```

---

## Próximos pasos

1. [ ] Aplicar fix `iwd` en el Acer → confirmar que recibe `192.168.72.x`
2. [ ] Probar con móvil Android/iOS → confirmar DHCP funciona
3. [ ] Hacer NAT permanente (sobrevive reboot)
4. [ ] **Seguridad completa:**
   - UFW: solo Tailscale para SSH, bloquear acceso externo a servicios
   - Proteger `enp0s20f0u3` (el iPhone que da ethernet)
   - Aislar clientes WiFi del AP entre sí
   - Fail2ban
   - Revisar exposición de servicios Yggdrasil desde la red del AP

---

## Notas técnicas

- El adaptador RTL8188FTV (rtl8xxxu) es 2.4GHz only → solo channels 1-13
- `iwd` versión 3.12 en el Acer
- SSH a madre SIEMPRE por Tailscale (`100.91.112.32`) — independiente del WiFi
- El Acer (theodora) tiene `20-wlan.network` con `DHCP=yes` y `Name=wl*` — config correcta, el problema es iwd no el networkd
