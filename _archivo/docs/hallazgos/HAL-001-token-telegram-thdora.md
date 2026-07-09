---
tipo: hallazgo
id: HAL-001
author: Alvaro Fernandez Mota
creado: 2026-07-05
actualizado: 2026-07-06
ruta: docs/hallazgos/HAL-001-token-telegram-thdora.md
tags: [hallazgo, seguridad, token, telegram, thdora, git]
severidad: critica
status: PENDIENTE
---

# 🔴 HAL-001 — Token de Telegram de THDORA en historial git

## Descripción

El token del bot de Telegram de THDORA fue commiteado en texto plano al historial de git en el repo `THDORA-PERSONAL`. Aunque el repo es privado, el token debe considerarse comprometido porque:

1. Cualquier acceso accidental al repo (colaborador, breach de GitHub) expone el token
2. El token puede aparecer en backups, mirrors locales (Gitea) o clones que se hicieran públicos por error
3. Un token en historial git nunca puede eliminarse limpiamente sin reescribir el historial completo

## Evidencia

Detectado durante auditoría del 2026-07-05. El commit contiene la cadena `bot:` seguida del token en un archivo de configuración.

## Impacto

- **Riesgo de toma de control del bot THDORA** por actor externo si obtiene el token
- El bot tiene acceso a comandos del ecosistema — un atacante podría ejecutar comandos en Madre
- Relacionado con HAL-003 (segunda exposición del mismo token)

## Plan de remediación

1. [ ] Ir a [t.me/BotFather](https://t.me/BotFather) → seleccionar el bot → `API Token` → `Revoke current token`
2. [ ] Generar token nuevo y guardarlo en variable de entorno en Madre (`.env` local, nunca en git)
3. [ ] Actualizar `docker-compose.yml` de THDORA para leer token desde `${TELEGRAM_BOT_TOKEN}`
4. [ ] Verificar que el nuevo token funciona: reiniciar contenedores y enviar mensaje de prueba
5. [ ] Si se quiere limpiar el historial → `git filter-branch` o `git-filter-repo` (opcional, repo ya privado)
6. [ ] Cerrar este hallazgo con evidencia: screenshot de revocación + fecha

## Prevención futura

- CI `validate-canon.yml` en THDORA-PERSONAL detectará futuros tokens antes del push
- Gitleaks en el CI escanea historial en cada PR
- Regla: **cualquier secreto va en `.env` local o en GitHub Secrets — nunca en código**

## Referencias

- Relacionado: [HAL-003](./HAL-003-token-telegram-segunda-exposicion.md)
- ADR de seguridad: [ADR-002](../canon/ADR-002-seguridad-ecosistema.md)
- Isla afectada: [thdora](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/thdora.md)

---
_Creado: 2026-07-05 · Documentado: 2026-07-06 · Perplexity-MCP_
