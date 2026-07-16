---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md
tags: [protocolo, sincronizacion, ecosistema, global, consistencia]
status: vigente
version: 1.0
---

# PROTOCOLO-SINCRONIZACION-ECOSISTEMA v1.0

> Protocolo pilar. Verifica que los 5 documentos maestros del ecosistema
> se dicen lo mismo entre si y reflejan el estado real.
>
> DIFERENCIA CLAVE:
> - ACTUALIZACION-ECOSISTEMA: propaga un cambio concreto hacia afuera
> - AUDITORIA-<REPO>: revision profunda de contenido y estructura
> - SINCRONIZACION-ECOSISTEMA: verifica que los maestros son consistentes entre si
>
> Ejecutar: cierre de sesion con cambios / primer dia de cada mes.
> Tiempo estimado: 10-15 min.

---

## Los 5 documentos maestros

```
1. docs/canon/ESTADO-SISTEMA.md         -> snapshot operativo
2. MASTER-PENDIENTES.md                 -> fases + canon protocolos + canon plantillas
3. docs/adr/INDEX-ADR.md                -> inventario ADRs
4. protocolo/INDEX.md                   -> inventario protocolos
5. docs/islas/MAPA-ISLAS-DEPENDENCIAS   -> mapa relaciones repos
```

---

## Fase 1: Sincronizar ESTADO-SISTEMA

```
[ ] Lista de repos en ESTADO-SISTEMA coincide con repos reales de alvarofernandezmota-tech
[ ] Estado de cada repo (activo/mantenimiento/caido) es correcto
[ ] Fecha 'actualizado' es real
[ ] Si hay diferencias -> actualizar ESTADO-SISTEMA.md
```

---

## Fase 2: Sincronizar MASTER-PENDIENTES

```
[ ] Fases marcadas CERRADAS estan realmente cerradas
[ ] Issues listados como abiertos siguen abiertos en GitHub
[ ] Canon de protocolos = archivos reales en protocolo/
[ ] Canon de plantillas = archivos reales en docs/canon/PLANTILLA-*
[ ] Si hay diferencias -> actualizar MASTER-PENDIENTES.md
```

---

## Fase 3: Sincronizar INDEX-ADR

```
[ ] Listar docs/adr/ y comparar con INDEX-ADR.md
[ ] ADR sin entrada en INDEX -> anadir
[ ] Entrada en INDEX sin archivo -> marcar 'faltante'
[ ] Ningun ADR vigente contradice a otro ADR vigente
```

---

## Fase 4: Sincronizar protocolo/INDEX

```
[ ] Listar protocolo/ y comparar con INDEX.md
[ ] Protocolo sin entrada -> anadir
[ ] Entrada sin archivo real -> marcar 'faltante'
[ ] Versiones en INDEX coinciden con frontmatter de cada archivo
```

---

## Fase 5: Sincronizar MAPA-ISLAS

```
[ ] Cada fila del MAPA tiene su ESTADO-ISLA-*.md en docs/islas/
[ ] Cada isla activa tiene su carta en yggdrasil-wiki/wiki/islas/
[ ] Dependencias documentadas siguen siendo reales
[ ] Isla nueva sin entrada en MAPA -> ejecutar ACTUALIZACION TIPO B
```

---

## Fase 6: Verificacion cruzada

```
[ ] ESTADO-SISTEMA <-> MASTER-PENDIENTES: fases cerradas coinciden
[ ] MASTER-PENDIENTES <-> protocolo/INDEX: canon de protocolos coincide
[ ] protocolo/INDEX <-> archivos reales en protocolo/: todos existen
[ ] INDEX-ADR <-> archivos reales en docs/adr/: todos existen
[ ] MAPA-ISLAS <-> wiki/islas/INDEX.md: islas activas coinciden
```

---

## Fase 7: Cierre

```
[ ] Actualizar fechas 'actualizado' en documentos tocados
[ ] Entrada en diario DEW del dia con diferencias encontradas
[ ] Si >3 diferencias -> abrir issue en DEW
[ ] Actualizar MASTER-PENDIENTES si hay tareas nuevas detectadas
```

---

## Frecuencia

| Trigger | Fases minimas |
|---|---|
| Cierre sesion con cambios estructurales | Fases 1-2 + 7 |
| Cierre de fase del MASTER-PENDIENTES | Fases 1-4 + 7 |
| Primer dia del mes | Fases 1-7 completo |
| Antes de auditoria general | Fases 1-7 completo |

---

_Creado: 2026-07-16 v1.0 protocolo pilar F15 Perplexity MCP_
