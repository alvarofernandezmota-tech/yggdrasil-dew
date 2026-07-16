---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-ADR.md
tags: [protocolo, adr, atomo, dew]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-ADR v1.0

> Ejecutar cada vez que se toma una decision arquitectural que afecta al ecosistema.
> Un ADR documenta POR QUE se tomo una decision, no solo el resultado.
> Sin ADR, las decisiones se pierden y el ecosistema pierde memoria.
> Tiempo estimado: 10-15 min.

---

## Cuando crear un ADR

```
CREAR ADR si la decision:
  - Cambia la estructura de un repo
  - Cambia como se nombran archivos o repos
  - Define una separacion entre repos (que va donde)
  - Introduce una nueva tecnologia o herramienta
  - Cambia un protocolo o norma del ecosistema
  - Afecta a como trabaja THDORA o cualquier agente

NO crear ADR para:
  - Cambios de contenido (actualizar un diario, una isla)
  - Fixes de typos o nombres incorrectos (esos son commits normales)
  - Tareas operativas del dia a dia
```

---

## Pasos

```
[ ] 1. Obtener siguiente numero de ADR:
       Leer docs/adr/INDEX-ADR.md -> ver ultimo ADR -> N+1

[ ] 2. Crear archivo:
       ruta: docs/adr/ADR-NNN-titulo-en-minusculas-con-guiones.md
       desde: docs/canon/PLANTILLA-ADR.md

[ ] 3. Completar el ADR:
       - titulo claro y especifico
       - contexto: por que se llego a esta decision
       - decision: que se decidio exactamente
       - alternativas consideradas
       - consecuencias: que cambia, que se facilita, que se complica
       - estado: propuesto / aceptado / deprecado

[ ] 4. Actualizar INDEX-ADR.md:
       Anadir fila con: numero, titulo, estado, fecha, descripcion breve

[ ] 5. Ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA TIPO D:
       Propagar la decision a los archivos que referencia el ADR

[ ] 6. Commit:
       mensaje: 'docs(adr): ADR-NNN titulo breve'
```

---

## Relacionado

- docs/canon/PLANTILLA-ADR.md
- docs/adr/INDEX-ADR.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO D)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
