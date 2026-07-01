---
tags: [estado, sistema, operativo, servicios, ahora]
fecha-actualizacion: 2026-07-01
hora: 05:09
---

# 📊 ESTADO DEL SISTEMA — 01 jul 2026 (05:09)

> Este archivo refleja el estado REAL operativo ahora mismo.
> Actualizar cada vez que cambie algo importante.

---

## 🖥️ Máquinas

| Máquina | Estado | Observaciones |
|---|---|---|
| **varopc (Madre)** | ✅ encendida y accesible | SSH OK · AP MadreAP activo · Tailscale `100.91.112.32` · IP local `10.48.234.18` |
| **Acer (theodora)** | ✅ operativo | Tailscale `100.86.119.102` · Netdata activo |
| **iPhone 11** | ✅ Tailscale activo | `100.81.187.99` |
| **Redmi A5** | ⚠️ Tailscale instalado — pendiente login | APK F-Droid 87MB instalado vía ADB ✅ |

---

## 🛠 Red

| Servicio | Estado | Detalle |
|---|---|---|
| Tailscale varopc | ✅ activo | `100.91.112.32` |
| Tailscale Acer | ✅ activo | `100.86.119.102` · relay `mad` |
| Tailscale iPhone 11 | ✅ activo | `100.81.187.99` |
| Tailscale Redmi A5 | ⚠️ instalado | App instalada — falta abrir y hacer login con cuenta Tailscale |
| **MadreAP (hostapd)** | ✅ estable | SSID: MadreAP · WPA2 · canal 6 · sin caídas |
| **dnsmasq DHCP** | ✅ activo | `192.168.72.50-150` · wlan0 |
| **UFW varopc** | ✅ activo | Reglas completas |
| **UFW Acer** | ✅ activo | Reglas completas |
| SSH hardening | ⚠️ parcial | `PasswordAuthentication no` ✅ · clave pública pendiente |

---

## 🐳 Docker — Estado varopc

### Stack base + OSINT — 14/14 CONTENEDORES UP ✅ (validado 01-jul 02:00 CEST)

| Contenedor | Puerto | Estado | Bloque |
|---|---|---|---|
| `ollama` | 11434 | ✅ healthy | IA |
| `ollama-embeddings` | 11435 | ✅ healthy | IA |
| `qdrant` | 6333 | ✅ healthy | IA |
| `open-webui` | 3001 | ✅ healthy | IA |
| `thdora` | 8000 | ✅ healthy | Bot |
| `thdora-bot` | — | ✅ healthy | Bot |
| `uptime-kuma` | 3002 | ✅ healthy | Obs |
| `portainer` | 9000 | ✅ up | Obs |
| `grafana` | 3000 | ✅ up | Obs |
| `prometheus` | 9090 | ✅ up | Obs |
| `n8n` | 5678 | ✅ up | Dev |
| `gitea` | 3003 | ✅ up | Dev |
| `code-server` | 8443 | ✅ up | Dev |
| `spiderfoot` | 5001 | ✅ UP | OSINT |

### 🔄 En descarga / pendiente levantar

| Contenedor | Puerto | Estado | Notas |
|---|---|---|---|
| `kali-pentest` | 6901 | ⏳ Descargando en tmux sesión `kali` | `kasmweb/kali-rolling-desktop:1.16.0` · 3.7GB total · caída de red interrumpió varias veces |
| `wazuh` | 1514/55000 | 🔜 pendiente | prereq `vm.max_map_count=262144` |
| `suricata` | — | 🔜 pendiente | modo pasivo en wlan0 |
| `defectdojo` | 8080 | 🔜 pendiente | depende de wazuh |

**Cuando Kali termine de descargar:**
```bash
# Verificar tmux activo:
tmux attach -t kali

# Verificar que levantó:
docker ps | grep kali
# Acceder:
# https://100.91.112.32:6901  — usuario: kasm_user  — pass: batcueva2026
```

> ⚠️ Usar siempre `tmux` para descargas largas en madre — la conexión de red cae y mata los procesos sin tmux.

### Modelos Ollama

| Modelo | Tamaño | Estado |
|---|---|---|
| `qwen2.5-coder:7b` | 4.7 GB | ✅ descargado |
| `qwen2.5:3b` | 1.9 GB | ✅ descargado |
| `llama3.1:8b` | 4.7 GB | ✅ descargado |
| `nomic-embed-text` | 274 MB | ✅ descargado |
| `bge-m3` | 1.2 GB | ✅ descargado |

---

## 🔐 Seguridad

| Servicio | varopc | Acer |
|---|---|---|
| fail2ban | ✅ activo · jail sshd | ✅ activo · jail sshd |
| UFW | ✅ activo | ✅ activo |
| SSH PasswordAuth | ✅ `no` | ✅ `no` |
| Puerto 53317 | ✅ cerrado | ✅ cerrado |
| Clave pública SSH | ❌ pendiente | ❌ pendiente |

