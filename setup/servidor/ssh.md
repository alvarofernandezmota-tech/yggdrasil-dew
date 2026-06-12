# SSH — Acceso remoto por terminal

> Última actualización: 12 junio 2026

---

## Estado

| Item | Estado |
|---|---|
| `sshd` en Madre | ⚠️ Sin verificar — dio `Connection refused` el 12 jun |
| Auth por password | ✅ Activo (pendiente migrar a Ed25519) |
| Puerto | `22` |
| Acceso desde Acer | Por Tailscale: `ssh varo@100.91.112.32` |

---

## Arrancar y fijar sshd en Madre

```bash
sudo systemctl enable --now sshd
sudo systemctl status sshd
```

---

## Conectar desde Acer

```bash
# Por Tailscale (desde cualquier red)
ssh varo@100.91.112.32

# Por LAN (en casa)
ssh varo@<IP_LAN_MADRE>
```

---

## Túmel SSH para VNC externo

```bash
# Abrir túmel + lanzar visor en un comando
ssh -L 5900:localhost:5900 -f -N varo@100.91.112.32 && vncviewer localhost:5900
```

---

## Fase siguiente — SSH seguro (Ed25519)

```bash
# Generar clave en Acer
ssh-keygen -t ed25519 -C "acer"

# Copiar a Madre
ssh-copy-id -i ~/.ssh/id_ed25519.pub varo@100.91.112.32

# Deshabilitar password auth en Madre
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
```

---

_Volver al índice: [README.md](README.md)_
