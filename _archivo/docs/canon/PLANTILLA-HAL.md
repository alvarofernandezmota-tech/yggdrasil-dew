---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/PLANTILLA-HAL.md
tags: [canon, plantilla, hallazgo, seguridad]
status: activo
---

# Plantilla — Hallazgo de Seguridad (HAL)

> Copiar este archivo como `yggdrasil-secops/hallazgos/YYYY-MM-DD-descripcion.md`.
> El ID HAL-XXX se asigna consultando `INDICE-HALLAZGOS.md` en Dew y cogiendo el siguiente número libre.
> **Nunca asignar un ID sin consultar el índice central primero.**

---

```markdown
---
id: HAL-XXX
tipo: hallazgo
titulo: Descripcion corta del hallazgo
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
ruta: hallazgos/YYYY-MM-DD-descripcion.md
tags: [hallazgo, seguridad, <categoria>]
status: abierto
severidad: critica | alta | media | baja
componente: <componente afectado>
---

# HAL-XXX — Titulo del hallazgo

## Descripcion

Que se encontro, cuando, como.

## Impacto

Que puede pasar si no se resuelve.

## Evidencia

```bash
# Comando o log que demuestra el hallazgo
```

## Mitigacion

Pasos para resolverlo.

## Estado

- [ ] Investigado
- [ ] Mitigado
- [ ] Cerrado

## Notas

Cualquier contexto adicional.

---
_Creado: YYYY-MM-DD | Fase: N/A | Perplexity MCP o manual_
```

---

## Proceso completo para abrir un HAL

1. Ir a `yggdrasil-dew/docs/hallazgos/INDICE-HALLAZGOS.md`
2. Ver el último ID usado (ej. HAL-006)
3. El nuevo es HAL-007
4. Crear `yggdrasil-secops/hallazgos/YYYY-MM-DD-descripcion.md` con `id: HAL-007`
5. Añadir la fila en `INDICE-HALLAZGOS.md` de Dew con el nuevo ID
6. Hacer commit en ambos repos

**Un hallazgo = un ID = un archivo = una fila en el índice.**

---

_Creado: 2026-07-06 · Fase 6 · Referencia: `INDICE-HALLAZGOS.md`_
