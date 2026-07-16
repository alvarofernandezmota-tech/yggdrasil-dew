---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SINCRONIZACION-FORMACION.md
tags: [protocolo, sincronizacion, formacion]
status: vigente
version: 1.0
---

# PROTOCOLO-SINCRONIZACION-FORMACION v1.0

> Verifica que yggdrasil-formacion esta internamente consistente.
> FORMACION = aprendizaje tecnico: apuntes, HTB, cursos, labs.
> No contiene vida personal ni configuracion de infra.
> Ejecutar desde PROTOCOLO-CIERRE-SESION cuando se toco FORMACION.
> Tiempo estimado: 3-5 min.

---

## Fase 1: Estructura de apuntes

```
[ ] Apuntes nuevos creados desde PLANTILLA-APUNTE-FORMACION.md
[ ] Frontmatter valido: tipo, area, fuente, fecha, tags, status, ruta
[ ] No hay apuntes huerfanos sin area definida
```

---

## Fase 2: Separacion tecnico/personal

```
[ ] No hay diarios personales (esos van en yggdrasil-tracking)
[ ] No hay configuraciones de infra (esas van en madre-config)
[ ] El nombre del repo es yggdrasil-formacion (sin guion final)
```

---

## Fase 3: Salida al ecosistema

```
[ ] Apuntes con campo 'Salida al ecosistema' completado o marcado pendiente
[ ] PoCs / scripts generados tienen issue de seguimiento en DEW
[ ] Si un apunte genero un cambio en infra -> hay ADR o issue en DEW
```

---

## Cierre

```
[ ] Notificar en DEW: entrada en diario tecnico del dia
[ ] Si hay mezcla o nombres incorrectos -> issue en DEW
```

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
