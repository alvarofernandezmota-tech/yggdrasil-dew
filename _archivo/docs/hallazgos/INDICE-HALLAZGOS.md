---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/hallazgos/INDICE-HALLAZGOS.md
tags: [indice, hallazgos, seguridad, deuda-tecnica]
status: vigente
---

# 🚨 Índice de Hallazgos (HAL)

> **¿Qué es un HAL?**  
> Un Hallazgo es cualquier problema real detectado en el ecosistema que requiere acción: vulnerabilidad de seguridad, servicio caído, deuda técnica crítica, inconsistencia estructural. No es una tarea de backlog — es un problema activo documentado con evidencia, impacto y plan de remediación.

> **¿Por qué documentarlos aquí y no solo en Issues?**  
> Los Issues de GitHub se cierran y se pierden en el historial. Los HALs son permanentes: cuando se resuelven, se marcan como `RESUELTO` con fecha y evidencia, y siguen siendo consultables. Además, algunos hallazgos afectan a varios repos — el índice central los une.

---

## Registro

| ID | Título | Severidad | Estado | Área | Fecha |
|----|--------|-----------|--------|------|-------|
| [HAL-001](./HAL-001-token-telegram-thdora.md) | Token Telegram THDORA en historial git | 🔴 crítica | PENDIENTE | Seguridad | 2026-07-05 |
| [HAL-002](./HAL-002-hdd-vida-util.md) | HDD Madre 28.715h — vida útil crítica | 🟠 alta | PENDIENTE | Infra | 2026-07-05 |
| [HAL-003](./HAL-003-token-telegram-segunda-exposicion.md) | Segunda exposición token Telegram | 🔴 crítica | PENDIENTE | Seguridad | 2026-07-05 |
| [HAL-004](./HAL-004-tailscale-crashloop.md) | tailscale_monitor crashloop infinito | 🟡 alta | PENDIENTE | Infra | 2026-07-05 |
| [HAL-005](./HAL-005-log-guardian-unhealthy.md) | log_guardian_bot unhealthy (falta procps) | 🟡 alta | PENDIENTE | Infra | 2026-07-05 |
| [HAL-006](./HAL-006-ssh-expuesto-internet.md) | SSH puerto 22 abierto a internet | 🟡 alta | PENDIENTE | Seguridad | 2026-07-05 |

---

## Severidades

| Nivel | Descripción | Tiempo de respuesta |
|-------|-------------|---------------------|
| 🔴 crítica | Dato comprometido o servicio completamente inoperativo | Inmediato |
| 🟡 alta | Riesgo real pero no explotado activamente | Esta semana |
| 🟠 media | Deuda técnica con impacto conocido | Este mes |
| 🔵 baja | Mejora menor, sin impacto operativo | Cuando haya tiempo |

## Estados

| Estado | Significado |
|--------|-------------|
| `PENDIENTE` | Detectado, documentado, sin resolver |
| `EN PROGRESO` | Se está trabajando activamente |
| `RESUELTO` | Cerrado con evidencia — fecha y qué se hizo |
| `ACEPTADO` | Riesgo conocido, se acepta conscientemente (documentar por qué) |

---

## Cómo registrar un HAL nuevo

1. Crear `docs/hallazgos/HAL-NNN-titulo-kebab.md` con el frontmatter estándar
2. Añadir fila en la tabla de este archivo
3. Si es de seguridad → también abrir issue en [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues)
4. Si afecta a un ADR vigente → añadir referencia en la sección “Consecuencias” del ADR

---

_Actualizado: 2026-07-06 · Perplexity-MCP_
