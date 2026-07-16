---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16 15:22 CEST
ruta: protocolo/INDEX.md
tags: [protocolo, indice, canon]
status: vigente
version: 3.0
---

# Indice de Protocolos - Ecosistema Yggdrasil

> Inventario completo de todos los protocolos vigentes.
> Actualizar cada vez que se crea, versiona o depreca un protocolo.
> (TIPO E del PROTOCOLO-ACTUALIZACION-ECOSISTEMA)

---

## Arquitectura del sistema de protocolos

```
NIVEL 0 - ALVARO
  pregunta / instruccion / tarea
        |
NIVEL 1 - GLOBALES (orquestan todo el ecosistema)
  APERTURA-SESION
    -> CONTEXTO-ECOSISTEMA (si sesion global)
    -> CONTEXTO-<REPO>     (si sesion en repo concreto)
  [trabajo con atomos: ADR / ISLA / APUNTE / TRACKING / PROTOCOLO / DIARIO]
    -> ACTUALIZACION-ECOSISTEMA (si cambia algo estructural)
  CIERRE-SESION
    -> SINCRONIZACION-ECOSISTEMA (global)
    -> SINCRONIZACION-<REPO>     (repos tocados)
        |
  AUDITORIA-ECOSISTEMA  (mensual / revision profunda)
        |
NIVEL 2 - POR REPO (zoom a un repo concreto)
  APERTURA-<REPO>         carga el repo al inicio
  SINCRONIZACION-<REPO>   verifica consistencia interna al cerrar
  AUDITORIA-<REPO>        revision profunda mensual
        |
NIVEL 3 - ATOMOS (protocolo para cada tipo de contenido nuevo)
  NUEVO-ADR               cada decision arquitectural
  NUEVA-ISLA              cada nuevo dominio en el ecosistema
  NUEVO-APUNTE            cada apunte en FORMACION
  ENTRADA-TRACKING        cada diario personal
  NUEVO-DIARIO-DEW        cada diario tecnico de sesion
  NUEVO-PROTOCOLO         cada protocolo nuevo (este ciclo)
        |
NIVEL 4 - PLANTILLAS (docs/canon/PLANTILLA-*.md)
  Garantizan frontmatter correcto en todo archivo nuevo
```

---

## NIVEL 1 - Protocolos de sesion (globales)

| Protocolo | Version | Cuando ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-APERTURA-SESION](./PROTOCOLO-APERTURA-SESION.md) | v2.0 | Inicio de cada sesion | Vigente |
| [PROTOCOLO-CIERRE-SESION](./PROTOCOLO-CIERRE-SESION.md) | v2.0 | Fin de cada sesion | Vigente |
| [PROTOCOLO-CONTEXTO-ECOSISTEMA](./PROTOCOLO-CONTEXTO-ECOSISTEMA.md) | v1.0 | Sesion de ecosistema completo | Vigente |

---

## NIVEL 1 - Protocolos de cambio (globales)

