---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-APERTURA-TRACKING.md
tags: [protocolo, apertura, tracking, sesion]
status: vigente
version: 1.0
---

# PROTOCOLO-APERTURA-TRACKING v1.0

> Zoom a yggdrasil-tracking al inicio de una sesion que lo afecta.
> Llamado desde PROTOCOLO-APERTURA-SESION (Fase 2).
> Tiempo estimado: 2-3 min.

---

## Que es TRACKING

```
yggdrasil-tracking = VIDA PERSONAL de Alvaro
Contiene: diarios personales, metas, habitos, reflexiones, rituales
NO contiene: tecnico / comandos / configs / diarios de sesion (esos van en DEW)
Repo PRIVADO siempre.
```

---

## Estructura esperada

```
yggdrasil-tracking/
+-- diarios/
|   +-- YYYY/
|       +-- MM-mes/
|           +-- YYYY-MM-DD.md    -> un diario por dia
+-- metas/
|   +-- README.md                -> metas activas
+-- README.md
```

---

## Checklist de apertura

```
[ ] Ver diario del dia anterior -> contexto personal
[ ] Verificar estructura de carpetas (arriba)
[ ] Abrir diario del dia: diarios/YYYY/MM-mes/YYYY-MM-DD.md desde PLANTILLA-DIARIO-TRACKING.md
[ ] Si se trabajan metas -> abrir metas/README.md
```

---

## Reglas criticas TRACKING

```
- Repo: yggdrasil-tracking (sin guion final)
- Un diario por dia, ruta exacta diarios/YYYY/MM-mes/YYYY-MM-DD.md
- Nada tecnico aqui: ningun bash, ningun IP, ningun config
- Repo siempre privado
- Todo lo personal va aqui, no en DEW
```

---

## Al cerrar

> Ejecutar PROTOCOLO-SINCRONIZACION-TRACKING.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
