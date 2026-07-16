---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16 15:25 CEST
ruta: protocolo/INDEX.md
tags: [protocolo, indice, canon]
status: vigente
version: 4.0
---

# Indice de Protocolos - Ecosistema Yggdrasil

> Inventario completo de todos los protocolos vigentes.
> Actualizar con PROTOCOLO-NUEVO-PROTOCOLO cada vez que se crea uno nuevo.

---

## Arquitectura del sistema de protocolos

```
NIVEL 0 — ALVARO
  instruccion / tarea / decision
        |
NIVEL 1 — GLOBALES (orquestan todo)
  APERTURA-SESION
    -> CONTEXTO-ECOSISTEMA     (sesion global)
    -> CONTEXTO-<REPO>         (sesion en repo concreto)
  [trabajo con atomos]
    -> ACTUALIZACION-ECOSISTEMA (cambio estructural)
    -> NOMBRES                  (al nombrar/renombrar)
    -> BORRADO                  (al eliminar)
    -> DEPRECAR-ARCHIVO         (al deprecar)
    -> SECRETOS                 (revision seguridad)
  CIERRE-SESION
    -> SINCRONIZACION-ECOSISTEMA
    -> SINCRONIZACION-<REPO> (repos tocados)
  [periodico]
    -> AUDITORIA-ECOSISTEMA
    -> AUDITORIA-<REPO>
        |
NIVEL 2 — POR REPO x4 (DEW / WIKI / TRACKING / FORMACION)
  APERTURA-<REPO>         al abrir sesion en ese repo
  CONTEXTO-<REPO>         zoom al repo
  SINCRONIZACION-<REPO>   verificar al cerrar
  AUDITORIA-<REPO>        revision profunda mensual
        |
NIVEL 3 — ATOMOS (protocolo para cada tipo de contenido)
  NUEVO-ADR               decision arquitectural
  NUEVA-ISLA              nuevo dominio en el ecosistema
  NUEVO-REPO              nuevo repo en el ecosistema
  NUEVO-APUNTE            apunte en FORMACION
  NUEVO-SCRIPT            script de automatizacion
  ENTRADA-TRACKING        diario personal
  NUEVO-DIARIO-DEW        diario tecnico de sesion
  NUEVO-PROTOCOLO         protocolo nuevo (este ciclo)
        |
NIVEL 4 — PLANTILLAS (docs/canon/PLANTILLA-*.md)
  PLANTILLA-DIARIO-DEW
  PLANTILLA-DIARIO-TRACKING
  PLANTILLA-ISLA-WIKI
  PLANTILLA-APUNTE-FORMACION
  PLANTILLA-ADR
  PLANTILLA-PROTOCOLO
  PLANTILLA-ESTADO-ISLA
```

---

## NIVEL 1 — Sesion (globales)

| Protocolo | v | Cuando | Estado |
|---|---|---|---|
| [APERTURA-SESION](./PROTOCOLO-APERTURA-SESION.md) | 2.0 | Inicio sesion | ✅ Vigente |
| [CIERRE-SESION](./PROTOCOLO-CIERRE-SESION.md) | 2.0 | Fin sesion | ✅ Vigente |
| [CONTEXTO-ECOSISTEMA](./PROTOCOLO-CONTEXTO-ECOSISTEMA.md) | 1.0 | Sesion global | ✅ Vigente |

---

## NIVEL 1 — Cambio y mantenimiento (globales)

