---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-16
ruta: docs/adr/ADR-011-separacion-tracking-formacion.md
tags: [adr, tracking, formacion, vidapersonal, migracion, arquitectura]
status: vigente
---

# ADR-011 — Separación VIDAPERSONAL en tracking + formacion

## Contexto

`VIDAPERSONAL` era un repo único que mezclaba:
- Contenido personal: diarios, metas, filosofía, reflexiones, hábitos
- Contenido técnico: apuntes de formación, cursos, plataformas de aprendizaje

Esta mezcla violaba la **Regla de fronteras personales/técnicas** añadida a NORMAS.md el 2026-07-13.

Además existía un repo antiguo `yggdrasil-formacion-` (con guión final) que duplicaba parcialmente el contenido técnico. Ese repo fue renombrado a `yggdrasil-formacion` (sin guión) el mismo 2026-07-13.

---

## Decisión

Separar en dos islas con fronteras claras:

| Isla | Repo | Qué contiene |
|---|---|---|
| **Tracking** | `yggdrasil-tracking` | Vida personal: diarios, metas, filosofía, reflexiones, hábitos, yo/ |
| **Formación** | `yggdrasil-formacion` | Aprendizaje técnico: cursos, apuntes, HTB, plataformas, skills |

El repo `VIDAPERSONAL` queda **deprecado**. Se mantiene con redirect en la wiki.

> **Nota histórica:** el repo de formación se llamaba `yggdrasil-formacion-` (con guión final) antes del 2026-07-13. El nombre canónico vigente es `yggdrasil-formacion` (sin guión).

---

## Alternativas consideradas

**Opción A (rechazada): mantener VIDAPERSONAL como repo único**
- Contra: mezcla personal/técnico, viola principio de separación
- Contra: difícil de auditar y mantener

**Opción B (adoptada): separar en dos repos**
- Pro: cada isla tiene propósito único y claro
- Pro: consistente con NORMAS.md Regla de fronteras
- Pro: permite auditorías independientes

**Opción C (considerada): tres repos — tracking + formacion + filosofia)**
- Descartada: filosofía es parte de la vida personal, no necesita repo propio

---

## Consecuencias

- `wiki/islas/VIDAPERSONAL.md` → redirect deprecado ✅
- `wiki/islas/tracking.md` → nueva isla activa ✅
- `wiki/islas/formacion.md` → isla activa, apunta a `yggdrasil-formacion` ✅
- NORMAS.md → Regla de fronteras personales/técnicas añadida ✅
- MAPA-ISLAS-DEPENDENCIAS → actualizado con tracking como isla ✅
- ADR-002 y ADR-005 → actualizados para referenciar tracking en lugar de VIDAPERSONAL ✅
- fix #65 → todos los archivos del ecosistema corregidos con nombre canónico (2026-07-16) ✅

---

## Principios que sustenta

- ADR-001: estructura ecosistema clara
- ADR-002: triángulo DEW → ahora es DEW + WIKI + tracking (vida) + formacion
- ADR-008: toda decisión tiene ADR — este es el de esa decisión

---

_Actualizado: 2026-07-16 · fix #65 · nombre canónico yggdrasil-formacion confirmado · Perplexity MCP_
