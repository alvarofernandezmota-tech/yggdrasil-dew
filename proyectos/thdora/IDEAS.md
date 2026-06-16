# 💡 IDEAS — THDORA

> Ideas y próximos pasos para el proyecto thdora.

---

## 📚 Guía de estudio Python desde código thdora

**Fecha idea:** 17 junio 2026  
**Estado:** 🔲 Pendiente de crear

### Concepto
Usar el código real de thdora como material de estudio de Python, en orden de dificultad creciente. Cada concepto se aprende directamente sobre algo que ya funciona y que es tuyo.

### Temario propuesto (borrador)

1. **Nivel 0 — Python puro**
   - Variables, tipos, funciones, clases → `src/config.py`, `src/services/github_client.py`
   - f-strings, diccionarios, listas → `src/bot/groq_router.py` (ejemplos JSON)

2. **Nivel 1 — Programación orientada a objetos**
   - Clases con métodos → `GitHubClient`, `GroqRouter`, `Settings`
   - `dataclass` → `ToolCallResult`, `AmbiguityRequest` en `groq_router.py`
   - `@property`, `__init__` → toda la capa de servicios

3. **Nivel 2 — Async/await**
   - Por qué async en un bot → `src/bot/main.py`
   - `async def`, `await`, `asyncio.run` → `_check_api()`, `append_to_diario()`
   - `httpx.AsyncClient` → `github_client.py`, `api_client.py`

4. **Nivel 3 — Librerías clave del ecosistema**
   - `pydantic` y validación de datos → `src/config.py`, modelos de la API
   - `python-telegram-bot` → handlers, ConversationHandler, filtros
   - `httpx` → cliente HTTP async, timeouts, manejo de errores

5. **Nivel 4 — Patrones y buenas prácticas**
   - Singleton, lru_cache → auditoría Sprint 2
   - Inyección de dependencias → refactoring api_client
   - Type hints completos → toda la base de código

### Dónde crear el material
`formacion/python/` en este mismo repo, un archivo por nivel.

---

## 🔮 Otras ideas

- Open WebUI apuntando a yggdrasil-dew para RAG sobre diarios personales
- Ollama en Madre: nomic-embed-text + qwen2.5:7b para búsqueda semántica
- Agente de gastos sobre plantilla THDORA
