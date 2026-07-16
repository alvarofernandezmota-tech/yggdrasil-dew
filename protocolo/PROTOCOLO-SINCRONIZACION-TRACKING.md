---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SINCRONIZACION-TRACKING.md
tags: [protocolo, sincronizacion, tracking]
status: vigente
version: 1.0
---

# PROTOCOLO-SINCRONIZACION-TRACKING v1.0

> Verifica que yggdrasil-tracking esta internamente consistente.
> TRACKING es vida personal: diarios, metas, habitos. No contiene tecnico.
> Ejecutar desde PROTOCOLO-CIERRE-SESION cuando se toco TRACKING.
> Tiempo estimado: 3-5 min.

---

## Fase 1: Estructura de diarios

```
[ ] Diarios en diarios/YYYY/MM-mes/YYYY-MM-DD.md (estructura correcta)
[ ] No hay diarios tecnicos mezclados (esos van en yggdrasil-dew/docs/diarios/)
[ ] Diarios recientes tienen frontmatter valido desde PLANTILLA-DIARIO-TRACKING.md
```

---

## Fase 2: Metas

```
[ ] metas/README.md existe y refleja metas activas reales
[ ] No hay referencias a repos con nombres incorrectos
[ ] Las metas completadas estan marcadas como completadas
```

---

## Fase 3: Separacion personal/tecnico

```
[ ] No hay comandos bash, scripts, IPs ni tokens en ningun archivo
[ ] No hay contenido que deberia estar en DEW o FORMACION
[ ] El repo sigue siendo privado (dato personal)
```

---

## Cierre

```
[ ] Notificar en DEW: entrada en diario tecnico del dia
[ ] Si hay mezcla tecnico/personal detectada -> abrir issue en DEW
```

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
