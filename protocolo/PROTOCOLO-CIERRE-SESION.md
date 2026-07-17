---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-CIERRE-SESION.md
tags: [protocolo, cierre, sesion, sincronizacion, global]
status: vigente
version: 3.0
---

# PROTOCOLO-CIERRE-SESION v3.0

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
[ ] Si se toco DEW       -> ejecutar PROTOCOLO-SINCRONIZACION-DEW (fases 1-2 minimo)
[ ] Si se toco WIKI      -> ejecutar PROTOCOLO-SINCRONIZACION-WIKI (fases 1-2 minimo)
[ ] Si se toco TRACKING  -> ejecutar PROTOCOLO-SINCRONIZACION-TRACKING (fases 1-2 minimo)
[ ] Si se toco FORMACION -> ejecutar PROTOCOLO-SINCRONIZACION-FORMACION (fases 1-2 minimo)
[ ] Si se toco Madre     -> ejecutar PROTOCOLO-ACTUALIZACION-MADRE (paso final: documentar)
```

---

## Fase 4: Sincronizacion de indices

```
[ ] Si se crearon ADRs nuevos            -> verificar INDEX-ADR.md
[ ] Si se crearon protocolos nuevos      -> verificar protocolo/INDEX.md
[ ] Si se crearon/modificaron islas      -> verificar wiki/islas/INDEX.md
[ ] Si se desplegaron contenedores       -> verificar docs/inventario-madre.md
[ ] Si cambiaron puertos                 -> verificar tabla PROTOCOLO-AUDITORIA-MADRE
```

---

## Fase 5: Cierre limpio

```
[ ] Verificar que no hay archivos sin frontmatter creados en esta sesion
[ ] Verificar que no hay secretos/tokens en ningun archivo tocado
[ ] Commit final si hay cambios pendientes (mensaje: 'chore: cierre sesion YYYY-MM-DD')
[ ] Cerrar issues que se resolvieron en esta sesion
```

---

_Actualizado: 2026-07-17 v3.0 · anadir rama Madre en Fase 3 + indices infra en Fase 4 · Perplexity MCP_
