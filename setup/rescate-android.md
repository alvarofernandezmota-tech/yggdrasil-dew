# Laboratorio de Rescate y Recuperación Android

> Documentado: 15 junio 2026  
> Máquina host: varopc (Arch Linux + Hyprland)

---

## 🎯 Objetivo

Crear un entorno híbrido **(Nativo Arch Linux + Virtualización Windows)** para la recuperación, diagnóstico y desbloqueo (FRP) de dispositivos móviles con procesadores **Unisoc** (Redmi A5) y **Samsung** (Exynos/Snapdragon).

---

## 🖥️ Dispositivos

| Dispositivo | Chip | Rol | Estado |
|-------------|------|-----|--------|
| **varopc** | x86 | PC principal (Arch Linux) | ✅ activo |
| **Samsung (Madre)** | Exynos/Snapdragon | Servidor THDORA producción | ✅ activo |
| **Redmi A5** | Unisoc T765 *(corregido de T7250)* | Objetivo rescate/FRP | 🔄 en proceso |

---

## ✅ Estado infraestructura

### Host (Arch Linux)
- [x] Entorno: Hyprland + Terminal
- [x] `sfd_tool` compilada y funcional en `~/sfd_tool`
- [x] Permisos USB: `/dev/ttyUSB0` y `ttyACM0` (grupos `uucp`, `lock`)
- [x] `xhost` configurado para evitar bloqueos con `sudo`
- [x] `android-tools 35.0.2-25` instalado (incluye `adb` y `fastboot`)
- [x] `android-udev 20260423-1` instalado — grupo `adbusers` creado
- [x] `usbutils 019-1` instalado — `lsusb` disponible

### Virtualización
- [x] `qemu-full`, `virt-manager`, `libvirt` instalados (139 paquetes)
- [ ] Crear VM Windows (10 Tiny / 11) para software propietario
- [ ] Configurar USB passthrough automático

### Redmi A5
- [x] Chip identificado: **Unisoc T765** (Qogirl6), modelo 25028RN03
- [x] ROM descargada: `A15.0.26.0.VGWMIXM` (~4.54 GB)
- [x] Script de flash analizado — confirma Unisoc por particiones `qogirl6_pubcp_MHM_customer_nvitem.bin`
- [x] Bootloader bloqueado por Xiaomi OEM → `Err:0xffffffff` definitivo
- [x] Recovery (ISO del móvil) dañado — no se puede usar para flashear
- [ ] Handshake FDL1/FDL2 para desbloquear BROM
- [ ] Flasheo completo

---

## 📦 Stack instalado (15/06/2026)

```bash
sudo pacman -S qemu-full libvirt virt-manager virt-install virt-viewer dnsmasq
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER

# Sesión tarde 15/06:
sudo pacman -S android-tools android-udev usbutils
sudo usermod -aG adbusers varopc
newgrp adbusers
```

> ⚠️ `wget` NO está en varopc — usar siempre `curl -L -C -` para descargas reanudables.

---

## 📱 Redmi A5 — ROM

- **Versión:** `A15.0.26.0.VGWMIXM` (Android 15, MIUI Global, build 27/04/2026)
- **Tamaño:** 4.54 GB | **Ruta:** `~/isos/redmi-a5/serenity_global.tgz`

```bash
mkdir -p ~/isos/redmi-a5 && cd ~/isos/redmi-a5
curl -L -C - -o serenity_global.tgz \
  "https://bkt-sgp-miui-ota-update-alisgp.oss-ap-southeast-1.aliyuncs.com/A15.0.26.0.VGWMIXM/serenity_global-images-A15.0.26.0.VGWMIXM-user-20260427.0000.00-15.0-global-26c6dc7975.tgz"
```

---

## 🔬 Sesión 15/06/2026 tarde — Diagnóstico completo

### Contexto
El Redmi A5 tiene el sistema roto y el recovery (ISO) también dañado. No se puede entrar a ajustes para activar depuración USB ni aceptar el diálogo de autorización ADB.

### Metodología de diagnóstico
Se procedió paso a paso desde lo más alto hasta lo más bajo:
1. Intentar Recovery → dañado, no funciona
2. Intentar ADB → `unauthorized` (pantalla rota, no se puede aceptar diálogo)
3. Intentar desbloqueo fastboot → bloqueado por OEM Xiaomi
4. Identificar chip por script de flash → confirmado Unisoc T765 / Qogirl6
5. Concluir: única salida es EDL / SPRD Download Mode

