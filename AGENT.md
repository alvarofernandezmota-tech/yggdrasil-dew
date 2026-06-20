# AGENT.md — Contexto para agentes IA

> Lee este archivo al inicio de cada sesión.
> Contiene todo lo que necesitas saber para trabajar en este ecosistema sin preguntar.

---

## 👤 Quién es el usuario

- **Nombre:** Álvaro Fernández Mota
- **Perfil:** Desarrollador autodidacta. Aprende haciendo. Stack: Python, Docker, Linux, IA local.
- **Filosofía:** Producción primero, perfección después. El ritmo es más importante que el sprint.
- **Repo filosofía completa:** [[filosofía]]

---

## 🖥️ Ecosistema de máquinas

| Máquina | Alias | OS | IP Tailscale | Rol |
|---|---|---|---|---|
| Ordenador Madre | `Madre` | Linux (Omarchy/Arch) | `100.91.112.32` | Servidor 24/7 · Docker · thdora |
| Portátil Acer | `varopc` | Arch Linux + Hyprland | `100.86.119.102` | Terminal de trabajo |
| HP TouchSmart | `HP` | Linux Mint (pendiente) | — | Visualización / dashboard |

---

## 🗂️ Repos activos

| Repo | URL | Para qué |
|---|---|---|
| `yggdrasil-dew` | https://github.com/alvarofernandezmota-tech/yggdrasil-dew | Segundo cerebro · Obsidian vault |
| `thdora` | privado | Bot TOKI · FastAPI · Docker |
| `personal` | https://github.com/alvarofernandezmota-tech/personal | Histórico · curso Python · se archiva |

---

## 📋 Reglas del sistema

1. **Todo entra por `inbox/`** — nunca sobreescribir directamente
2. **inbox → destino → CONTEXT.md** — ese es el orden siempre
3. **CONTEXT.md** = estado actual del ecosistema — actualizar al inicio Y al final de cada sesión
4. **AGENT.md** = contexto estructural — actualizar solo si cambia algo estructural (nuevo repo, nueva máquina, nueva regla)
5. **HOME.md** = índice de navegación — actualizar cuando se añade sección nueva
6. **No sobreescribir sin inbox** — si hay duda, inbox primero

---

## 🤖 Agentes del ecosistema

| Agente | Para qué | MCP GitHub |
|---|---|---|
| Perplexity | Principal — escribe en repos, documenta, organiza | ✅ |
| Grok | Datos frescos · investigación | ❌ |
| Gemini | Código largo · arquitectura | ❌ |
| OpenCode | Terminal · local | ✅ local |
| TOKI (bot) | Control móvil desde Telegram | ⏳ en desarrollo |

---

## 🛠️ Stack técnico activo

- **Bot:** Python + LangGraph + Telegram Bot API
- **Backend:** FastAPI + PostgreSQL (Docker)
- **Monitoreo:** Prometheus + Grafana
- **IA local:** Ollama en Madre (GTX 1060 · 6GB VRAM)
- **VPN:** Tailscale (varopc ↔ Madre)
- **Segundo cerebro:** Obsidian → vault = yggdrasil-dew
- **CI/CD:** GitHub Actions

---

## 📐 Flujo de trabajo estándar

```
Idea / tarea / dato nuevo
    ↓
inbox/     ← siempre aquí primero
    ↓
se organiza → se mueve al destino
    ↓
CONTEXT.md se actualiza
```

---

_Actualizado: 20 jun 2026 10:00 CEST · Post-auditoría masiva_
