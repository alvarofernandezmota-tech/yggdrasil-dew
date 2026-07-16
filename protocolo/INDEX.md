---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/INDEX.md
tags: [protocolo, indice, canon]
status: vigente
---

# Indice de Protocolos - Ecosistema Yggdrasil

> Inventario completo de todos los protocolos vigentes.
> Actualizar cada vez que se crea, versiona o depreca un protocolo
> (TIPO E del PROTOCOLO-ACTUALIZACION-ECOSISTEMA).

---

## Arquitectura del sistema de protocolos

```
NIVEL 0 - TU
  pregunta / instruccion
        |
NIVEL 1 - PROTOCOLOS GLOBALES (orquestan todo)
  APERTURA -> CONTEXTO-ECOSISTEMA -> [trabajo] -> SINCRONIZACION -> CIERRE
        |
        | si hay cambio estructural:
        v
  ACTUALIZACION-ECOSISTEMA
        |
        | si hay revision profunda:
        v
  AUDITORIA-ECOSISTEMA
        |
NIVEL 2 - PROTOCOLOS POR REPO (zoom a un repo concreto)
  CONTEXTO-DEW/WIKI/TRACKING/FORMACION         (carga el repo)
  SINCRONIZACION-DEW/WIKI/TRACKING/FORMACION   (verifica consistencia interna)
  AUDITORIA-DEW/WIKI/TRACKING/FORMACION        (revision profunda)
        |
NIVEL 3 - PLANTILLAS (docs/canon/PLANTILLA-*.md)
  Garantizan frontmatter correcto en todo archivo nuevo
```

---

## Protocolos de sesion (globales)

| Protocolo | Version | Cuando ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-APERTURA-SESION](./PROTOCOLO-APERTURA-SESION.md) | v2.0 | Inicio de cada sesion | Vigente |
| [PROTOCOLO-CIERRE-SESION](./PROTOCOLO-CIERRE-SESION.md) | v2.0 | Fin de cada sesion | Vigente |
| [PROTOCOLO-CONTEXTO-ECOSISTEMA](./PROTOCOLO-CONTEXTO-ECOSISTEMA.md) | v1.0 | Sesion de ecosistema completo | Vigente |

---

## Protocolos de cambio (globales)

| Protocolo | Version | Cuando ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-ACTUALIZACION-ECOSISTEMA](./PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md) | v1.0 | Cada cambio estructural | Vigente |
| [PROTOCOLO-SINCRONIZACION-ECOSISTEMA](./PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md) | v1.0 | Cierre sesion / mensual | Vigente |
| [PROTOCOLO-AUDITORIA-ECOSISTEMA](./PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | v1.0 | Mensual / revision profunda | Vigente |
| [PROTOCOLO-NOMBRES](./PROTOCOLO-NOMBRES.md) | v2.0 | Al renombrar | Vigente |
| [PROTOCOLO-BORRADO](./PROTOCOLO-BORRADO.md) | v1.0 | Al borrar archivos | Vigente |

---

## Protocolos de contexto (por repo)

| Protocolo | Version | Repo | Estado |
|---|---|---|---|
| [PROTOCOLO-CONTEXTO-DEW](./PROTOCOLO-CONTEXTO-DEW.md) | v1.0 | yggdrasil-dew | Vigente |
| [PROTOCOLO-CONTEXTO-WIKI](./PROTOCOLO-CONTEXTO-WIKI.md) | v1.0 | yggdrasil-wiki | Vigente |
| [PROTOCOLO-CONTEXTO-TRACKING](./PROTOCOLO-CONTEXTO-TRACKING.md) | v1.0 | yggdrasil-tracking | Vigente |
| [PROTOCOLO-CONTEXTO-FORMACION](./PROTOCOLO-CONTEXTO-FORMACION.md) | v1.0 | yggdrasil-formacion | Vigente |

---

## Protocolos de sincronizacion (por repo)

| Protocolo | Version | Repo | Cuando | Estado |
|---|---|---|---|---|
| [PROTOCOLO-SINCRONIZACION-DEW](./PROTOCOLO-SINCRONIZACION-DEW.md) | v1.0 | yggdrasil-dew | Cierre sesion DEW | Vigente |
| [PROTOCOLO-SINCRONIZACION-WIKI](./PROTOCOLO-SINCRONIZACION-WIKI.md) | v1.0 | yggdrasil-wiki | Cierre sesion WIKI | Vigente |
| [PROTOCOLO-SINCRONIZACION-TRACKING](./PROTOCOLO-SINCRONIZACION-TRACKING.md) | v1.0 | yggdrasil-tracking | Cierre sesion TRACKING | Vigente |
| [PROTOCOLO-SINCRONIZACION-FORMACION](./PROTOCOLO-SINCRONIZACION-FORMACION.md) | v1.0 | yggdrasil-formacion | Cierre sesion FORMACION | Vigente |

---

## Protocolos de auditoria (por repo)

| Protocolo | Version | Repo | Frecuencia | Estado |
|---|---|---|---|---|
| [PROTOCOLO-AUDITORIA-DEW](./PROTOCOLO-AUDITORIA-DEW.md) | v1.0 | yggdrasil-dew | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-WIKI](./PROTOCOLO-AUDITORIA-WIKI.md) | v1.0 | yggdrasil-wiki | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-TRACKING](./PROTOCOLO-AUDITORIA-TRACKING.md) | v1.0 | yggdrasil-tracking | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-FORMACION](./PROTOCOLO-AUDITORIA-FORMACION.md) | v1.0 | yggdrasil-formacion | Mensual | Vigente |

---

## Pendiente F15

| Protocolo | Prioridad | Notas |
|---|---|---|
| PROTOCOLO-AUDITORIA-ECOSISTEMA | Alta | Verificar si existe / recrear |
| PROTOCOLO-NOMBRES v2.0 | Alta | Verificar si existe en protocolo/ |
| PROTOCOLO-BORRADO v1.0 | Alta | Verificar si existe en protocolo/ |
| PROTOCOLO-DOCUMENTACION-ECOSISTEMA | Media | Entrada formal de elementos nuevos |
| PROTOCOLO-SECRETOS | Media | Pendiente desde issue #68 |

---

_Actualizado: 2026-07-16 v2.0 F15 - sistema completo de protocolos por nivel Perplexity MCP_
