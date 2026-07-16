---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-DIARIO-DEW.md
tags: [protocolo, diario, dew, atomo]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-DIARIO-DEW v1.0

> Ejecutar al inicio de cada sesion tecnica para abrir el diario del dia.
> El diario DEW es el registro tecnico de lo que se hizo, no de como te sientes.
> Tiempo estimado: 2 min (abrir) + tiempo de sesion.

---

## Que va en un diario DEW

```
VA en diario DEW:
  - Tabla de acciones: hora / accion / archivo / commit
  - Decisiones tomadas (si no tienen ADR propio)
  - Hallazgos durante auditoria o fix
  - Pendientes al cierre de sesion
  - Contexto de entrada (estado del ecosistema al abrir)

NO va en diario DEW:
  - Como te sientes hoy -> eso es TRACKING
  - Apuntes de cursos o HTB -> eso es FORMACION
  - Configuracion de infra -> eso es madre-config
```

---

## Pasos

```
[ ] 1. Verificar si ya existe el diario del dia:
       ruta: docs/diarios/YYYY-MM-DD.md
       Si existe -> continuar desde donde se dejo
       Si no existe -> crear desde PLANTILLA-DIARIO-DEW.md

[ ] 2. Completar frontmatter:
       tipo: diario
       creado: YYYY-MM-DD
       actualizado: YYYY-MM-DD HH:MM CEST
       tags: [diario, sesion, <temas del dia>]
       status: en-progreso

[ ] 3. Completar seccion 'Contexto de entrada':
       Estado del ecosistema al abrir sesion (fases activas, bloqueantes)

[ ] 4. Al cerrar sesion:
       - Completar tabla de acciones
       - Completar 'Decisiones tomadas'
       - Completar 'Pendiente al cierre'
       - Cambiar status: en-progreso -> completado
       - Actualizar fecha 'actualizado'

[ ] 5. Commit:
       'docs: diario DEW YYYY-MM-DD'
```

---

## Regla critica

```
UN diario por dia. Nombre exacto: YYYY-MM-DD.md
Sin sufijos: sin -sesion2, sin -dew, sin -tarde.
Si hubo varias sesiones en el dia -> todo en el mismo archivo, 
separado por bloques con hora.
```

---

## Relacionado

- docs/canon/PLANTILLA-DIARIO-DEW.md
- PROTOCOLO-APERTURA-DEW.md
- PROTOCOLO-CIERRE-SESION.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
