---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, issues, gobernanza, dew]
status: vigente
---

# Protocolo de Issues en DEW

> Cómo abrir, gestionar y cerrar issues bien.

## Cuándo abrir un issue

- Todo pendiente que salga de una sesión IA
- Todo bug o incidente detectado
- Toda decisión técnica pendiente
- Toda deuda técnica identificada
- Nunca dejar pendientes en el chat — si no es un issue, se pierde

## Estructura de un issue bien formado

```markdown
## Contexto
¿Por qué existe este issue? ¿Qué detectó el problema?

## Qué hay que hacer
- [ ] Paso 1 concreto
- [ ] Paso 2 concreto

## Criterio de cierre
> Una frase que diga exactamente cuándo este issue está terminado.

## Refs
- Issues relacionados
- Diario del día
- Archivos afectados
```

## Labels obligatorios

| Label | Cuándo |
|---|---|
| `feat` | Nueva funcionalidad |
| `bug` / `hal` | Incidente o fallo |
| `chore` | Limpieza, reorganización |
| `docs` | ADR, protocolo, documentación |
| `audit` | Auditoría de repo o isla |
| `refactor` | Cambio estructural sin nueva funcionalidad |
| `deuda-tecnica` | Algo que hay que hacer pero no es urgente |
| `gobernanza` | Decisión de sistema, filosofía |

## Al cerrar

- Añadir comentario con resumen de qué se hizo
- Referenciar commits: `[abc1234](url)`
- Si hay lección aprendida → añadirla al comentario de cierre
- `state_reason: completed` si está hecho, `not_planned` si se descarta

---
_Creado: 2026-07-13 · Perplexity MCP_
