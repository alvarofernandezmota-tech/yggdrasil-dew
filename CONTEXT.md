# CONTEXT — Estado actual del sistema

> **Última actualización:** 12 junio 2026, 18:42 CEST
> **Actualizar:** al inicio y cierre de cada sesión de trabajo.

---

## 📍 Dónde estamos ahora

**Bloqueo activo:** Input Leap en Madre no funciona por incompatibilidad con el portal InputCapture de Wayland/Hyprland.
**Plan listo:** instalar `input-leap-git` (AUR) que incluye parches libei/InputCapture.
**Pendiente confirmar:** si Madre tiene `yay` o `paru` instalado.

---

## ✅ Última sesión (12 jun 2026)

| Bloque | Estado |
|---|---|
| Auditoría `personal` (repo madre) | ✅ |
| Estructura definitiva `personal-v2` | ✅ |
| Sistema de agentes documentado | ✅ |
| Tailscale Madre + Acer operativos | ✅ |
| Input Leap CLIENT en Acer | ✅ |
| UFW Zero Trust en Acer | ✅ |
| Input Leap SERVER en Madre | ⚠️ Bloqueado — portal Wayland |
| Diagnóstico + plan de ruta documentado | ✅ |

---

## 🚧 Pendiente — próxima sesión

### Input Leap en Madre (prioridad 1)
- [ ] `which yay || which paru` — confirmar gestor AUR
- [ ] `yay -S input-leap-git` (o paru / manual)
- [ ] Verificar lanzando binario manualmente (sin systemd)
- [ ] Reconstruir `.service` con variables portal si funciona

### Servidor — Fase 2
- [ ] TLS en Input Leap
- [ ] fail2ban en Acer
- [ ] Auditoría Docker en Acer
- [ ] Headscale self-hosted
- [ ] dotfiles / omarchy sync Madre ↔ Acer
- [ ] MacBook como tercer nodo

### Repo
- [ ] Migrar contenido de `personal` → `yo/`, `formacion/`, `proyectos/`
- [ ] `.gitignore` con datos sensibles
- [ ] Crear `tracking/` con TRACKING-MAESTRO.md

---

## 🖥️ Infraestructura actual

| Máquina | IP Tailscale | Rol | Estado |
|---|---|---|---|
| **Madre** | `100.91.112.32` | Workstation + Input Leap server | ⚠️ Input Leap bloqueado |
| **Acer** | `100.86.119.102` | Soporte 24/7 + Input Leap client | ✅ |
| **MacBook** | pendiente | Cliente | ⏳ Fase 2 |

---

## 🤖 Agentes activos

| Agente | Rol | Doc |
|---|---|---|
| **Perplexity** | Acción sobre GitHub, estructurar, subir | `agentes/perplexity.md` |
| **Gemini** | Entrada: voz, visual, docs largos, diseño | `agentes/gemini.md` |

---

## 🎯 Objetivo 2026

**Conseguir trabajo antes de que acabe el año.**
Eje principal: empleabilidad. Todo lo demás (servidor, proyectos, formación) sirve a este objetivo.

---

## 📁 Estado del repo

```
personal-v2/
├── README.md        ✅
├── AGENT.md         ✅
├── CONTEXT.md       ✅ (este archivo)
├── CHANGELOG.md     ✅
├── filosofia.md     ✅
├── agentes/         ✅ perplexity + gemini + prompts
├── diarios/2026/    ✅ 2026-06-12.md completo
├── setup/servidor/  ✅ Fase 1 documentada
├── yo/              ⏳ pendiente migrar
├── formacion/       ⏳ pendiente migrar
—── proyectos/       ⏳ pendiente migrar
└── tracking/        ❌ no creada aún
```

---

_Diario de hoy: `diarios/2026/2026-06-12.md`_
