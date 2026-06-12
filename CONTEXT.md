# CONTEXT — Estado actual del sistema

> **Última actualización:** 12 junio 2026, 19:23 CEST
> **Actualizar:** al inicio y cierre de cada sesión de trabajo.

---

## 📍 Dónde estamos ahora

**`input-leap-git` instalado. Ambos equipos reiniciados limpio.**
Test de verificación remota pendiente desde el parque (SSH).
Al volver: test físico del ratón saltando entre pantallas.

---

## ✅ Completado hoy (12 jun 2026)

| Bloque | Estado |
|---|---|
| Repo `personal-v2` estructurado al completo | ✅ |
| Sistema de agentes documentado | ✅ |
| Tailscale Madre + Acer operativos | ✅ |
| Diagnóstico bloqueo `InputCapture` | ✅ |
| `input-leap-git` instalado desde AUR | ✅ |
| Portal Hyprland configurado en `hyprland.conf` | ✅ |
| Servicio systemd habilitado en Madre | ✅ |
| Reinicio limpio ambos equipos | ✅ |
| Test físico KVM | ⏳ al volver del parque |

---

## 🚧 Pendiente — próxima sesión

### KVM (prioridad 1 — al volver)
- [ ] SSH a Madre: `ssh varo@100.91.112.32`
- [ ] `systemctl --user status input-leap.service`
- [ ] `busctl --user introspect ... | grep InputCapture`
- [ ] Test físico: ratón saltando Madre ↔ Acer
- [ ] Si OK → Fase 5 (SSH Ed25519)

### Repo
- [ ] Migrar contenido `personal` → `yo/`, `formacion/`, `proyectos/`
- [ ] `.gitignore` datos sensibles
- [ ] Crear `tracking/`

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
| **Perplexity** | Acción sobre GitHub, estructurar, subir |
| **Gemini** | Entrada: voz, visual, docs largos, troubleshooting |

---

## 🎯 Objetivo 2026

**Conseguir trabajo antes de que acabe el año.**

---

## 📁 Estado del repo

```
personal-v2/
├── README.md        ✅
├── AGENT.md         ✅
├── CONTEXT.md       ✅ (este archivo)
├── CHANGELOG.md     ✅
├── filosofia.md     ✅
├── agentes/         ✅
├── diarios/2026/    ✅ 2026-06-12.md completo
├── setup/servidor/  ✅ plan-maestro + Fase 1-2 documentadas
├── yo/              ⏳
├── formacion/       ⏳
├── proyectos/       ⏳
└── tracking/        ❌
```

_Diario de hoy: `diarios/2026/2026-06-12.md`_
