# Tailscale — Red Privada Zero Trust

> Red mesh entre Madre y Acer con IPs estables 100.x.x.x.
> **Frecuencia de actualización: al cambiar nodos o IPs.**
> Última actualización: 12 junio 2026

---

## IPs reales (fijadas 12 jun 2026)

| Nodo | IP Tailscale | Rol |
|---|---|---|
| **Madre** | `100.91.112.32` | Workstation + Input Leap server |
| **Acer** | `100.86.119.102` | Soporte 24/7 + Input Leap client |

---

## Instalación (Arch Linux)

```bash
sudo pacman -Syu tailscale --noconfirm
sudo systemctl enable --now tailscaled.service
sudo tailscale up
```

### Fix: NeedsLogin
```bash
sudo tailscale up --force-reauth
tailscale ip -4
```

### Verificar interconexión
```bash
tailscale status
ping -c 3 100.86.119.102  # desde Madre
```

---

## Fase 2 — Headscale (self-hosted)

Tailscale usa servidores de coordinación propietarios.
En Fase 2 se sustituye por **Headscale** (open source, self-hosted en Acer).
Los clientes Tailscale siguen funcionando — solo cambia el servidor de coordinación.

---

_Open source: Tailscale cliente (BSD) · Headscale servidor (MIT)_
