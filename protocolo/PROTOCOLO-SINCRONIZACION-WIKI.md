---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SINCRONIZACION-WIKI.md
tags: [protocolo, sincronizacion, wiki]
status: vigente
version: 1.0
---

# PROTOCOLO-SINCRONIZACION-WIKI v1.0

> Verifica que yggdrasil-wiki esta sincronizada con el estado real del ecosistema.
> La WIKI es el mapa conceptual: debe reflejar lo que existe, no lo que existia.
> Ejecutar desde PROTOCOLO-CIERRE-SESION cuando se toco WIKI.
> Tiempo estimado: 5-8 min.

---

## Fase 1: INDEX de islas

```
[ ] wiki/islas/INDEX.md tiene entrada para cada archivo en wiki/islas/
[ ] No hay islas en INDEX que no existan como archivo
[ ] Islas depredadas tienen tipo: redirect
```

---

## Fase 2: Consistencia con DEW

```
[ ] Cada isla activa en WIKI tiene su ESTADO-ISLA-*.md en yggdrasil-dew/docs/islas/
[ ] Campo 'repo_principal' de cada isla apunta a URL real y existente
[ ] Nombres de repos en islas son los canonicos (sin guion final, sin WIKI---PERSONAL)
```

---

## Fase 3: Frontmatter de islas

```
[ ] Campos obligatorios: tipo, nombre, descripcion, repo_principal, estado, author, creado, actualizado, ruta, tags, status
[ ] Campo 'estado': estable / borrador / deprecado
[ ] Fecha 'actualizado' correcta en islas tocadas esta sesion
```

---

## Fase 4: Contenido

```
[ ] Ninguna isla contiene secretos/tokens/IPs
[ ] Ninguna isla duplica contenido operativo de DEW
[ ] Cada isla tiene seccion 'Estado y auditoria' con link a DEW
```

---

## Cierre

```
[ ] Notificar en DEW: entrada en diario del dia
[ ] Si >2 diferencias -> issue en DEW
```

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
