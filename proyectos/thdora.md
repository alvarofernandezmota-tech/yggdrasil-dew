# THDORA — Bot Telegram Personal

---

## Resumen

**Qué es:** Bot de Telegram personal que actúa como asistente + tracker de vida
**Por qué existe:** Automatizar registro diario, hábitos, recordatorios y consultas personales
**Estado actual:** 🔄 Activo en Ordenador Madre — migrando al Acer (Home Server)
**Repo GitHub:** github.com/alvarofernandezmota-tech/thdora (privado)

---

## Objetivo final

THDORA corre 24/7 en el Acer, tiene acceso a PostgreSQL, puede responder preguntas sobre mis datos, registrar entradas del diario desde Telegram y eventualmente llamar al LLM local (Ollama) para razonar.

---

## Stack

- Python 3
- python-telegram-bot
- PostgreSQL (migración pendiente desde SQLite)
- Docker (pendiente containerizar)
- Acer como servidor host

---

## Estado y próximos pasos

| Tarea | Estado |
|---|---|
| Bot funcional en Ordenador Madre | ✅ |
| Migrar a Acer | 🔄 En curso |
| Migrar DB a PostgreSQL | 🔄 En curso |
| Containerizar con Docker | ⏳ Pendiente |
| Integrar con Ollama local | ⏳ Futuro |

**Próximo paso:** Completar migración al Acer y confirmar que corre 24/7

---

## Log

- `2026-06-12` — Proyecto documentado en personal-v2
