---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SINCRONIZACION-DEW.md
tags: [protocolo, sincronizacion, dew]
status: vigente
version: 1.0
---

# PROTOCOLO-SINCRONIZACION-DEW v1.0

> Verifica que los archivos internos de yggdrasil-dew son consistentes entre si
> y reflejan el estado real despues de una sesion de trabajo.
> Ejecutar desde PROTOCOLO-CIERRE-SESION cuando se toco DEW.
> Tiempo estimado: 5-8 min.

---

## Fase 1: Documentos canon

```
[ ] docs/canon/ESTADO-SISTEMA.md -> fecha actualizado correcta / repos reales
[ ] MASTER-PENDIENTES.md -> fases y canon de protocolos/plantillas al dia
[ ] docs/adr/INDEX-ADR.md -> todos los ADRs de docs/adr/ tienen entrada
[ ] protocolo/INDEX.md -> todos los archivos de protocolo/ tienen entrada
```

---

## Fase 2: Diarios

```
[ ] Diario del dia existe en docs/diarios/YYYY-MM-DD.md
[ ] Diario tiene frontmatter valido desde PLANTILLA-DIARIO-DEW.md
[ ] No hay diarios con sufijos raros (YYYY-MM-DD-sesion2.md etc.)
```

---

## Fase 3: Islas DEW

```
[ ] docs/islas/ESTADO-ISLA-*.md existe para cada isla referenciada en MAPA
[ ] MAPA-ISLAS-DEPENDENCIAS tiene todas las islas activas
[ ] Ningun ESTADO-ISLA con status desconocido
```

---

## Fase 4: Frontmatter rapido

```
[ ] Archivos creados/modificados esta sesion tienen frontmatter valido
[ ] Campo 'actualizado' refleja la fecha de hoy en archivos tocados
[ ] Campo 'ruta' coincide con la ruta real del archivo
```

---

## Cierre

```
[ ] Entrada en diario DEW con resumen de diferencias encontradas
[ ] Si >2 diferencias -> abrir issue o anadir a MASTER-PENDIENTES
```

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
