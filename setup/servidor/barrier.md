# Input Leap — Teclado/Ratón Compartido

> Teclado y ratón de Madre controlando Acer (y MacBook) sin hardware extra.
> Protocolo: Input Leap sobre Tailscale (canal cifrado).
> **Frecuencia de actualización: al cambiar IPs o añadir nodos.**
> Última actualización: 12 junio 2026

---

## Arquitectura

```
Madre (100.91.112.32) ── Input Leap SERVER ──► Acer (100.86.119.102)
    teclado + ratón físicos                      recibe control
    pantalla izquierda                            pantalla derecha
```

Mover el ratón a la derecha de Madre → el cursor aparece en Acer.

---

## PARTE 1 — MADRE (servidor)

### 1. Archivo de configuración de pantallas

```bash
mkdir -p ~/.config/input-leap
nano ~/.config/input-leap/input-leap.conf
```

Contenido:

```
section: screens
    madre:
    acer:
end

section: links
    madre:
        right = acer
    acer:
        left = madre
end

section: options
    screenCorners = false
    halfDuplexCapsLock = false
    halfDuplexNumLock = false
    halfDuplexScrollLock = false
    xtestIsSynchronous = false
    switchCorners = none
    switchCornerSize = 0
end
```

### 2. Servicio systemd (usuario)

```bash
mkdir -p ~/.config/systemd/user
nano ~/.config/systemd/user/input-leaps.service
```

Contenido:

```ini
[Unit]
Description=Input Leap Server Daemon
After=graphical-session.target

[Service]
Type=simple
Environment=QT_QPA_PLATFORM=wayland
ExecStart=/usr/bin/input-leaps -c %h/.config/input-leap/input-leap.conf --address 0.0.0.0:24800 -f -n madre
Restart=on-failure

[Install]
WantedBy=graphical-session.target
```

### 3. Activar

```bash
systemctl --user daemon-reload
systemctl --user enable --now input-leaps.service
```

### Verificar

```bash
systemctl --user status input-leaps.service
journalctl --user -u input-leaps.service -f
```

---

## PARTE 2 — ACER (cliente)

Acceder por SSH desde Madre:
```bash
ssh varo@100.86.119.102
```

### 1. Servicio systemd (usuario)

```bash
mkdir -p ~/.config/systemd/user
nano ~/.config/systemd/user/input-leapc.service
```

Contenido:

```ini
[Unit]
Description=Input Leap Client Daemon
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/input-leapc -f -n acer 100.91.112.32:24800
Restart=on-failure

[Install]
WantedBy=graphical-session.target
```

### 2. Activar

```bash
systemctl --user daemon-reload
systemctl --user enable --now input-leapc.service
```

### Verificar

```bash
systemctl --user status input-leapc.service
journalctl --user -u input-leapc.service -f
```

---

## PARTE 3 — UFW en ACER (Zero Trust)

```bash
# Política por defecto: bloquear todo lo entrante
sudo ufw default deny incoming
sudo ufw default allow outgoing

# SSH solo desde Madre (IP Tailscale)
sudo ufw allow from 100.91.112.32 to any port 22 proto tcp comment 'SSH seguro desde Madre'

# Input Leap solo desde Madre
sudo ufw allow from 100.91.112.32 to any port 24800 proto tcp comment 'Input Leap desde Madre'

# Activar UFW
sudo systemctl enable --now ufw.service
sudo ufw enable

# Verificar
sudo ufw status verbose
```

---

## Estado

| Componente | Estado |
|---|---|
| Input Leap server en Madre | ✅ Activo |
| Input Leap client en Acer | ✅ Activo |
| UFW Zero Trust en Acer | ✅ Activo |

---

## Fase 2 — TLS

En Fase 2 se añade TLS con certificado self-signed (openssl) para cifrar el tráfico de Input Leap además del túmel Tailscale.

---

_Open source: Input Leap (GPL-2.0)_
