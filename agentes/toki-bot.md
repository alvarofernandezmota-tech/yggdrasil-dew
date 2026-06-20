---
tags: [agente, toki, telegram, bot, automatizacion, vision]
fecha-actualizacion: 2026-06-20
---

# 🤖 TOKI — Bot Telegram (agente personal)

## Qué es

TOKI es el bot de Telegram del ecosistema. Corre en [[setup/madre]] vía Docker.
Es el **único punto de entrada móvil** al ecosistema — desde el móvil, sin abrir Obsidian ni GitHub.

## Estado actual

- Stack Docker: 6/6 healthy ✅
- API FastAPI: `http://100.91.112.32:8000` (vía Tailscale)
- Repo: [[proyectos/thdora]]

## Visión — Organizar TODO desde el bot

> **Objetivo:** TOKI como centro de control del ecosistema desde el móvil.
> Sin abrir Obsidian, sin abrir GitHub. Solo Telegram.

### Handlers a implementar (por prioridad)

#### 🔴 Alta — Segundo cerebro desde móvil
- [ ] `/diario <texto>` — escribe entrada en `diarios/YYYY-MM-DD.md` de ygg vía GitHub API
- [ ] `/inbox <texto>` — crea nota en `inbox/` con tags automáticos
- [ ] `/tarea <texto>` — añade `- [ ] <texto>` al diario del día
- [ ] `/nota <texto>` — captura rápida sin estructura

#### 🟡 Media — Control del ecosistema
- [ ] `/estado` — muestra estado de todos los servicios Docker en Madre
- [ ] `/deploy` — hace `git pull + docker compose up --build` en thdora
- [ ] `/logs [servicio]` — últimas 20 líneas de logs
- [ ] `/git <repo> <mensaje>` — commit + push en repo especificado

#### 🟢 Baja — Productividad
- [ ] `/hoy` — resumen del diario de hoy
- [ ] `/pendientes` — lista todas las notas con tag `#pendiente`
- [ ] `/semana` — resumen de la semana en curso
- [ ] `/python <pregunta>` — consulta al curso de Python

## Arquitectura del handler `/diario`

```
Usuario escribe en Telegram
    ↓
TOKI recibe mensaje
    ↓
API FastAPI (Madre) → GitHub API
    ↓
crea/actualiza diarios/YYYY-MM-DD.md en ygg
    ↓
git pull en varopc → Obsidian muestra el diario
```

## Integración con OpenCode

```
TOKI recibe /deploy
    ↓
FastAPI llama script en Madre
    ↓
OpenCode ejecuta rebuild
    ↓
TOKI notifica resultado por Telegram
```

---
_Ver también: [[proyectos/thdora]] · [[setup/madre]] · [[agentes/perplexity]] · [[HOME]]_
