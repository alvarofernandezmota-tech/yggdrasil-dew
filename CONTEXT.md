# CONTEXT.md — Estado actual del sistema

> Actualizar al inicio de cada sesión con una IA.
> Última actualización: **14 junio 2026 · 00:10 CEST**

---

## Equipos

| Máquina | Rol | IP Tailscale | IP Local | Estado |
|---|---|---|---|---|
| **Madre** | Servidor — torre fija | `100.91.112.32` | `10.134.31.228` | ✅ Operativa, sshd activo |
| **Acer (Theodora)** | Cliente — portátil | `100.86.119.102` | `10.134.31.171` | ✅ Operativo |

---

## Bloqueante actual

```
AP Isolation en el router bloquea tráfico UDP entre Madre y Acer.
Impide que lan-mouse funcione por red local.
Requiere acceso al panel de configuración del router.
```

---

## Estado del servidor — Pirámide de Resiliencia

| Capa | Objetivo | Estado |
|---|---|---|
| 0 — Acceso | sshd + wayvnc + Tailscale | ✅ Tailscale ✅ · SSH ✅ (activo desde 14 jun) |
| 1 — Blindaje | UFW + fail2ban | ⚠️ UFW Acer ✅ · Madre ⏳ pendiente |
| 2 — Auditoría | lynis + journald + btop | ⏳ Pendiente |
| 3 — Aislamiento | Docker + contenedores | ✅ Docker Madre operativo |

---

## Servicios instalados (estado real)

| Servicio | Host | Estado |
|---|---|---|
| Tailscale | Madre + Acer | ✅ Activo |
| sshd | Madre | ✅ Activo (desde 14 jun 2026) |
| wayvnc | Madre | ⚠️ Instalado, sin autostart |
| UFW | Acer | ✅ Activo |
| UFW | Madre | ⏳ Pendiente |
| whisrs | Acer | ✅ Instalado, Super+V |
| lan-mouse | Madre + Acer | ⚠️ Config lista, bloqueado por AP Isolation |
| Docker | Madre | ✅ Operativo |
| THDORA | Madre | ✅ En producción (v0.16.4) |
| Ollama | Madre | ⏳ Pendiente |
| PostgreSQL | Madre | ⏳ Pendiente |
| Pi-hole | Madre | ⏳ Pendiente |
| Uptime Kuma | Madre | ⏳ Pendiente |

---

## Proyectos activos

| Proyecto | Repo | Estado | Próximo paso |
|---|---|---|---|
| **THDORA** | [thdora](https://github.com/alvarofernandezmota-tech/thdora) | ✅ v0.16.4 en producción | Fix `TimedOut` NLP |
| **personal-v2** | [personal-v2](https://github.com/alvarofernandezmota-tech/personal-v2) | ✅ Activo | Diario diario |
| **Python** | — | ⏳ Pendiente retomar | **Mañana sí o sí** |

---

## Contexto para IAs

- **Usuario:** Alvaro — arquitecto de sistemas en desarrollo (Arch Linux / Omarchy)
- **Entorno:** Red P2P Tailscale, Hyprland/Wayland, Docker en Madre
- **Enfoque:** Sistemas, automatización, agentes IA personales, documentación exhaustiva
- **Flujo IA:** Gemini (voz/visual) → Álvaro revisa → Perplexity estructura y sube a GitHub
- **Regla:** Si no está en el repo, no existe
- **THDORA:** Bot Telegram en Madre. NLP con Groq `llama-3.3-70b-versatile`. Fix `TimedOut` pendiente.
- **Python:** Estudio pendiente — prioridad máxima para el 15 jun

---

_Ver plan de tareas: [setup/servidor/plan-maestro.md](setup/servidor/plan-maestro.md)_
_Ver proyectos: [proyectos/thdora.md](proyectos/thdora.md)_
_Última actualización: 14 junio 2026 — 00:10 CEST_
