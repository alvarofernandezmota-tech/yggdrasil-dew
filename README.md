# 🌲 yggdrasil-dew

> Second brain personal de Álvaro Fernández Mota.
> Última actualización: **17 junio 2026**

---

## ¿Qué es esto?

Este repo es el cerebro. La fuente de verdad única de todo el ecosistema técnico y personal.
Si no está aquí, no existe.

```
yggdrasil-dew
├── AGENT.md        ← leer primero si eres una IA
├── CONTEXT.md      ← estado HOY (actualizar cada sesión)
├── ECOSISTEMA.md   ← mapa completo del ecosistema
├── diarios/        ← un archivo por día — única fuente del diario
├── proyectos/      ← fichas de proyectos activos
├── setup/          ← toda la configuración técnica
├── formacion/      ← aprendizaje estructurado
├── agentes/        ← fichas y prompts de cada IA
└── yo/             ← perfil, CV, objetivos
```

---

## Proyectos activos

| Proyecto | Repo | Estado |
|---|---|---|
| **thdora** (bot TOKI) | [thdora](https://github.com/alvarofernandezmota-tech/thdora) | v0.17.0 pendiente merge |
| **ai-toolkit** | [ai-toolkit](https://github.com/alvarofernandezmota-tech/ai-toolkit) | Activo |
| **Servidor Madre** | — | Docker ✅ · UFW pendiente |
| **Redmi A5** | [proyectos/redmi-a5.md](proyectos/redmi-a5.md) | ROM descargando |
| **HP rescate** | [proyectos/hp-rescate.md](proyectos/hp-rescate.md) | Verificar cables |

---

## IAs del ecosistema

| IA | Rol |
|---|---|
| **Perplexity** (Claude Sonnet 4.6) | Principal · repos · código · MCP GitHub |
| **Grok** | Investigación · datos frescos · truth-seeking |
| **Gemini** | Código largo · contexto 1M tokens |
| **OpenCode** | Agente código en terminal |

> Ver fichas completas → [agentes/](agentes/)

---

## Cómo arrancar una sesión nueva

### Con Perplexity
```
Lee AGENT.md y CONTEXT.md de yggdrasil-dew y dame el estado actual.
```

### Auditoría rápida (desde varopc)
```bash
bash setup/scripts/audit-repo.sh
```

### Sync manual
```bash
bash setup/scripts/daily-sync.sh
```

---

## Regla de oro

> *Si no está en el repo, no existe.*

---

_Mantenido por Álvaro + Perplexity (MCP GitHub) · Arch Linux · Obsidian_
