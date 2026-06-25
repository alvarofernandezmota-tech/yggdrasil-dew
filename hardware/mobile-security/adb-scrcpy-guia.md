---
title: "Guía: Control Remoto Android con ADB + scrcpy"
fecha: 2026-06-25
estado: verificado
tags:
  - android
  - adb
  - scrcpy
  - lab
  - mobile-security
risk_level: Medium
context: Red local ethernet USB / Tailscale VPN
---

# Guía: Control Remoto Android con ADB + scrcpy

Guía completa verificada en sesión práctica el 2026-06-25.

## Requisitos

- Arch Linux con `android-tools` y `scrcpy` instalados
- Android con **Opciones de desarrollador** activadas
- **Depuración por USB** habilitada

```bash
sudo pacman -S android-tools scrcpy
```

## Paso 1 — Activar opciones de desarrollador

1. Ajustes → Información del teléfono
2. Tocar **Número de compilación** × 7
3. Entrar en **Opciones para desarrolladores**
4. Activar **Depuración por USB**

## Paso 2 — Autorizar el PC

Conectar cable USB y ejecutar:

```bash
adb kill-server
adb start-server
adb devices
# → Aceptar popup en el móvil: "Permitir siempre desde este ordenador"
```

Resultado esperado:
```
List of devices attached
mvj78dnnljlzukk7    device
```

## Paso 3 — Pasar ADB a TCP/IP

```bash
adb -s mvj78dnnljlzukk7 tcpip 5555
# → restarting in TCP mode port: 5555
```

## Paso 4 — Obtener IP del móvil

```bash
adb shell ip route
# Buscar línea con src → esa es la IP del móvil
# Ejemplo: 10.28.231.0/24 dev rndis0 ... src 10.28.231.115
```

## Paso 5 — Conectar por red

```bash
adb connect 10.28.231.115:5555
# → already connected to 10.28.231.115:5555
```

## Paso 6 — Lanzar scrcpy

```bash
# Con cable (más estable):
scrcpy -d

# Sin cable (TCP):
scrcpy -e

# Especificando dispositivo:
scrcpy --serial 10.28.231.115:5555
```

## Automatización con el script

Ver `scripts/watchdog_adb.sh`:

```bash
bash ~/yggdrasil-dew/scripts/watchdog_adb.sh 10.28.231.115
# O con Tailscale:
bash ~/yggdrasil-dew/scripts/watchdog_adb.sh 100.x.y.z
```

## Limitaciones

| Escenario | Estado |
|---|---|
| Misma red, móvil encendido | ✅ Funciona sin cable |
| Tras reinicio del móvil | ⚠️ Requiere cable una vez para re-auth |
| Fuera de red local (sin Tailscale) | ❌ No funciona |
| Fuera de red local (con Tailscale) | ✅ Funciona en cualquier red |
| Pantalla bloqueada (sin reinicio) | ✅ Comandos ADB funcionan |
| After First Unlock (reinicio frío) | ❌ Requiere desbloqueo físico primero |

## Próximo nivel — Tailscale

1. Instalar Tailscale en el móvil (F-Droid o Play Store)
2. Autenticar en la misma cuenta que el PC
3. Anotar IP MagicDNS en `devices_inventory.md`
4. Desde cualquier red: `bash watchdog_adb.sh <IP_TAILSCALE>`
