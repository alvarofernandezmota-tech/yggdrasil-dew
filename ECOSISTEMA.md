---
tags: [ecosistema, repos, docker, arquitectura, mapa]
fecha-actualizacion: 2026-06-28
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
| [thdora](https://github.com/alvarofernandezmota-tech/thdora) | Bot Telegram + FastAPI + Ollama local | ❌ público | 🔧 handlers pendientes | thdora-bot, Ollama |
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

| Máquina | Hostname | Specs | Rol | IP Tailscale |
|---|---|---|---|---|
| PC torre | **varpc (Madre)** | i5-8400 · 16GB RAM · HDD 1TB · GTX 1060 6GB | Servidor principal · Docker · Ollama · AP WiFi | `100.91.112.32` |
| Portátil | **varo12f (theodora/Acer)** | Arch Linux · Hyprland · AMD Ryzen 5 | Desarrollo · Obsidian · terminal | `100.86.119.102` |
| Móvil | **Redmi A5** | Android | Control remoto · thdora · Telegram | ⚠️ pendiente instalar |

---

## 🌐 Red — Madre

| Interfaz | IP | Rol |
|---|---|---|
| `wlan0` (RTL8188FTV USB) | `192.168.72.1/24` | AP WiFi MadreAP |
| `tailscale0` | `100.91.112.32` | VPN mesh |
| `enp0s20f0u3` (Xiaomi USB tethering) | `10.204.17.34/24` | Internet upstream (4G ~20Mbps) |
| `enp4s0` (Ethernet Gigabit) | — | DOWN / sin cable |

### MadreAP WiFi
| Parámetro | Valor |
|---|---|
| SSID | `MadreAP` |
| Seguridad | WPA2-PSK / CCMP |
| Canal | 6 (2.4GHz) |
| Gateway | `192.168.72.1` |
| DHCP pool | `192.168.72.50 – 192.168.72.150` (dnsmasq) |
| Driver | RTL8188FTV ⚠️ inestable — fix pendiente |

---

## 🐳 Docker Stack completo — Madre

### ✅ Levantado y healthy (desde 25-jun-2026)
| Contenedor | Puerto | Rol |
|---|---|---|
| ollama | 11434 | Motor LLM local |
| ollama-embeddings | 11435 | Embeddings |
| open-webui | 3001 | UI chat IA |
| qdrant | 6333 | Base vectorial RAG |
| uptime-kuma | 3002 | Monitor servicios |
| thdora | 8000 | FastAPI backend |
| thdora-bot | — | Bot Telegram |
| grafana | 3000 | Dashboards |
| prometheus | 9090 | Métricas |
| portainer | 9000 | Panel Docker |
| code-server | 8443 | VSCode web |
| n8n | 5678 | Automatización workflows |
| gitea | 3003 | Git self-hosted |

### ⏳ Pendiente levantar — Fase 5 Seguridad
| Contenedor | Imagen | Rol |
|---|---|---|
| Wazuh | wazuh/wazuh | SIEM — prereq `vm.max_map_count=262144` |
| Suricata | jasonish/suricata | IDS pasivo en wlan0 |
| CrowdSec | crowdsecurity/crowdsec | IDS/IPS |
| Traefik | traefik | Proxy alternativo |
| Vault | hashicorp/vault | Secretos |

### ⏳ Pendiente levantar — Fase 6 OSINT
| Contenedor | Puerto | Rol |
|---|---|---|
| Kali Desktop | 6901 | Pentest |
| SpiderFoot | 5001 | OSINT automatizado |
| SearXNG | 8080 | Buscador privado |
| PiHole | 53/80 | DNS + bloqueador ads |

---

## 🤖 Modelos Ollama — Madre

| Modelo | Tamaño | Estado | Uso |
|---|---|---|---|
| qwen2.5-coder:7b | 4.7GB | ✅ descargado | Código · thdora |
| qwen2.5:3b | 1.9GB | ✅ descargado | Chat rápido |
| llama3.1:8b | 4.7GB | ❌ pendiente pull | Chat general |
| bge-m3 | 1.2GB | ❌ pendiente pull | Embeddings RAG |
| nomic-embed-text | 0.3GB | ❌ pendiente pull | Embeddings rápidos |

---

## 📡 Monitorización

| Servicio | URL | Estado |
|---|---|---|
| Netdata Madre | `http://100.91.112.32:19999` | ✅ activo |
| Netdata Acer | `http://100.86.119.102:19999` | ✅ activo |
| Netdata streaming | Acer → Madre stream.conf | ✅ 2 nodos · 4400+ métricas |
| Grafana | `http://100.91.112.32:3000` | ✅ up |
| Uptime Kuma | `http://100.91.112.32:3002` | ✅ up |
| Portainer | `http://100.91.112.32:9000` | ✅ up |

---

## 🔗 Referencias clave

- [[HOME]] — punto de entrada diario
- [[CONTEXT]] — contexto para agentes IA
- [[ESTADO-SISTEMA]] — estado operativo ahora mismo
- [[MASTER-PENDIENTES]] — tareas pendientes
- [[filosofia]] — principios del sistema
- [[setup/servidor/README]] — guía setup Madre

---
_Actualizado: 28 jun 2026 22:37 CEST — Perplexity vía MCP_
_Ver commit history para cambios anteriores_
