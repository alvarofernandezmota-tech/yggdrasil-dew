---
tipo: hallazgo
id: HAL-003
author: Alvaro Fernandez Mota
creado: 2026-07-05
actualizado: 2026-07-06
ruta: docs/hallazgos/HAL-003-token-telegram-segunda-exposicion.md
tags: [hallazgo, seguridad, token, telegram, thdora, git]
severidad: critica
status: PENDIENTE
---

# 🔴 HAL-003 — Segunda exposición del token de Telegram

## Descripción

Además de la exposición documentada en HAL-001, se detectó una segunda aparición del mismo token (o de un token diferente del mismo bot) en el historial git. Esto indica que el problema no fue un accidente puntual sino un patrón: el token fue hardcodeado en más de un lugar o en más de un commit.

## Evidencia

Detectado durante auditoría del 2026-07-05. Dos commits distintos contienen el token.

## Impacto

- Mismo impacto que HAL-001: riesgo de toma de control del bot
- La segunda exposición confirma que la práctica de hardcodear el token era habitual — puede haber más apariciones no detectadas
- Aumenta la urgencia de rotar el token antes de cualquier otra operación en THDORA

## Plan de remediación

1. [ ] Ejecutar búsqueda exhaustiva en todo el historial antes de rotar:
   ```bash
   cd ~/repos/THDORA-PERSONAL
   git log --all --full-history -p | grep -n "bot:" | head -50
   # También buscar sin el prefijo:
   git log --all --full-history -p | grep -n "[0-9]\{10\}:[A-Za-z0-9_-]\{35\}" | head -20
   ```
2. [ ] Documentar todos los commits afectados
3. [ ] Revocar el token en BotFather (ver HAL-001 paso 1)
4. [ ] Decidir si limpiar historial con `git-filter-repo` (recomendado si hay plan de hacer el repo público alguna vez)
5. [ ] Cerrar junto con HAL-001 — los dos se resuelven con la misma acción (rotación)

## Referencias

- Relacionado: [HAL-001](./HAL-001-token-telegram-thdora.md)
- ADR de seguridad: [ADR-002](../canon/ADR-002-seguridad-ecosistema.md)
- Isla afectada: [thdora](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/thdora.md)

---
_Creado: 2026-07-05 · Documentado: 2026-07-06 · Perplexity-MCP_
