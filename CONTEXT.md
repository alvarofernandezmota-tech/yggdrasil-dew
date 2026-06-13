# CONTEXT.md — Estado actual del sistema

> Actualizar al inicio de cada sesión con una IA.
> Última actualización: 13 junio 2026 · 02:25 CEST

---

## Equipos

| Máquina | Rol | IP Tailscale | Estado |
|---|---|---|---|
| **Madre** | Servidor — torre fija | `100.91.112.32` | ⚠️ Online pero sin sshd activo |
| **Acer** | Cliente — portátil | `100.86.119.102` | ✅ Operativo |

---

## Bloqueante actual

```
sshd en Madre no está activo ni configurado para arrancar.
Requiere acceso físico una única vez para resolverlo.
```

Protocolo completo: [setup/servidor/rescate.md](setup/servidor/rescate.md)
Post-mortem: [setup/servidor/incidencia-acceso-madre.md](setup/servidor/incidencia-acceso-madre.md)

---

## Próxima acción (P1 — mañana físico en Madre)

```bash
# 1. Físico en Madre:
sudo systemctl enable --now sshd

# 2. Desde Acer:
ssh-copy-id varo@100.91.112.32
ssh varo@100.91.112.32 'bash <(curl -s https://raw.githubusercontent.com/alvarofernandezmota-tech/personal-v2/main/setup/servidor/scripts/bootstrap-madre.sh)'
```

---

## Estado del servidor — Pirámide de Resiliencia

| Capa | Objetivo | Estado |
|---|---|---|
| 0 — Acceso | sshd + wayvnc + Tailscale | ⚠️ Tailscale ✅ · SSH 🔴 |
| 1 — Blindaje | UFW + fail2ban | ⚠️ UFW Acer ✅ · Madre 🔴 |
| 2 — Auditoría | lynis + journald + btop | ⏳ Pendiente |
| 3 — Aislamiento | Docker + contenedores | ⏳ Pendiente |

---

## Servicios instalados (estado real)

| Servicio | Host | Estado |
|---|---|---|
| Tailscale | Madre + Acer | ✅ Activo |
| sshd | Madre | 🔴 No activo |
| wayvnc | Madre | ⚠️ Instalado, sin autostart |
| UFW | Acer | ✅ Activo |
| UFW | Madre | ⏳ Pendiente |
| whisrs | Acer | ✅ Instalado |
| Docker | Madre | ⏳ Pendiente |
| Ollama | Madre | ⏳ Pendiente |
| PostgreSQL | Madre | ⏳ Pendiente |
| Pi-hole | Madre | ⏳ Pendiente |
| Uptime Kuma | Madre | ⏳ Pendiente |
| THDORA | Acer | ⚠️ Migrar a Madre |

---

## Contexto para IAs

- **Usuario:** Arquitecto de sistemas en desarrollo (Arch Linux)
- **Entorno:** Red P2P Tailscale, Hyprland/Wayland
- **Enfoque:** Seguridad defensiva, virtualización, documentación exhaustiva
- **Flujo IA:** Gemini (voz/visual) → Álvaro revisa → Perplexity estructura y sube
- **Regla:** Si no está en el repo, no existe

---

_Ver plan de tareas: [setup/servidor/plan-maestro.md](setup/servidor/plan-maestro.md)_
_Ver arquitectura completa: [setup/servidor/arquitectura.md](setup/servidor/arquitectura.md)_
