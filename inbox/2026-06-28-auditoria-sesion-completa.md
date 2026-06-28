---
tags: [inbox, auditoria, sesion, plan, osint, pentest, docker, fases]
fecha: 2026-06-28
hora: 22:43
estado: procesado
---

# 📥 Auditoría sesión completa — 28 jun 2026

> Documentado por Perplexity vía MCP durante sesión nocturna 22:30-22:45 CEST
> Para procesar: mover contenido relevante a `docs/` o `diarios/`

---

## ✅ Completado esta sesión (madrugada 00:37–01:00 + noche 22:00-22:45)

### Infraestructura
- **fail2ban jail sshd** activo — Madre + Acer (`maxretry:5` `bantime:86400`)
- **dnsmasq DHCP** activo en wlan0 — pool `192.168.72.50-150` · lease 12h
- **Puerto 53317** cerrado UFW — Madre + Acer
- **Netdata Acer** activo · puerto 19999 restringido a Madre
- **UFW puerto 53 wlan0** — clientes AP pueden resolver DNS

### Repo yggdrasil-dew — actualizado vía MCP
- `MASTER-PENDIENTES.md` — sesión 28-jun documentada ✅
- `ESTADO-SISTEMA.md` — estado real 28-jun ✅
- `ECOSISTEMA.md` — IPs corregidas, red AP documentada, stack completo ✅
- `CHANGELOG.md` — toda la semana 22-28 jun ✅
- Issues #5 (AP hostapd) + #6 (DIARY 28-jun) creados ✅
- Auditoría completa de carpetas y archivos root del repo ✅

---

## 📍 Estado real del plan — 28 jun 2026

### Plan completo: `PLAN-SEGURIDAD-Y-DESPLIEGUE.md` — 10 fases

| Fase | Nombre | Estado |
|---|---|---|
| **0** | Repo y docs al día | 🟡 95% — solo falta `git pull --rebase` en Madre |
| **1** | Seguridad de red | 🔴 0% — SSH hardening, UFW completo, Tailscale autoarranque, no suspensión |
| **2** | Script `start-batcueva.sh` | 🔴 0% — crear y subir al repo |
| **3** | Backup Restic | 🔴 0% — bucket cloud + scripts + timer |
| **4** | Monitorización completa | 🟡 50% — Grafana dashboards, Uptime Kuma→THDORA, Wazuh pendiente |
| **5** | Seguridad avanzada contenedores | 🔴 0% — SOPS, Rootless Docker, VLANs |
| **6** | Handlers THDORA | 🔴 0% — `/estado` `/inbox` `/diario` `/pull` |
| **7** | Modelos Ollama + RAG | 🔴 20% — `llama3.1:8b`, `bge-m3`, `nomic-embed-text` pendientes |
| **8** | Seguridad Acer (theodora) | 🔴 0% — Prey, Computrace, número de serie |
| **9** | Pentest + OSINT real | 🔴 0% — **BLOQUEADO hasta Fase 1** |

---

## 🐳 Docker — Qué está levantado vs qué falta

### ✅ 13 contenedores healthy desde 25-jun
```
ollama · ollama-embeddings · open-webui · qdrant
uptime-kuma · thdora · thdora-bot · grafana
prometheus · portainer · code-server · n8n · gitea
```

### ⏳ Pendiente levantar — Fase 5-6 (OSINT/Pentest/Seguridad)
```
Kali Desktop    → puerto 6901   — pentest
SpiderFoot      → puerto 5001   — OSINT automático
Bettercap       → network_mode:host — MITM / análisis WiFi
Wazuh           → SIEM          — prereq vm.max_map_count=262144
Suricata        → IDS pasivo    — monitor wlan0
DefectDojo      → gestión findings
SearXNG         → buscador privado
PiHole          → DNS + bloqueador ads
```

Archivo listo: `osint-stack/docker-compose.kali.yml` — solo falta ejecutar `docker compose up -d`

---

## 🔎 OSINT vs Pentest — diferencia clara

| | OSINT | Pentest |
|---|---|---|
| **Qué es** | Inteligencia de fuentes abiertas — información pública | Pruebas de penetración — atacar sistemas con permiso |
| **Herramientas** | SpiderFoot, SearXNG, Maltego | Kali, Bettercap, nmap, Metasploit |
| **Cómo** | Pasivo — no tocas el objetivo | Activo — lanzas ataques controlados |
| **Para qué** | Reconocimiento previo | Encontrar vulnerabilidades reales |
| **En el stack** | SpiderFoot (puerto 5001) | Kali Desktop (puerto 6901) |

---

## 📱 Móvil (Redmi A5) — SSH y Tailscale

### Estado actual
- **Tailscale**: ❌ pendiente instalar desde Play Store
- **SSH desde móvil**: posible via **Termux** (app Android)

### Cuando esté Tailscale instalado podrás:
```bash
# Desde Termux en el móvil:
ssh varopc@100.91.112.32      # SSH a Madre
ssh varo@100.86.119.102       # SSH a Acer
```
- Ver dashboards en navegador: Grafana, Netdata, Portainer, Open WebUI
- Controlar THDORA desde Telegram
- Acceder a Kali Desktop desde navegador móvil (`http://100.91.112.32:6901`)

---

## 🚨 Problema pendiente crítico — AP inestable

Driver **RTL8188FTV** cae solo — `INTERFACE-DISABLED` en logs hostapd.

**Fix preparado** (pendiente ejecutar en Madre):
```bash
echo "options 8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8188fu.conf
sudo modprobe -r 8188fu 2>/dev/null; sudo modprobe 8188fu
sudo systemctl restart hostapd
systemctl is-active hostapd
```

---

## 🗓️ Próximas sesiones — orden de ejecución

```
Sesión siguiente:
  1. Fix driver RTL8188FTV → AP estable
  2. git pull --rebase en Madre → Fase 0 cerrada
  3. Fase 1: SSH hardening + UFW completo + Tailscale enable + mask suspend
  4. Fase 2: script start-batcueva.sh

Esta semana:
  5. Modelos Ollama (llama3.1:8b, bge-m3, nomic-embed-text)
  6. THDORA handlers (/estado /inbox /diario /pull)
  7. Tailscale Redmi A5 → móvil como nodo

Siguiente semana:
  8. Fase 3 Restic backup
  9. Fase 4 Grafana + Wazuh
  10. Fase 9 Kali + SpiderFoot → primer scan OSINT real
```

---
_Creado: 28 jun 2026 22:43 CEST — Perplexity vía MCP_
_Ver: [[PLAN-SEGURIDAD-Y-DESPLIEGUE]] · [[MASTER-PENDIENTES]] · [[ESTADO-SISTEMA]]_
