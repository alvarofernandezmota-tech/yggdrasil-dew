---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-16
ruta: docs/adr/ADR-002-triangulo-dew-wiki-vida.md
tags: [adr, tridente, triangulo, ecosistema, tracking]
status: vigente
---

# ADR-002 — El triángulo DEW + WIKI + vida personal

## Contexto

El ecosistema necesita tres capas diferenciadas de documentación que no se pisen:
1. Gobernanza técnica y decisiones — DEW
2. Conocimiento conceptual — WIKI
3. Vida personal y aprendizaje — tracking + formacion

## Decisión

El sistema opera como un **triángulo** (o Tridente) con tres vértices:

```
        DEW
    (ejecutas,
     decides)
       /\
      /  \
     /    \
  WIKI----TRACKING+FORMACION
(mapas,   (vida personal
conceptos) y aprendizaje)
```

| Vértice | Repo(s) | Pregunta que responde |
|---|---|---|
| DEW | yggdrasil-dew | ¿Cómo funciona y qué se decidió? |
| WIKI | yggdrasil-wiki | ¿Qué existe y por qué? |
| VIDA | yggdrasil-tracking | ¿Quién soy y qué quiero? |
| FORMACIÓN | yggdrasil-formacion | ¿Qué aprendo y cómo me formo? |

> **Actualización 2026-07-13 (ADR-011):** El vértice «vida personal» fue separado en dos repos:
> - `yggdrasil-tracking` para contenido vital/personal
> - `yggdrasil-formacion` para contenido técnico/aprendizaje
> El triángulo pasa a ser un cuadrado operativo pero la filosofía del Tridente se mantiene.
>
> **Nota histórica:** antes del 13-07-2026 el repo se llamaba `yggdrasil-formacion-` (con guión final). Renombrado el 2026-07-13.

## Consecuencias

- Cada decisicón de dónde poner algo tiene respuesta clara
- No hay duplicados entre vértices
- Si algo no encaja en ninguno de los cuatro → se crea una nueva isla con ADR

## Relacionado

- ADR-001: estructura del ecosistema
- ADR-005: normas del Tridente
- ADR-011: separación tracking/formacion

---

_Actualizado: 2026-07-16 · fix #65 · yggdrasil-formacion sin guión · Perplexity MCP_
