# Tailscale — VPN mesh

> Última actualización: 12 junio 2026

---

## Qué es y para qué sirve

Tailscale crea una red privada virtual entre todos tus equipos.
Cada máquina recibe una IP fija `100.x.x.x` que funciona desde cualquier red.

> ⚠️ Tailscale es la **VPN**. No es el escritorio remoto. No es SSH. Es la capa de red que los hace posibles desde fuera de casa.

---

## IPs permanentes

| Máquina | IP Tailscale |
|---|---|
| **Madre** | `100.91.112.32` |
| **Acer** | `100.86.119.102` |
| **MacBook** | pendiente |

---

## Estado

| Máquina | Estado |
|---|---|
| Madre | ✅ Activo |
| Acer | ✅ Activo |

---

## Comandos útiles

```bash
tailscale status          # ver nodos conectados
tailscale ping 100.91.112.32   # comprobar conectividad
sudo tailscale up         # activar
sudo tailscale down       # desactivar
```

---

_Volver al índice: [README.md](README.md)_
