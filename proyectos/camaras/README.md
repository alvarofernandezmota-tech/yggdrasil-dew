---
id: 202406242256
fecha: 2026-06-24
tipo: proyecto
status: pendiente
repo: camaras
tags: [proyecto, #repo/camaras, docker, seguridad, nvr, frigate]
sync: true
---

# Proyecto: camaras (nombre a confirmar)

- **Repo**: pendiente crear — privado obligatorio
- **Descripción**: Sistema NVR cámaras seguridad homelab — grabacion, detección, alertas
- **Hardware objetivo**: Madre o Raspberry Pi dedicada

## Stack Docker candidato

| Opción | Contenedor | Pros | Contras |
|---|---|---|---|
| **Frigate NVR** | frigate | IA detección objetos, Coral TPU, HomeAssistant | necesita GPU/TPU para IA |
| **MotionEye** | motioneye | simple, ligero, sin IA | sin detección inteligente |
| **Shinobi** | shinobicctv | UI completa, multi-camara | más pesado |
| **go2rtc** | go2rtc | solo RTSP bridge, muy ligero | no NVR completo |

**Recomendación**: Frigate (con CPU, sin Coral) para tener base de IA aunque sea lenta.

## Estado
- ❓ Pendiente confirmar nombre del repo
- ❓ Pendiente decidir stack
- ❌ Repo no creado aún

## Pendiente
- [ ] Decidir nombre: `camaras`, `nvr-stack`, `homelab-cameras`
- [ ] Elegir stack: Frigate vs MotionEye
- [ ] Crear repo privado
- [ ] Documentar en ECOSISTEMA.md + CONTEXT.md

## Links
- [[ECOSISTEMA]] · [[setup/servidor/README]]
