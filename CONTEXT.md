---
tags: [contexto, sistema, estado, agente]
fecha-actualizacion: 2026-06-23
---

# CONTEXT.md — Estado HOY

> ⚠️ Actualizar SIEMPRE al inicio y al final de cada sesión.
> Este fichero es el "resumen ejecutivo" del ecosistema — lo primero que lee cualquier agente.
> Última actualización: **23 junio 2026 — 16:45 CEST**

---

## 📍 Dónde estamos ahora mismo

### Sesión 23 jun 2026 — parque + casa
- Avance masivo batcueva Docker + OSINT
- Inbox auditado por Claude/Grok (en proceso)
- Docker limpiado (3.16GB liberados) — relanzando Ollama + Open WebUI
- **FIX crítico:** usuario en Madre es `varopc`, no `alvaro`

---

## 🟢 Stack Docker Madre — estado real 23/06/2026 ~16:45

| Servicio | Puerto | Estado |
|---|---|---|
| thdora API | :8000 | ✅ healthy |
| thdora-bot | — | ✅ healthy |
| Grafana | :3000 | ✅ |
| Prometheus | :9090 | ✅ |
| Portainer | :9000 | ✅ |
| Uptime Kuma | :3002 | ✅ |
| Open WebUI | :3001 | ⏬ descargando (2º intento) |
| Ollama | :11434 | ⏬ descargando (2º intento) |

### ⏳ Fase 2 — pendiente
| Servicio | Puerto | Script |
|---|---|---|
| tar1090 (aviones) | :8085 | `setup/servidor/batcueva-fase2.yml` |
| Kismet (WiFi audit) | :2501 | ídem |
| IVRE (Shodan clon) | :8089 | `setup/servidor/batcueva-osint.yml` |
| Recon-ng | CLI | ídem |
| Qdrant (vectorial) | :6333 | ídem |
| Caddy (proxy) | :80/:443 | nativo Arch |

---

## 🖥️ Hardware — usuarios y rutas

### Madre (servidor headless)
- IP Tailscale: `100.91.112.32`
- **Usuario: `varopc`** ← ⚠️ NO es alvaro
- Home: `/home/varopc/`
- Docker compose dir: `/home/varopc/docker/`
- Hardware: i5-8400 · 16GB RAM · GTX 1060 6GB VRAM
- OS: Arch Linux headless
- Docker ✅ · Tailscale ✅ · UFW + fail2ban ✅
- Netdata: ✅ multi-nodo en `:19999`
- tmux: ⏳ pendiente instalar

### varopc (Acer — terminal de trabajo)
- IP Tailscale: `100.86.119.102`
- OS: Arch Linux + Hyprland
- Obsidian: ✅ · git pull pendiente
- Monitor Sony TV (DP-1): cable DP con mal contacto — fix: desconectar/reconectar
- Maltego CE: ⏳ instalar aquí (no en Madre)

---

## 🔴 Urgente — ahora mismo

1. **Ollama + Open WebUI** → `cd /home/varopc/docker/batcueva-nueva && docker compose pull && docker compose up -d`
2. **Modelos Ollama** → `ollama pull llama3:latest && ollama pull nomic-embed-text:latest`
3. **Auditoría inbox** → Claude/Grok procesando → output a Perplexity para ejecutar
4. **git pull** en varopc → sincronizar Obsidian

---

## 🟡 Esta semana

- Ejecutar Fase 2: tar1090 + Kismet + IVRE + Qdrant
- Caddy nativo: `sudo pacman -S caddy`
- Pipeline RAG: IVRE → Qdrant → Ollama → Obsidian
- Ronda 2 LLM: 7 fichas nuevas en `agentes/`
- Thdora: auditoría código → MVP real
- Módulo 05 Python

---

## 📊 Stack OSINT objetivo

```
Capa 1 — Escaneo activo:    SpiderFoot + IVRE + Recon-ng + Amass
Capa 2 — Vigilancia pasiva: Kismet (WiFi) + tar1090 (aviones)
Capa 3 — Análisis IA:       Ollama llama3 + nomic-embed-text
Capa 4 — Memoria vectorial: Qdrant
Capa 5 — Segundo cerebro:   yggdrasil-dew (Obsidian + GitHub)
Capa 6 — Proxy unificado:   Caddy + Tailscale MagicDNS
```

---

## 🤖 Agentes activos

| Agente | Acceso GitHub | Cuándo usarlo |
|---|---|---|
| **Perplexity** | ✅ MCP directo | Principal — escribe en repos, documenta |
| **Grok** | ❌ usar [[agentes/AGENT-SCRIPT]] | Investigación · datos frescos · acceso web |
| **Claude** | ❌ usar [[agentes/AGENT-SCRIPT]] | Código largo · razonamiento · auditorías |
| **Gemini** | ❌ usar [[agentes/AGENT-SCRIPT]] | Deep Research · contexto largo |
| **OpenCode** | ✅ local | Terminal · archivos locales |
| **TOKI** | ⏳ en desarrollo | Control móvil desde Telegram |

---

## 📁 Scripts listos

| Script | Ubicación | Estado |
|---|---|---|
| Fase 2 (Ollama+tar1090+Kismet) | `setup/servidor/batcueva-fase2.yml` | ✅ |
| OSINT (IVRE+Recon-ng+Qdrant) | `setup/servidor/batcueva-osint.yml` | ✅ |
| RAG orchestrator | `tools/rag_osint_engine.py` | ✅ |
| Caddyfile maestro | `setup/servidor/Caddyfile` | ✅ |
| Ollama + Open WebUI | `/home/varopc/docker/batcueva-nueva/docker-compose.yml` | ✅ |

---

## 📝 Diarios

- `diarios/2026-06-23.md` — sesión parque + casa
- `diarios/2026-06-22.md` — sesión noche, agentes LLM + Netdata

---

_Mantenido por Perplexity vía MCP GitHub_
_23 junio 2026 · 16:45 CEST_
_Ver: [[HOME]] · [[AGENT]] · [[filosofia]]_
