---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-AUDITORIA-WIKI.md
tags: [protocolo, auditoria, wiki, islas, consistencia]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-WIKI v1.0

> Protocolo de auditoría completa del repo `yggdrasil-wiki`.
> Ejecutar: mensualmente o antes de ciclos de purga (issue #59 F3).
> Tiempo estimado: 45-60 min con MCP.

---

## Fase 1: Islas activas vs repo real

```
[ ] Listar wiki/islas/ — verificar que cada .md tiene su isla correspondiente
[ ] Verificar que INDEX.md tiene entrada para cada isla activa
[ ] Verificar que no hay islas en INDEX.md que no existan como archivo
[ ] Verificar que no hay archivos .md en islas/ que no estén en INDEX.md
[ ] Verificar que VIDAPERSONAL.md tiene tipo: redirect (deprecado)
```

---

## Fase 2: Frontmatter de islas

```
[ ] Campos obligatorios: tipo, nombre, descripcion, repo_principal, estado, author, creado, actualizado, ruta, tags, status
[ ] Campo 'repo_principal' apunta a URL válida y existente
[ ] Campo 'estado' es: estable | borrador | deprecado
[ ] Islas deprecadas tienen tipo: redirect
```

---

## Fase 3: Consistencia de nombres en islas

```
[ ] Buscar 'yggdrasil-formacion-' — corregir a 'yggdrasil-formacion'
[ ] Buscar 'formacion-tech' — corregir a 'yggdrasil-formacion'
[ ] Buscar 'VIDAPERSONAL' en islas activas — corregir a tracking o formacion
[ ] Verificar que formacion.md apunta a yggdrasil-formacion (sin guión)
[ ] Verificar que tracking.md tiene regla de oro con 'yggdrasil-formacion' (sin guión)
```

---

## Fase 4: Contenido de islas

```
[ ] Verificar que ninguna isla tiene comandos bash, scripts, IPs o tokens
[ ] Verificar que ninguna isla duplica contenido de DEW u otro repo operativo
[ ] Verificar que cada isla tiene sección 'Estado y auditoría' con link al ESTADO-ISLA en DEW
[ ] Verificar que los links a repos externos funcionan
```

---

## Fase 5: Purga (F3)

```
[ ] Identificar archivos que no son islas (borradores sin frontmatter, duplicados)
[ ] Verificar archivos .md fuera de wiki/islas/ — ¿son necesarios?
[ ] Purgar o archivar archivos obsoletos respetando PROTOCOLO-BORRADO.md
[ ] Actualizar INDEX.md tras purga
```

---

## Fase 6: Cierre de auditoría

```
[ ] Actualizar INDEX.md con fecha de auditoría
[ ] Notificar en DEW: ESTADO-SISTEMA y diario del día
[ ] Cerrar issue de auditoría si existía (#59 F3 si se completó purga)
```

---

_Creado: 2026-07-16 · F14 Protocolo Auditoría WIKI v1.0 · Perplexity MCP_
