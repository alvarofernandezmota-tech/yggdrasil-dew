---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ENTRADA-TRACKING.md
tags: [protocolo, tracking, diario, atomo, personal]
status: vigente
version: 1.0
---

# PROTOCOLO-ENTRADA-TRACKING v1.0

> Ejecutar cada vez que se abre o completa un diario personal en yggdrasil-tracking.
> El diario de tracking no es tecnico. Es la voz de Alvaro sobre su propio dia.
> Tiempo estimado: 5-15 min (depende del dia).

---

## Que va en un diario de tracking

```
VA en tracking:
  - Como estoy hoy (energia, estado animo, fisico)
  - Que he vivido (no que he programado)
  - Reflexiones, pensamientos, rituales
  - Avance en metas personales
  - Lo que quiero recordar de este dia

NO va en tracking:
  - Commits que hice / archivos que cree -> eso es el diario DEW
  - Comandos bash / configs -> eso es DEW o madre-config
  - Apuntes tecnicos -> eso es FORMACION
```

---

## Pasos

```
[ ] 1. Crear archivo del dia si no existe:
       ruta: diarios/YYYY/MM-mes/YYYY-MM-DD.md
       desde: docs/canon/PLANTILLA-DIARIO-TRACKING.md (en DEW)
       ejemplo: diarios/2026/07-julio/2026-07-16.md

[ ] 2. Completar frontmatter:
       tipo: diario-tracking
       fecha: YYYY-MM-DD
       estado-animo: (libre)
       tags: [...]
       status: borrador / completado

[ ] 3. Escribir con honestidad.
       No hay formato obligatorio mas alla del frontmatter.
       El diario es tuyo.

[ ] 4. Al terminar -> cambiar status: borrador -> completado

[ ] 5. Commit:
       'docs: diario tracking YYYY-MM-DD'
```

---

## Diarios pendientes

> Si hay dias sin diario -> no pasa nada. Mejor tarde que nunca.
> Escribir retrospectivamente si quieres, marcando que es retrospectivo.

---

## Relacionado

- docs/canon/PLANTILLA-DIARIO-TRACKING.md (en DEW)
- PROTOCOLO-APERTURA-TRACKING.md
- PROTOCOLO-SINCRONIZACION-TRACKING.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
