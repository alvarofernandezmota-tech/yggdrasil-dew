---
tags: [setup, acer, monitorizacion, instalacion]
fecha-actualizacion: 2026-06-22
---

# 📊 Acer — Monitorización completa

> Todo lo necesario para tener el Acer 100% monitorizado.
> Ejecutar en orden desde SSH: `ssh varopc@100.86.119.102`

---

## 📦 Instalar herramientas de monitorización

```bash
# Actualización previa
sudo pacman -Syu

# Monitor visual avanzado (reemplaza htop)
sudo pacman -S btop

# Sensores temperatura CPU
sudo pacman -S lm_sensors
sudo sensors-detect --auto

# Monitor de red
sudo pacman -S nload

# Información hardware
sudo pacman -S inxi

# nmap (escaneo red)
sudo pacman -S nmap

# tmux (sesiones persistentes — SIEMPRE antes de trabajos largos)
sudo pacman -S tmux
```

---

## 💻 Monitorizar en tiempo real

```bash
# Dashboard visual completo (CPU, RAM, red, procesos, disco)
btop

# Temperatura CPU AMD Ryzen
sensors

# RAM y swap
free -h

# Disco
df -h
du -sh ~/*

# Red en tiempo real
nload wlan0

# Procesos por CPU
ps aux --sort=-%cpu | head -10

# Procesos por RAM
ps aux --sort=-%mem | head -10

# Uptime y carga
uptime

# Hardware completo
inxi -F
```

---

## 📝 Resumen estado Acer (1 comando)

Guardar como `~/ecocheck-acer.sh`:

```bash
#!/bin/bash
echo "============================="
echo " ACER — Estado $(date '+%H:%M %d/%m/%Y')"
echo "============================="
echo ""
echo "💻 CPU / RAM:"
top -bn1 | grep "Cpu(s)" | awk '{print " CPU: " $2 "%"}'
free -h | awk 'NR==2{print " RAM: " $3 " / " $2}'
echo ""
echo "💾 Disco:"
df -h / | awk 'NR==2{print " Uso: " $3 " / " $2 " (" $5 ")"}'
echo ""
echo "🌡️ Temperatura:"
sensors | grep -E 'Tctl|temp1' | head -3
echo ""
echo "📡 Red:"
ip addr show wlan0 | grep 'inet ' | awk '{print " IP WiFi: " $2}'
tailscale status | head -3
echo ""
echo "🔒 Seguridad:"
sudo ufw status | grep Status
sudo fail2ban-client status sshd | grep 'Currently banned'
echo "============================="
```

```bash
# Hacerlo ejecutable
chmod +x ~/ecocheck-acer.sh

# Ejecutar
~/ecocheck-acer.sh

# Añadir alias en ~/.zshrc
echo "alias ecocheck='~/ecocheck-acer.sh'" >> ~/.zshrc
source ~/.zshrc
```

---

## ⏳ Checklist instalación

- [ ] `btop` instalado
- [ ] `lm_sensors` instalado + configurado
- [ ] `nload` instalado
- [ ] `inxi` instalado
- [ ] `nmap` instalado
- [ ] `tmux` instalado
- [ ] `ecocheck-acer.sh` creado y con alias
- [ ] Tailscale activo y conectado

---

_Ver también: [[setup/acer]] · [[setup/dashboard]] · [[setup/obsidian-sync]]_
