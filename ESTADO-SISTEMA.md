---
tags: [estado, sistema, operativo, servicios, ahora]
fecha-actualizacion: 2026-06-24
hora: 22:22
---

# 📊 ESTADO DEL SISTEMA — 24 jun 2026

> Este archivo refleja el estado REAL operativo ahora mismo.
> Actualizar cada vez que cambie algo importante.

---

## 🖥️ Máquinas

| Máquina | Estado | Observaciones |
|---|---|---|
| **Madre** | 🟡 encendida, sin verificar | Descargando modelos desde noche 23-24 jun · pendiente verificar |
| **varopc** | ✅ activo | Usando ahora mismo |
| **Redmi A5** | ✅ activo | Sesión actual desde móvil |

---

## 🐳 Docker — Estado Madre

### Imágenes descargadas ✅
```
ghcr.io/open-webui/open-webui   6.7GB
ollama/ollama                   8.29GB
n8nio/n8n                       2.39GB
ghcr.io/paperless-ngx           2.01GB
ghcr.io/berriai/litellm         1.53GB
grafana/grafana                 1.46GB
ghcr.io/ajnart/homarr           1.5GB
jc21/nginx-proxy-manager        1.77GB
lscr.io/linuxserver/code-server 1.08GB
louislam/uptime-kuma            707MB
vaultwarden/server              347MB
portainer/portainer-ce          242MB
qdrant/qdrant                   269MB
gitea/gitea                     247MB
postgres:15-alpine              417MB
redis:7-alpine                  58.9MB
containrrr/watchtower           22.2MB
thdora-bot                      531MB
```

### Imágenes descargando ⏳
```
crazymax/fail2ban · crowdsecurity/crowdsec · immauss/openvas
aquasec/trivy · ghcr.io/goauthentik/server · traefik
linuxserver/wireguard · hashicorp/vault
netdata/netdata · nicolargo/glances · prom/alertmanager
searxng/searxng · itzcrazykns/perplexica · pihole/pihole
```

### Contenedores activos
- ⚠️ **Sin verificar** — pendiente `docker ps` al llegar a Madre

---

## 🤖 Ollama — Estado modelos

| Modelo | Estado | Verificado |
|---|---|---|
| qwen2.5:3b | ✅ listo | 24 jun 06:10 |
| qwen2.5:14b | ⏳ en descarga | en cola desde 06:00 |
| qwen2.5:7b | ⏳ en cola | — |
| llama3.1:8b | ⏳ en cola | — |
| mistral:7b | ⏳ en cola | — |
| bge-m3 | ⏳ en cola | — |
| nomic-embed-text | ⏳ en cola | — |

> Verificar con: `ssh madre "ollama list"`

---

## 🗂️ Repos GitHub

| Repo | Último commit | Estado |
|---|---|---|
| yggdrasil-dew | 24 jun 22:22 | ✅ actualizado |
| thdora | 24 jun 03:12 | 🔧 pendiente handlers |
| local-brain | 24 jun 03:13 | ⚠️ pendiente documentar Docker |
| osint-stack | 24 jun 03:13 | ⚠️ pendiente documentar Docker |
| personal | 24 jun 02:19 | ✅ ok |

### Repos pendientes de crear
- [ ] `ollama-stack`
- [ ] `chatbot-control`
- [ ] `terminal-ia`

---

## 📥 Inbox

| Estado | Detalle |
|---|---|
| ~100 archivos en inbox/ | ⚠️ pendiente migrar |
| Script migración | ✅ generado — ejecutar `bash migrate-inbox.sh` |
| MASTER-PENDIENTES.md | ✅ actualizado 22:17 |

---

## 🔐 Red y acceso

| Servicio | Estado |
|---|---|
| Tailscale varopc | ✅ activo (100.86.119.102) |
| Tailscale Madre | ⚠️ pendiente autoarranque |
| SSH Madre→varopc | ⚠️ pendiente configurar sin contraseña |
| UFW Madre | ⚠️ pendiente activar |
| Hotspot móvil→Madre | ⚠️ pendiente conectar |

---

## 📋 Próxima acción inmediata

1. Desde móvil ahora → thdora handlers con Perplexity
2. Al llegar al PC → `bash migrate-inbox.sh`
3. Verificar descargas Madre → `ssh madre "ollama list && docker images"`
4. Levantar fases → `docker compose up -d`

---
_Actualizado: 24 jun 2026 22:22 CEST por Perplexity vía MCP_
_Ver: [[ECOSISTEMA]] · [[inbox/MASTER-PENDIENTES]] · [[HOME]]_
