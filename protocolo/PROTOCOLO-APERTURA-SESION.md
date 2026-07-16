---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-APERTURA-SESION.md
tags: [protocolo, apertura, sesion, global]
status: vigente
version: 2.0
---

# PROTOCOLO-APERTURA-SESION v2.0

> Ejecutar SIEMPRE al inicio de cada sesion.
> Sustituye a: docs/canon/PROTOCOLO-INICIO-SESION.md v1.0 (legacy).
> Tiempo estimado: 5-8 min.

---

## Fase 1: Cargar estado del ecosistema

```
[ ] Leer docs/canon/ESTADO-SISTEMA.md
[ ] Leer MASTER-PENDIENTES.md
[ ] Leer ultimo diario en docs/diarios/
```

---

## Fase 2: Identificar repos afectados y cargar su contexto

```
[ ] Sesion afecta a TODO el ecosistema -> ejecutar PROTOCOLO-CONTEXTO-ECOSISTEMA.md
[ ] Sesion afecta solo a DEW           -> ejecutar PROTOCOLO-CONTEXTO-DEW.md
[ ] Sesion afecta solo a WIKI          -> ejecutar PROTOCOLO-CONTEXTO-WIKI.md
[ ] Sesion afecta solo a TRACKING      -> ejecutar PROTOCOLO-CONTEXTO-TRACKING.md
[ ] Sesion afecta solo a FORMACION     -> ejecutar PROTOCOLO-CONTEXTO-FORMACION.md
```

> Se pueden combinar: sesion en DEW + WIKI = ejecutar ambos contextos.

---

## Fase 3: Verificar reglas criticas

```
[ ] Nombres canonicos vigentes:
    - yggdrasil-dew / yggdrasil-wiki / yggdrasil-tracking / yggdrasil-formacion
    - sin guion final / sin 'formacion-tech' / sin 'WIKI---PERSONAL'
[ ] Separacion: tecnicos en DEW/FORMACION / personales en TRACKING / mapa en WIKI
[ ] Ningun secreto/token/IP en ningun .md
[ ] Ningun archivo nuevo sin plantilla canonica de docs/canon/
```

---

## Fase 4: Confirmar objetivo

```
[ ] Identificar que fase del MASTER-PENDIENTES se trabaja hoy
[ ] Verificar bloqueantes criticos
[ ] Abrir diario DEW del dia desde PLANTILLA-DIARIO-DEW.md
```

---

## Al cerrar

> Ejecutar PROTOCOLO-CIERRE-SESION.md

---

_Actualizado: 2026-07-16 v2.0 F15 Perplexity MCP_