| Protocolo | Version | Cuando ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-ACTUALIZACION-ECOSISTEMA](./PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md) | v1.0 | Cada cambio estructural | Vigente |
| [PROTOCOLO-SINCRONIZACION-ECOSISTEMA](./PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md) | v1.0 | Cierre sesion / mensual | Vigente |
| [PROTOCOLO-AUDITORIA-ECOSISTEMA](./PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | v1.0 | Mensual | Pendiente verificar |
| [PROTOCOLO-NOMBRES](./PROTOCOLO-NOMBRES.md) | v2.0 | Al renombrar | Pendiente verificar |
| [PROTOCOLO-BORRADO](./PROTOCOLO-BORRADO.md) | v1.0 | Al borrar archivos | Pendiente verificar |

---

## NIVEL 2 - Apertura por repo

| Protocolo | Version | Repo | Estado |
|---|---|---|---|
| [PROTOCOLO-APERTURA-DEW](./PROTOCOLO-APERTURA-DEW.md) | v1.0 | yggdrasil-dew | Vigente |
| [PROTOCOLO-APERTURA-WIKI](./PROTOCOLO-APERTURA-WIKI.md) | v1.0 | yggdrasil-wiki | Vigente |
| [PROTOCOLO-APERTURA-TRACKING](./PROTOCOLO-APERTURA-TRACKING.md) | v1.0 | yggdrasil-tracking | Vigente |
| [PROTOCOLO-APERTURA-FORMACION](./PROTOCOLO-APERTURA-FORMACION.md) | v1.0 | yggdrasil-formacion | Vigente |

---

## NIVEL 2 - Contexto por repo

| Protocolo | Version | Repo | Estado |
|---|---|---|---|
| [PROTOCOLO-CONTEXTO-DEW](./PROTOCOLO-CONTEXTO-DEW.md) | v1.0 | yggdrasil-dew | Vigente |
| [PROTOCOLO-CONTEXTO-WIKI](./PROTOCOLO-CONTEXTO-WIKI.md) | v1.0 | yggdrasil-wiki | Vigente |
| [PROTOCOLO-CONTEXTO-TRACKING](./PROTOCOLO-CONTEXTO-TRACKING.md) | v1.0 | yggdrasil-tracking | Vigente |
| [PROTOCOLO-CONTEXTO-FORMACION](./PROTOCOLO-CONTEXTO-FORMACION.md) | v1.0 | yggdrasil-formacion | Vigente |

---

## NIVEL 2 - Sincronizacion por repo

| Protocolo | Version | Cuando | Estado |
|---|---|---|---|
| [PROTOCOLO-SINCRONIZACION-DEW](./PROTOCOLO-SINCRONIZACION-DEW.md) | v1.0 | Cierre sesion DEW | Vigente |
| [PROTOCOLO-SINCRONIZACION-WIKI](./PROTOCOLO-SINCRONIZACION-WIKI.md) | v1.0 | Cierre sesion WIKI | Vigente |
| [PROTOCOLO-SINCRONIZACION-TRACKING](./PROTOCOLO-SINCRONIZACION-TRACKING.md) | v1.0 | Cierre sesion TRACKING | Vigente |
| [PROTOCOLO-SINCRONIZACION-FORMACION](./PROTOCOLO-SINCRONIZACION-FORMACION.md) | v1.0 | Cierre sesion FORMACION | Vigente |

---

## NIVEL 2 - Auditoria por repo

| Protocolo | Version | Frecuencia | Estado |
|---|---|---|---|
| [PROTOCOLO-AUDITORIA-DEW](./PROTOCOLO-AUDITORIA-DEW.md) | v1.0 | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-WIKI](./PROTOCOLO-AUDITORIA-WIKI.md) | v1.0 | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-TRACKING](./PROTOCOLO-AUDITORIA-TRACKING.md) | v1.0 | Mensual | Vigente |
| [PROTOCOLO-AUDITORIA-FORMACION](./PROTOCOLO-AUDITORIA-FORMACION.md) | v1.0 | Mensual | Vigente |

---

## NIVEL 3 - Atomos

| Protocolo | Version | Para que | Estado |
|---|---|---|---|
| [PROTOCOLO-NUEVO-ADR](./PROTOCOLO-NUEVO-ADR.md) | v1.0 | Crear ADR nuevo | Vigente |
| [PROTOCOLO-NUEVA-ISLA](./PROTOCOLO-NUEVA-ISLA.md) | v1.0 | Entrar nuevo dominio al ecosistema | Vigente |
| [PROTOCOLO-NUEVO-APUNTE](./PROTOCOLO-NUEVO-APUNTE.md) | v1.0 | Crear apunte en FORMACION | Vigente |
| [PROTOCOLO-ENTRADA-TRACKING](./PROTOCOLO-ENTRADA-TRACKING.md) | v1.0 | Crear diario personal | Vigente |
| [PROTOCOLO-NUEVO-DIARIO-DEW](./PROTOCOLO-NUEVO-DIARIO-DEW.md) | v1.0 | Crear/completar diario tecnico | Vigente |
| [PROTOCOLO-NUEVO-PROTOCOLO](./PROTOCOLO-NUEVO-PROTOCOLO.md) | v1.0 | Crear protocolo nuevo | Vigente |

---

## Pendiente F15 (verificar existencia)

| Protocolo | Prioridad | Estado |
|---|---|---|
| PROTOCOLO-AUDITORIA-ECOSISTEMA | Alta | Verificar si existe |
| PROTOCOLO-NOMBRES v2.0 | Alta | Verificar si existe en protocolo/ |
| PROTOCOLO-BORRADO v1.0 | Alta | Verificar si existe en protocolo/ |
| PROTOCOLO-SECRETOS | Media | Pendiente issue #68 |
| PROTOCOLO-DOCUMENTACION-ECOSISTEMA | Media | Pendiente |

---

_Actualizado: 2026-07-16 15:22 CEST v3.0 - 4 niveles completos - atomos incluidos - F15 Perplexity MCP_
