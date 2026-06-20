---
tags: [contexto, sistema, estado, agente]
fecha-actualizacion: 2026-06-20
---

# CONTEXT.md — Estado HOY

> ⚠️ Actualizar SIEMPRE al inicio y al final de cada sesión.
> Este fichero es el "resumen ejecutivo" del ecosistema — lo primero que lee cualquier agente.
> Última actualización: **20 junio 2026 — 10:12 CEST**

---

## 📍 Dónde estamos ahora mismo

### yggdrasil-dew — segundo cerebro
- **AUDITORÍA MASIVA completada hoy 20 jun 2026** ✅
- ~40 archivos creados o actualizados esta mañana
- [[HOME]] — ✅ índice completo con todos los hipervínculos
- [[inbox/README]] — ✅ procedimiento oficial documentado
- [[inbox/MASTER-PENDIENTES]] — ✅ fuente única de verdad pendientes
- [[agentes/AGENT-SCRIPT]] — ✅ script RAW para Grok/Claude/Gemini
- [[setup/obsidian]] — ✅ 4 plugins + IA open-source gratuita documentada
- [[proyectos/thdora-docs]] — ✅ plan milimétrico thdora
- [[proyectos/impresion-3d]] — ✅ ficha creada
- [[proyectos/ai-toolkit]] — ✅ ficha creada
- [[formacion/python]] — ✅ procedimiento + M05 siguiente
- [[yo/perfil]] — ✅ completo
- [[diarios/2026-06-20]] — ✅ diario de hoy
- **Vault local Obsidian: ⏳ PENDIENTE `git pull`** — no ve nada de esto aún

### THDORA — bot TOKI
- Versión: **v0.22.1** · Stack Docker: 6/6 ✅
- API FastAPI (8000): ✅ healthy
- Bot Telegram: ⚠️ **pendiente fix** — `git pull + docker compose up --build` en Madre
- Pendiente verificar: `/start` en Telegram

### varopc (terminal de trabajo)
- OS: Arch Linux + Hyprland ✅
- Obsidian instalado: ✅ (hacer `git pull` para ver todo)
- Plugin Git Obsidian: ⏳ instalar
- nmap / theHarvester: ⏳ pendiente

### Madre (servidor)
- IP Tailscale: `100.91.112.32`
- Hardware: i5-8400 · 16GB RAM · GTX 1060 6GB VRAM
- Docker / Tailscale / Ollama: ✅
- UFW + fail2ban: ⏳ pendiente
- tmux: ⏳ instalar

---

## 🔴 Urgente — hacer ahora

1. `cd ~/Projects/yggdrasil-dew && git pull` → sincronizar vault Obsidian
2. Instalar 5 plugins Obsidian → ver [[setup/obsidian]]
3. SSH Madre → `git pull + docker compose up -d --build` → fix bot
4. Probar `/start` en Telegram → confirmar TOKI responde
5. SSH Madre → diagnóstico hardware → ver [[inbox/modelos-ollama-hardware-madre]]

---

## 🟡 Esta semana

- Obsidian-Copilot → conectar Ollama Madre (`100.91.112.32:11434` · `qwen2.5:7b`)
- Handler `/inbox` en thdora → primera implementación
- Handler `/diario` en thdora → escribir en vault desde Telegram
- Módulo 05 Python → martes
- Explorar `menu.py` thdora → miércoles
- Upgrade RAM 32GB → verificar slots antes de comprar

---

## 📊 Stack completo

| Herramienta | Dónde | Estado |
|---|---|---|
| THDORA API + TOKI | Madre Docker | ⚠️ API ok · bot verificar |
| PostgreSQL | Madre Docker | ✅ |
| Prometheus + Grafana | Madre Docker | ✅ |
| Ollama | Madre | ✅ · modelos: pull qwen2.5:7b |
| Tailscale | varopc + Madre | ✅ |
| Obsidian | varopc | ✅ · plugins pendiente instalar |
| Open WebUI | Madre | ⏳ |
| n8n | Madre | ⏳ |
| UFW + fail2ban | Madre | ⏳ |

---

## 📐 Arquitectura del sistema

```
Cualquier cosa nueva
        ↓
    inbox/     ← SIEMPRE aquí primero. Sin excepciones.
        ↓
  se organiza · se decide dónde va
        ↓
  destino definitivo:
  setup/ · proyectos/ · formacion/ · diarios/ · agentes/ · yo/
        ↓
  CONTEXT.md se actualiza   ← al final de cada sesión
        ↓
  AGENT.md si cambia algo estructural
```

---

## 🤖 Agentes activos

| Agente | Acceso GitHub | Cuándo usarlo |
|---|---|---|
| **Perplexity** | ✅ MCP directo | Principal — escribe en repos, documenta |
| **Grok** | ❌ usar [[agentes/AGENT-SCRIPT]] | Investigación · datos frescos |
| **Claude** | ❌ usar [[agentes/AGENT-SCRIPT]] | Código largo · razonamiento |
| **Gemini** | ❌ usar [[agentes/AGENT-SCRIPT]] | Arquitectura · contexto largo |
| **OpenCode** | ✅ local | Terminal · archivos locales |
| **TOKI** | ⏳ en desarrollo | Control móvil desde Telegram |

---

_Mantenido por Perplexity (Claude Sonnet 4.6) vía MCP GitHub_
_20 junio 2026 · 10:12 CEST · Cierre auditoría masiva_
_Ver: [[HOME]] · [[AGENT]] · [[agentes/AGENT-SCRIPT]] · [[inbox/MASTER-PENDIENTES]]_
