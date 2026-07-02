# Estado del Sistema — Yggdrasil

> Última actualización: 2026-07-02 02:30 CEST

---

## Nodos activos

| Nodo | Rol | Estado | IP Tailscale | Conectividad |
|------|-----|--------|--------------|--------------|
| **madre** | Servidor principal / AP | ✅ ON | `100.91.112.32` | LAN + MadreAP + Tailscale |
| **theodora** | Workstation dev | ✅ ON | `100.86.119.102` | Hotspot Redmi A5 |
| **Redmi A5** | Hotspot 4G | ✅ ON | ⏳ pendiente login | DIGI ES LTE CA |
| **iPhone** | Cliente móvil | ✅ ON | `100.81.187.99` | MadreAP + Tailscale |
| **Xiaomi** | Dispositivo adicional | ✅ ON | `100.106.133.70` | Tailscale |

---

## Servicios en madre

### ✅ Corriendo
- **Ollama** — systemd service activo
  - `qwen2.5-coder:7b` ✅
  - `qwen2.5:3b` ✅
  - `llama3.1:8b` ✅
  - `bge-m3` ✅
  - `nomic-embed-text` ✅
- **hostapd** — MadreAP en wlan0 (192.168.72.0/24) ✅
- **dnsmasq** — DHCP para MadreAP ✅
- **Tailscale** — nodo activo, 4 nodos conectados ✅
- **SSH** — hardened (ed25519 only, no password, no root) ✅

### Docker Stack principal ✅
- open-webui (3001) · qdrant (6333) · uptime-kuma (3002)
- thdora (8000) · thdora-bot · grafana (3000) · prometheus (9090)
- portainer (9000) · code-server (8443) · n8n (5678)
- gitea (3003) · spiderfoot (5001)
- ollama (11434) · ollama-embeddings (11435)

### Bots de seguridad — yggdrasil-secops ✅/⚠️
| Bot | Estado | Issues |
|---|---|---|
| Watchdog | ✅ Activo | — |
| Tailscale Monitor | ✅ Activo | ⚠️ Crash-loop cada ~10min (healthcheck timeout) |
| Network Radar | ✅ Activo | — |
| Log Guardian | ✅ Activo | ⚠️ Crash-loop cada ~8min (healthcheck estricto) |
| Local Tripwire | ⚠️ Activo | 🔴 0 archivos vigilados — sin rutas configuradas |
| Guardian Bot (Telegram) | ✅ Activo | — |

### Pendiente de levantar ⏳
- Wazuh Manager + Dashboard (4.7.0)
- Suricata IDS
- Kali KasmWeb (descargando)
- Pihole + SearXNG

---

## Seguridad

### Hardening completado ✅
- SSH: solo ed25519, passphrase, sin root login, sin password auth
- `sleep.target suspend.target hibernate.target` — maskeados
- Fail2ban activo
- Watchdog + Log Guardian monitorizando

### Hallazgos pendientes 🔴
- **Puerto 21 FTP abierto en router** — CRÍTICO, cerrar en Digi
- **local_tripwire sin rutas** — 0 archivos vigilados
- **Healthchecks de bots** — ajustar timeouts (log_guardian_bot, tailscale_monitor)
- **APIs sin auth**: Ollama `:11434`, Qdrant `:6333` — auditar exposición

---

## Fases del plan

| Fase | Descripción | Estado |
|------|-------------|--------|
| 1 | SSH Hardening madre | ✅ Completada |
| 2 | Ollama + modelos | ✅ Completada |
| 3 | Pentest inicial red local | ✅ Completada |
| 4 | MadreAP WiFi | ✅ Completada |
| 5 | Docker stack principal (thdora, RAG, grafana…) | ✅ Completada |
| 6 | Bots watchdog y monitorización (yggdrasil-secops) | 🔄 Activo — con issues a corregir |
| 7 | Wazuh + Suricata IDS | ⏳ Pendiente |
| 8 | Pihole + SearXNG privacidad | ⏳ Pendiente |
| 9 | Kali KasmWeb pentest lab | ⏳ Descargando |
| 10 | AlertManager + Loki — cadena de alertas completa | ⏳ Planeado |
| 11 | CrowdSec + DefectDojo | ⏳ Planeado |

---

## Red

- **LAN:** 192.168.1.0/24 (router doméstico)
- **MadreAP:** 192.168.72.0/24 (hostapd en madre)
- **Tailscale:** 100.x.x.x (red privada — 4 nodos activos)
- **Hotspot Redmi:** 4G DIGI ES, LTE Carrier Aggregation

---

## Tmux sessions en madre

```
fase5:      1 windows
kali:       1 windows
wazuh:      1 windows
descargas:  1 windows
```
