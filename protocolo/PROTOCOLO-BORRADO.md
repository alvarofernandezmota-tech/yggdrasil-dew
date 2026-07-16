---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-BORRADO.md
tags: [protocolo, borrado, eliminacion, canon]
status: vigente
version: 1.0
---

# PROTOCOLO-BORRADO v1.0

> Ejecutar ANTES de borrar cualquier archivo del ecosistema.
> Borrar sin protocolo rompe referencias silenciosamente.
> La regla: si algo esta referenciado en otro sitio, no se borra sin propagar.

---

## Antes de borrar: 3 preguntas

```
1. Quien referencia este archivo?
   (buscar el nombre en todos los repos del ecosistema)
2. El contenido esta en otro lugar o se pierde para siempre?
3. Es un borrado definitivo o es una deprecacion?
   - Definitivo: el archivo deja de tener valor
   - Deprecacion: el archivo sigue siendo historico, solo se marca
```

---

## Borrado definitivo

```
[ ] 1. Buscar todas las referencias al archivo en el ecosistema
[ ] 2. Por cada referencia:
       - Si es un link activo -> actualizar o eliminar el link
       - Si es historico -> anadir nota '> Nota historica: este archivo fue eliminado'
[ ] 3. Eliminar el archivo
[ ] 4. Si era un protocolo -> actualizar protocolo/INDEX.md (marcar como eliminado)
[ ] 5. Si era un ADR -> NO borrar ADRs (son historia permanente, marcar como deprecado)
[ ] 6. Actualizar MASTER-PENDIENTES si estaba referenciado
[ ] 7. Commit: 'chore: borrar <nombre-archivo> - <razon breve>'
```

---

## Deprecacion (alternativa al borrado)

```
[ ] 1. Cambiar frontmatter: status: vigente -> status: deprecado
[ ] 2. Anadir al inicio del archivo:
       > DEPRECADO: YYYY-MM-DD. Sustituido por / Razon: <texto>
[ ] 3. Si tiene entrada en INDEX -> actualizar estado a 'Deprecado'
[ ] 4. Commit: 'chore: deprecar <nombre-archivo>'
```

---

## Borrado masivo (>5 archivos)

```
[ ] Crear issue en DEW documentando QUE se va a borrar y POR QUE
[ ] Ejecutar los pasos de borrado unitario para cada archivo
[ ] Un solo commit con todos los borrados y el issue referenciado
[ ] Cerrar el issue al terminar
```

> El borrado masivo de 2026-07-14 (22 protocolos) fue la razon de crear este protocolo.

---

## Relacionado

- PROTOCOLO-NOMBRES.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (TIPO A)

---

_Actualizado: 2026-07-16 v1.0 F15 Perplexity MCP_
