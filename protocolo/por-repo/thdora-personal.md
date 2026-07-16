---
tipo: protocolo-repo
repo: THDORA-PERSONAL
creado: 2026-07-16
actualizado: 2026-07-16
---

# Protocolo THDORA-PERSONAL

## Contexto rápido

- Bot Telegram + API personal de Álvaro
- **Estado actual: CAÍDO** por HAL-007 + HAL-008
- Corre en Madre (Docker Compose)

## Antes de cualquier trabajo en este repo

1. Verificar estado de HAL-007 ([DEW #44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44))
2. Verificar estado de HAL-008 ([DEW #45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45))
3. Si ambos cerrados → `docker-compose up -d` en Madre para verificar arranque

## Flujo de trabajo normal

```
Leer AGENT.md → Leer CONTEXT.md → Ver issues activos → Trabajar → Cerrar sesión
```

## Ficheros críticos

| Fichero | Precaución |
|---|---|
| `.env` | Solo tocar en contexto HAL-007 |
| `docker-compose.yml` | Afecta producción en Madre |
| `alembic/` | Nunca sin revisar estado BD |

## Issues activos

- [DEW #44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) — HAL-007 (P0)
- [DEW #45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) — HAL-008 (P0)
- [DEW #36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) — AUDIT-003
