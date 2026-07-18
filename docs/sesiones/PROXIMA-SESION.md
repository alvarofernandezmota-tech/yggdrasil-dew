# PRÓXIMA SESIÓN — Prompt de arranque

**Última actualización:** 2026-07-18 04:34 CEST  
**Sesión anterior:** F30 — Auditoría Madre + diagnóstico docker + propuesta consolidación repos

---

## Estado actual del sistema

- **Madre:** Operativa, uptime estable
- **Docker:** 23 contenedores activos, 3 con problemas conocidos
- **thdora-bot:** En crash loop (restartCount=106) — pendiente fix
- **open-webui / qdrant:** unhealthy por healthcheck mal configurado (no fallo real)
- **local_tripwire:** Completando baseline al cierre de sesión
- **Disco:** 43% uso, ~20 GB reclamables en Docker

---

## Tareas prioritarias — siguiente sesión

### URGENTE
1. **Fix thdora-bot crash loop**
   - Revisar .env en `~/Projects/thdora/`
   - Verificar token Telegram vigente
   - `docker compose up -d --force-recreate thdora-bot`

2. **Fix healthchecks open-webui + qdrant**
   - open-webui: ajustar healthcheck en compose
   - qdrant: deshabilitar telemetría externa (`QDRANT__TELEMETRY_DISABLED=true`)

### IMPORTANTE
3. **Limpieza Docker** (~20 GB reclamables)
   ```bash
   docker image prune -a
   docker builder prune
   ```

4. **Limpieza ~/Downloads e ~/isos** (27 GB combinados)

5. **Iniciar consolidación repos** (plan F30):
   - Paso 1: `ollama-stack` absorbe `local-brain`
   - Paso 2: `yggdrasil-secops` absorbe `osint-stack`
   - Paso 3: archivar `dev-labs`

---

## Prompt de arranque para próxima sesión

```
Continuamos ecosistema Yggdrasil desde sesión F30 (2026-07-18 madrugada).
Estado: thdora-bot en crash loop, open-webui/qdrant con healthcheck malo, tripwire completando baseline.
Foco hoy:
1. Fix thdora-bot — revisar .env y token Telegram
2. Fix healthchecks open-webui + qdrant
3. Limpieza Docker (~20 GB reclamables)
Arranca con: cd ~/yggdrasil-dew && git pull
```

---

*Actualizado en sesión F30 — 2026-07-18 04:34 CEST*
