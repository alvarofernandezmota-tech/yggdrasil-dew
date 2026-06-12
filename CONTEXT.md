# CONTEXT — Estado actual del sistema

> **Última actualización:** 12 junio 2026, 21:16 CEST

---

## 📍 Dónde estamos ahora

**Input Leap bloqueado definitivamente.** No es compatible con Hyprland sin portales que aún no existen de forma estable.
**Siguiente:** probar `lan-mouse` (nativo libei, sin portales D-Bus).

---

## ✅ Completado hoy

| Bloque | Estado |
|---|---|
| `personal-v2` estructurado al completo | ✅ |
| Tailscale Madre + Acer | ✅ |
| SSH Madre → Acer | ✅ |
| UFW Zero Trust Acer | ✅ |
| `input-leap-git` instalado y configurado | ✅ |
| Diagnóstico definitivo Input Leap | ✅ |
| Alternativas documentadas | ✅ |

---

## 🚧 Pendiente — próxima sesión

### KVM (prioridad 1)
- [ ] Probar `lan-mouse`: `yay -S lan-mouse`
- [ ] Si falla → probar `barrier-git`
- [ ] Si falla → modo X11 forzado (parche temporal)

### Repo
- [ ] Migrar `yo/`, `formacion/`, `proyectos/`
- [ ] Crear `tracking/`
- [ ] `.gitignore` datos sensibles

---

## 🖥️ Infraestructura

| Máquina | IP Tailscale | Estado |
|---|---|---|
| **Madre** | `100.91.112.32` | ✅ Tailscale + SSH |
| **Acer** | `100.86.119.102` | ✅ Tailscale + UFW |
| KVM | — | ❌ bloqueado — evaluando alternativas |

---

## 🎯 Objetivo 2026

**Conseguir trabajo antes de que acabe el año.**

---

_Diario: `diarios/2026/2026-06-12.md` · Plan: `setup/servidor/plan-maestro.md`_
