---
id: ADR-005
titulo: Normas del Tridente — qué va en cada vértice
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, tridente, dew, wiki, vidapersonal, normas]
principio: Un solo punto de verdad
---

# ADR-005 — Normas del Tridente DEW ↔ Wiki ↔ VIDAPERSONAL

## Contexto

El ecosistema tiene tres repos con propósitos distintos pero interconectados. Sin normas claras, el contenido acaba en el sitio equivocado: reflexiones personales en DEW, operativa técnica en VIDAPERSONAL, o viceversa.

## Decisión

### 🛠️ DEW (`yggdrasil-dew`)
> **El cerebro técnico. Plan, arquitectura, decisiones, trazabilidad.**

- Plan maestro por fases (SSOT del roadmap)
- ADRs — toda decisión técnica va aquí
- Issues — toda tarea pendiente va como issue, nunca en el chat
- Logs de sesión técnica (`docs/sesiones/`)
- Auditorías de repos (`docs/auditorias/`)
- Incidentes HAL (`docs/infra/`)
- Diagramas de arquitectura (C4, ownership matrix)

**NO va en DEW:** reflexiones personales, rituales, emociones, vida privada.

### 📚 Wiki (`yggdrasil-wiki`)
> **El conocimiento del ecosistema. Qué existe, cómo funciona, para qué sirve.**

- Islas — una ficha por dispositivo/servicio/área de conocimiento
- Agentes — cómo trabajar con cada IA
- Convenciones y modelo mental
- Conocimiento técnico atemporal (no operativo)

**NO va en Wiki:** tareas pendientes (eso va en DEW issues), vida personal, logs de sesión.

### 🌱 VIDAPERSONAL
> **La vida. Diario, metas, reflexiones, proyectos personales.**

- Diario (`01_diarios/YYYY-MM-DD.md`) — entrada diaria: emociones, rituales, reflexiones
- Metas y hábitos tracking
- Proyectos personales no técnicos
- `now.md` — estado semanal visceral

**NO va en VIDAPERSONAL:** código, infra, issues técnicos, logs de sistema.

## Regla de separación

| Pregunta | Va en |
|----------|-------|
| ¿Es una decisión técnica? | DEW (ADR) |
| ¿Es una tarea pendiente? | DEW (issue) |
| ¿Es conocimiento sobre cómo funciona algo? | Wiki (isla) |
| ¿Es una reflexión, emoción o ritual? | VIDAPERSONAL (diario) |
| ¿Es una meta o hábito? | VIDAPERSONAL (metas) |
| ¿Es un log de sesión técnica? | DEW (docs/sesiones) |

## Consecuencias

- Cualquier agente IA o colaborador futuro sabe exactamente dónde buscar
- El triángulo no se corrompe: cada vértice mantiene su propósito
- La filosofía de isla `cerebro.md` describe el triángulo; este ADR es la norma operativa

---
_Aceptado: 2026-07-13 · Principio: Un solo punto de verdad_