| Protocolo | v | Cuando | Estado |
|---|---|---|---|
| [ACTUALIZACION-ECOSISTEMA](./PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md) | 1.0 | Cambio estructural | ✅ Vigente |
| [SINCRONIZACION-ECOSISTEMA](./PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md) | 1.0 | Cierre / mensual | ✅ Vigente |
| [AUDITORIA-ECOSISTEMA](./PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | 1.0 | Mensual | ✅ Vigente |
| [NOMBRES](./PROTOCOLO-NOMBRES.md) | 2.0 | Nombrar / renombrar | ✅ Vigente |
| [BORRADO](./PROTOCOLO-BORRADO.md) | 1.0 | Borrar archivos | ✅ Vigente |
| [DEPRECAR-ARCHIVO](./PROTOCOLO-DEPRECAR-ARCHIVO.md) | 1.0 | Deprecar archivos | ✅ Vigente |
| [SECRETOS](./PROTOCOLO-SECRETOS.md) | 1.0 | Seguridad / escaneo | ✅ Vigente |

---

## NIVEL 2 — Apertura por repo

| Protocolo | v | Repo | Estado |
|---|---|---|---|
| [APERTURA-DEW](./PROTOCOLO-APERTURA-DEW.md) | 1.0 | yggdrasil-dew | ✅ Vigente |
| [APERTURA-WIKI](./PROTOCOLO-APERTURA-WIKI.md) | 1.0 | yggdrasil-wiki | ✅ Vigente |
| [APERTURA-TRACKING](./PROTOCOLO-APERTURA-TRACKING.md) | 1.0 | yggdrasil-tracking | ✅ Vigente |
| [APERTURA-FORMACION](./PROTOCOLO-APERTURA-FORMACION.md) | 1.0 | yggdrasil-formacion | ✅ Vigente |

---

## NIVEL 2 — Contexto por repo

| Protocolo | v | Repo | Estado |
|---|---|---|---|
| [CONTEXTO-DEW](./PROTOCOLO-CONTEXTO-DEW.md) | 1.0 | yggdrasil-dew | ✅ Vigente |
| [CONTEXTO-WIKI](./PROTOCOLO-CONTEXTO-WIKI.md) | 1.0 | yggdrasil-wiki | ✅ Vigente |
| [CONTEXTO-TRACKING](./PROTOCOLO-CONTEXTO-TRACKING.md) | 1.0 | yggdrasil-tracking | ✅ Vigente |
| [CONTEXTO-FORMACION](./PROTOCOLO-CONTEXTO-FORMACION.md) | 1.0 | yggdrasil-formacion | ✅ Vigente |

---

## NIVEL 2 — Sincronizacion por repo

| Protocolo | v | Cuando | Estado |
|---|---|---|---|
| [SINCRONIZACION-DEW](./PROTOCOLO-SINCRONIZACION-DEW.md) | 1.0 | Cierre sesion DEW | ✅ Vigente |
| [SINCRONIZACION-WIKI](./PROTOCOLO-SINCRONIZACION-WIKI.md) | 1.0 | Cierre sesion WIKI | ✅ Vigente |
| [SINCRONIZACION-TRACKING](./PROTOCOLO-SINCRONIZACION-TRACKING.md) | 1.0 | Cierre sesion TRACKING | ✅ Vigente |
| [SINCRONIZACION-FORMACION](./PROTOCOLO-SINCRONIZACION-FORMACION.md) | 1.0 | Cierre sesion FORMACION | ✅ Vigente |

---

## NIVEL 2 — Auditoria por repo

| Protocolo | v | Frecuencia | Estado |
|---|---|---|---|
| [AUDITORIA-DEW](./PROTOCOLO-AUDITORIA-DEW.md) | 1.0 | Mensual | ✅ Vigente |
| [AUDITORIA-WIKI](./PROTOCOLO-AUDITORIA-WIKI.md) | 1.0 | Mensual | ✅ Vigente |
| [AUDITORIA-TRACKING](./PROTOCOLO-AUDITORIA-TRACKING.md) | 1.0 | Mensual | ✅ Vigente |
| [AUDITORIA-FORMACION](./PROTOCOLO-AUDITORIA-FORMACION.md) | 1.0 | Mensual | ✅ Vigente |

---

## NIVEL 3 — Atomos

| Protocolo | v | Para que | Estado |
|---|---|---|---|
| [NUEVO-ADR](./PROTOCOLO-NUEVO-ADR.md) | 1.0 | Decision arquitectural | ✅ Vigente |
| [NUEVA-ISLA](./PROTOCOLO-NUEVA-ISLA.md) | 1.0 | Nuevo dominio ecosistema | ✅ Vigente |
| [NUEVO-REPO](./PROTOCOLO-NUEVO-REPO.md) | 1.0 | Nuevo repo ecosistema | ✅ Vigente |
| [NUEVO-APUNTE](./PROTOCOLO-NUEVO-APUNTE.md) | 1.0 | Apunte en FORMACION | ✅ Vigente |
| [NUEVO-SCRIPT](./PROTOCOLO-NUEVO-SCRIPT.md) | 1.0 | Script automatizacion | ✅ Vigente |
| [ENTRADA-TRACKING](./PROTOCOLO-ENTRADA-TRACKING.md) | 1.0 | Diario personal | ✅ Vigente |
| [NUEVO-DIARIO-DEW](./PROTOCOLO-NUEVO-DIARIO-DEW.md) | 1.0 | Diario tecnico sesion | ✅ Vigente |
| [NUEVO-PROTOCOLO](./PROTOCOLO-NUEVO-PROTOCOLO.md) | 1.0 | Protocolo nuevo | ✅ Vigente |
| [DEPRECAR-ARCHIVO](./PROTOCOLO-DEPRECAR-ARCHIVO.md) | 1.0 | Deprecar sin borrar | ✅ Vigente |

---

## NIVEL 4 — Plantillas (docs/canon/)

| Plantilla | Para que | Estado |
|---|---|---|
| PLANTILLA-DIARIO-DEW.md | Diarios tecnicos | ✅ Vigente |
| PLANTILLA-DIARIO-TRACKING.md | Diarios personales | ✅ Vigente |
| PLANTILLA-ISLA-WIKI.md | Islas en WIKI | ✅ Vigente |
| PLANTILLA-APUNTE-FORMACION.md | Apuntes en FORMACION | ✅ Vigente |
| PLANTILLA-ADR.md | ADRs | ✅ Vigente |
| PLANTILLA-PROTOCOLO.md | Protocolos nuevos | ✅ Vigente |
| PLANTILLA-ESTADO-ISLA.md | ESTADO-ISLA en DEW | ✅ Vigente |

---

_Actualizado: 2026-07-16 15:25 CEST v4.0 - sistema completo 4 niveles - F15 CERRADA - Perplexity MCP_
