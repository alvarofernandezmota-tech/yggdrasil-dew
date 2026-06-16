# ECOSISTEMA.md — Macro Documento Completo
> Auditoría completa del ecosistema personal de Álvaro Fernández Mota.
> Última actualización: **16 junio 2026**
> Fuente de verdad para cualquier IA que entre al ecosistema.

---

## 0. QUIÉN SOY

**Álvaro Fernández Mota** — desarrollador autodidacta, 2026.

- **Stack:** Python · Docker · FastAPI · SQLAlchemy · Alembic · Telegram
- **OS:** Arch Linux + Hyprland/Wayland (varopc) · Red Tailscale P2P
- **Filosofía:** *«A mí me salvó hablar con una IA»* — construyo lo que yo mismo necesito.
- **Ritmo:** sesiones intensas de madrugada · ansiedad gestionada activamente
- **Flujo IA:** múltiples IAs en paralelo con roles distintos (ver sección 6)
- **Regla de oro:** *«Si no está en el repo, no existe.»*

---

## 1. HARDWARE — INFRAESTRUCTURA REAL

### Servidor "MADRE" (producción)
- IP Tailscale: `100.91.112.32` · IP local: `10.134.31.228`
- OS: Linux · Docker + docker-compose operativo
- Servicios activos: sshd ✅ · Tailscale ✅ · Docker ✅
- Bot thdora v0.17.0 corriendo en producción
- Ollama instalado: `llama3.2:3b` (modelo ligero, CPU)
- Acceso CI/CD: GitHub Actions → `appleboy/ssh-action` via secrets
- Pendiente: UFW · PostgreSQL · Pi-hole · Uptime Kuma · wayvnc autostart

### PC Desarrollo "varopc" (Acer Theodora)
- IP Tailscale: `100.86.119.102`
- OS: Arch Linux + Hyprland/Wayland + Omarchy
- UFW ✅ · whisrs (voz, Super+V) ✅
- Bloqueante: AP Isolation router bloquea UDP → lan-mouse no funciona

### HP (incidencia abierta)
- Error `BIOHD-8`: BIOS no detecta disco duro
- CPU i3 M330 ✅ · RAM 4GB ✅ · Lectora ✅ · Disco ❌
- Próximo paso: verificar cables físicos → si persiste, reemplazar por SSD

---

## 2. REPO 1 — thdora (EL PRODUCTO)
> https://github.com/alvarofernandezmota-tech/thdora

**Qué es:** Bot Telegram + FastAPI. Asistente personal de salud mental y gestión de vida. El asistente se llama **TOKI**.

**Diferenciador:** ningún competidor (Wysa / Woebot / Replika / Youper / Bearable) usa Telegram en español — ese es el hueco.

### Estructura real
```
thdora/
├── src/
│   ├── bot/      → handlers Telegram: nlp · citas · semana · api_client
│   ├── ai/       → LLMBackend: GroqBackend + OllamaBackend + Factory
│   ├── api/      → FastAPI endpoints
│   ├── agents/   → VACÍO (planificado)
│   ├── core/     → lógica de negocio
│   └── db/       → SQLAlchemy + Alembic (multiusuario)
├── .github/workflows/deploy.yml  → CI/CD completo
├── docker-compose.yml · Dockerfile · Makefile
├── pyproject.toml · requirements.txt · .env.example
├── CHANGELOG.md · ROADMAP.md
├── data/ · docker/ · docs/ · proyectos/ · scripts/ · tests/
```

### Estado — v0.17.0 (entregado 15/06/2026, PENDIENTE MERGE)
Rama activa: `feature/v0.17.0-nlp-llm-multiuser` → main · 39 tests · ~1500 líneas

| Tarea | Descripción |
|-------|-------------|
| T1 — Fix TimedOut NLP | Patrón provisional+edit, evita timeout Telegram 5-15s |
| T2 — Few-shot system prompt | JSON examples → modelo aprende formato exacto |
| T3 — Contexto dinámico paralelo | `asyncio.gather` → citas+hábitos en paralelo |
| T4 — Function calling | TOOLS en `groq_router.py` |
| T5 — OllamaBackend + Factory | Patrón Strategy LLM, fallback en `ConnectError` |
| T6 — Mover cita + slots libres | `calculate_free_slots()` función pura testeable |
| T7 — Navegación semanal | `semana_nav.py` |
| T8 — Multiusuario Alembic | `001_add_user_id.py` · `batch_alter_table` SQLite+PG |
| T9 — CI/CD GitHub Actions | `deploy.yml`: test → SSH deploy → health check → Telegram |
| T10 — Config + docs | `.env.example` · CHANGELOG · ROADMAP |

