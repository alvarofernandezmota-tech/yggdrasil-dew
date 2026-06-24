---
tags: [ecosistema, repos, docker, arquitectura, mapa]
fecha-actualizacion: 2026-06-24
---

# 🌳 ECOSISTEMA — Mapa completo del sistema

> Fuente de verdad de TODOS los repos, herramientas y stacks.
> Actualizar cada vez que se crea un repo o se añade una herramienta.

---

## 📦 Repos GitHub — Estado actual

| Repo | Descripción | Privado | Estado | Docker/stack |
|---|---|---|---|---|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | 🧠 Second brain — base conocimiento + diarios | ❌ público | ✅ activo | — |
| [personal](https://github.com/alvarofernandezmota-tech/personal) | Vida personal — finanzas, gym, salud, diario | ❌ público | ✅ activo | — |
| [thdora](https://github.com/alvarofernandezmota-tech/thdora) | Bot Telegram + FastAPI + Ollama local | ❌ público | 🔧 en desarrollo | thdora-bot, Ollama |
| [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) | Cerebro cognitivo — Ollama, RAG, embeddings | ✅ privado | 🔧 en desarrollo | Ollama, Open WebUI, LiteLLM, Qdrant |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | Stack OSINT — SpiderFoot, investigación | ✅ privado | 🔧 en desarrollo | SpiderFoot, SearXNG, Perplexica |
| [ai-toolkit](https://github.com/alvarofernandezmota-tech/ai-toolkit) | Open source AI dev stack | ❌ público | ✅ activo | Claude Code, OpenRouter |
| [thea-ia](https://github.com/alvarofernandezmota-tech/thea-ia) | Proyecto IA anterior (thea) | ❌ público | 🟡 mantenimiento | — |
| [image-calculator](https://github.com/alvarofernandezmota-tech/image-calculator) | OCR + calculadora Python | ❌ público | ✅ estable | — |
| [impresion-3d](https://github.com/alvarofernandezmota-tech/impresion-3d) | Anycubic Photon V1 — diarios y configs | ❌ público | ✅ estable | — |

### Repos pendientes de crear
- [ ] `ollama-stack` — stack Ollama independiente + modelos
- [ ] `chatbot-control` — bots y automatizaciones
- [ ] `terminal-ia` — CLI tools + scripts IA

---

## 🖥️ Hardware del ecosistema

| Máquina | Nombre | Specs | Rol |
|---|---|---|---|
| PC torre | **Madre** | i5-8400 · 16GB RAM · 1TB SSD | Servidor principal · Docker · Ollama |
| Portátil | **varopc** / Acer | Arch Linux · Hyprland | Desarrollo · Obsidian · terminal |
| Móvil | Redmi A5 | Android | Control remoto · thdora · Telegram |

---

## 🐳 Docker Stack completo — Madre

### ✅ Fase 1 — Base IA (IMÁGENES DESCARGADAS)
| Contenedor | Puerto | Imagen | Rol |
|---|---|---|---|
| ollama | 11434 | ollama/ollama | Motor LLM local |
| open-webui | 3000 | ghcr.io/open-webui/open-webui | UI chat IA |
| qdrant | 6333 | qdrant/qdrant | Base vectorial RAG |

### 🔧 Fase 2 — IA Gateway
| Contenedor | Puerto | Imagen | Rol |
|---|---|---|---|
| litellm | 4000 | ghcr.io/berriai/litellm | Gateway unificado LLMs |
| nginx-pm | 80/443 | jc21/nginx-proxy-manager | Proxy reverso + SSL |

### 🔧 Fase 3 — Productividad
| Contenedor | Puerto | Imagen | Rol |
|---|---|---|---|
| n8n | 5678 | n8nio/n8n | Automatización workflows |
| gitea | 3001 | gitea/gitea | Git self-hosted |
| paperless | 8000 | ghcr.io/paperless-ngx | Gestión documentos |
| vaultwarden | 8001 | vaultwarden/server | Gestor contraseñas |
| code-server | 8443 | lscr.io/linuxserver/code-server | VSCode web |

### 🔧 Fase 4 — Monitorización
| Contenedor | Puerto | Imagen | Rol |
|---|---|---|---|
| portainer | 9000 | portainer/portainer-ce | Panel Docker |
| uptime-kuma | 3002 | louislam/uptime-kuma | Monitor servicios |
| grafana | 3003 | grafana/grafana | Dashboards |
| netdata | 19999 | netdata/netdata | Métricas sistema |

### 📋 Fase 5 — Seguridad (pendiente)
| Contenedor | Imagen | Rol |
|---|---|---|
| fail2ban | crazymax/fail2ban | Protección brute-force |
| crowdsec | crowdsecurity/crowdsec | IDS/IPS |
| traefik | traefik | Proxy alternativo |
| wireguard | linuxserver/wireguard | VPN |
| vault | hashicorp/vault | Secretos |
| authentik | ghcr.io/goauthentik/server | SSO |

### 📋 Fase 6 — OSINT
| Contenedor | Puerto | Imagen | Rol |
|---|---|---|---|
| searxng | 8080 | searxng/searxng | Buscador privado |
| perplexica | 3004 | itzcrazykns/perplexica | IA buscador |
| spiderfoot | 5001 | — | OSINT automatizado |
| pihole | 53/80 | pihole/pihole | DNS + bloqueador ads |

---

## 🤖 Modelos Ollama — Madre

| Modelo | Tamaño | Estado | Uso |
|---|---|---|---|
| qwen2.5:3b | 1.9GB | ✅ listo | Chat rápido · thdora |
| qwen2.5:7b | 4.7GB | ⏳ descargando | Chat equilibrado |
| qwen2.5:14b | 9.0GB | ⏳ descargando | Chat potente |
| llama3.1:8b | 4.7GB | ⏳ descargando | Alternativa general |
| mistral:7b | 4.1GB | ⏳ descargando | Código |
| bge-m3 | 1.2GB | ⏳ descargando | Embeddings RAG |
| nomic-embed-text | 0.3GB | ⏳ descargando | Embeddings rápidos |

---

## 🌐 Red — Tailscale

| Máquina | IP Tailscale | Estado |
|---|---|---|
| Madre | — | ⏳ configurar autoarranque |
| varopc | 100.86.119.102 | ✅ activo |

---

## 🔗 Referencias clave

- [[HOME]] — punto de entrada diario
- [[CONTEXT]] — contexto para agentes IA
- [[ESTADO-SISTEMA]] — estado operativo ahora mismo
- [[inbox/MASTER-PENDIENTES]] — tareas pendientes
- [[filosofia]] — principios del sistema
- [[setup/servidor/README]] — guía setup Madre

---
_Actualizado: 24 jun 2026 22:22 CEST_
_Ver commit history para cambios anteriores_
