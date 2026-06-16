# 🔍 Auditoría THDORA — v0.17.0

> Fecha: 17 junio 2026 · Branch: `feature/v0.17.0-nlp-llm-multiuser`  
> Generada por Claude tras leer los archivos reales del repo.

---

## 🔴 Crítico — afecta rendimiento/seguridad en producción YA

### C1 — groq_router.py usa os.environ, no settings
- **Archivo:** `src/bot/groq_router.py` líneas 148–149  
- **Problema:** `os.environ["GROQ_API_KEY"]` — si la key no está en el entorno en el momento exacto de la importación, el bot revienta con `KeyError`. Timeout sigue en `read=30.0`.
- **Fix:** Migrar a `settings.GROQ_API_KEY` / `settings.GROQ_MODEL`. Timeout → `read=45.0`.

### C2 — api_client.py usa API_BASE_URL, no THDORA_API_URL
- **Archivo:** `src/bot/api_client.py` líneas 11 y 28–47  
- **Problema:** `os.getenv("API_BASE_URL", "http://localhost:8000")` — en Docker, la variable es `THDORA_API_URL=http://api:8000`. El bot nunca llega a la API real. Sin timeout → hang indefinido.
- **Fix:**
```python
from src.config import settings
async with httpx.AsyncClient(timeout=httpx.Timeout(5.0)) as client:
```

### C3 — Sin control de acceso en /diario
- **Archivo:** `src/bot/handlers/diario.py`  
- **Problema:** Cualquier usuario puede escribir en yggdrasil-dew con el PAT de GitHub.
- **Fix:**
```python
allowed = {int(u) for u in settings.ALLOWED_USERS.split(",") if u.strip()}
if allowed and user_id not in allowed:
    await update.message.reply_text("⛔ No autorizado.")
    return
```

### C4 — PicklePersistence escribe en disco en cada update
- **Archivo:** `src/bot/main.py` línea 121  
- **Problema:** Write amplification constante. En HDD doméstico: +50–200ms de latencia por mensaje.
- **Fix corto plazo:**
```python
persistence = PicklePersistence(filepath=_PERSISTENCE_PATH, update_interval=60)
```
- **Fix estructural (Sprint 3):** Migrar a SQLitePersistence.

---

## 🟡 Importante — mejora significativa, bajo riesgo

### I1 — httpx.AsyncClient nuevo en cada operación HTTP
- `api_client.py` + `github_client.py` — cada llamada negocia TCP desde cero → +50–150ms de latencia.
- **Fix:** Cliente compartido como singleton o atributo de instancia.

### I2 — GitHubClient se instancia en cada llamada al handler
- `handlers/diario.py` línea 17 — bajo coste ahora, pero escala mal.
- **Fix:** `_github_client = GitHubClient()` a nivel de módulo.

### I3 — build_system_prompt() se recalcula en cada mensaje NLP
- `groq_router.py` línea 65 y 156 — serializa JSON + construye f-string de ~2.5KB en cada mensaje.
- **Fix:** `@lru_cache(maxsize=32)` sobre la función.

### I4 — ConversationHandlers sin timeout
- Estados huérfanos acumulados en el pickle con multiusuario.
- **Fix:** `conversation_timeout=300` en cada `ConversationHandler`.

### I5 — _load_token() no usa settings
- `main.py` líneas 113–118 — duplica lógica que Settings ya valida.
- **Fix:** `return settings.TELEGRAM_BOT_TOKEN`

### I6 — Sin typing... durante llamadas a Groq
- El usuario ve el bot mudo 3–8s y reenvía el mensaje (duplica llamadas).
- **Fix:** `await update.effective_chat.send_action(ChatAction.TYPING)` antes de llamar a Groq.

---

## 🟢 Mejoras menores

| ID | Archivo | Descripción |
|----|---------|-------------|
| M1 | `groq_router.py` | `import time` y `import os` sin usar — eliminar |
| M2 | `github_client.py` | `_inject_entry` no maneja TOKI_SECTION ausente en diarios manuales |
| M3 | `check_env.py` | Leer `THDORA_API_URL` desde Settings, no `os.environ` |
| M4 | `docker-compose.yml` | Healthcheck del bot siempre devuelve 0 → `pgrep -f entrypoint-bot.sh` |

---

## 💰 Reducción de coste tokens

| # | Problema | Tokens actuales | Con fix | Ahorro |
|---|----------|-----------------|---------|--------|
| 1 | `json.dumps(indent=2)` en few-shot → compacto | ~650/llamada | ~450 | 31% |
| 2 | Modelo 70b para intent simple → 8b | 650 in+out | ~400 | 40% |
| 3 | `max_tokens=1024` → 256 | reserva 1024 | 256 | 30% latencia |
| 4 | Few-shot 5 ejemplos → 1 por categoría | 350 fijos | ~70 | 53% system prompt |
| 5 | Pre-filtro saludos/ok antes de Groq | 650/mensaje | 0 | 100% mensajes triviales |

**Ahorro total estimado:** de ~650 tokens/mensaje a ~200 tokens/mensaje.  
Con 50 mensajes/día: **32.500 → 10.000 tokens/día**.

---

## 🏗️ Propuesta estructura

```
src/
├── config.py                  ✅
├── bot/
│   ├── main.py
│   ├── groq_router.py
│   ├── api_client.py          🔴 renombrar → thdora_client.py + migrar a settings
│   ├── scheduler.py
│   └── handlers/
├── services/
│   └── github_client.py       ✅
└── api/
```

Eliminar `core/`, `agents/`, `ai/`, `db/` si están vacíos — YAGNI.

---

## ✅ Checklist Sprint 2 — por impacto/esfuerzo

| Prioridad | Tarea | Archivo | Esfuerzo |
|-----------|-------|---------|----------|
| 🔴 1 | Guard ALLOWED_USERS en /diario | `handlers/diario.py` | 15 min |
| 🔴 2 | api_client.py → THDORA_API_URL + settings + timeout | `bot/api_client.py` | 30 min |
| 🔴 3 | PicklePersistence update_interval=60 | `bot/main.py` | 5 min |
| 🟡 4 | @lru_cache en build_system_prompt | `groq_router.py` | 10 min |
| 🟡 5 | httpx.AsyncClient compartido | ambos clientes | 30 min |
| 🟡 6 | send_action(TYPING) antes de Groq | `handlers/nlp.py` | 10 min |
| 🟡 7 | conversation_timeout=300 | `main.py` + factories | 20 min |
| 🟡 8 | _load_token() → settings | `main.py` | 5 min |
| 🟢 9 | json.dumps indent=None | `groq_router.py` | 5 min |
| 🟢 10 | max_tokens 1024 → 256 | `groq_router.py` | 2 min |
| 🟢 11 | Pre-filtro mensajes triviales | `handlers/nlp.py` | 45 min |
| 🟢 12 | Evaluar llama3-8b-8192 | `config.py` | 1h A/B |
| 🟢 13 | Healthcheck real bot | `docker-compose.yml` | 5 min |
| 🟢 14 | Singleton GitHubClient | `handlers/diario.py` | 2 min |

---

_Auditoría generada: 17 junio 2026 — post Sprint 1_