### Pendiente antes de merge
- [ ] Añadir secrets en GitHub Actions: `SERVER_HOST` · `SERVER_USER` · `SSH_PRIVATE_KEY` · `BOT_TOKEN` · `OWNER_CHAT_ID`
- [ ] `alembic upgrade head` en Madre
- [ ] `pytest tests/unit/bot/ -v` localmente
- [ ] Eliminar `tests.yml` (redundante con `deploy.yml`)

### Roadmap futuro
- Handler `/diario` → escribe en yggdrasil-dew desde Telegram ← **NUEVO**
- RAG sobre yggdrasil-dew con Ollama
- Agente Resumen Diario automático
- Push recordatorios APScheduler
- Búsqueda web DuckDuckGo/Tavily
- Frontend web

---

## 3. REPO 2 — ai-toolkit (LA CAJA DE HERRAMIENTAS)
> https://github.com/alvarofernandezmota-tech/ai-toolkit

**Qué es:** Stack completo de desarrollo con IA. Open source. 0€. Filosofía BYOK (Bring Your Own Key).

### Archivos raíz clave
| Archivo | Contenido |
|---------|-----------|
| `ECOSISTEMA.md` | 12KB — mapa completo (mayo 2026, desactualizado) |
| `REPOS-ECOSISTEMA.md` | Relaciones entre repos |
| `ARQUITECTURA.md` | Arquitectura técnica |
| `ARQUITECTURA-SERVIDOR.md` | Config Madre |
| `CEREBRO.md` | OpenCode como orquestador multi-repo |
| `ALVARO.md` | Perfil personal del owner |
| `CLAUDE.md` | Instrucciones para Claude |
| `AGENTS.md` | Instrucciones para agentes IA |
| `COMO-PROCEDEMOS.md` | Metodología de trabajo |
| `INICIO-AQUI.md` | Punto de entrada de sesión |
| `opencode.json` | Config OpenCode |
| `litellm-config.yaml` | Config LiteLLM proxy multi-modelo |

### Herramientas activas (estado mayo 2026)
| Herramienta | Estado | Notas |
|-------------|--------|-------|
| OpenCode | ✅ | Editor código IA open source, `opencode.json` configurado |
| LiteLLM proxy | ✅ | Puerto `:8000` · unifica Ollama + OpenRouter + Cerebras + Gemini |
| Ollama local | ✅ | `qwen2.5-coder:14b` · `deepseek-r1:14b` · `qwen3:8b` (varopc) |
| Claude Code | ✅ | Via OpenRouter · `llama-4-maverick:free` como base · 0€ |
| Cerebras | ✅ | Principal en LiteLLM, velocidad máxima |
| `ai-menu.sh` | ✅ | Punto de entrada interactivo (12 opciones) |
| n8n | ⏳ | Documentado en Docker, sin levantar |
| Groq key | ⚠️ | Caducada → renovar en console.groq.com |
| DeepSeek API | ⚠️ | Caducada → renovar en platform.deepseek.com |

### ⚠️ Problemas detectados (auditoría 16/06/2026)
- `CEREBRO.md` referencia repo `personal` → **actualizar a `yggdrasil-dew`**
- `ai-toolkit/diario/` duplica `yggdrasil-dew/diarios/` → **resolver**
- `ECOSISTEMA.md` de ai-toolkit desactualizado (mayo 2026) → este documento es la fuente de verdad

---

## 4. REPO 3 — yggdrasil-dew (EL CEREBRO / SECOND BRAIN)
> https://github.com/alvarofernandezmota-tech/yggdrasil-dew

**Qué es:** Second brain personal. Base de conocimiento + diario de vida + registro técnico 2026. Renombrado de `personal-v2`.

