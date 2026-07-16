---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ACTUALIZACION-DEW.md
tags: [protocolo, actualizacion, dew, repo]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-DEW v1.0

> Ejecutar cuando un cambio estructural afecta a yggdrasil-dew.
> Version especifica de PROTOCOLO-ACTUALIZACION-ECOSISTEMA para DEW.
> Tiempo estimado: 10-20 min segun el tipo de cambio.

---

## Tipos de cambio en DEW

```
TIPO A — Renombrado de archivo o ruta
  [ ] Buscar todas las referencias al nombre antiguo en DEW
  [ ] Actualizar referencias internas (ADRs, islas, MASTER, INDEX)
  [ ] Actualizar campo 'ruta' del frontmatter del archivo renombrado
  [ ] Ejecutar PROTOCOLO-NOMBRES

TIPO B — Nuevo protocolo
  [ ] Crear desde PLANTILLA-PROTOCOLO.md
  [ ] Actualizar protocolo/INDEX.md
  [ ] Actualizar tabla Canon de protocolos en MASTER-PENDIENTES.md

TIPO C — Nuevo ADR
  [ ] Crear desde PLANTILLA-ADR.md
  [ ] Actualizar docs/adr/INDEX-ADR.md
  [ ] Propagar decision a archivos afectados

TIPO D — Cambio en NORMAS o ESTADO-SISTEMA
  [ ] Actualizar NORMAS.md o ESTADO-SISTEMA.md
  [ ] Verificar que MASTER-PENDIENTES refleja el cambio
  [ ] Si afecta a otros repos -> ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA

TIPO E — Nueva plantilla
  [ ] Crear en docs/canon/ desde PLANTILLA-PROTOCOLO.md (adaptado)
  [ ] Actualizar tabla Canon de plantillas en MASTER-PENDIENTES.md
  [ ] Actualizar protocolo/INDEX.md seccion NIVEL 4
```

---

## Checklist post-cambio DEW

```
[ ] MASTER-PENDIENTES.md refleja el cambio
[ ] protocolo/INDEX.md actualizado si se toco protocolo/
[ ] docs/adr/INDEX-ADR.md actualizado si se toco docs/adr/
[ ] Ningun campo 'ruta' desactualizado en los archivos tocados
[ ] Ningun secreto en los archivos tocados
[ ] Commit con mensaje descriptivo
```

---

## Relacionado

- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (global)
- PROTOCOLO-NOMBRES.md
- PROTOCOLO-BORRADO.md
- MASTER-PENDIENTES.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
