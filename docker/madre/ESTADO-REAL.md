---
tags: [tipo/moc, estado/activo, #infra/docker]
---

# Estado Real Madre — SSOT

> ✅ VALIDADO: 2026-07-01  
> Esta página es la fuente de verdad del estado real de madre.
> Si algo no está aquí, no cuenta como "en producción".

## Hardware

- **CPU:** Intel i5-8400 (6 cores)
- **RAM:** 16 GB
- **GPU:** Sin GPU
- **OS:** Arch Linux
- **IP local:** 192.168.72.x
- **IP Tailscale:** 100.91.112.32
- **IP pública:** 79.116.247.44 (Digi ES)

---

## Servicios en producción ahora mismo

### Fase 1 — Stack IA base
*Compose: `docker-compose.fase1-real.yml` — fuente: `~/docker-compose.yml`*

| Servicio | Puerto | Estado | Notas |
|----------|--------|--------|-------|
| `ollama` | 11434 | ✅ healthy | qwen2.5:7b — máx 7g RAM |
| `ollama-embeddings` | 11435 | ✅ healthy | bge-m3 para RAG |
| `qdrant` | 6333 | ✅ healthy | BD vectorial RAG |
| `open-webui` | 3001 | ✅ healthy | UI para Ollama |

### Fase 2 — Monitoring + OSINT
*Compose: `docker-compose.fase2.yml` — fuente: `~/Obsidian/.../batcueva-fase2.yml`*

| Servicio | Puerto | Estado | Notas |
|----------|--------|--------|-------|
| `portainer` | 9000 | ✅ up | ⚠️ docker.sock expuesto |
| `uptime-kuma` | 3002 | ✅ healthy | monitoreo servicios |
| `spiderfoot` | 5001 | ✅ up | OSINT — imagen local |
| `heimdall` | 8090 | ❌ no corre | imagen descargada, no levantado |

### Fase 3 — Automatización + Dev
*Compose: `docker-compose.fase3.yml` — fuente: `~/Obsidian/.../batcueva-fase3.yml`*

| Servicio | Puerto | Estado | Notas |
|----------|--------|--------|-------|
| `n8n` | 5678 | ✅ up | orquestador flujos |
| `gitea` | 3003/2222 | ✅ up | git local |
| `code-server` | 8443 | ✅ up | VSCode en browser |
| `headscale` | — | ❌ no corre | VPN propia — pendiente |

### Thdora
*Compose: `docker-compose.thdora.yml` — fuente: `~/Projects/thdora/docker-compose.yml`*

| Servicio | Puerto | Estado | Notas |
|----------|--------|--------|-------|
| `thdora` | 8000 | ✅ healthy | API FastAPI |
| `thdora-bot` | — | ✅ healthy | Bot Telegram |
| `prometheus` | 9090 | ✅ up | métricas |
| `grafana` | 3000 | ✅ up | ⚠️ admin/admin — CAMBIAR |

---

## Imágenes descargadas pero NO levantadas

| Imagen | Uso previsto | Fase |
|--------|-------------|------|
| `pihole/pihole` | DNS + ad-blocker | Fase 4 |
| `searxng/searxng` | Buscador privado | Fase 4 |
| `wazuh/wazuh-manager` | SIEM | Fase 5 |
| `wazuh/wazuh-dashboard` | SIEM UI | Fase 5 |
| `jasonish/suricata` | IDS | Fase 5 |
| `crowdsecurity/crowdsec` | Protección colectiva | Hardening |
| `crazymax/fail2ban` | Bloqueo automático | Hardening |
| `aquasec/trivy` | Escaneo vulnerabilidades | Hardening |
| `containrrr/watchtower` | Auto-actualización | Mantenimiento |
| `kasmweb/kali-rolling-desktop` | Kali GUI browser | Pentest |
| `hashicorp/vault` | Gestión secretos | Futuro |
| `headscale/headscale` | VPN propia | Fase 3b |
| `netdata/netdata` | Monitoreo alternativo | Futuro |
| `nginx-proxy-manager` | Reverse proxy | Hardening |
| `linuxserver/wireguard` | VPN WireGuard | Futuro |
| `ghcr.io/berriai/litellm` | Proxy LLMs | Futuro |
| `paperless-ngx` | Gestión documentos | Futuro |
| `vaultwarden/server` | Password manager | Futuro |
| `homarr` | Dashboard alternativo | Futuro |
| `redis:7-alpine` | Cache | Dependencia |
| `postgres:15-alpine` | BD relacional | Dependencia |

---

## Problemas de seguridad activos 🔴

1. **Todos los servicios en `0.0.0.0`** — accesibles desde cualquier dispositivo LAN
2. **`ollama :11434`** — API IA sin autenticación
3. **`qdrant :6333`** — BD vectorial sin autenticación
4. **`prometheus :9090`** — métricas raw sin autenticación
5. **`portainer`** — docker.sock montado (riesgo container breakout)
6. **`grafana`** — credencial `admin/admin` por defecto
7. **Puerto 21 WAN** — FTP Digi expuesto (no controlable por nosotros)

---

## Próximos pasos ordenados por prioridad

### 🔴 Crítico — hacer ya
- [ ] Cambiar password Grafana (`admin/admin`)
- [ ] Auditar `docker inspect --format='{{.Name}}: Privileged={{.HostConfig.Privileged}}' $(docker ps -aq)`
- [ ] Verificar `N8N_ENCRYPTION_KEY` en .env de madre

### 🟡 Hardening — esta semana
- [ ] Cambiar puertos `0.0.0.0` → `127.0.0.1` en compose
- [ ] Levantar `fail2ban` + `crowdsec` (imágenes listas)
- [ ] UFW: `default deny incoming` + permitir solo tailscale0

### 🟢 Fase 4 — próxima
- [ ] Levantar Pihole + SearXNG
- [ ] Levantar Wazuh SIEM
- [ ] Terminar descarga Kali KasmWeb

### 🔵 Bots SecOps — después del hardening
- [ ] Bot 1: rastreador de logs (Python + watchdog)
- [ ] Bot 2: analista IA (Ollama API)
- [ ] Bot 3: alertas Telegram
- [ ] Orquestar con n8n