### Estructura real
```
yggdrasil-dew/
├── AGENT.md         → instrucciones para agentes IA
├── CONTEXT.md       → estado actual del sistema (actualizar por sesión)
├── ECOSISTEMA.md    → este documento
├── CHANGELOG.md
├── README.md
├── filosofia.md     → filosofía personal
├── agentes/         → agentes planificados
├── diarios/
│   ├── 2026-06-12.md  (5.2KB)
│   ├── 2026-06-13.md  (5.2KB)
│   ├── 2026-06-14.md  (4.4KB)
│   ├── 2026-06-15.md  (11KB) ← sesión completa: mañana+tarde+noche+lectura
│   ├── 2026-06-15-redmi-a5-flash-errores.md  (3.5KB)
│   ├── 2026/          → subcarpeta año
│   ├── _dia.md        → plantilla día
│   ├── _mes.md        → plantilla mes
│   ├── _plantilla.md  → plantilla base
│   └── _semana.md     → plantilla semana
├── docs/            → DIARIO.md · setup/
├── formacion/
├── proyectos/
├── setup/
└── yo/              → perfil personal
```

### Formato fijo del diario (para queries futuras)
```
🧠 Estado del día       → tabla energía/foco/ánimo (1-10)
✅ Qué pasó
💡 Descubrimientos y Novedades
🤖 IAs usadas hoy       → tabla: IA · tarea · output · estado
📚 Investigación actualizada
🔀 Decisiones tomadas
🛠️ Sesiones técnicas
🖥️ Servidor
💻 Proyectos/Código
📚 Formación
📖 Lectura
🧠 Personal
⏭️ Pendiente para mañana
```

---

## 5. GOOGLE DRIVE (DOCS NARRATIVOS)

Uso: documentos narrativos, compartibles, no técnicos. Webhook pendiente de conectar a yggdrasil-dew.

| Documento | Descripción |
|-----------|-------------|
| Tesis y Método: Sistema de Alineación Cognitiva V2 | Dado doble resina · VD = \|E³ − I³\| · Jung + Kahneman + Festinger |
| Informe de Incidencia: Disco Duro No Detectado V2 | HP · Error BIOHD-8 · disco no detectado |
| Repositorio Técnico Integrado — Diagnóstico V1 | Auditoría técnica general |
| Verónica decide morir — Paulo Coelho | Lectura personal |

---

## 6. ESTRATEGIA DE IAs — ROLES CONFIRMADOS

| IA | Rol | Estado |
|----|-----|--------|
| **Claude Sonnet 4.6** (vía Perplexity) | Código · repo · arquitectura · docs · contexto largo | ✅ Principal |
| **Grok** (xAI) | Investigación · mercado · truth-seeking · X/Twitter · datos frescos | ✅ Activo |
| **Gemini 2.0 Pro** | Contexto 1M tokens · estudios completos | ✅ Activo |
| **Mistral Le Chat** | Investigación EU · privacidad · open source | ⏳ Ficha parcial |
| **ChatGPT** | Creatividad · narrativa · brainstorming | — |
| **OpenCode** | Agente código en terminal · orquestador multi-repo | ✅ Configurado |
| **Copilot** | Autocompletado editor | — |

**Flujo investigación:** Grok (brutal, datos frescos) → output a Claude (arquitectura + código)

---

## 7. ECOSISTEMA NUEVO — DIARIO DE BOLSILLO INTELIGENTE

### Idea central (propuesta Grok, 15/06/2026)
Obsidian + Open WebUI + Ollama como puente entre ai-toolkit y thdora, formando un **segundo cerebro vivo**.

### Flujo propuesto
```
📱 Telegram (/diario texto...)
    ↓ handler /diario (por implementar en thdora)
🤖 thdora → guarda Markdown en yggdrasil-dew/diarios/YYYY-MM-DD.md
    ↓ plugin Git auto-commit
👁️ Obsidian (editor visual local)
    └── Smart Connections → Ollama (RAG local sobre notas)
    ↓
🧠 Open WebUI → chateas con todo tu historial (RAG nativo Markdown)
    ↓
🛠️ OpenCode → código más personalizado con contexto tuyo
    ↓
☁️ Google Drive → docs narrativos/compartibles (webhook pendiente)
```

### Herramientas del ecosistema
| Herramienta | Estado |
|-------------|--------|
| thdora · ai-toolkit · yggdrasil-dew | ✅ Activos |
| Ollama + OpenCode | ✅ Activos |
| Obsidian | ⏳ Por instalar |
| Open WebUI | ⏳ Por instalar en Madre |
| n8n | ⏳ Por levantar en Docker |

