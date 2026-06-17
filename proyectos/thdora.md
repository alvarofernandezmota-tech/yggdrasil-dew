# 🤖 thdora / TOKI — Ficha de Proyecto

> Fuente de verdad del proyecto thdora.
> Última actualización: **17 junio 2026**

---

## Qué es

Bot Telegram personal + API REST. El asistente se llama **TOKI**.
Gestiona citas, hábitos, diario y notificaciones diarias desde Telegram.
Diferenciador: ningún competidor (Wysa / Woebot / Replika / Youper / Bearable) usa Telegram en español.

**Repo:** https://github.com/alvarofernandezmota-tech/thdora

---

## Estado actual

| Campo | Valor |
|---|---|
| Versión en producción | v0.16.0 (main) |
| Versión pendiente merge | v0.17.0 (`feature/v0.17.0-nlp-llm-multiuser`) |
| Servidor | Madre · Docker · corriendo 24/7 desde 24 abril 2026 |
| DB actual | SQLite |
| DB planificada | PostgreSQL |
| LLM actual | Groq (Llama 3.1) |
| LLM local | Ollama qwen3:8b (varopc) · llama3.2:3b (Madre) |

---

## Pendiente antes del merge v0.17.0

- [ ] Añadir secrets en GitHub Actions (`GITHUB_TOKEN`, `GROQ_API_KEY`, `HOST`, `USER`, `KEY`, `PORT`)
- [ ] `alembic upgrade head` en Servidor Madre
- [ ] `pytest tests/unit/bot/ -v` en local sin errores
- [ ] Eliminar workflow `tests.yml` obsoleto

---

## Roadmap v0.18+

### 🔜 Próxima versión — v0.18.0
- Notas de voz (Whisper vía Groq)
- Historial conversacional NLP persistente entre reinicios
- CD automático GitHub Actions → Madre por SSH (si no está en v0.17)

### 🟡 Medio plazo — v0.19.0
- Fallback automático Ollama → Groq
- Soporte multiusuario completo con gestión desde bot
- Capa regex NLP nivel 0 (intenciones simples sin LLM)
- PostgreSQL en Servidor Madre

### 🔵 Largo plazo
- Extracción de `thdora-base` como módulo reutilizable / open source
- RAG sobre yggdrasil-dew (Open WebUI + Ollama)
- Handler `/diario` completo con resumen nocturno automático
- Comercialización TOKI: ver [toki-comercializacion.md](toki-comercializacion.md)

---

## Conexión con yggdrasil-dew

| Dirección | Cómo | Estado |
|---|---|---|
| thdora **escribe** en ygg | `/diario` → GitHub Contents API | ⏳ En rama v0.17.0 |
| thdora **lee** ygg | RAG Ollama sobre vault | 🔵 Planificado |
| GitHub Actions **resumen nocturno** | 23:00 → commit en ygg | 🔵 Planificado |

---

## Arquitectura real (v0.17.0)

```
src/
├── api/          ← FastAPI endpoints
├── ai/           ← LLMBackend: GroqBackend + OllamaBackend + Factory
├── bot/
│   ├── handlers/
│   │   ├── citas.py
│   │   ├── habitos.py
│   │   ├── semana.py
│   │   ├── nlp.py
│   │   └── diario.py   ← escribe en yggdrasil-dew
│   ├── api_client.py
│   ├── github_client.py  ← GitHub Contents API
│   └── scheduler.py
├── core/
└── db/           ← SQLAlchemy + Alembic + multiusuario
```

---

## Decisiones técnicas clave

- **Separación API/bot:** el bot es un cliente HTTP puro, nunca toca la DB directamente
- **LLMBackend factory:** intercambiable entre Groq y Ollama sin cambiar handlers
- **AbstractLifeManager:** permite migrar de SQLite a PostgreSQL cambiando solo una clase
- **Multiusuario:** `user_id` en todos los modelos, aislamiento total de datos
- **yggdrasil-dew como destino:** el diario no vive en thdora, vive en el segundo cerebro

---

## Historial de versiones

| Versión | Fecha | Hito |
|---|---|---|
| v0.16.0 | 24 abril 2026 | Lanzamiento producción, 9 comandos, NLP Groq |
| v0.17.0 | junio 2026 | LLMBackend, multiusuario, /diario → ygg |

---

_Ver ROADMAP.md en el repo para estado de branches: [thdora/ROADMAP.md](https://github.com/alvarofernandezmota-tech/thdora/blob/main/ROADMAP.md)_
_Diario del proyecto: [diarios/](../diarios/)_
