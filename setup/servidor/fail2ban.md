# fail2ban — Protección contra intrusiones

> Última actualización: 13 junio 2026
> Host: Madre

---

## Estado

| Item | Estado |
|---|---|
| fail2ban en Madre | ✅ Instalado y activo |
| jail sshd | ✅ Vigilando SSH |
| Configuración jail.local | ✅ Aplicada |

---

## Instalación (desde Acer vía SSH)

```bash
ssh -t madre "sudo pacman -S --noconfirm fail2ban && sudo systemctl enable --now fail2ban"
```

## Configuración jail.local

```bash
# En Madre
sudo bash -c 'cat > /etc/fail2ban/jail.local << EOF
[DEFAULT]
bantime  = 1h
findtime = 10m
maxretry = 5

[sshd]
enabled = true
port    = ssh
EOF'
sudo systemctl restart fail2ban
```

> Parámetros:
> - `bantime 1h` — ban de 1 hora tras superar intentos
> - `findtime 10m` — ventana de tiempo para contar fallos
> - `maxretry 5` — máximo 5 intentos fallidos antes de banear

## Verificar que funciona

```bash
sudo fail2ban-client status sshd
# Debe mostrar:
# Currently failed: 0
# Currently banned: 0
# Journal matches: _SYSTEMD_UNIT=sshd.service
```

## Comandos útiles

```bash
# Ver IPs baneadas
sudo fail2ban-client status sshd

# Desbanear una IP
sudo fail2ban-client set sshd unbanip <IP>

# Ver logs en tiempo real
sudo journalctl -u fail2ban -f

# Estado del servicio
sudo systemctl status fail2ban
```

---

_Ver también: [ufw.md](ufw.md) · [ssh.md](ssh.md) · [rescate.md](rescate.md)_
_Volver al índice: [README.md](README.md)_
