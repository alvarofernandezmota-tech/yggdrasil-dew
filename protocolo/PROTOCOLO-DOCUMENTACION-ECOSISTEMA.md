---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-DOCUMENTACION-ECOSISTEMA.md
tags: [protocolo, documentacion, ecosistema, global]
status: vigente
version: 1.0
---

# PROTOCOLO-DOCUMENTACION-ECOSISTEMA v1.0

> Guia de que documentar, donde y como en el ecosistema Yggdrasil.
> Responde la pregunta: 'tengo algo nuevo, donde lo pongo?'
> Tiempo estimado: 2 min (consulta) / 10-30 min (documentacion).

---

## El mapa de destinos

```
QUE TENGO                          DONDE VA
─────────────────────────────────────────────────────
Decision arquitectural             ADR en yggdrasil-dew/docs/adr/
Estado del ecosistema hoy          docs/canon/ESTADO-SISTEMA.md
Que hice en la sesion tecnica      docs/diarios/YYYY-MM-DD.md (DEW)
Como estoy yo hoy                  diarios/YYYY/MM-mes/YYYY-MM-DD.md (TRACKING)
Dominio/concepto nuevo             Isla en yggdrasil-wiki/wiki/islas/
Apunte de curso o HTB              apuntes/<area>/<tema>.md (FORMACION)
Script de automatizacion           yggdrasil-scripts
Config de servidor Madre           madre-config
Protocolo nuevo                    protocolo/ en yggdrasil-dew
Plantilla nueva                    docs/canon/ en yggdrasil-dew
Pendientes y fases                 MASTER-PENDIENTES.md (DEW)
Reglas del ecosistema              NORMAS.md (DEW)
Mapa de repos y dependencias       ECOSYSTEM-ARCHITECTURE.md (DEW)
```

---

## La regla de la pregunta doble

```
Antes de crear cualquier archivo, preguntate:
  1. Ya existe esto en algun otro sitio? -> Si -> actualiza el existente
  2. Es contenido o es estructura?       -> Contenido -> tu repo
                                         -> Estructura -> DEW
```

---

## Cuando algo no encaja en el mapa

```
[ ] No crear el archivo todavia
[ ] Abrir issue en DEW: 'Nuevo tipo de contenido: <descripcion>'
[ ] Decidir destino en la sesion
[ ] Si es un tipo nuevo recurrente -> crear plantilla + protocolo de entrada
```

---

## Documentacion minima obligatoria por tipo

```
TODO ARCHIVO nuevo necesita:
  - frontmatter con: tipo, author, creado, actualizado, ruta, tags, status
  - campo 'ruta' = ruta exacta desde la raiz del repo
  - creado desde su PLANTILLA-*.md correspondiente

TODO CAMBIO ESTRUCTURAL necesita:
  - entrada en diario DEW del dia
  - actualizacion de maestros afectados (MASTER / ESTADO-SISTEMA / INDEX)
  - commit con mensaje descriptivo

TODA DECISION necesita:
  - ADR si cambia la arquitectura del ecosistema
  - entrada en diario DEW si es decision de sesion
```

---

## Relacionado

- PROTOCOLO-NUEVO-PROTOCOLO.md
- PROTOCOLO-NUEVA-ISLA.md
- PROTOCOLO-NUEVO-ADR.md
- NORMAS.md
- ECOSYSTEM-ARCHITECTURE.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
