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
*Compose: `docker-compose.fase1-real.yml`*

| Servicio | Puerto | Estado |
|----------|--------|--------|
| `ollama` | 11434 | ✅ healthy — qwen2.5:7b, máx 7g RAM |
| `ollama-embeddings` | 11435 | ✅ healthy — bge-m3 para RAG |
| `qdrant` | 6333 | ✅ healthy — BD vectorial |
| `open-webui` | 3001 | ✅ healthy — UI Ollama |

### Fase 2 — Monitoring + OSINT
*Compose: `docker-compose.fase2.yml`*

| Servicio | Puerto | Estado |
|----------|--------|--------|
| `portainer` | 9000 | ✅ up — ⚠️ docker.sock montado |
| `uptime-kuma` | 3002 | ✅ healthy |
| `spiderfoot` | 5001 | ✅ up — imagen local |
| `heimdall` | 8090 | ❌ no levantado |

### Fase 3 — Automatización + Dev
*Compose: `docker-compose.fase3.yml`*

| Servicio | Puerto | Estado |
|----------|--------|--------|
| `n8n` | 5678 | ✅ up — orquestador flujos |
| `gitea` | 3003/2222 | ✅ up — git local |
| `code-server` | 8443 | ✅ up — VSCode browser |
| `headscale` | — | ❌ pendiente — VPN propia |

### Thdora — proyecto independiente
> ⚠️ Thdora tiene su propio repo. Su compose NO vive aquí (Regla 13).
> Referencia: `~/Projects/thdora/docker-compose.yml` — repo: `thdora`

| Servicio | Puerto | Estado |
|----------|--------|--------|
| `thdora` | 8000 | ✅ healthy — API FastAPI |
| `thdora-bot` | — | ✅ healthy — Bot Telegram |
| `prometheus` | 9090 | ✅ up — métricas thdora |
| `grafana` | 3000 | ✅ up — ✅ password cambiado 2026-07-01 |

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

## Hardening completado ✅

| Fecha | Acción | Resultado |
|-------|--------|-----------|
| 2026-07-01 | Grafana `admin/admin` cambiado | ✅ |
| 2026-07-01 | Audit `Privileged=false` todos los contenedores | ✅ ninguno privilegiado |

## Hardening pendiente 🔴

| Problema | Riesgo | Acción |
|----------|--------|--------|
| Todos en `0.0.0.0` | Accesibles desde LAN completa | Cambiar a `127.0.0.1` en compose |
| `ollama :11434` | API IA sin auth | Bind a `127.0.0.1` o tailscale0 |
| `qdrant :6333` | BD vectorial sin auth | Bind a `127.0.0.1` |
| `prometheus :9090` | Métricas raw sin auth | Bind a `127.0.0.1` |
| `portainer` docker.sock | Riesgo breakout indirecto | Evaluar alternativa sin socket |
| `N8N_ENCRYPTION_KEY` | Clave por defecto en .env | Verificar y rotar |

---

## Próximos pasos ordenados

### 🔴 Inmediato
- [ ] Verificar `N8N_ENCRYPTION_KEY` en `.env` de madre — no debe ser la de ejemplo
- [ ] Levantar `fail2ban` + `crowdsec` (imágenes listas)

### 🟡 Esta semana — Hardening
- [ ] Cambiar puertos `0.0.0.0` → `127.0.0.1` en todos los compose
- [ ] UFW: `default deny incoming` + permitir solo tailscale0
- [ ] Auditar `docker inspect` para mounts sensibles

### 🟢 Fase 4
- [ ] Levantar Pihole + SearXNG
- [ ] Levantar Wazuh SIEM
- [ ] Terminar descarga Kali KasmWeb

### 🔵 Bots SecOps — después del hardening
- [ ] `secops-bot` — contenedor independiente en madre
- [ ] Bot 1: rastreador logs (Python + watchdog)
- [ ] Bot 2: analista IA (Ollama API local)
- [ ] Bot 3: alertas Telegram
- [ ] Orquestar con n8n
