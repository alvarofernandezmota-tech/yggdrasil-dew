# Red LAN — Mapa de red y puertos

> Mapa completo de la red doméstica: IPs, puertos, servicios.
> **Frecuencia de actualización: al cambiar IPs o añadir servicios.**
> Última actualización: 12 junio 2026

---

## IPs Tailscale (permanentes)

| Máquina | IP Tailscale | Rol |
|---|---|---|
| **Madre** | `100.91.112.32` | Workstation + Input Leap server |
| **Acer** | `100.86.119.102` | Soporte 24/7 + puerta exterior |
| **MacBook** | pendiente | Cliente opcional |

## IPs LAN (DHCP — pueden cambiar)

| Máquina | IP LAN | Nota |
|---|---|---|
| Acer | `10.176.119.171` | Fijar por MAC en router (pendiente) |
| MacBook | `10.176.119.229` | DHCP |
| Madre | pendiente | DHCP |

> **Usar siempre IPs Tailscale** para servicios — son estables.
> IPs LAN solo para diagnóstico local.

---

## Puertos abiertos en Acer (UFW)

| Puerto | Protocolo | Servicio | Desde |
|---|---|---|---|
| `22` | TCP | SSH | Solo `100.91.112.32` (Madre) |
| `24800` | TCP | Input Leap | Solo `100.91.112.32` (Madre) |
| Todo lo demás | — | BLOQUEADO | — |

---

## Servicios planificados (Fase 3)

| Puerto | Servicio | Máquina |
|---|---|---|
| `5432` | PostgreSQL | Acer |
| `53` | Pi-hole DNS | Acer |
| `3000` | Open WebUI | Madre |
| `11434` | Ollama API | Madre |

---

_Regla: ningún puerto abierto al mundo. Todo vía Tailscale._
