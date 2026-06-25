# ADB Móvil Hotspot — Experimentación

**Estado:** 💡 Idea  
**Prioridad:** Baja — entretenido pero no urgente

---

## Qué se puede hacer con ADB desde varopc

- Controlar el móvil por USB desde terminal
- Scripting de acciones Android
- Monitorizar batería, señal, temperatura
- Automatizar configuraciones del hotspot
- Experimentar con funciones ocultas de Android

## Para empezar

```bash
# Instalar ADB en varopc
sudo pacman -S android-tools

# Activar modo desarrollador en móvil
# Ajustes → Sobre el teléfono → Número de compilación x7

# Activar depuración USB
# Ajustes → Opciones desarrollador → Depuración USB

# Verificar conexión
adb devices
```

## Ideas a explorar
- [ ] Control hotspot desde script
- [ ] Monitor de señal automático
- [ ] Automatizar encendido/apagado hotspot con n8n
