---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ACTUALIZACION-WIKI.md
tags: [protocolo, actualizacion, wiki, repo]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-WIKI v1.0

> Ejecutar cuando un cambio estructural afecta a yggdrasil-wiki.
> Version especifica de PROTOCOLO-ACTUALIZACION-ECOSISTEMA para WIKI.
> Tiempo estimado: 10-15 min segun el tipo de cambio.

---

## Tipos de cambio en WIKI

```
TIPO A — Nueva isla
  [ ] Ejecutar PROTOCOLO-NUEVA-ISLA.md completo
  [ ] Actualizar wiki/islas/INDEX.md
  [ ] Crear ESTADO-ISLA en DEW
  [ ] Actualizar MAPA-ISLAS-DEPENDENCIAS en DEW

TIPO B — Modificacion de isla existente
  [ ] Actualizar campo 'actualizado' en frontmatter
  [ ] Si cambia el estado (borrador->estable) -> actualizar wiki/islas/INDEX.md
  [ ] Si cambia el nombre -> ejecutar PROTOCOLO-NOMBRES
  [ ] Actualizar ESTADO-ISLA correspondiente en DEW

TIPO C — Deprecar isla
  [ ] Ejecutar PROTOCOLO-DEPRECAR-ARCHIVO en la carta de isla
  [ ] Actualizar wiki/islas/INDEX.md (marcar como deprecada)
  [ ] Actualizar ESTADO-ISLA en DEW (marcar como deprecada)
  [ ] Actualizar MAPA-ISLAS-DEPENDENCIAS

TIPO D — Cambio en HOME o INDEX global
  [ ] Verificar que todos los links siguen siendo validos
  [ ] Actualizar ESTADO-SISTEMA en DEW si el cambio es estructural
```

---

## Checklist post-cambio WIKI

```
[ ] wiki/islas/INDEX.md actualizado
[ ] ESTADO-ISLA correspondiente actualizado en DEW
[ ] MAPA-ISLAS-DEPENDENCIAS actualizado si cambian conexiones
[ ] Campo 'actualizado' en frontmatter de archivos tocados
[ ] Ningun secreto en los archivos tocados
[ ] Commit con mensaje descriptivo
```

---

## Relacionado

- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (global)
- PROTOCOLO-NUEVA-ISLA.md
- PROTOCOLO-DEPRECAR-ARCHIVO.md
- PROTOCOLO-NOMBRES.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