### ⚠️ Hallazgos seguridad abiertos

| ID | Hallazgo | Riesgo | Estado |
|---|---|---|---|
| SEC-001 | **Puerto 21 FTP abierto en IP pública** `79.116.247.44` | 🟡 MEDIO | ❌ PENDIENTE cerrar |

**SEC-001 — Acción requerida:**
```bash
# 1. Entrar al router Digi:
ip route | grep default   # ver IP del router
# Abrir: http://192.168.X.X
# Buscar: USB / FTP Server / Administración → desactivar FTP

# 2. Verificar tras cerrar:
nmap -Pn --open -p 21 79.116.247.44
# Resultado esperado: filtered (no open)
```
> Ver detalle completo: `inbox/2026-07-01-hallazgo-ftp-puerto21.md`

---

## 📡 Monitorización

| Servicio | Estado | URL |
|---|---|---|
| Netdata varopc | ✅ activo | `http://100.91.112.32:19999` |
| Netdata Acer | ✅ activo | `http://100.86.119.102:19999` |
| Grafana | ✅ up | `http://100.91.112.32:3000` |
| Uptime Kuma | ✅ up | `http://100.91.112.32:3002` |
| Portainer | ✅ up | `http://100.91.112.32:9000` |

---

## 🤖 THDORA

| Componente | Estado |
|---|---|
| thdora (FastAPI) | ✅ healthy · v0.12.1 |
| thdora-bot | ✅ healthy |
| Handlers Telegram | ⚠️ básicos — no tocar hasta stack pentest estable |

---

## 📱 ADB / Redmi A5

| Acción | Estado | Notas |
|---|---|---|
| ADB USB conectado | ✅ | `mvj78dnnljlzukk7 device` |
| Depuración USB | ✅ activo | |
| Instalar vía USB (MIUI) | ✅ activo | Requiere verificación cuenta Mi al activar |
| `adb input keyevent` | ❌ bloqueado | `INJECT_EVENTS` denegado en Android 13+ MIUI |
| Tailscale APK | ✅ instalado | F-Droid 87MB · `adb install` → `Success` al 3er intento |
| Tailscale login | ⏳ pendiente | Abrir app físicamente y hacer login |
| ADB tcpip 5555 | ❌ falló | `error: closed` — pantalla bloqueada al intentarlo |

**Para ver pantalla sin display:**
```bash
adb shell screencap -p /sdcard/screen.png && adb pull /sdcard/screen.png ~/screen.png
# Copiar a theodora:
scp varo@10.48.234.18:~/screen.png /tmp/screen.png && xdg-open /tmp/screen.png
```

**Para abrir app por ADB:**
```bash
adb shell monkey -p com.tailscale.ipn 1
```

---

## 📂 Git

| Repo | Estado |
|---|---|
| yggdrasil-dew | ✅ sincronizado — 01-jul 05:09 CEST |
| `docker/madre/docker-compose.fase1.yml` | ✅ compose real validado |
| `osint-stack/docker-compose.kali.yml` | ✅ corregido (bridge, p6901) |
| `docs/infra/accesos-servicios.md` | ✅ todos los accesos documentados |
| `inbox/2026-07-01-hallazgo-ftp-puerto21.md` | ✅ hallazgo SEC-001 documentado |
| `tailscale-full.apk` | ❌ archivo vacío en repo — ignorar, usar F-Droid |

---

## 📋 Próximas acciones (orden prioridad)

### 🔴 URGENTE
1. **📱 Tailscale Redmi** — Abrir app físicamente → login → confirmar IP asignada
2. **⚠️ SEC-001** — Cerrar FTP puerto 21 en router Digi
3. **Verificar Kali up** — `tmux attach -t kali` → `docker ps | grep kali` → acceder `https://100.91.112.32:6901`

### 🟡 PRÓXIMO — cuando Kali esté UP
4. Escaneo red local desde Kali — `nmap -sn 192.168.72.0/24`
5. Auditar aislamiento redes Docker (todos en bridge = riesgo)
6. Auditar APIs sin auth: Ollama `:11434`, Qdrant `:6333`
7. `searchsploit` contra versiones de servicios Docker

### 🟢 PLANIFICADO
8. Prereq Wazuh — `sudo sysctl -w vm.max_map_count=262144`
9. Levantar Wazuh SIEM
10. Pipeline RAG — bge-m3 → Qdrant → Open WebUI
11. SSH clave pública ambos nodos
12. ADB tcpip 5555 Redmi — cuando pantalla desbloqueada
13. Reorganizar filesystem varopc — todos los composes a `~/docker/`
14. Eliminar `tailscale-full.apk` vacío del repo

---
_Actualizado: 01 jul 2026 05:09 CEST — Perplexity vía MCP_
_Ver: [[MASTER-PENDIENTES]] · [[ECOSISTEMA]] · [[diarios/2026-07-01]]_
