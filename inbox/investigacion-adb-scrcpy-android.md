---
title: "Investigación: Control remoto Android vía ADB + scrcpy"
fecha: 2026-06-25
estado: inbox
tipo: investigacion
tags:
  - android
  - adb
  - scrcpy
  - pentesting
  - tailscale
  - lab
  - mobile-security
prioridad: media
destino: hardware/mobile-security/
---

# Investigación: Control remoto Android vía ADB + scrcpy

## Contexto

Investigación iniciada durante sesión práctica de configuración de dispositivo Android (Xiaomi Redmi Note 11). Objetivo: establecer control remoto completo (pantalla + comandos) desde Omarchy (Arch Linux) usando herramientas 100% open source.

## Stack Utilizado

- **ADB** (android-tools) — interfaz oficial de Google para comunicación con Android
- **scrcpy 4.0** — espejo de pantalla + control de entrada vía ADB
- **Tailscale** — VPN mesh para acceso remoto fuera de red local
- **Ethernet USB (rndis0)** — conexión física inicial para autorización

## Procedimiento Verificado ✅

### 1. Activar Opciones de Desarrollador
- Ajustes → Información del teléfono → Número de compilación × 7
- Activar **Depuración por USB**

### 2. Autorizar el PC
```bash
adb kill-server
adb start-server
adb devices  # Aceptar popup en el móvil marcando "Permitir siempre"
```

### 3. Pasar ADB a modo TCP/IP
```bash
adb -s <SERIAL> tcpip 5555
```

### 4. Obtener IP del móvil
```bash
adb shell ip route
# Buscar línea con rndis0 o wlan0 → src <IP>
```

### 5. Conectar por red
```bash
adb connect <IP_MOVIL>:5555
adb devices  # Verificar estado "device"
```

### 6. Lanzar scrcpy
```bash
scrcpy -d          # Por USB
scrcpy -e          # Por TCP/IP (sin cable)
scrcpy --tcpip=<IP>:5555  # Especificando dispositivo
```

## Topología de Red (Caso Real)

```
PC (Omarchy) ←→ USB Ethernet ←→ Android
10.28.231.21              10.28.231.115

PC (Omarchy) ←→ Tailscale ←→ Android (futuro)
100.91.112.32             100.x.y.z
```

## Limitaciones Importantes

- **BFU (Before First Unlock)**: Tras reinicio completo, ADB no responde hasta desbloqueo físico inicial
- **Notificación visible**: scrcpy muestra notificación en Android — no es stealth
- **Autorización única**: Una vez autorizado con "Permitir siempre", no vuelve a pedir confirmación

## Automatización (ver script)

Ver `scripts/watchdog_adb.sh` para script de reconexión automática y logging.

## Próximos Pasos

- [ ] Integrar con Tailscale para acceso remoto fuera de red local
- [ ] Configurar IP fija en Tailscale MagicDNS para el móvil
- [ ] Investigar `adb logcat` para monitoreo de instalación de apps
- [ ] Documentar en `hardware/mobile-security/devices_inventory.md`
- [ ] Investigar CVEs del SOC del dispositivo (Snapdragon/MediaTek)

## Referencias

- [scrcpy GitHub](https://github.com/Genymobile/scrcpy)
- [ADB docs — Android Developers](https://developer.android.com/tools/adb)
- XDA Developers — ADB over TCP/IP
