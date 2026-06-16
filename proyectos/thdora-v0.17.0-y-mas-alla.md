# proyectos/thdora-v0.17.0-y-mas-alla.md — Plan de trabajo

> Documento para coordinar la auditoría, merge y despliegue de thdora.
> Fecha: 16 junio 2026 · Sesión nocturna.

---

## 1. Objetivo inmediato

- Auditar thdora v0.17.0 (rama `feature/v0.17.0-nlp-llm-multiuser`).
- Merge limpio a `main`.
- Levantar stack Docker completo en Madre y probar end-to-end:
  - Bot Telegram activo.
  - Comando `/diario` escribiendo en `yggdrasil-dew/diarios/`.
  - Despliegue vía GitHub Actions funcionando.

---

## 2. Estado actual conocido

- thdora está en producción en Madre, pero con v0.16.x como base.
- v0.17.0 vive en rama `feature/v0.17.0-nlp-llm-multiuser` y aún no ha sido mergeada.
- CI/CD tiene `deploy.yml` para desplegar a Madre vía SSH.
- Falta añadir secrets de GitHub Actions para despliegue automático:
  - `SERVER_HOST`, `SERVER_USER`, `SSH_PRIVATE_KEY`, `BOT_TOKEN`, `OWNER_CHAT_ID`.

---

## 3. Plan de trabajo (ordenado)

1. **Auditoría rápida de thdora**
   - Revisar `README.md` y `ECOSISTEMA.md` (en ai-toolkit) para entender el rol de thdora.
   - Revisar estructura de `src/` (bot, handlers, config, servicios).
   - Validar que no hay hardcodes de IDs ni tokens en el código.

2. **Revisión de rama v0.17.0**
   - Comparar `main` vs `feature/v0.17.0-nlp-llm-multiuser` (cambios clave).
   - Mirar el modelo de datos multiuser (cómo se identifica a cada usuario).
   - Confirmar que las migraciones de SQLAlchemy/Alembic están al día.

3. **Integrar handler `/diario` (GitHub Contents API)**
   - Añadir `src/config.py` con pydantic-settings.
   - Añadir `src/services/github_client.py` (client GitHub Contents API).
   - Añadir `src/bot/handlers/diario.py` y engancharlo en el bot.

4. **Despliegue y pruebas en Madre**
   - Añadir secrets a GitHub Actions.
   - Ejecutar `alembic upgrade head`.
   - Lanzar pipeline de despliegue.
   - Probar comandos básicos (`/start`, `/diario`, etc.).

---

## 4. Relación con el ecosistema

- thdora es la "cara" del ecosistema ante el usuario (Telegram).
- yggdrasil-dew es la memoria larga (diarios, contexto).
- ai-toolkit es el taller de herramientas (OpenCode, LiteLLM, scripts).

Esta sesión se centrará en thdora, pero todo lo que hagamos tiene que respetar las decisiones de arquitectura global ya documentadas en `yggdrasil-dew/ECOSISTEMA.md` y `ai-toolkit/docs/ARQUITECTURA-PIPELINE.md`.

---

_Última actualización: 16 junio 2026 — 23:04 CEST_
