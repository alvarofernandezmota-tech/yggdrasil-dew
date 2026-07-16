---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVA-ISLA.md
tags: [protocolo, isla, wiki, atomo, dew]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVA-ISLA v1.0

> Ejecutar cada vez que entra un nuevo dominio/repo/concepto al ecosistema.
> Una isla sin protocolo de entrada nace desconectada. Una isla conectada
> tiene su carta en WIKI, su ESTADO en DEW y su contexto en el MAPA.
> Tiempo estimado: 15-20 min.

---

## Las 4 preguntas antes de crear

```
Antes de crear cualquier isla, Alvaro responde:
  1. Que ES esta isla (dominio, repo, concepto)
  2. Que REPRESENTA en el ecosistema (funcion, proposito)
  3. Que FUNCIONES tiene (que contiene, que produce)
  4. A que ISLAS esta conectada (dependencias, relaciones)

Si no puedes responder las 4 -> la isla no esta lista para entrar.
```

---

## Pasos

```
[ ] 1. Responder las 4 preguntas (arriba)

[ ] 2. Crear carta de isla en WIKI:
       ruta: wiki/islas/<nombre-isla>.md
       desde: docs/canon/PLANTILLA-ISLA-WIKI.md
       completar: nombre, descripcion, repo_principal, estado=borrador, conexiones

[ ] 3. Crear ESTADO-ISLA en DEW:
       ruta: docs/islas/ESTADO-ISLA-<NOMBRE>.md
       desde: docs/canon/PLANTILLA-ESTADO-ISLA.md
       completar: estado operativo, healthcheck, ultima auditoria

[ ] 4. Actualizar MAPA-ISLAS-DEPENDENCIAS en DEW:
       Anadir fila con nombre, repo, tipo, estado, dependencias

[ ] 5. Actualizar wiki/islas/INDEX.md en WIKI:
       Anadir entrada con nombre, descripcion breve, estado

[ ] 6. Si la isla es un repo nuevo -> ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA TIPO B

[ ] 7. Commit en DEW:
       'feat(isla): nueva isla <nombre> - carta WIKI + ESTADO-ISLA + MAPA'
       Commit en WIKI:
       'feat: nueva isla <nombre>'

[ ] 8. Cuando la isla tenga contenido real -> cambiar estado: borrador -> estable
```

---

## Relacionado

- docs/canon/PLANTILLA-ISLA-WIKI.md
- docs/canon/PLANTILLA-ESTADO-ISLA.md
- docs/islas/MAPA-ISLAS-DEPENDENCIAS.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO B)
- NORMA-ENTRADA-NUEVA-ISLA.md (norma que complementa este protocolo)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
