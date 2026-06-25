# Guía ADB Android Completa — Gemini 2026-06-24

**Fuente:** Gemini  
**Estado:** 🔧 Pendiente revisar y ejecutar  
**Prioridad:** Media

---

## 1. Automatización base ADB

```bash
sudo systemctl start adb
adb shell svc wifi tether start
adb shell svc wifi tether stop
adb shell input keyevent 26
adb shell input text "TuTextoAqui"
adb shell input tap 500 1200
```

## 2. Monitorización

```bash
adb shell dumpsys battery | grep -E "level|temperature|status"
adb shell dumpsys telephony.registry | grep -i signalstrength
```

## 3. Enrutamiento y traffic shaping

```bash
adb shell ip route
sudo ip route add default via 192.168.42.129 dev usb0 metric 10
sudo wondershaper usb0 20480 5120
sudo wondershaper clear usb0
```

## 4. Persistencia hotspot y energía

```bash
adb shell settings put global soft_ap_timeout_enabled 0
adb shell settings put global stay_on_while_plugged_in 3
adb shell settings put global low_power 1
```

## 5. Congelación de apps

```bash
adb shell pm suspend com.instagram.android
adb shell pm suspend com.google.android.youtube
adb shell pm unsuspend com.instagram.android
adb shell cmd appops set com.whatsapp RUN_IN_BACKGROUND ignore
```

## 6. Herramientas open source

```bash
scrcpy --turn-screen-off --keyboard=uhid --max-fps=60
```

- **scrcpy** — espejo pantalla ultra baja latencia
- **Termux + Termux:API** — scripts nativos en Android + SSH
- **KDE Connect** — portapapeles compartido, Wayland/Hyprland

## 7. Optimización GPU móvil

```bash
adb shell wm size 720x1600
adb shell wm density 280
# Restaurar:
adb shell wm size reset
adb shell wm density reset
```

## 8. Regla udev Arch (automatización al conectar)

```
/etc/udev/rules.d/99-android-automation.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="TU_ID", ATTR{idProduct}=="TU_ID", ACTION=="add", RUN+="/usr/local/bin/android_init.sh"
```

## 9. Script maestro android_core.sh

```bash
#!/bin/bash
INTERFACE="usb0"
DOWNLOAD_LIMIT=20480
UPLOAD_LIMIT=5120
TEMP_LIMIT=40

adb wait-for-device
adb shell wm size 720x1600
adb shell wm density 280
adb shell svc wifi tether start
adb shell settings put global soft_ap_timeout_enabled 0
adb shell settings put global stay_on_while_plugged_in 3
adb shell settings put global low_power 1

BACKGROUND_APPS=("com.facebook.katana" "com.instagram.android" "com.google.android.youtube")
for app in "${BACKGROUND_APPS[@]}"; do
    adb shell pm suspend "$app" > /dev/null 2>&1
done

sudo wondershaper clear "$INTERFACE" > /dev/null 2>&1
sudo wondershaper "$INTERFACE" "$DOWNLOAD_LIMIT" "$UPLOAD_LIMIT"

scrcpy --turn-screen-off --keyboard=uhid --window-title="Android_Core" --window-width=450 &

while true; do
    RAW_TEMP=$(adb shell dumpsys battery | grep temperature | awk '{print $2}')
    REAL_TEMP=$((RAW_TEMP / 10))
    if [ "$REAL_TEMP" -gt "$TEMP_LIMIT" ]; then
        notify-send -u critical "ALERTA TÉRMICA" "${REAL_TEMP}°C — apagando tethering"
        adb shell svc wifi tether stop
        break
    fi
    sleep 30
done
```

---

## Pendiente
- [ ] Instalar: `sudo pacman -S android-tools scrcpy`
- [ ] Instalar wondershaper desde AUR
- [ ] Activar modo desarrollador en el móvil
- [ ] Obtener idVendor/idProduct con `lsusb`
- [ ] Adaptar INTERFACE con `ip a` cuando esté conectado
- [ ] Testear script maestro `android_core.sh`
