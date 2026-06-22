---
tags: [contexto, sistema, estado, agente]
fecha-actualizacion: 2026-06-22
---

# CONTEXT.md — Estado HOY

> ⚠️ Actualizar SIEMPRE al inicio y al final de cada sesión.
> Este fichero es el "resumen ejecutivo" del ecosistema — lo primero que lee cualquier agente.
> Última actualización: **22 junio 2026 — 21:55 CEST**

---

## 📍 Dónde estamos ahora mismo

### yggdrasil-dew — segundo cerebro
- **Sesión 22 jun 2026** — tarde/noche
- [[agentes/]] — ✅ 15 fichas LLM nuevas creadas (cloud + local + especializados)
- [[inbox/README]] — ✅ elevado a estándar ingeniería v2.0 (estados, SLA, protocolo auditoría)
- [[inbox/MASTER-PENDIENTES]] — ✅ actualizado con perfil profesional + plan real
- [[inbox/2026-06-22-tarde-netdata-agentes-llm]] — ✅ sesión completa documentada + Prompt Maestro v2
- [[filosofia]] — ✅ v2.0 con principios de ingeniería — las 4 preguntas + anti-patrones
- **Vault local Obsidian: ⏳ PENDIENTE `git pull`** — acumula cambios desde el 20 jun

### Netdata — monitoreo multi-nodo ✅ NUEVO
- **Madre** (`100.91.112.32`) — receiver + dashboard central
- **Acer** (`100.86.119.102`) — sender conectado
- Dashboard: `http://100.91.112.32:19999` — 2 nodos activos
- API key: `5e5bbc39-0cc2-4650-a691-b273e8a131f2`
- Pendiente: SSH sin contraseña Madre→Acer + autossh persistente

### THDORA — bot TOKI
- Versión: **v0.22.1** · Stack Docker: 6/6 ✅
- API FastAPI (8000): ✅ healthy
- Bot Telegram: ⚠️ **pendiente verificar** — `/start` en Telegram
- Estado real del código: **pendiente auditoría al milímetro** — MVP a definir

### varopc (terminal de trabajo)
- OS: Arch Linux + Hyprland ✅
- Obsidian instalado: ✅ (hacer `git pull` para ver cambios del 20+22 jun)
- Plugin Git Obsidian: ⏳ instalar
- nmap / theHarvester: ⏳ pendiente instalar

### Madre (servidor)
- IP Tailscale: `100.91.112.32`
- Hardware: i5-8400 · 16GB RAM · GTX 1060 6GB VRAM
- Docker / Tailscale / Ollama / Netdata: ✅
- UFW + fail2ban: ✅ (configurado el 20 jun)
- tmux: ⏳ instalar
- SSH sin contraseña hacia Acer: ⏳ pendiente

---

## 🔴 Urgente — próxima sesión

1. **Ronda 2 LLM** → copiar Prompt Maestro v2 de inbox → Gemini Deep Research → 7 fichas nuevas en `agentes/`
2. **Auditoría inbox** → 24 archivos pendientes → protocolo 1 a 1 (ver `inbox/README.md` sección 4)
3. **SSH sin contraseña** → `ssh-keygen -t ed25519` en Madre → `ssh-copy-id varo@100.86.119.102`
4. **`git pull`** en varopc → sincronizar Obsidian con todos los cambios

---

## 🟡 Esta semana

- Auditoría repo completo (después de vaciar inbox)
- Thdora: auditoría código al milímetro → definir MVP real
- Módulo 05 Python → martes
- OSINT setup: instalar nmap + theHarvester en Madre
- Obsidian Git plugin → auto-sync permanente

---

## 📊 Stack completo

| Herramienta | Dónde | Estado |
|---|---|---|
| THDORA API + TOKI | Madre Docker | ⚠️ API ok · bot verificar |
| PostgreSQL | Madre Docker | ✅ |
| Prometheus + Grafana | Madre Docker | ✅ |
| Ollama | Madre | ✅ · modelos: qwen2.5:7b + otros |
| Netdata | Madre + Acer | ✅ multi-nodo desde 22 jun |
| Tailscale | varopc + Madre + Acer | ✅ |
| Obsidian | varopc | ✅ · git pull pendiente |
| Open WebUI | Madre | ⏳ |
| n8n | Madre | ⏳ |

---

## 🧠 Perfil profesional del sistema

> Todo lo que se construye en este ecosistema apunta a este perfil:

- **Dev Python** — scripting, automatización, bots, APIs, ML
- **Pentest Linux** — OSINT, reconocimiento de redes, seguridad ofensiva
- **IA local** — Ollama, LLMs open source, RAG, fine-tuning, agentes
- **LLMs / ML** — arquitecturas, entrenamiento, inferencia, despliegue
- **Chatbots** — Telegram bots, handlers, memoria, integración LLM

---

## 📐 Arquitectura del sistema

```
Cualquier cosa nueva
        ↓
    inbox/     ← SIEMPRE aquí primero. Sin excepciones.
        ↓
  Auditoría 1 a 1 (ver inbox/README.md)
  ¿Qué problema resuelve? ¿Por qué ahora? ¿Cómo simple? ¿Cómo verificar?
        ↓
  destino definitivo:
  setup/ · proyectos/ · formacion/ · diarios/ · agentes/ · yo/ · tools/
        ↓
  CONTEXT.md se actualiza   ← al final de cada sesión
```

---

## 🤖 Agentes activos

| Agente | Acceso GitHub | Cuándo usarlo |
|---|---|---|
| **Perplexity** | ✅ MCP directo | Principal — escribe en repos, documenta |
| **Grok** | ❌ usar [[agentes/AGENT-SCRIPT]] | Investigación · datos frescos |
| **Claude** | ❌ usar [[agentes/AGENT-SCRIPT]] | Código largo · razonamiento |
| **Gemini** | ❌ usar [[agentes/AGENT-SCRIPT]] | Deep Research · contexto largo |
| **OpenCode** | ✅ local | Terminal · archivos locales |
| **TOKI** | ⏳ en desarrollo | Control móvil desde Telegram |

---

## 📝 Fichas LLM en `agentes/` — estado

### ✅ Completas (22 jun 2026)
`claude-sonnet-4.6` · `chatgpt-o3` · `gemini-2.5-pro` · `grok-3` · `mistral-large-2`
`ollama-llama3.3-70b` · `ollama-qwen2.5-72b` · `ollama-deepseek-r1` · `ollama-mistral-7b`
`ollama-phi4` · `ollama-gemma3` · `ollama-codegemma-starcoder2`
`especializados-ocr-vision` · `especializados-embeddings` · `especializados-audio`

### ⏳ Pendientes (ronda 2 — Prompt Maestro v2)
`tecnicas-entrenamiento` · `parametros-inferencia` · `fine-tuning-local`
`erika-persona` · `arquitecturas-emergentes` · `seguridad-ataques-llm` · `etica-principios-por-modelo`

### ⚠️ Stubs a sustituir
`gemini.md` · `grok.md` · `opencode.md` · `perplexity.md`

---

_Mantenido por Perplexity (Claude Sonnet 4.6) vía MCP GitHub_
_22 junio 2026 · 21:55 CEST · Cierre sesión tarde_
_Ver: [[HOME]] · [[AGENT]] · [[filosofia]] · [[inbox/MASTER-PENDIENTES]]_
