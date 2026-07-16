---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-APERTURA-WIKI.md
tags: [protocolo, apertura, wiki, sesion]
status: vigente
version: 1.0
---

# PROTOCOLO-APERTURA-WIKI v1.0

> Zoom a yggdrasil-wiki al inicio de una sesion que lo afecta.
> Llamado desde PROTOCOLO-APERTURA-SESION (Fase 2).
> Tiempo estimado: 3-5 min.

---

## Que es WIKI

```
yggdrasil-wiki = MAPA CONCEPTUAL del ecosistema
Contiene: islas tematicas (cartas de cada dominio/repo/concepto)
NO contiene: codigo / datos personales / configuracion de infra / diarios
Regla: la WIKI describe y mapea. No opera ni almacena.
```

---

## Estructura esperada

```
yggdrasil-wiki/
+-- wiki/
|   +-- islas/           -> una carta .md por isla (PLANTILLA-ISLA-WIKI.md)
|   +-- islas/INDEX.md   -> indice de todas las islas
+-- README.md
+-- HOME.md
+-- INDEX.md
```

---

## Checklist de apertura

```
[ ] Leer wiki/islas/INDEX.md -> islas existentes y su estado
[ ] Verificar estructura de carpetas (arriba)
[ ] Si se va a crear isla nueva -> tener a mano PLANTILLA-ISLA-WIKI.md
    y ejecutar NORMA-ENTRADA-NUEVA-ISLA.md antes de crear
[ ] Si se va a modificar isla -> verificar que su ESTADO-ISLA-*.md en DEW esta al dia
```

---

## Reglas criticas WIKI

```
- Repo: yggdrasil-wiki (sin guion, sin WIKI---PERSONAL)
- Cada isla: frontmatter con tipo, nombre, repo_principal, estado, author, creado, actualizado, ruta, tags, status
- Estado de isla: estable / borrador / deprecado
- Ninguna isla duplica contenido operativo de DEW o TRACKING
- Ninguna isla sin su ESTADO-ISLA-*.md correspondiente en DEW
- Ningun secreto/token/IP
```

---

## Al cerrar

> Ejecutar PROTOCOLO-SINCRONIZACION-WIKI.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
