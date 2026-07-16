---
tipo: protocolo-repo
repo: yggdrasil-wiki
creado: 2026-07-16
actualizado: 2026-07-16
---

# Protocolo yggdrasil-wiki

## Contexto rápido

- Fuente de verdad del conocimiento del ecosistema
- Estructura: `wiki/islas/` (una isla = un área del ecosistema)
- **Nunca** borrar islas sin marcarlas deprecadas primero

## Antes de cualquier trabajo en este repo

1. Leer `wiki/00-mapa.md` — mapa completo del ecosistema
2. Leer `wiki/mapa-islas.md` — índice de islas
3. Leer `wiki/islas/INDEX.md` — estado de cada isla
4. Identificar la isla relevante para el trabajo

## Reglas de edición

- Cada isla tiene frontmatter con `status`, `actualizado`, `tags`
- Al actualizar una isla: actualizar campo `actualizado`
- Al deprecar una isla: cambiar `status: deprecado` + añadir redirect
- Nuevas islas: usar plantilla en `wiki/plantillas/isla-template.md`

## Estructura de isla

```
Área tematizada → isla en wiki/islas/
Cada isla tiene: estado, repos, servicios, issues relacionados, próximos pasos
```

## Issues activos

- Toda la documentación de islas se trackea en yggdrasil-dew
