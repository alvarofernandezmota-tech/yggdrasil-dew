# CONTEXT — Estado actual del sistema

> **Última actualización:** 12 junio 2026, 20:31 CEST
> **Actualizar:** al inicio y cierre de cada sesión de trabajo.

---

## 📍 Dónde estamos ahora

**`input-leap-git` instalado y configurado. Ambos equipos reiniciados limpio.**
Verificación remota en curso (SSH desde exterior). Test físico pendiente al volver.

---

## ✅ Completado hoy (12 jun 2026)

| Bloque | Estado |
|---|---|
| Repo `personal-v2` estructurado al completo | ✅ |
| Sistema de agentes Perplexity + Gemini | ✅ |
| Tailscale Madre (`100.91.112.32`) + Acer (`100.86.119.102`) | ✅ |
| SSH Madre → Acer operativo | ✅ |
| UFW Zero Trust en Acer | ✅ |
| Diagnóstico error `InputCapture` versión estable | ✅ |
| `input-leap-git` instalado desde AUR | ✅ |
| `input-leap.conf` creado en Madre | ✅ |
| Servicio `systemd` habilitado en Madre | ✅ |
| `xdg-desktop-portal-hyprland` en `hyprland.conf` | ✅ |
| Reinicio limpio ambos equipos | ✅ |
| Verificación SSH remota | ⚡ En curso |
| Test físico ratón saltando | ⏳ Al volver |

---

## 🚧 Pendiente — próxima sesión

### KVM (prioridad 1)
- [ ] Confirmar `systemctl --user status input-leap.service` activo
- [ ] Confirmar `busctl | grep InputCapture` devuelve la interfaz
- [ ] Test físico: ratón saltando Madre ↔ Acer
- [ ] Si OK → Fase 5 (SSH Ed25519)

### Repo
- [ ] Migrar contenido `personal` → `yo/`, `formacion/`, `proyectos/`
- [ ] `.gitignore` con datos sensibles
- [ ] Crear `tracking/` con TRACKING-MAESTRO.md

---

## 🖥️ Infraestructura actual

| Máquina | IP Tailscale | Estado |
|---|---|---|
| **Madre** | `100.91.112.32` | ✅ reiniciada — input-leap-git activo |
| **Acer** | `100.86.119.102` | ✅ reiniciado — cliente listo |
| **MacBook** | pendiente | ⏳ Fase 7 |

---

## 🤖 Agentes activos

| Agente | Rol |
|---|---|
| **Perplexity** | Acción sobre GitHub, estructurar, documentar, subir |
| **Gemini** | Entrada: voz, visual, docs largos, troubleshooting técnico |

---

## 🎯 Objetivo 2026

**Conseguir trabajo antes de que acabe el año.**

---

## 📁 Estado del repo

```
personal-v2/
├── README.md              ✅
├── AGENT.md               ✅
├── CONTEXT.md             ✅ (este archivo)
├── CHANGELOG.md           ✅
├── filosofia.md           ✅
├── agentes/               ✅ perplexity + gemini + prompts
├── diarios/2026/          ✅ 2026-06-12.md completo
├── setup/servidor/        ✅ plan-maestro + README + configs
├── yo/                    ⏳ pendiente migrar
├── formacion/             ⏳ pendiente migrar
├── proyectos/             ⏳ pendiente migrar
└── tracking/              ❌ no creada aún
```

---

_Diario de hoy: `diarios/2026/2026-06-12.md`_
