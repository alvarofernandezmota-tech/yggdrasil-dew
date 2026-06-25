---
title: "Inventario de Dispositivos Móviles"
fecha_creacion: 2026-06-25
estado: activo
tags:
  - hardware
  - android
  - inventario
  - mobile-security
---

# Inventario de Dispositivos Móviles

## Dispositivo 01 — Sin identificar (Xiaomi/Android)

| Campo | Valor |
|---|---|
| Serial ADB | `mvj78dnnljlzukk7` |
| Modelo | Xiaomi Redmi Note 11 (22101316G) |
| IP local (ethernet USB) | `10.28.231.115` |
| IP Tailscale | pendiente |
| Android Ver. | pendiente verificar |
| ADB autorizado | ✅ Sí |
| scrcpy verificado | ✅ Sí (USB + TCP) |
| Tailscale instalado | ❌ Pendiente |
| Root | ❌ No |

### Notas técnicas
- Conectado vía ethernet USB (interfaz `rndis0` en el móvil, `enp0s20f0u3` en el PC)
- IP del PC en esa red: `10.28.231.21`
- ADB TCP configurado en puerto `5555`
- scrcpy funciona con `-d` (USB) y `-e` (TCP)
- **Limitación**: ADB TCP no persiste tras reinicio sin root

### Próximos pasos
- [ ] Instalar Tailscale en el dispositivo
- [ ] Anotar IP MagicDNS de Tailscale aquí
- [ ] Verificar versión Android y SOC exacto
- [ ] Investigar CVEs del SOC
