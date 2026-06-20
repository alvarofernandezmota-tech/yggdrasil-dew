# Inbox — Estado Madre + Plan Red · 20 junio 2026 ~18:56

> Tags: `#madre` `#varpc` `#red` `#usb-tethering` `#failover` `#internet` `#hardware`
> Estado: 🟡 Pendiente configurar

---

## 🖥️ Estado real Madre (varpc) — 18:56

| Métrica | Valor |
|---|---|
| Hostname | `varpc` |
| Uptime | 36 min |
| Load average | 0.46 / 0.51 / 0.54 ✅ tranquilo |
| RAM total | 15 Gi |
| RAM usada | 3.3 Gi |
| RAM libre | 8.9 Gi ✅ |
| Swap | 19 Gi (0 usado) |
| Disco / | 930 GB total / 66 GB usados (8%) ✅ |
| Tailscale | `tailscale0` UP ✅ |

---

## 🌐 Interfaces de red

| Interfaz | Estado | Tipo |
|---|---|---|
| `lo` | UP | Loopback |
| `enp4s0` | **DOWN / NO-CARRIER** | Ethernet físico ❌ |
| `wlan0` | **UP / DORMANT** | WiFi (hotspot móvil) ⚠️ |
| `tailscale0` | UP | VPN Tailscale ✅ |

> `wlan0 DORMANT` = conectado pero en modo bajo consumo, puede caerse
> `enp4s0 NO-CARRIER` = cable ethernet no conectado
> `nmcli` no instalado → usa `iwd` o `systemd-networkd`

---

## ⚠️ Problema de red identificado

Madre depende de **un solo punto de fallo**: hotspot WiFi del móvil (`wlan0`).
Si el hotspot se cae → Madre sin internet → Tailscale cae → sin acceso remoto.

---

## 💪 Plan failover — internet siempre activo

### Opción 1: USB tethering como principal (más estable)
```bash
# Conectar móvil por USB
# Ver si aparece interfaz nueva:
ip link show
# Buscar usb0 o enp0s20u1 o similar
```

### Opción 2: WiFi hotspot siempre activo (arreglar DORMANT)
```bash
# Ver estado real wlan0:
iwctl station wlan0 show
# Reconectar si caido:
iwctl station wlan0 connect <SSID-hotspot>
```

### Opción 3 (mejor) — Script failover automático
Logic: 
1. Comprueba si hay internet cada 60s
2. Si WiFi caído → activa USB tethering automáticamente
3. Si USB también caído → alerta en yggdrasil-dew

```bash
# Pendiente crear: ~/scripts/failover-internet.sh
# Pendiente: servicio systemd que lo ejecute cada 60s
```

---

## 📦 Pendientes Madre — por orden

- [ ] Instalar `networkmanager` o confirmar gestor de red actual:
  ```bash
  systemctl status systemd-networkd
  systemctl status iwd
  ```
- [ ] Ver qué interfaz USB tethering genera el móvil:
  ```bash
  ip link show  # con móvil conectado por USB
  ```
- [ ] Configurar USB tethering como conexión prioritaria
- [ ] Script failover WiFi → USB
- [ ] Verificar Docker:
  ```bash
  which docker
  systemctl status docker
  ```
- [ ] Estado bot y thdora
- [ ] `git clone` yggdrasil-dew en Madre
- [ ] Preparar para Ollama (16GB RAM ✅ perfecto para 7B-13B)

---

## 🧠 Ollama — capacidad Madre

Con 15Gi RAM y disco 930GB:
- **llama3:8b** → corre bien (~5GB RAM)
- **llama3:13b** → corre bien (~8GB RAM)
- **mistral:7b** → corre bien (~5GB RAM)
- **codellama:13b** → corre bien (~8GB RAM)

Madre tiene potencia para IA local decente. ✅

---

_Procesar a: `setup/madre.md` · `setup/red-failover.md` · `hardware/madre-specs.md`_
