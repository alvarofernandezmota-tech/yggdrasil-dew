# UFW — Firewall en Acer

> Última actualización: 12 junio 2026

---

## Estado

| Item | Estado |
|---|---|
| UFW en Acer | ✅ Activo |
| Política | Zero Trust: `deny incoming` por defecto |

---

## Reglas activas

| Puerto | Protocolo | Servicio | Desde |
|---|---|---|---|
| `22` | TCP | SSH | Solo `100.91.112.32` (Madre) |
| `5900` | TCP | VNC | LAN local |
| Todo lo demás | — | BLOQUEADO | — |

---

## Comandos útiles

```bash
sudo ufw status verbose
sudo ufw allow from 100.91.112.32 to any port 22
sudo ufw deny incoming
sudo ufw enable
```

---

_Volver al índice: [README.md](README.md)_
