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
| **Redmi A5** | Unisoc T7250 | Objetivo rescate/FRP | 🔄 en proceso |

---

## ✅ Estado infraestructura

### Host (Arch Linux)
- [x] Entorno: Hyprland + Terminal
- [x] `sfd_tool` compilada y funcional en `~/sfd_tool`
- [x] Permisos USB: `/dev/ttyUSB0` y `ttyACM0` (grupos `uucp`, `lock`)
- [x] `xhost` configurado para evitar bloqueos con `sudo`

### Virtualización
- [x] `qemu-full`, `virt-manager`, `libvirt` instalados (139 paquetes)
- [ ] Crear VM Windows (10 Tiny / 11) para software propietario
- [ ] Configurar USB passthrough automático

### Redmi A5
- [x] Chip identificado: Unisoc T7250, modelo 25028RN03
- [x] ROM descargada: `A15.0.26.0.VGWMIXM` (~4.54 GB)
- [ ] Handshake FDL1/FDL2 para desbloquear BROM
- [ ] Flasheo completo

---

## 📦 Stack instalado (15/06/2026)

```bash
sudo pacman -S qemu-full libvirt virt-manager virt-install virt-viewer dnsmasq
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER
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
| Redmi A5 (Unisoc) | sfd_tool nativo Arch | ❌ No |
| Samsung (Knox) | Software propietario | ✅ Sí |

---

## ⏭️ Pendientes

- [ ] Verificar integridad ROM tras descarga
- [ ] Extraer FDL1/FDL2 del paquete
- [ ] Crear VM Windows en virt-manager
- [ ] Configurar USB passthrough
- [ ] Flashear Redmi A5 en modo BROM
- [ ] Documentar reinstalación Samsung (Madre)
