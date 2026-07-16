---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CONTEXTO-TRACKING.md
tags: [protocolo, contexto, tracking, agente, apertura, vida-personal]
status: vigente
version: 1.0
---

# PROTOCOLO-CONTEXTO-TRACKING v1.0

> Este protocolo carga el contexto de `yggdrasil-tracking` al inicio de cualquier sesión
> que implique trabajo en vida personal, diarios personales, metas o filosofía.

---

## 1. Propósito del repo

`yggdrasil-tracking` es el **espacio de vida personal** de Álvaro:
- Diarios personales (QUÉ vivo, QUÉ pienso, QUÉ soy)
- Metas de vida
- Reflexiones y filosofía
- Hábitos y tracking personal
- Identidad y valores

No contiene: diarios de sesión técnica (eso es DEW), apuntes de cursos (eso es yggdrasil-formacion).

---

## 2. Estructura del repo

```
yggdrasil-tracking/
├── diarios/          ← diarios personales — YYYY/MM-mes/YYYY-MM-DD.md
├── metas/            ← objetivos — anuales, trimestrales, empleabilidad
├── reflexiones/      ← reflexiones libres
├── filosofia/        ← principios y filosofía personal
├── proyectos/        ← proyectos personales no técnicos
├── tracking/         ← hábitos, métricas personales
├── yo/               ← identidad, valores, autoperfil
├── 04_curiosidad/    ← curiosidades e intereses
├── 05_contenido/     ← contenido creado o consumido
├── inbox/            ← entrada sin clasificar
├── inbox.md          ← captura rápida
└── now.md            ← estado actual de vida
```

---

## 3. Checklist de contexto al abrir sesión

```
[ ] Leer now.md — estado actual de vida de Álvaro
[ ] Verificar si existe diario personal de hoy — crear si no existe
[ ] Leer el último diario personal disponible — continuidad de contexto
[ ] Revisar metas/ si la sesión involucra objetivos
[ ] Confirmar que lo que se va a escribir es personal (no técnico)
```

---

## 4. Regla crítica: separación DEW/Tracking

```
Diario de sesión técnica (qué hice, qué decidí) → DEW/docs/diarios/
Diario personal (qué siento, qué pienso, qué soy) → tracking/diarios/
```

Nunca mezclar. Si hay duda: es personal si no hay commits, issues ni técnica en el contenido.

---

## 5. Formato diario personal

```
tracking/diarios/YYYY/MM-mes/YYYY-MM-DD.md

Frontmatter mínimo:
---
tipo: diario-personal
author: Alvaro Fernandez Mota
fecha: YYYY-MM-DD
tags: [diario, personal, YYYY]
status: completado | borrador
---
```

---

## 6. Reglas críticas de Tracking

- `now.md` se actualiza cuando el estado de vida cambia significativamente.
- `inbox.md` se vacía cada semana (ritual semanal).
- Los diarios personales no tienen sección de commits ni issues — son vida, no trabajo.
- La isla Wiki correspondiente es: [wiki/islas/tracking.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/tracking.md)

---

_Creado: 2026-07-16 · F13 Protocolo Contexto Tracking v1.0 · Perplexity MCP_
