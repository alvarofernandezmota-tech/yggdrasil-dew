---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-AUDITORIA-FORMACION.md
tags: [protocolo, auditoria, formacion, aprendizaje, consistencia]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-FORMACION v1.0

> Protocolo de auditoría del repo `yggdrasil-formacion`.
> Ejecutar: tras migraciones, mensualmente, o ante duda sobre contenido.
> Tiempo estimado: 20-30 min con MCP.

---

## Fase 1: Estructura

```
[ ] Verificar que README.md existe y describe el repo y su estructura
[ ] Verificar carpetas esperadas: cursos/, labs/, apuntes/, recursos/, skills/
[ ] Detectar carpetas o archivos de migración antigua sin clasificar
```

---

## Fase 2: Separación técnico/personal

```
[ ] Verificar que no hay diarios personales mezclados (que deberían estar en tracking)
[ ] Verificar que no hay archivos sobre metas de vida, filosofía o reflexiones personales
[ ] Si hay mezcla — mover a yggdrasil-tracking y documentar en DEW
```

---

## Fase 3: Consistencia de nombres y referencias

```
[ ] Verificar que README.md usa el nombre 'yggdrasil-formacion' (sin guión)
[ ] Buscar referencias internas a 'yggdrasil-formacion-' o 'formacion-tech' — corregir
[ ] Verificar que la isla Wiki apunta correctamente: wiki/islas/formacion.md
```

---

## Fase 4: Contenido activo

```
[ ] Verificar que hay apuntes reales (no solo carpetas vacías)
[ ] Verificar que labs/ tiene evidencia de práctica (no solo estructura)
[ ] Detectar archivos zombi (0 bytes, solo título) — borrar o completar
```

---

## Fase 5: Cierre de auditoría

```
[ ] Actualizar ESTADO-ISLA-FORMACION.md en DEW con hallazgos
[ ] Notificar en DEW: diario del día + MASTER-PENDIENTES
[ ] Marcar auditoría completada en MAPA-ISLAS-DEPENDENCIAS
```

---

_Creado: 2026-07-16 · F14 Protocolo Auditoría Formacion v1.0 · Perplexity MCP_
