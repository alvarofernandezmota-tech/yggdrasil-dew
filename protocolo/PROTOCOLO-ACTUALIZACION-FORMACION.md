---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ACTUALIZACION-FORMACION.md
tags: [protocolo, actualizacion, formacion, repo]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-FORMACION v1.0

> Ejecutar cuando un cambio estructural afecta a yggdrasil-formacion.
> Version especifica de PROTOCOLO-ACTUALIZACION-ECOSISTEMA para FORMACION.
> Tiempo estimado: 5-10 min.

---

## Tipos de cambio en FORMACION

```
TIPO A — Nueva area de aprendizaje
  [ ] Crear carpeta apuntes/<nueva-area>/
  [ ] Actualizar README.md de FORMACION con la nueva area
  [ ] Actualizar isla WIKI de formacion si existe

TIPO B — Nuevo apunte
  [ ] Ejecutar PROTOCOLO-NUEVO-APUNTE.md completo
  [ ] Verificar seccion 'Salida al ecosistema' completada

TIPO C — Apunte que genera cambio en infra
  [ ] Crear issue en DEW con descripcion del cambio detectado
  [ ] Si es decision arquitectural -> PROTOCOLO-NUEVO-ADR en DEW
  [ ] El apunte en FORMACION solo documenta el aprendizaje,
      la decision y el cambio van en DEW

TIPO D — Cambio de estructura de carpetas
  [ ] Verificar que el nuevo nombre es canonico (PROTOCOLO-NOMBRES)
  [ ] Actualizar README.md de FORMACION
  [ ] Si hay apuntes con campo 'ruta' -> actualizar frontmatter
```

---

## Checklist post-cambio FORMACION

```
[ ] README.md de FORMACION actualizado
[ ] Ningun secreto/token/IP real en ningun apunte nuevo
[ ] Campo 'ruta' correcto en frontmatter de archivos tocados
[ ] Si el aprendizaje genera algo para DEW -> issue o ADR creado
[ ] Commit con mensaje descriptivo
```

---

## Relacionado

- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (global)
- PROTOCOLO-NUEVO-APUNTE.md
- PROTOCOLO-NUEVO-ADR.md
- PROTOCOLO-SECRETOS.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
