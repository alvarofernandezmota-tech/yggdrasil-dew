---
tags: [agente, script, claude, grok, gemini, raw, contexto]
fecha-actualizacion: 2026-06-20
---

# 📜 AGENT SCRIPT — Contexto RAW para Claude / Grok / Gemini

> Pega este bloque RAW al inicio de cualquier sesión con Claude, Grok o Gemini.
> Es el contexto completo del ecosistema en formato compacto.
> Actualizar este archivo cuando cambie algo estructural.

---

## 📤 Cómo usarlo

```
1. Abrir Claude / Grok / Gemini
2. Nuevo chat
3. Pegar el bloque RAW de abajo como primer mensaje
4. El agente ya tiene todo el contexto — empezar a trabajar
```

> Con Perplexity no hace falta — tiene MCP GitHub directo y lee los repos.
> Con Claude/Grok/Gemini sí hace falta porque no tienen acceso al repo.

---

## 📝 BLOQUE RAW — copiar y pegar tal cual

```
=== CONTEXTO ECOSISTEMA ÁLVARO FERNÁNDEZ MOTA ===
Fecha: {{HOY}}
Repo segundo cerebro: https://github.com/alvarofernandezmota-tech/yggdrasil-dew

--- REGLAS DEL SISTEMA ---
1. Todo entra por inbox/ primero. Nunca sobreescribir directo.
2. Flujo: inbox → destino definitivo → actualizar CONTEXT.md
3. Cada proyecto tiene su propio inbox/ dentro de su carpeta.
4. CONTEXT.md = estado actual. Leerlo siempre.
5. AGENT.md = reglas estructurales. Seguirlas siempre.

--- MÁQUINAS ---
Madre (servidor 24/7):
  - IP Tailscale: 100.91.112.32
  - Hardware: i5-8400 · 16GB RAM · GTX 1060 6GB VRAM
  - OS: Linux (Arch/Ubuntu — verificar)
  - Servicios: thdora API+bot · PostgreSQL · Prometheus · Grafana · Ollama

varopc (Acer — terminal de trabajo):
  - IP Tailscale: 100.86.119.102
  - Hardware: Ryzen 5 5500U · 8GB RAM
  - OS: Arch Linux + Hyprland (Omarchy)
  - Vault Obsidian: ~/Projects/yggdrasil-dew

--- PROYECTOS ACTIVOS ---
thdora: bot Telegram TOKI · FastAPI · Docker · v0.22.1 en producción
  - Pendiente: fix restart loop bot · handlers /diario /inbox /estado /deploy
  - Docs: yggdrasil-dew/proyectos/thdora-docs.md

impresion-3d: en investigación · sin impresora aún
ai-toolkit: instalado en Madre · bloqueado hasta RTX 3060

--- FORMACIÓN ---
Python: curso en personal/02_formacion/02_python/ · Módulo 05 SIGUIENTE
Linux: Arch+Hyprland en uso diario ✅
SQL: DBeaver · practica.db · CE02 JOINs
OSINT: pendiente instalar herramientas

--- AGENTES IA ---
Perplexity: MCP GitHub directo · agente principal · escribe en repos
Claude/Grok/Gemini: necesitan este script de contexto
OpenCode: terminal local
TOKI (bot): en desarrollo · control móvil del ecosistema

--- STACK TÉCNICO ---
Bot: Python + LangGraph + Telegram Bot API
Backend: FastAPI + PostgreSQL
Monitoreo: Prometheus + Grafana
IA local: Ollama (qwen2.5:7b recomendado)
VPN: Tailscale
CI/CD: GitHub Actions
Segundo cerebro: Obsidian → yggdrasil-dew

--- FILOSOFÍA ---
Producción primero, perfección después.
El ritmo es más importante que el sprint.
Nada se sobreescribe sin pasar por inbox.
=== FIN CONTEXTO ===
```

---

## 🔄 Cuándo actualizar este script

- Nueva máquina en el ecosistema
- Nuevo proyecto activo
- Cambio de IP Tailscale
- Nueva regla del sistema
- Cambio de stack técnico

> Actualizar aquí + en AGENT.md + en CONTEXT.md. Los tres siempre sincronizados.

---

_Ver también: [[AGENT]] · [[CONTEXT]] · [[agentes/perplexity]] · [[HOME]]_