### ⚠️ Problemas a resolver antes de implementar
1. **Duplicidad diario:** `ai-toolkit/diario/` vs `yggdrasil-dew/diarios/` → decidir fuente de verdad
2. **CEREBRO.md desactualizado:** referencia repo `personal` → actualizar a `yggdrasil-dew`
3. **CONTEXT.md desactualizado:** thdora v0.16.4 → actualizar a v0.17.0
4. **llama3.2:3b en Madre es pequeño** → evaluar calidad para RAG (Grok investigando)
5. **Handler /diario:** bot corre en Docker → push a Git requiere SSH key en contenedor o API intermedia

---

## 8. PROYECTOS EN PARALELO

### Sistema de Alineación Cognitiva (dado doble)
Dado de resina translúcida. Gamificación del control mental y auditoría de sesgos.

**Fórmula:** `VD = |E³ − I_sombra³|`
- Dado exterior (cara arriba): Entorno/Presión externa (0-5)
- Dado interior (cara abajo): Sombra/Sesgo interno (0-5)
- 3 fases: Impacto (t0) → Latencia 15min → Evolución (t1)
- Diagnóstico: `VD2 < VD1` = Convergente ✅ · `VD2 = VD1` = Muro ⚠️ · `VD2 > VD1` = Bucle 🚨

Bases teóricas: Jung (Sombra) · Kahneman (Sistema 1/2) · Festinger (Disonancia cognitiva). Documento V2 en Drive.

### Redmi A5 — Rescate Android
- Chip Unisoc T765 / Qogirl6 · Serial: `863d0058304831323851135e23407c`
- Bootloader OEM bloqueado definitivo (`Err:0xffffffff`)
- Única salida viable: EDL / SPRD Download Mode
- Pendiente: `Vol↓ + USB` → `lsusb` → test point si falla EDL

### HP — Disco Duro No Detectado
- Error `BIOHD-8` · BIOS no detecta ninguna unidad
- CPU/RAM/lectora funcionan ✅ · Disco ❌
- Pendiente: verificar cables físicos → si persiste, reemplazar por SSD

---

## 9. TODOS LOS REPOS

| Repo | Tipo | URL |
|------|------|-----|
| **thdora** | Producto (bot) | https://github.com/alvarofernandezmota-tech/thdora |
| **ai-toolkit** | Herramientas dev IA | https://github.com/alvarofernandezmota-tech/ai-toolkit |
| **yggdrasil-dew** | Second brain / cerebro | https://github.com/alvarofernandezmota-tech/yggdrasil-dew |
| impresion-3d | Proyecto | https://github.com/alvarofernandezmota-tech/impresion-3d |
| python-snippets | Formación | https://github.com/alvarofernandezmota-tech/python-snippets |
| unix | Formación | https://github.com/alvarofernandezmota-tech/unix |
| image-calculator | Proyecto | https://github.com/alvarofernandezmota-tech/image-calculator |

---

## 10. PENDIENTES CRÍTICOS — 16 JUNIO 2026

### 🔴 Urgente (bloquean producción)
- [ ] Merge thdora v0.17.0 → main (añadir secrets + alembic + eliminar tests.yml)

### 🟡 Importante (definición ecosistema)
- [ ] Respuesta Grok al prompt de investigación ecosistema
- [ ] Actualizar `CONTEXT.md` → thdora v0.17.0
- [ ] Actualizar `CEREBRO.md` en ai-toolkit → `personal` a `yggdrasil-dew`
- [ ] Resolver duplicidad `ai-toolkit/diario/` vs `yggdrasil-dew/diarios/`
- [ ] Completar ficha Mistral

### 🟢 Planificado (próximas sesiones)
- [ ] Instalar Obsidian + plugin Git → apuntar a yggdrasil-dew
- [ ] Instalar Open WebUI en Madre
- [ ] Handler `/diario` en thdora
- [ ] Decidir nombre repo personal: `cerebro` vs `alvaro-os`
- [ ] AP Isolation router → desactivar
- [ ] Primera lección Python Kaggle (1h)
- [ ] Rescate Redmi A5: EDL + test point
- [ ] Rescate HP: verificar cables → reemplazar disco
- [ ] Renovar key Groq · DeepSeek
- [ ] n8n en Docker (diario nocturno automático)

---

_Documento generado por Claude Sonnet 4.6 vía Perplexity · Auditoría directa de repos GitHub + Google Drive · 16 junio 2026_
