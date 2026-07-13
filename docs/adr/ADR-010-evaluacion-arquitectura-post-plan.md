---
id: ADR-010
titulo: Evaluación de arquitectura post-plan — tridente vs alternativas
fecha: 2026-07-13
estado: pendiente-evaluacion
author: Alvaro Fernandez Mota
tags: [adr, arquitectura, tridente, estructura, decision-futura]
principio: Sistemas que perduran
---

# ADR-010 — Evaluación de arquitectura post-plan

## Contexto

El tridente DEW↔Wiki↔VIDAPERSONAL es la arquitectura actual. Funciona. Pero es una de varias posibles estructuras para un ecosistema personal de esta complejidad. Una vez que el plan de fases 2026 esté completado y el ecosistema estable, tiene sentido evaluar si la estructura actual es la óptima o si existe una mejor.

## Momento para evaluar

**No antes de:** completar los bloqueantes críticos (#44 #45 #46) + tener el blue team activo + IaC versionada.
Estimación: Q3 2026 — cuando el ecosistema esté estable operativamente.

## Estructuras a evaluar

| Estructura | Descripción | Ventaja | Riesgo |
|-----------|-------------|---------|--------|
| **Tridente** (actual) | DEW + Wiki + VIDAPERSONAL | Simple, SSOT claro | Wiki puede crecer demasiado |
| **Cuadrado** | + repo `yggdrasil-scripts` (ya creado) | Scripts con CI propio | 4 repos que sincronizar |
| **Hub and Spoke** | Un repo central que referencia todos | Un solo punto de entrada | Complejidad de referencias cruzadas |
| **Mono-repo** | Todo en un repo con carpetas | Máxima cohesión | Permisos, CI, tamaño |
| **Domain-driven** | Repos por dominio (infra, ia, vida, ops) | Separación semántica | Más repos, más contexto switching |

## Criterios de evaluación

Cuando llegue el momento, evaluar con:
1. **Fricción diaria:** ¿cuántos repos toco en una sesión normal?
2. **Trazabilidad:** ¿puedo encontrar cualquier decisión en < 30 segundos?
3. **Escalabilidad:** ¿funciona igual cuando haya el doble de contenido?
4. **Soberanía:** ¿puedo mover todo a otra plataforma fácilmente?
5. **Coherencia:** ¿un colaborador externo entiende la estructura en 10 minutos?

## Estado

`pendiente-evaluacion` — No se toma decisión hasta Q3 2026.
Este ADR se actualizará con la decisión final y se marcará `aceptado` o `superado`.

---
_Creado: 2026-07-13 · Principio: Sistemas que perduran · Evaluar: Q3 2026_
