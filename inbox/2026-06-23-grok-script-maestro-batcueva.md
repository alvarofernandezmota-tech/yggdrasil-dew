---
tags: [inbox, batcueva, docker, grok, script, fase2, osint]
fecha: 2026-06-23
estado: REVISAR-ANTES-DE-EJECUTAR
fuente: Grok
pendiente: validar-imagenes-docker
---

# 🤖 Grok — Script Maestro Batcueva Completo

> Output de Grok del 23/06/2026.
> **⚠️ NO ejecutar directamente — leer las notas de revisión primero.**
> Perplexity: revisar imágenes Docker y ajustar rutas antes de mover a `setup/servidor/`

---

## ⚠️ Notas de revisión (Perplexity)

Antes de ejecutar este script hay que verificar:

| Item | Estado | Noción |
|---|---|---|
| `ghcr.io/simplifaisoul/osiris:latest` | ❓ Verificar | Imagen no confirmada — puede no existir |
| `kismet/kismet:latest` | ❓ Verificar | Verificar imagen oficial en Docker Hub |
| `IP_TAILSCALE_MADRE=100.86.119.102` | ⚠️ **INCORRECTO** | Es la IP de varopc — Madre es `100.91.112.32` |
| `thdora-api:latest` y `thdora-bot:latest` | ⚠️ Son builds locales | No son imágenes públicas — ya corren en su propio compose |
| `ollama` en el compose | ⚠️ Duplicado | Ollama ya corre en Madre nativamente en :11434 |
| `grafana`, `prometheus`, `portainer`, `uptime-kuma`, `open-webui` | ⚠️ Ya instalados | Ya corren como contenedores independientes |
| `network_mode: host` en Caddy y Kismet | ⚠️ Conflicto | Puede entrar en conflicto con contenedores existentes |
| Ruta Obsidian `/home/alvaro/yggdrasil-dew/inbox` | ✅ Correcta | Verificar que el path existe en Madre |
| Puerto 8085 (Osiris) | ✅ Libre | No conflicto con servicios existentes |
| Puerto 2501 (Kismet) | ✅ Libre | No conflicto |
| Puerto 8099 (Obsidian Gate) | ✅ Libre | No conflicto |
| Puerto 1883 (MQTT) | ✅ Libre | No conflicto |
| Puerto 8686 (Vector) | ✅ Libre | No conflicto |

---

## 🗺️ Plan de uso correcto

Este script NO se ejecuta de golpe. Se usa como referencia para:

```
FASE 2 — Esta semana:
1. Extraer el bloque de Osiris → crear docker-compose separado
2. Extraer el bloque de Kismet → crear docker-compose separado
3. Caddy (proxy inverso) → instalar si Tailscale MagicDNS está activo
4. Vector + Obsidian Gate → Fase 3 (cuando todo lo demás funcione)
5. MQTT → solo si thdora lo necesita en el futuro
```

**Los servicios ya instalados (Grafana, Prometheus, Portainer, Uptime Kuma, Open WebUI)
no se tocan — ya están corriendo correctamente.**

---

## 📋 Lo nuevo y valioso de este script

### 1. Osiris — Inteligencia Geoespacial
```yaml
  osiris:
    image: ghcr.io/simplifaisoul/osiris:latest  # ⚠️ verificar imagen
    container_name: osiris-platform
    restart: unless-stopped
    ports:
      - "8085:3000"
    environment:
      - TZ=Europe/Madrid
      - NODE_ENV=production
      - OLLAMA_HOST=http://100.91.112.32:11434  # IP correcta de Madre
      - OLLAMA_MODEL=llama3:latest
      - ENABLE_AVIATION=true
      - ENABLE_MARITIME=true
      - ENABLE_CCTV=true
      - ENABLE_SEISMIC=true
    volumes:
      - osiris_data:/app/.next/cache
```

### 2. Kismet — Auditoría WiFi/Bluetooth
```yaml
  kismet:
    image: kismet/kismet:latest  # ⚠️ verificar imagen
    container_name: kismet-server
    restart: unless-stopped
    network_mode: "host"
    privileged: true
    cap_add:
      - NET_ADMIN
    volumes:
      - kismet_data:/rxtx
      - /dev/bus/usb:/dev/bus/usb  # USB passthrough para antena externa
    environment:
      - TZ=Europe/Madrid
```
> Requiere adaptador USB WiFi externo compatible con modo monitor.
> Recomendados: Alfa AWUS036ACH (~20€) o TP-Link AC600 (~12€)

### 3. Caddy — Proxy inverso Tailscale MagicDNS
```yaml
  caddy:
    image: caddy:latest
    container_name: batcueva-proxy
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
      - caddy_config:/config
```
Caddyfile para acceso sin puertos:
```
osiris.madre.tailscale    { reverse_proxy 127.0.0.1:8085 }
kismet.madre.tailscale    { reverse_proxy 127.0.0.1:2501 }
portainer.madre.tailscale { reverse_proxy 127.0.0.1:9000 }
uptime.madre.tailscale    { reverse_proxy 127.0.0.1:3002 }
openwebui.madre.tailscale { reverse_proxy 127.0.0.1:3001 }
spiderfoot.madre.tailscale{ reverse_proxy 127.0.0.1:5001 }
grafana.madre.tailscale   { reverse_proxy 127.0.0.1:3000 }
```

### 4. Vector — Tejido nervioso logs → Obsidian
```toml
# vector/vector.toml
[sources.kismet_logs]
type = "file"
include = ["/var/log/kismet/*.kismet"]

[sinks.to_obsidian]
type = "http"
inputs = ["kismet_logs"]
uri = "http://127.0.0.1:8099/webhook"
method = "post"
```

### 5. Obsidian Gate — Alertas automáticas al segundo cerebro
Microservicio Node.js que vuelca alertas OSINT directamente a `inbox/` de yggdrasil-dew.
Puerto: `:8099`

---

## 🔧 Script bash de setup (parcial — solo directorios y configs)

```bash
#!/bin/bash
# Solo crear estructura — NO ejecutar docker compose up todavía
set -e

DIR_BASE="/home/alvaro/docker/batcueva"
mkdir -p "$DIR_BASE/prometheus"
mkdir -p "$DIR_BASE/vector"
cd "$DIR_BASE"

# Configuración Prometheus
cat << 'EOF' > prometheus/prometheus.yml
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'thdora-api'
    static_configs:
      - targets: ['host.docker.internal:8000']
EOF

echo "Directorios creados en $DIR_BASE"
echo "Editar docker-compose.yml antes de levantar"
```

---

## ✅ Próximo paso

1. Verificar que `ghcr.io/simplifaisoul/osiris:latest` existe → `docker pull ghcr.io/simplifaisoul/osiris:latest`
2. Verificar imagen Kismet → `docker pull kismet/kismet:latest`
3. Si existen → crear `setup/servidor/batcueva-fase2.yml` con solo Osiris + Kismet
4. Si no existen → buscar alternativas y documentar

---

_Fuente: Grok (output 23/06/2026) · Revisado y anotado por Perplexity · MCP GitHub_
