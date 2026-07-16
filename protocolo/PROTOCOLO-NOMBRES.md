---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NOMBRES.md
tags: [protocolo, nombres, naming, canon]
status: vigente
version: 2.0
---

# PROTOCOLO-NOMBRES v2.0

> Canon de nombrado del ecosistema Yggdrasil.
> Ejecutar ANTES de crear cualquier archivo, repo o carpeta.
> Ejecutar ANTES de renombrar cualquier elemento existente.
> Un nombre incorrecto rompe referencias y genera deuda tecnica.

---

## Nombres canonicos de repos

```
yggdrasil-dew        CORRECTO
yggdrasil-wiki       CORRECTO
yggdrasil-tracking   CORRECTO
yggdrasil-formacion  CORRECTO
yggdrasil-scripts    CORRECTO
madre-config         CORRECTO
ollama-stack         CORRECTO
THDORA               CORRECTO

yggdrasil-dew-       INCORRECTO (guion final)
yggdrasil-formacion- INCORRECTO (guion final)
formacion-tech       INCORRECTO (nombre antiguo eliminado)
WIKI---PERSONAL      INCORRECTO (nombre antiguo eliminado)
```

---

## Nombres de archivos por tipo

```
DIARIO DEW:        docs/diarios/YYYY-MM-DD.md
                   - sin sufijos (-sesion2, -dew, -tarde)
                   - un archivo por dia siempre

DIARIO TRACKING:   diarios/YYYY/MM-mes/YYYY-MM-DD.md
                   - MM-mes: 01-enero, 02-febrero... 07-julio

ADR:               docs/adr/ADR-NNN-titulo-en-minusculas-con-guiones.md
                   - NNN: tres digitos (001, 002... 013)

PROTOCOLO:         protocolo/PROTOCOLO-NOMBRE-EN-MAYUSCULAS.md
                   - palabras separadas por guion
                   - todo en mayusculas despues de PROTOCOLO-

PLANTILLA:         docs/canon/PLANTILLA-NOMBRE-EN-MAYUSCULAS.md

ISLA WIKI:         wiki/islas/<nombre-isla-en-minusculas>.md
                   - sin espacios, sin mayusculas, guiones si necesario

ESTADO-ISLA:       docs/islas/ESTADO-ISLA-<NOMBRE-EN-MAYUSCULAS>.md

APUNTE:            apuntes/<area>/<tema-en-minusculas>.md
```

---

## Al renombrar un archivo existente

```
[ ] 1. Identificar TODOS los archivos que lo referencian
       (buscar el nombre actual en todos los repos afectados)
[ ] 2. Crear archivo nuevo con nombre correcto
[ ] 3. Actualizar todas las referencias
[ ] 4. Borrar archivo antiguo (PROTOCOLO-BORRADO.md)
[ ] 5. Si el archivo tenia campo 'ruta' en frontmatter -> actualizar
[ ] 6. Ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA TIPO A
[ ] 7. Commit: 'refactor: renombrar <nombre-antiguo> -> <nombre-nuevo>'
```

---

## Al renombrar un repo

```
[ ] 1. Verificar impacto: quien referencia el repo (islas WIKI, ESTADO-ISLA, ADRs)
[ ] 2. Cambiar nombre en GitHub
[ ] 3. Actualizar todas las referencias en todos los repos del ecosistema
[ ] 4. Actualizar ESTADO-SISTEMA.md
[ ] 5. Actualizar islas WIKI afectadas
[ ] 6. Actualizar MAPA-ISLAS-DEPENDENCIAS
[ ] 7. Crear ADR si el renombrado es una decision arquitectural
[ ] 8. Ejecutar PROTOCOLO-ACTUALIZACION-ECOSISTEMA TIPO A
```

---

## Relacionado

- PROTOCOLO-BORRADO.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO A)
- NORMAS.md

---

_Actualizado: 2026-07-16 v2.0 F15 Perplexity MCP_
