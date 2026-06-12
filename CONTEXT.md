# CONTEXT — Estado actual del sistema

> **Última actualización:** 12 junio 2026, 21:29 CEST

---

## 📍 Dónde estamos ahora

**VNC operativo.** `wayvnc` (Madre) + `tigervnc` (Acer) funcionando sobre Tailscale.
Input Leap abandonado con diagnóstico completo documentado.

---

## ✅ Completado hoy (12 jun 2026)

| Bloque | Estado |
|---|---|
| `personal-v2` estructurado al completo | ✅ |
| Sistema de agentes Perplexity + Gemini | ✅ |
| Tailscale Madre + Acer | ✅ |
| SSH Madre → Acer | ✅ |
| UFW Zero Trust Acer | ✅ |
| Input Leap — instalado, diagnosticado, abandonado | ✅ |
| **VNC operativo (wayvnc + tigervnc)** | ✅ |
| Repo alineado al 100% | ✅ |

---

## 🚧 Pendiente — próxima sesión

- [ ] Evaluar `systemd` para wayvnc automático
- [ ] Fase 6: SSH Ed25519
- [ ] Migrar `yo/`, `formacion/`, `proyectos/`
- [ ] Crear `tracking/`

---

## 🖥️ Infraestructura

| Máquina | IP Tailscale | Estado |
|---|---|---|
| **Madre** | `100.91.112.32` | ✅ wayvnc activo |
| **Acer** | `100.86.119.102` | ✅ tigervnc cliente |
| **VNC** | `100.91.112.32:5900` | ✅ operativo |

---

## 🤖 Agentes

| Agente | Rol |
|---|---|
| **Perplexity** | Documenta, estructura, sube al repo |
| **Gemini** | Troubleshooting técnico, voz, visual |

---

## 🎯 Objetivo 2026

**Conseguir trabajo antes de que acabe el año.**

---

## 📁 Estado del repo

```
personal-v2/
├── README.md              ✅
├── AGENT.md               ✅
├── CONTEXT.md             ✅
├── CHANGELOG.md           ✅
├── filosofia.md           ✅
├── agentes/               ✅
├── diarios/2026/          ✅ 2026-06-12.md completo
├── setup/servidor/        ✅ plan-maestro + vnc + README_CONNECT
├── yo/                    ⏳
├── formacion/             ⏳
├── proyectos/             ⏳
└── tracking/              ❌
```

_Diario: `diarios/2026/2026-06-12.md`_