### Estado detectado

| Componente | Estado | Detalle |
|---|---|---|
| ADB | ❌ `unauthorized` | Pantalla rota — no se puede aceptar diálogo |
| `fastboot oem unlock` | ❌ `Err:0xffffffff` | Bootloader bloqueado por OEM Xiaomi |
| `fastboot flashing unlock` | ❌ `unknown cmd` | No soportado en este firmware |
| Modo fastboot | ✅ Funciona | Serial: `863d0058304831323851135e23407c` |
| Recovery / ISO | ❌ Dañado | No arranca |
| Sistema operativo | ❌ Roto | HyperOS corrupto |

### Comandos ejecutados y resultados

```bash
# ADB — siempre unauthorized
adb kill-server && adb devices
# → 863d0058304831323851135e23407c  unauthorized

adb reboot bootloader
# → error: device unauthorized.
# → This adb server's $ADB_VENDOR_KEYS is not set

# Intento desbloqueo fastboot
fastboot oem unlock
# → FAILED (remote: 'Unlock failed - Err:0xffffffff')

fastboot flashing unlock
# → FAILED (remote: 'unknown cmd.')

fastboot reboot
# → Rebooting  OKAY [0.000s]  ← esto sí funciona
```

### Solución de permisos USB intentada (sin éxito por diseño)
```bash
sudo pacman -S android-udev        # crea grupo adbusers
sudo usermod -aG adbusers varopc
newgrp adbusers
adb kill-server && adb devices
# → sigue unauthorized (lógico: la pantalla no puede mostrar el diálogo)
```

### Identificación del chip por script de flash
El script `.sh` de flash contiene referencias a:
- `qogirl6_pubcp_MHM_customer_nvitem.bin` → **Unisoc Qogirl6 = T765** ✅
- Particiones: `l_modem`, `l_gdsp`, `l_ldsp`, `l_agdsp`, `pm_sys` → arquitectura Unisoc
- Particiones Android: `boot`, `vendor_boot`, `init_boot`, `dtbo`, `super`, `vbmeta*`

### Diagnóstico final
El `Err:0xffffffff` en Unisoc con Xiaomi/HyperOS es definitivo — el bootloader está cerrado a nivel OEM. No se puede desbloquear desde fastboot normal. Opciones:

1. **MiUnlock oficial (Windows)** — requiere cuenta Mi vinculada + 72h de espera + sistema funcional → no viable
2. **EDL / Spreadtrum Download Mode** — bypass total, flashea directo al hardware. Puede requerir credenciales servidor Xiaomi en algunos firmwares
3. **Test Point (hardware)** — cortocircuitar puntos en la placa para forzar EDL sin autenticación

---

## 🔄 Pipeline validado

```
1. CONEXIÓN EN FRÍO   → Apagado + Vol↓ + USB = modo BROM
2. IDENTIFICACIÓN     → sfd_tool → chip_uid
3. DUMP (OBLIGATORIO) → frp + persist + nvram
4. ACCIÓN             → quitar FRP o reparar sistema
5. VERIFICACIÓN       → reboot + validar AVB
```

---

## 💻 VM Windows — passthrough USB

```bash
# Identificar móvil en modo descarga
lsusb
# En virt-manager → Hardware → Add Hardware → USB Host Device
# Seleccionar ID del móvil → Apply
```

---

## 🔧 Flujos por dispositivo

| Dispositivo | Herramienta | Necesita VM |
|-------------|-------------|-------------|
| Redmi A5 (Unisoc T765) | sfd_tool nativo Arch | ❌ No |
| Samsung (Knox) | Software propietario | ✅ Sí |

---

## ⏭️ Pendientes

- [ ] Verificar integridad ROM tras descarga
- [ ] Extraer FDL1/FDL2 del paquete
- [ ] Probar EDL: apagar → Vol↓ + USB → verificar con `lsusb`
- [ ] Buscar test point para Unisoc T765 / Qogirl6 (requiere abrir el móvil)
- [ ] Crear VM Windows en virt-manager
- [ ] Configurar USB passthrough
- [ ] Flashear Redmi A5 en modo BROM con sfd_tool
- [ ] Documentar reinstalación Samsung (Madre)
