---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md
tags: [protocolo, actualizacion, cascada, ecosistema, propagacion]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-ECOSISTEMA v1.0

> Ejecutar cada vez que algo cambia en el ecosistema.
> Define exactamente qué archivos tocar en qué orden según el tipo de cambio.
> Sin este protocolo, los cambios se propagan de forma incompleta.
>
> Inspirado en: Runbook best practices (IdeaPlan/em-tools) + Docs-as-Code SSoT

---

## Principio base

```
Todo cambio tiene un ORIGEN y uno o varios DESTINOS.
El agente nunca cierra una sesión con cambios sin propagar.
Si no sabe si algo es destino de un cambio → consulta esta tabla.
```

---

## Tabla de propagación por tipo de cambio

### TIPO A — Cambio de nombre de repo

> Ejemplo: `yggdrasil-formacion-` → `yggdrasil-formacion`

```
Afectados obligatorios (DEW):
[ ] NORMAS.md → buscar nombre antiguo y corregir
[ ] ECOSYSTEM-ARCHITECTURE.md → tabla repos
[ ] MASTER-PENDIENTES.md → todas las menciones
[ ] docs/canon/ESTADO-SISTEMA.md → tabla de repos
[ ] docs/islas/MAPA-ISLAS-DEPENDENCIAS.md → tabla de dependencias
[ ] docs/islas/ESTADO-ISLA-<REPO>.md → frontmatter + nombre repo
[ ] docs/adr/ → buscar en todos los ADRs con grep 'nombre_antiguo'
[ ] protocolo/ → buscar en todos los protocolos con grep 'nombre_antiguo'

Afectados obligatorios (WIKI):
[ ] wiki/islas/<isla-afectada>.md → campo repo_principal
[ ] wiki/islas/INDEX.md → link si lo referencia

Afectados obligatorios (TRACKING si aplica):
[ ] metas/README.md → si hay referencia al repo

Siempre al final:
[ ] Diario DEW del día → documenta el cambio con nota histórica
[ ] Issue DEW → abrir fix#XX si hay > 3 archivos afectados
```

---

### TIPO B — Nuevo repo / nueva isla

> Ejecutar además NORMA-ENTRADA-NUEVA-ISLA.md (checklist completo)

```
Afectados obligatorios (DEW):
[ ] ECOSYSTEM-ARCHITECTURE.md → añadir fila en tabla de repos
[ ] MASTER-PENDIENTES.md → añadir si tiene trabajo pendiente
[ ] docs/canon/ESTADO-SISTEMA.md → añadir fila
[ ] docs/islas/MAPA-ISLAS-DEPENDENCIAS.md → añadir fila + dependencias
[ ] docs/islas/ESTADO-ISLA-<NUEVO-REPO>.md → crear desde PLANTILLA-ESTADO-ISLA.md
[ ] docs/adr/ → crear ADR si la decisión lo requiere

Afectados obligatorios (WIKI):
[ ] wiki/islas/<nueva-isla>.md → crear desde PLANTILLA-ISLA-WIKI.md
[ ] wiki/islas/INDEX.md → añadir entrada

Siempre al final:
[ ] Diario DEW del día
[ ] Issue DEW si hay trabajo pendiente
```

---

### TIPO C — Deprecación de repo / isla

```
Afectados obligatorios (DEW):
[ ] ECOSYSTEM-ARCHITECTURE.md → mover a sección Deprecados
[ ] docs/canon/ESTADO-SISTEMA.md → mover a sección Deprecados con motivo
[ ] docs/islas/ESTADO-ISLA-<REPO>.md → status: deprecado + nota de sustitución
[ ] docs/islas/MAPA-ISLAS-DEPENDENCIAS.md → marcar como deprecado
[ ] ADR nuevo → documentar la decisión de deprecar

Afectados obligatorios (WIKI):
[ ] wiki/islas/<isla>.md → tipo: redirect + link al sustituto
[ ] wiki/islas/INDEX.md → mover a sección deprecados

Siempre al final:
[ ] Diario DEW del día
```

---

### TIPO D — Nuevo ADR

```
[ ] Crear docs/adr/ADR-<NNN>-<titulo>.md desde PLANTILLA-ADR.md
[ ] Actualizar docs/adr/INDEX-ADR.md con la nueva entrada
[ ] Si el ADR afecta a un protocolo → actualizar el protocolo y su versión
[ ] Si el ADR afecta a NORMAS.md → actualizar NORMAS.md
[ ] Diario DEW del día
```

---

### TIPO E — Nuevo protocolo

```
[ ] Crear protocolo/<NOMBRE>.md desde PLANTILLA-PROTOCOLO.md
[ ] Actualizar protocolo/INDEX.md con la nueva entrada
[ ] Si reemplaza a uno existente → status: superseded en el antiguo + nota
[ ] Actualizar MASTER-PENDIENTES.md sección canon protocolos
[ ] Diario DEW del día
```

---

### TIPO F — Cambio en NORMAS.md

```
[ ] Verificar si el cambio afecta a algún ADR → actualizar o crear ADR
[ ] Verificar si el cambio afecta a algún protocolo → actualizar protocolo
[ ] Verificar si el cambio afecta a la wiki → actualizar isla correspondiente
[ ] Diario DEW del día
```

---

### TIPO G — Cambio en una isla WIKI

```
[ ] Verificar que ESTADO-ISLA-<REPO>.md en DEW está sincronizado
[ ] Verificar que wiki/islas/INDEX.md tiene la entrada actualizada
[ ] Si cambia repo_principal → ejecutar TIPO A si es un renombrado
[ ] Diario DEW del día
```

---

## Regla de oro de la cascada

> **Ningún archivo es una isla.** Todo está conectado.
> Si dudas si algo es destino de un cambio → es mejor tocarlo que dejarlo.
> El coste de actualizar de más es cero. El coste de no actualizar es deuda técnica.

---

## Relación con otros protocolos

| Si el cambio afecta a... | Ejecutar también... |
|---|---|
| repo nuevo | NORMA-ENTRADA-NUEVA-ISLA.md |
| borrado de archivos | PROTOCOLO-BORRADO.md |
| nombres canónicos | PROTOCOLO-NOMBRES.md |
| cierre de sesión | PROTOCOLO-CIERRE-SESION.md |

---

_Creado: 2026-07-16 · F15 · ADR-013 · inspirado en Runbook best practices + Docs-as-Code SSoT · Perplexity MCP_
