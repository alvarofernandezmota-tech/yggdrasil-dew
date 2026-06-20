---
tags: [inbox, thdora, bug, docker, urgente, fix]
fecha: 2026-06-20
fuente: Grok + CONTEXT.md
destino: proyectos/thdora.md
estado: pendiente-ejecutar
---

# 🔴 Fix — Bot TOKI en restart loop

> Migrado desde [[inbox/grok-2026-06-20-investigacion-completa]].
> Esto ya es claramente de thdora → vive aquí.

---

## Síntoma

`docker compose ps` muestra `thdora-bot` en estado `Restarting`.
No responde a `/start` en Telegram.

## Causas probables (Grok)

1. Excepción no manejada en startup — LangGraph graph build, env var faltante, DB no conecta
2. `restart: always` en docker-compose → crash → restart infinito
3. PostgreSQL tarda más que el bot en arrancar (`depends_on` sin `condition: service_healthy`)
4. `Application.run_polling()` con conflicto de event loop en Docker

## Fix — ejecutar en este orden

```bash
# 1. Conectar a Madre
ssh alvaro@100.91.112.32

# 2. Ir al repo (pendiente confirmar ruta)
find ~ -name docker-compose.yml
cd <ruta-encontrada>

# 3. Ver el error exacto
docker compose logs --tail=50 thdora-bot

# 4. Rebuild limpio
docker compose down
docker compose up --build
# (sin -d primero — ver logs en tiempo real)

# 5. Si va bien:
docker compose up -d --build

# 6. Verificar
docker compose ps
```

## Verificación final

- [ ] `docker compose ps` → thdora-bot en estado `Up`
- [ ] `/start` en Telegram → TOKI responde
- [ ] Mover esta nota a resuelta → actualizar [[proyectos/thdora]] y [[CONTEXT]]

## Si el error persiste

Pegar el output de `docker compose logs` aquí → análisis con Perplexity o Grok.

---

_Fuente: [[inbox/grok-2026-06-20-investigacion-completa]] · 20 jun 2026_
_Destino: [[proyectos/thdora]] cuando resuelto_
