---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/adr/ADR-012-protocolo-cierre-sesion.md
tags: [adr, cierre, sesion, protocolo, propagacion]
status: vigente
---

# ADR-012 — Protocolo formal de cierre de sesión

## Contexto

Durante las sesiones de trabajo con MCP se toman decisiones, se crean archivos y se modifican repos.
Sin un protocolo de cierre formal, ocurren dos problemas:

1. **Archivos descolgados** — se crea algo en un repo sin propagarlo a los demás donde debería vivir
2. **Decisiones sin rastro** — se hace algo importante pero no queda en ADR, diario ni issue

Ejemplo real de hoy (2026-07-13): la migración VIDAPERSONAL→tracking se hizo en la wiki pero hubiera quedado sin ADR, sin actualizar ADR-002 y ADR-005, y sin registro en el índice si no se hubiera seguido el protocolo.

---

## Decisión

Toda sesión de trabajo termina ejecutando el **PROTOCOLO-CIERRE-SESION.md**.

El agente (Perplexity MCP) es responsable de:
- Proponer el cierre al detectar que la sesión termina
- Ejecutar el checklist en orden: DEW → WIKI → repos operativos
- Hacer las 5 preguntas de cierre antes de dar la sesión por cerrada
- Nunca cerrar sin diario actualizado

Álvaro es responsable de:
- Responder las preguntas de cierre
- Confirmar que el diario refleja lo que pasó
- Indicar si hubo algo personal que vaya a tracking

---

## Regla de propagación

Todo cambio sigue la cadena:
```
DEW (ADR + diario) → WIKI (isla + INDEX) → repo operativo
```
Nunca al revés. Nunca saltar niveles.

---

## Alternativas consideradas

**Sin protocolo formal (situación anterior):** el agente cerraba cuando se lo pedían, sin verificar propagación. Resultado: archivos descolgados, ADRs que no se actualizaban, islas en la wiki que apuntaban a repos que ya no existían.

**Checklist solo en diario:** insuficiente — no garantiza que se actualicen los repos cruzados.

---

## Consecuencias

- Cada sesión termina con el ecosistema consistente
- Cualquier decisión importante tiene rastro en ADR
- Ningún archivo queda descolgado entre repos
- El coste es ~5-10 min por sesión, que se ahorra en confusión futura

---

## Relacionado

- ADR-006: sesión-log como artefacto
- ADR-008: ADR obligatorio por decisión
- NORMAS.md: Regla de sesión
- [PROTOCOLO-CIERRE-SESION.md](../canon/PROTOCOLO-CIERRE-SESION.md)

---

_Fecha: 2026-07-13 · Sesión tarde · Perplexity MCP_
