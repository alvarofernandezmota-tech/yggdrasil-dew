# fail2ban — Protección contra intrusiones

> Última actualización: 13 junio 2026
> Host: Madre | Estado: ✅ Activo

---

## Estado

| Item | Estado |
|---|---|
| fail2ban instalado | ✅ |
| systemd enable --now | ✅ |
| jail.local creado | ✅ `/etc/fail2ban/jail.local` |
| jail sshd activo | ✅ `Currently banned: 0` |

---

## Instalación (desde Acer vía SSH)

```bash
ssh -t madre "sudo pacman -S --noconfirm fail2ban && sudo systemctl enable --now fail2ban"
```

## Configuración jail.local

```bash
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
> - `bantime 1h` — ban de 1 hora
> - `findtime 10m` — ventana de tiempo
> - `maxretry 5` — máximo 5 intentos fallidos

## Verificar estado

```bash
# Esperar 3s tras restart antes de consultar (timing del socket)
sleep 3 && sudo fail2ban-client status sshd
```

Salida esperada:
```
Status for the jail: sshd
|- Currently failed: 0
|- Currently banned: 0
`- Journal matches: _SYSTEMD_UNIT=sshd.service + _COMM=sshd
```

## ⚠️ Problema conocido: socket error tras restart

```
ERROR Failed to access socket path: /var/run/fail2ban/fail2ban.sock. Is fail2ban running?
```

**Causa**: `fail2ban-client` ejecutado demasiado rápido tras `systemctl restart` — el socket aún no existe.
**Solución**: `sleep 3 && sudo fail2ban-client status sshd`

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
