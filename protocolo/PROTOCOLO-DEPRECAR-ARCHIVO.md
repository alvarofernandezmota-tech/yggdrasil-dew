---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-DEPRECAR-ARCHIVO.md
tags: [protocolo, deprecacion, archivo, atomo]
status: vigente
version: 1.0
---

# PROTOCOLO-DEPRECAR-ARCHIVO v1.0

> Cuando un archivo deja de ser valido pero no debe borrarse
> (historia, referencia, contexto), se depreca en lugar de eliminarse.
> Diferencia con BORRADO: el archivo permanece, solo cambia su estado.
> Tiempo estimado: 2-3 min por archivo.

---

## Cuando deprecar en lugar de borrar

```
DEPRECAR si:
  - El archivo es historico y da contexto de por que se decidio algo
  - Es un ADR que queda obsoleto pero explica una decision pasada
  - Es un protocolo que fue sustituido por otro mas completo
  - Es una isla que dejo de existir pero fue importante

BORRAR (PROTOCOLO-BORRADO) si:
  - El archivo no tiene valor historico
  - Es un duplicado exacto de otro
  - Es un borrador que nunca llego a completarse
  - Es basura tecnica sin referencias
```

---

## Pasos

```
[ ] 1. Cambiar frontmatter:
       status: vigente -> status: deprecado

[ ] 2. Anadir bloque al inicio del contenido (despues del frontmatter):
       > DEPRECADO: YYYY-MM-DD
       > Razon: <por que se depreca>
       > Sustituido por: <archivo nuevo si aplica>

[ ] 3. Si tiene entrada en INDEX -> marcar como 'Deprecado' en la tabla

[ ] 4. Si otros archivos lo referencian como activo -> actualizar esas referencias

[ ] 5. Commit:
       'chore: deprecar <nombre-archivo> - <razon breve>'
```

---

## Relacionado

- PROTOCOLO-BORRADO.md
- protocolo/INDEX.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
