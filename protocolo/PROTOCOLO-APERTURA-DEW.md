---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-APERTURA-DEW.md
tags: [protocolo, apertura, dew, sesion]
status: vigente
version: 1.0
---

# PROTOCOLO-APERTURA-DEW v1.0

> Zoom a yggdrasil-dew al inicio de una sesion que lo afecta.
> Llamado desde PROTOCOLO-APERTURA-SESION (Fase 2).
> Tiempo estimado: 3-5 min.

---

## Que es DEW

```
yggdrasil-dew = CEREBRO TECNICO del ecosistema
Contiene: canon, ADRs, protocolos, plantillas, diarios de sesion, islas DEW
NO contiene: vida personal (eso es TRACKING) / apuntes de formacion (eso es FORMACION)
```

---

## Estructura esperada

```
yggdrasil-dew/
+-- docs/
|   +-- adr/             -> ADRs (ADR-001 a ADR-013+)
|   +-- canon/           -> ESTADO-SISTEMA, NORMAS, plantillas, protocolo inicio legacy
|   +-- diarios/         -> un archivo por dia YYYY-MM-DD.md (sin sufijos)
|   +-- islas/           -> ESTADO-ISLA-*.md + MAPA-ISLAS-DEPENDENCIAS
+-- protocolo/           -> todos los protocolos vigentes + INDEX.md
+-- MASTER-PENDIENTES.md -> fuente de verdad de fases y tareas
+-- NORMAS.md            -> reglas del ecosistema
+-- ECOSYSTEM-ARCHITECTURE.md
+-- README.md
```

---

## Checklist de apertura

```
[ ] Leer MASTER-PENDIENTES.md -> que fase se trabaja hoy
[ ] Leer docs/canon/ESTADO-SISTEMA.md -> estado operativo actual
[ ] Leer ultimo diario en docs/diarios/ -> contexto de sesion anterior
[ ] Verificar que la estructura de carpetas es la esperada (arriba)
[ ] Si se van a crear ADRs -> tener a mano docs/adr/INDEX-ADR.md
[ ] Si se van a crear protocolos -> tener a mano protocolo/INDEX.md
[ ] Abrir diario del dia: docs/diarios/YYYY-MM-DD.md desde PLANTILLA-DIARIO-DEW.md
```

---

## Reglas criticas DEW

```
- Un diario por dia, nombre exacto YYYY-MM-DD.md, sin sufijos
- Todo ADR en docs/adr/ con nombre ADR-NNN-titulo-en-minusculas.md
- Todo protocolo en protocolo/ con nombre PROTOCOLO-NOMBRE-EN-MAYUSCULAS.md
- Ningun secreto/token/IP en ningun archivo
- Todo archivo nuevo desde su PLANTILLA-*.md
- Repo: yggdrasil-dew (sin guion final)
```

---

## Al cerrar

> Ejecutar PROTOCOLO-SINCRONIZACION-DEW.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
