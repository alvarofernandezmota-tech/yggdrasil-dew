# THDORA — Estado del Proyecto

> Bot Telegram personal con FastAPI + SQLite + LangGraph + Groq  
> Repo: https://github.com/alvarofernandezmota-tech/thdora

---

## Estado Actual · 18 junio 2026

| Elemento | Estado |
|----------|--------|
| Versión | v0.22.0 |
| Cold-start | ✅ Resuelto (17 fixes) |
| Docker stack | ✅ Robusto |
| Flujo /nueva | ✅ Funciona |
| Flujo NLP natural | ⚠️ Parcial (BUG-001, BUG-002) |
| Tests unitarios | ❌ Pendientes (5 críticos) |
| Auditoría IA | ✅ Completada hoy |

---

## Stack Técnico

```
Bot         python-telegram-bot v21
API         FastAPI + uvicorn
DB          SQLite via SQLAlchemy
Agente      LangGraph + Groq (llama-3.3-70b-versatile)
Memoria     langgraph-checkpoint-sqlite
Monitor     Prometheus + Grafana
Infra       Docker multi-stage
```

---

## Cómo arrancar

```bash
cd ~/Projects/thdora
git pull origin main
make smoke && make fresh && make logs
```

---

## Bugs Pendientes

### BUG-001 — MEDIO · Regex NLP incompleto
- Frases como "mañana tengo dentista" no crean cita
- Fix: ampliar regex en `src/bot/handlers/nlp.py`

### BUG-002 — MEDIO · LLM no llama a create_appointment
- El agente responde texto pero no persiste la cita en DB
- Fix: integrar tool `create_appointment` en el grafo

### BUG-003 — BAJO · Docker depends_on circular
- API depende de Prometheus → retrasa arranque
- Fix: eliminar `depends_on: prometheus` de `thdora` en docker-compose

---

## Próximas Acciones

- [ ] Arrancar bot y verificar `/start`, `hola`, `/nueva`, `/citas`
- [ ] Ejecutar `python scripts/ai_audit.py` con key real
- [ ] Fix BUG-001 (regex NLP)
- [ ] Fix BUG-002 (LLM → create_appointment)
- [ ] Fix BUG-003 (docker-compose depends_on)
- [ ] Implementar 5 tests pytest críticos
- [ ] Conectar THDORA con Obsidian en YGG

---

## Documentación Técnica (links directos)

- [Informe auditoría 18-jun](https://github.com/alvarofernandezmota-tech/thdora/blob/main/docs/THDORA_AUDIT_2026-06-18.md)
- [Consultas a IAs](https://github.com/alvarofernandezmota-tech/thdora/blob/main/docs/AI_QUERIES_2026-06-18.md)
- [Runbook arranque](https://github.com/alvarofernandezmota-tech/thdora/blob/main/docs/STARTUP_RUNBOOK.md)
- [Sesión interna](https://github.com/alvarofernandezmota-tech/thdora/blob/main/.github/audits/2026-06-18-session.md)
- [Script ai_audit.py](https://github.com/alvarofernandezmota-tech/thdora/blob/main/scripts/ai_audit.py)
