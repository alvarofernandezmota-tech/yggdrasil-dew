---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CIERRE-SESION.md
tags: [protocolo, cierre, sesion, sincronizacion, global]
status: vigente
version: 2.0
---

# PROTOCOLO-CIERRE-SESION v2.0

> Ejecutar SIEMPRE al finalizar cada sesion con cambios.
> El cierre garantiza que el ecosistema queda sincronizado y que la proxima sesion
> puede arrancar con contexto correcto sin depender de la memoria del agente.
> Tiempo estimado: 5-10 min.

---

## Fase 1: Registrar lo hecho

```
[ ] Completar diario DEW del dia:
    - tabla de acciones ejecutadas (hora / accion / archivo / commit)
    - decisiones tomadas
    - pendientes al cierre
[ ] Si se tomaron decisiones arquitecturales -> verificar que tienen su ADR
```

---

## Fase 2: Sincronizacion minima obligatoria

> Ejecutar siempre. No es opcional.

```
[ ] MASTER-PENDIENTES.md:
    - marcar fases cerradas como CERRADAS
    - actualizar fases en progreso
    - actualizar issues cerrados/abiertos
[ ] docs/canon/ESTADO-SISTEMA.md:
    - actualizar fecha 'actualizado'
    - reflejar cambios en repos si los hubo
```

---

## Fase 3: Sincronizacion por repo (solo los repos tocados)

```
[ ] Si se tocou DEW      -> ejecutar PROTOCOLO-SINCRONIZACION-DEW.md (fases 1-2 minimo)
[ ] Si se tocou WIKI     -> ejecutar PROTOCOLO-SINCRONIZACION-WIKI.md (fases 1-2 minimo)
[ ] Si se tocou TRACKING -> ejecutar PROTOCOLO-SINCRONIZACION-TRACKING.md (fases 1-2 minimo)
[ ] Si se tocou FORMACION-> ejecutar PROTOCOLO-SINCRONIZACION-FORMACION.md (fases 1-2 minimo)
```

---

## Fase 4: Sincronizacion de indices

```
[ ] Si se crearon ADRs nuevos         -> verificar INDEX-ADR.md
[ ] Si se crearon protocolos nuevos   -> verificar protocolo/INDEX.md
[ ] Si se crearon/modificaron islas   -> verificar wiki/islas/INDEX.md
[ ] Si se crearon plantillas nuevas   -> verificar MASTER-PENDIENTES canon plantillas
```

---

## Fase 5: Cierre limpio

```
[ ] Verificar que no hay archivos sin frontmatter creados en esta sesion
[ ] Verificar que no hay secretos/tokens en ningun archivo tocado esta sesion
[ ] Commit final si hay cambios pendientes (mensaje: 'chore: cierre sesion YYYY-MM-DD')
[ ] Cerrar issues que se resolvieron en esta sesion
```

---

_Actualizado: 2026-07-16 v2.0 F15 Perplexity MCP_
