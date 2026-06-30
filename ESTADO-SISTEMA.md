---
tags: [estado, sistema, operativo, servicios, ahora]
fecha-actualizacion: 2026-06-30
hora: 21:20
---

# 📊 ESTADO DEL SISTEMA — 30 jun 2026 (21:20)

> Este archivo refleja el estado REAL operativo ahora mismo.
> Actualizar cada vez que cambie algo importante.

---

## 🖥️ Máquinas

| Máquina | Estado | Observaciones |
|---|---|---|
| **Madre (varpc)** | ✅ encendida y accesible | SSH OK · AP MadreAP activo · Tailscale `100.91.112.32` |
| **Acer (theodora / varo12f)** | ✅ operativo | Tailscale `100.86.119.102` · Netdata activo · relay `mad` activo |
| **iPhone 11** | ✅ Tailscale activo | `100.81.187.99` |
| **Redmi A5** | ⚠️ sin Tailscale | Tailscale pendiente instalar desde Play Store |

---

## 🛜 Red

| Servicio | Estado | Detalle |
|---|---|---|
| Tailscale Madre | ✅ activo | `100.91.112.32` |
| Tailscale Acer | ✅ activo | `100.86.119.102` · relay `mad` · tx 2.7MB rx 43MB |
| Tailscale iPhone 11 | ✅ activo | `100.81.187.99` |
| Tailscale Redmi A5 | ❌ pendiente | Instalar desde Play Store |
| **MadreAP (hostapd)** | ✅ activo | SSID: MadreAP · WPA2 · canal 6 · wlan0 RTL8188FTV |
| **dnsmasq DHCP** | ✅ activo | `192.168.72.50-150` · 12h lease · wlan0 |
| **NAT/IP Masquerade** | ✅ activo | Clientes WiFi tienen internet |
| **UFW Madre** | ✅ activo | docker-dns · tailscale0 · SSH Acer · Netdata Acer · DHCP wlan0 · DNS wlan0 · forwarding wlan0 |
| **UFW Acer** | ✅ activo | docker-dns · tailscale0 · SSH Madre · Input Leap · Netdata Madre |
| ⚠️ Driver RTL8188FTV | ❌ inestable | INTERFACE-DISABLED espontáneo en logs — fix pendiente (modprobe.d) |
| SSH hardening | ⚠️ parcial | `PasswordAuthentication no` ✅ · clave pública pendiente |

---

## 🐳 Docker — Estado Madre

### Stack — 13/13 CONTENEDORES UP ✅ (validado 30-jun 21:15)

| Contenedor | Puerto | Estado |
|---|---|---|
| `ollama` | 11434 | ✅ healthy |
| `ollama-embeddings` | 11435 | ✅ healthy |
| `open-webui` | 3001 | ✅ healthy |
| `qdrant` | 6333 | ✅ healthy |
| `uptime-kuma` | 3002 | ✅ healthy |
| `thdora` | 8000 | ✅ healthy — FastAPI v0.12.1 |
| `thdora-bot` | — | ✅ healthy |
| `grafana` | 3000 | ✅ up |
| `prometheus` | 9090 | ✅ up |
| `portainer` | 9000 | ✅ up |
| `code-server` | 8443 | ✅ up |
| `n8n` | 5678 | ✅ up |
| `gitea` | 3003 | ✅ up |

### Pendiente levantar (Fases 5-6)
- [ ] Kali Desktop (puerto 6901) — pentest
- [ ] Wazuh SIEM — prereq `vm.max_map_count=262144`
- [ ] Suricata IDS pasivo
- [ ] SpiderFoot OSINT
- [ ] PiHole DNS

### Modelos Ollama

| Modelo | Tamaño | Estado |
|---|---|---|
| `qwen2.5-coder:7b` | 4.7GB | ✅ descargado · Q4_K_M · ctx 32k · tools |
| `qwen2.5:3b` | 1.9GB | ✅ descargado · Q4_K_M · ctx 32k · tools |
| `llama3.1:8b` | — | ❌ pendiente pull |
| `bge-m3` | — | ❌ pendiente pull |
| `nomic-embed-text` | — | ❌ pendiente pull |

---

## 🔐 Seguridad

| Servicio | Madre | Acer |
|---|---|---|
| fail2ban | ✅ activo · jail sshd ✅ | ✅ activo · jail sshd ✅ |
| UFW | ✅ activo y limpio | ✅ activo y limpio |
| SSH PasswordAuth | ✅ `no` — confirmado 30-jun | ✅ contraseña |
| Puerto 53317 | ✅ cerrado | ✅ cerrado |
| Clave pública SSH | ❌ pendiente | ❌ pendiente |

---

## 📡 Monitorización

| Servicio | Estado | URL |
|---|---|---|
| Netdata Madre | ✅ activo | `http://localhost:19999` · `http://100.91.112.32:19999` |
| Netdata Acer | ✅ activo | `http://100.86.119.102:19999` |
| Netdata streaming | ✅ activo | Acer → Madre vía stream.conf UUID |
| Grafana | ✅ up | `http://100.91.112.32:3000` |
| Uptime Kuma | ✅ up | `http://100.91.112.32:3002` |
| Portainer | ✅ up | `http://100.91.112.32:9000` |

---

## 🤖 THDORA — Bot Telegram

| Componente | Estado |
|---|---|
| thdora (FastAPI) | ✅ healthy · v0.12.1 |
| thdora-bot | ✅ healthy |
| Endpoint `/health` | ✅ `{"status":"ok","service":"thdora","version":"0.12.1"}` |
| Endpoint `/docs` | ✅ Swagger UI accesible |
| Handlers Telegram | ⚠️ básicos — mapear endpoints pendiente |
| Uptime Kuma → THDORA webhook | ❌ pendiente |

---

## 🗂️ Git — Estado repos

| Repo | Estado |
|---|---|
| yggdrasil-dew (GitHub) | ✅ sincronizado — sesión 30-jun committed |
| yggdrasil-dew (Madre local) | ⚠️ pendiente `git pull --rebase` |
| thdora | 🔧 handlers pendientes |
| local-brain | 🔧 en desarrollo |
| osint-stack | 🔧 en desarrollo |

---

## 📋 Próximas acciones (orden prioridad)

1. **`git pull --rebase`** en Madre — sincronizar repo local con GitHub
2. **Fix driver RTL8188FTV** — AP inestable (`modprobe.d/8188fu.conf`)
3. Modelos Ollama: `llama3.1:8b` + `bge-m3` + `nomic-embed-text`
4. THDORA handlers: mapear endpoints via `/docs`, implementar handlers Telegram
5. SSH hardening — clave pública ambos nodos
6. Tailscale Redmi A5
7. Uptime Kuma → THDORA alertas Telegram
8. Wazuh prereq + levantar SIEM

---
_Actualizado: 30 jun 2026 21:20 CEST — Perplexity vía MCP_
_Ver: [[MASTER-PENDIENTES]] · [[ECOSISTEMA]] · [[diarios/]]_
