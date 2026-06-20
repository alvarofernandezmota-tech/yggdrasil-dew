# CONTEXT.md — Estado HOY

> ⚠️ Actualizar SIEMPRE al inicio y al final de cada sesión.
> Este fichero es el "resumen ejecutivo" del ecosistema — lo primero que lee cualquier agente.
> Última actualización: **20 junio 2026 — 10:00 CEST**

---

## 📍 Dónde estamos ahora mismo

### THDORA — bot TOKI
- Versión: **v0.22.1** en rama `main`
- Stack Docker en Madre: **6/6 contenedores arriba** ✅
- API FastAPI (puerto 8000): **healthy** ✅
- Bot Telegram: ⚠️ **pendiente verificar** — hacer `/start` en Telegram para confirmar
- Fix bot restart loop (langgraph): ⏳ pendiente `git pull + docker compose up --build` en Madre

### yggdrasil-dew — segundo cerebro
- **AUDITORÍA MASIVA completada hoy 20 jun 2026** ✅
- ~30 archivos nuevos o actualizados esta mañana
- HOME.md: ✅ completo, cero links rotos
- inbox/: ✅ 8 notas etiquetadas con destino claro
- Filosofía, agentes, formación, setup, diarios: ✅ todo conectado
- **Vault local Obsidian: ⏳ PENDIENTE `git pull`** — no ve los cambios de hoy

### varopc (Acer — terminal de trabajo)
- OS: Arch Linux + Hyprland (Omarchy) ✅
- IP Tailscale: `100.86.119.102`
- Obsidian instalado: ✅ (verificar `yay -S obsidian` si no)
- Plugin Git Obsidian: ⏳ pendiente instalar
- nmap / theHarvester: ⏳ pendiente `yay -S nmap theharvester`

### Madre (servidor central)
- OS: Linux (verificar: `uname -a`)
- IP Tailscale: `100.91.112.32`
- CPU: i5-8400 · RAM: 16GB · GPU: GTX 1060 6GB VRAM
- Docker: ✅ · Tailscale: ✅ · Ollama: ✅
- UFW + fail2ban: ⏳ pendiente
- tmux: ⏳ instalar

---

## 🔴 Urgente — hacer hoy

1. `cd ~/Projects/yggdrasil-dew && git pull` → sincronizar vault local
2. Instalar plugin **Obsidian Git** → auto-sync permanente
3. SSH Madre → `git pull + docker compose up -d --build` → fix bot
4. Probar `/start` en Telegram → confirmar TOKI responde
5. SSH Madre → ejecutar diagnóstico hardware (ver `inbox/modelos-ollama-hardware-madre.md`)

---

## 🟡 Esta semana

- Instalar Local GPT en Obsidian → conectar a Ollama Madre (`100.91.112.32:11434`)
- Handler `/diario` en thdora → escribir en ygg desde Telegram
- Handler `/inbox` en thdora → captura rápida desde móvil
- Documentar ruta repo thdora en Madre (`find ~ -name docker-compose.yml`)
- Upgrade RAM Madre: verificar slots libres antes de comprar (~45€)

---

## 📊 Stack tecnológico completo

| Herramienta | Dónde | Estado |
|---|---|---|
| THDORA API + bot TOKI | Madre Docker | ⚠️ API ok · bot verificar |
| Prometheus + Grafana | Madre Docker | ✅ corriendo |
| PostgreSQL | Madre Docker | ✅ corriendo |
| Ollama | Madre | ✅ · modelos pendiente pull |
| Tailscale | varopc + Madre | ✅ |
| Obsidian | varopc | ✅ · plugin Git pendiente |
| Open WebUI | Madre | ⏳ pendiente |
| n8n | Madre | ⏳ pendiente |
| UFW + fail2ban | Madre | ⏳ pendiente |

---

## 📐 Arquitectura del sistema — flujo de información

```
Cualquier idea / dato / cambio
        ↓
    inbox/          ← TODO entra aquí primero
        ↓
  se organiza y se decide dónde va
        ↓
  se mueve a su destino definitivo:
    setup/ · proyectos/ · formacion/ · diarios/ · agentes/
        ↓
  CONTEXT.md se actualiza    ← SIEMPRE al final
        ↓
  AGENT.md se actualiza si cambia contexto estructural
```

**Regla de oro:** Nada se sobreescribe directamente. Primero inbox, luego destino, luego CONTEXT.

---

## 🤖 Agentes activos

| Agente | Rol | Acceso GitHub |
|---|---|---|
| **Perplexity** | Principal — escribe en repos vía MCP | ✅ directo |
| **Grok** | Investigación · datos frescos | ❌ no |
| **Gemini** | Código largo · arquitectura | ❌ no |
| **OpenCode** | Terminal · archivos locales | ✅ local |
| **TOKI** | Bot Telegram · control móvil | ⏳ en desarrollo |

---

_Mantenido por Perplexity (Claude Sonnet 4.6) vía MCP GitHub_
_20 junio 2026 10:00 CEST · Post-auditoría masiva_
