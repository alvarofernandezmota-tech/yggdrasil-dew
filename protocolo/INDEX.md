---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16 16:24 CEST
ruta: protocolo/INDEX.md
tags: [indice, protocolos, canon]
status: vigente
version: 6.0
---

# INDEX de Protocolos — v6.0

> Indice canon de todos los protocolos vigentes del ecosistema Yggdrasil.
> Total: **45 protocolos** + INDEX
> Ultima actualizacion: 2026-07-16 16:24 CEST · F17 cerrada

---

## NIVEL 1 — Protocolos globales (16)

| Protocolo | Descripcion | Version |
|---|---|---|
| [APERTURA-SESION](PROTOCOLO-APERTURA-SESION.md) | Inicio de cualquier sesion | v2.0 |
| [CIERRE-SESION](PROTOCOLO-CIERRE-SESION.md) | Cierre de cualquier sesion | v2.0 |
| [CONTEXTO-ECOSISTEMA](PROTOCOLO-CONTEXTO-ECOSISTEMA.md) | Contexto global del ecosistema | v1.0 |
| [ACTUALIZACION-ECOSISTEMA](PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md) | Actualizar estado global | v1.0 |
| [SINCRONIZACION-ECOSISTEMA](PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md) | Sincronizar todos los repos | v1.0 |
| [AUDITORIA-ECOSISTEMA](PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | Auditoria global del ecosistema | v1.0 |
| [AUDITORIA-MADRE](PROTOCOLO-AUDITORIA-MADRE.md) | Auditoria SSH + Docker de Madre | v1.0 🆕 |
| [RITUAL-SEMANAL](PROTOCOLO-RITUAL-SEMANAL.md) | Revision semanal dominical | v1.0 |
| [NOMBRES](PROTOCOLO-NOMBRES.md) | Convencion de nombres | v2.0 |
| [BORRADO](PROTOCOLO-BORRADO.md) | Borrado seguro de archivos | v1.0 |
| [DEPRECAR-ARCHIVO](PROTOCOLO-DEPRECAR-ARCHIVO.md) | Deprecar sin borrar | v1.0 |
| [SECRETOS](PROTOCOLO-SECRETOS.md) | Gestion de secretos y tokens | v1.0 |
| [DOCUMENTACION-ECOSISTEMA](PROTOCOLO-DOCUMENTACION-ECOSISTEMA.md) | Estandar de documentacion | v1.0 |
| [EMERGENCIA](PROTOCOLO-EMERGENCIA.md) | Protocolo ante incidentes criticos | v1.0 |
| [RENOMBRAR-REPO](PROTOCOLO-RENOMBRAR-REPO.md) | Renombrar repos con trazabilidad | v1.0 |

---

## NIVEL 2 — Por repo (20)

### DEW (5)
| Protocolo | Descripcion |
|---|---|
| [APERTURA-DEW](PROTOCOLO-APERTURA-DEW.md) | Apertura sesion DEW |
| [CONTEXTO-DEW](PROTOCOLO-CONTEXTO-DEW.md) | Contexto repo DEW |
| [SINCRONIZACION-DEW](PROTOCOLO-SINCRONIZACION-DEW.md) | Sincronizar DEW |
| [AUDITORIA-DEW](PROTOCOLO-AUDITORIA-DEW.md) | Auditoria repo DEW |
| [ACTUALIZACION-DEW](PROTOCOLO-ACTUALIZACION-DEW.md) | Actualizar DEW |

### WIKI (5)
| Protocolo | Descripcion |
|---|---|
| [APERTURA-WIKI](PROTOCOLO-APERTURA-WIKI.md) | Apertura sesion WIKI |
| [CONTEXTO-WIKI](PROTOCOLO-CONTEXTO-WIKI.md) | Contexto repo WIKI |
| [SINCRONIZACION-WIKI](PROTOCOLO-SINCRONIZACION-WIKI.md) | Sincronizar WIKI |
| [AUDITORIA-WIKI](PROTOCOLO-AUDITORIA-WIKI.md) | Auditoria repo WIKI |
| [ACTUALIZACION-WIKI](PROTOCOLO-ACTUALIZACION-WIKI.md) | Actualizar WIKI |

### TRACKING (5)
| Protocolo | Descripcion |
|---|---|
| [APERTURA-TRACKING](PROTOCOLO-APERTURA-TRACKING.md) | Apertura sesion TRACKING |
| [CONTEXTO-TRACKING](PROTOCOLO-CONTEXTO-TRACKING.md) | Contexto repo TRACKING |
| [SINCRONIZACION-TRACKING](PROTOCOLO-SINCRONIZACION-TRACKING.md) | Sincronizar TRACKING |
| [AUDITORIA-TRACKING](PROTOCOLO-AUDITORIA-TRACKING.md) | Auditoria repo TRACKING |
| [ACTUALIZACION-TRACKING](PROTOCOLO-ACTUALIZACION-TRACKING.md) | Actualizar TRACKING |

### FORMACION (5)
| Protocolo | Descripcion |
|---|---|
| [APERTURA-FORMACION](PROTOCOLO-APERTURA-FORMACION.md) | Apertura sesion FORMACION |
| [CONTEXTO-FORMACION](PROTOCOLO-CONTEXTO-FORMACION.md) | Contexto repo FORMACION |
| [SINCRONIZACION-FORMACION](PROTOCOLO-SINCRONIZACION-FORMACION.md) | Sincronizar FORMACION |
| [AUDITORIA-FORMACION](PROTOCOLO-AUDITORIA-FORMACION.md) | Auditoria repo FORMACION |
| [ACTUALIZACION-FORMACION](PROTOCOLO-ACTUALIZACION-FORMACION.md) | Actualizar FORMACION |

---

## NIVEL 3 — Atomos (10)

| Protocolo | Descripcion | Version |
|---|---|---|
| [NUEVO-ADR](PROTOCOLO-NUEVO-ADR.md) | Crear nuevo ADR | v1.0 |
| [NUEVA-ISLA](PROTOCOLO-NUEVA-ISLA.md) | Crear nueva isla en WIKI | v1.0 |
| [NUEVO-REPO](PROTOCOLO-NUEVO-REPO.md) | Crear nuevo repo | v1.0 |
| [NUEVO-APUNTE](PROTOCOLO-NUEVO-APUNTE.md) | Crear apunte en FORMACION | v1.0 |
| [NUEVO-SCRIPT](PROTOCOLO-NUEVO-SCRIPT.md) | Crear script en yggdrasil-scripts | v1.0 |
| [NUEVO-DIARIO-DEW](PROTOCOLO-NUEVO-DIARIO-DEW.md) | Crear diario tecnico en DEW | v1.0 |
| [NUEVO-DIARIO-TRACKING](PROTOCOLO-NUEVO-DIARIO-TRACKING.md) | Crear entrada diario personal | v1.0 🆕 |
| [NUEVO-PROTOCOLO](PROTOCOLO-NUEVO-PROTOCOLO.md) | Crear nuevo protocolo | v1.0 |
| [ENTRADA-TRACKING](PROTOCOLO-ENTRADA-TRACKING.md) | Entrada rapida en TRACKING | v1.0 |
| [DEPRECAR-ARCHIVO](PROTOCOLO-DEPRECAR-ARCHIVO.md) | Deprecar archivo con trazabilidad | v1.0 |

---

## Regla canon: DEW vs TRACKING

> - `yggdrasil-dew/docs/diarios/` → diarios de **trabajo tecnico**
> - `yggdrasil-tracking/diarios/` → diarios **personales**
> - Ningun agente viola esta separacion. (ADR-011)

---

_Actualizado: 2026-07-16 16:24 CEST · v6.0 · 45 protocolos · F17 CERRADA · Perplexity MCP_
