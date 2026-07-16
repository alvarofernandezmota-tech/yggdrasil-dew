---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-PROTOCOLO.md
tags: [protocolo, meta, atomo, dew]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-PROTOCOLO v1.0

> El protocolo para crear protocolos.
> Un protocolo sin estructura es una nota. Con estructura es una garantia.
> Tiempo estimado: 15-20 min.

---

## Cuando crear un protocolo nuevo

```
CREAR PROTOCOLO si:
  - Hay una accion que se repite y necesita pasos consistentes
  - Hay un tipo de cambio que siempre olvidas propagar
  - Hay un tipo de archivo nuevo que entra al ecosistema
  - THDORA necesita instrucciones para ejecutar algo

NO crear protocolo para:
  - Acciones que ocurren una sola vez (esas van como issue o en el diario)
  - Variaciones minimas de un protocolo existente (amplia el existente)
```

---

## Preguntas antes de crear

```
1. Nivel: es GLOBAL (afecta a todo) o POR REPO (especifico de un repo)?
2. Tipo: es de SESION / CAMBIO / VERIFICACION / ENTRADA DE ATOMO?
3. Ya existe algo similar? -> revisar protocolo/INDEX.md antes de crear
4. Tiene su versión por repo? Si es global -> necesita variante por repo?
```

---

## Pasos

```
[ ] 1. Responder las 4 preguntas (arriba)

[ ] 2. Crear archivo:
       ruta: protocolo/PROTOCOLO-NOMBRE-EN-MAYUSCULAS.md
       desde: docs/canon/PLANTILLA-PROTOCOLO.md

[ ] 3. Completar estructura obligatoria:
       - frontmatter completo (tipo: protocolo, version: 1.0)
       - descripcion: cuando ejecutar + tiempo estimado
       - fases o pasos con checkboxes [ ]
       - seccion 'Relacionado' con links a protocolos/plantillas que usa

[ ] 4. Actualizar protocolo/INDEX.md:
       Anadir entrada en la tabla del nivel correspondiente

[ ] 5. Actualizar MASTER-PENDIENTES.md:
       Anadir al canon de protocolos con estado Vigente

[ ] 6. Si el protocolo es global y necesita variante por repo:
       Crear PROTOCOLO-NOMBRE-DEW/WIKI/TRACKING/FORMACION.md

[ ] 7. Commit:
       'feat(protocolo): PROTOCOLO-NOMBRE v1.0'
```

---

## Relacionado

- docs/canon/PLANTILLA-PROTOCOLO.md
- protocolo/INDEX.md
- MASTER-PENDIENTES.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO E)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
