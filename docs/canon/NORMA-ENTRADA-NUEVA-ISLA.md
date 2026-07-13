---
title: Norma de Entrada de Nueva Isla
tipo: norma
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/NORMA-ENTRADA-NUEVA-ISLA.md
tags: [norma, isla, checklist, onboarding]
status: vigente
---

# 📋 Norma de Entrada de Nueva Isla — Ecosistema Yggdrasil

> Checklist obligatorio cada vez que se crea un nuevo repo o se eleva una isla al ecosistema.
> Sin completar este checklist, la isla NO está integrada en el ecosistema.

---

## Checklist mínimo de entrada

### 1. Repo
- [ ] Repo creado en GitHub bajo `alvarofernandezmota-tech`
- [ ] Visibilidad correcta definida (privado si contiene datos personales o secretos)
- [ ] README.md mínimo creado con: nombre, propósito, rol en el ecosistema y enlace a dew

### 2. Documentación en DEW
- [ ] `docs/islas/ESTADO-ISLA-[NOMBRE].md` creado con estado inicial
- [ ] `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` actualizado con la nueva fila
- [ ] Dependencias con otras islas documentadas en la tabla de dependencias del mapa

### 3. Canon
- [ ] Si la isla tiene ADR propio → crear en `docs/adr/` e indexar en `docs/adr/INDEX.md`
- [ ] Si la isla reemplaza o depreca otra → crear `ESTADO-ISLA-[NOMBRE]-LEGACY.md` con nota de deprecación

### 4. Wiki
- [ ] Carta de isla creada en `yggdrasil-wiki` bajo `wiki/islas/[nombre].md`
- [ ] Indexada en `wiki/islas/INDEX.md`

### 5. Verificación final
- [ ] `PLAN-MAESTRO-2026-07.md` o `MASTER-PENDIENTES.md` actualizado si hay trabajo pendiente en la isla
- [ ] Issue abierto en dew si hay auditoría pendiente

---

## Plantilla README mínimo para nueva isla

```markdown
# [Nombre Isla]

> Parte del ecosistema [Yggdrasil](https://github.com/alvarofernandezmota-tech/yggdrasil-dew).

## Propósito
[Una frase: qué hace este repo]

## Rol en el ecosistema
[Cómo encaja con las demás islas]

## Documentación
- Estado de la isla: [dew/docs/islas/ESTADO-ISLA-[NOMBRE].md](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/blob/main/docs/islas/ESTADO-ISLA-[NOMBRE].md)
- Plan maestro: [PLAN-MAESTRO-2026-07.md](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/blob/main/PLAN-MAESTRO-2026-07.md)
```

---

## Regla de oro

> Una isla sin ESTADO-ISLA en DEW y sin fila en el MAPA **no existe** para el ecosistema.

---

_Creado: 2026-07-13 · Norma formal Bloque 4 · Perplexity MCP_
