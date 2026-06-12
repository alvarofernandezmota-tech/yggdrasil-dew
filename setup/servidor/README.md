# Setup Servidor — Índice de aplicaciones

> Cada aplicación tiene su propio archivo. Lee este README primero.
> Última actualización: 12 junio 2026

---

## Arquitectura del sistema

```
Madre (Torre)  ──────────────────────  Acer (Portátil)
100.91.112.32                          100.86.119.102

  [Tailscale]  ←── VPN mesh P2P ──►  [Tailscale]
  [sshd]       ←── SSH (puerto 22) ── [ssh client]
  [wayvnc]     ←── VNC (LAN/túmel) ── [vncviewer]
```

---

## Aplicaciones instaladas

| App | Máquina | Para qué | Estado | Doc |
|---|---|---|---|---|
| **Tailscale** | Madre + Acer | VPN mesh — IPs permanentes entre equipos | ✅ Activo | [tailscale.md](tailscale.md) |
| **sshd** | Madre | Acceso remoto por terminal | ⚠️ Verificar | [ssh.md](ssh.md) |
| **UFW** | Acer | Firewall Zero Trust | ✅ Activo | [ufw.md](ufw.md) |
| **wayvnc** | Madre | Servidor escritorio remoto (Wayland nativo) | ✅ Activo en LAN | [vnc.md](vnc.md) |
| **tigervnc** | Acer | Cliente escritorio remoto | ✅ Instalado | [vnc.md](vnc.md) |
| **input-leap-git** | Madre + Acer | KVM (compartir ratón/teclado) | ❌ Abandonado | [input-leap.md](input-leap.md) |
| **Ollama** | Madre | LLM local (GTX 1060) | ⏳ Planificado | [ollama.md](ollama.md) |

---

## Capas de red — bien separadas

| Capa | Tecnología | Para qué | IP |
|---|---|---|---|
| **VPN mesh** | Tailscale | Conectar equipos desde cualquier red | `100.x.x.x` |
| **LAN local** | Router doméstico | Red en casa | `10.176.x.x` |
| **VNC en casa** | wayvnc + LAN | Escritorio remoto dentro de casa | IP LAN Madre |
| **VNC fuera** | wayvnc + túmel SSH/Tailscale | Escritorio remoto desde exterior | `100.91.112.32` |

> ⚠️ **Tailscale y VNC son cosas distintas.** Tailscale es la VPN. VNC es el escritorio remoto.
> VNC usa Tailscale como transporte solo cuando estás fuera de casa (túmel SSH).

---

## Pendiente urgente

- [ ] Verificar `sshd` activo en Madre: `sudo systemctl enable --now sshd`
- [ ] Fijar IP LAN de Madre por MAC en el router
- [ ] Probar túmel VNC sobre Tailscale desde exterior

---

_Plan maestro: [plan-maestro.md](plan-maestro.md)_
