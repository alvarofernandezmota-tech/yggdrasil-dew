---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-AUDITORIA-TRACKING.md
tags: [protocolo, auditoria, tracking, vida-personal, consistencia]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-TRACKING v1.0

> Protocolo de auditoría del repo `yggdrasil-tracking`.
> Ejecutar: mensualmente o cuando haya duda sobre mezcla personal/técnico.
> Tiempo estimado: 20-30 min con MCP.

---

## Fase 1: Estructura

```
[ ] Verificar carpetas esperadas: diarios/, metas/, reflexiones/, filosofia/, yo/, tracking/, inbox/, proyectos/
[ ] Verificar que inbox.md y now.md existen y no son zombis
[ ] Verificar que README.md existe y describe el repo correctamente
```

---

## Fase 2: Diarios personales

```
[ ] Verificar que diarios/ sigue estructura YYYY/MM-mes/YYYY-MM-DD.md
[ ] Verificar que no hay diarios de sesión técnica mezclados
[ ] Verificar que no hay archivos plantilla sin completar (status: plantilla)
[ ] Detectar huecos en el diario personal (días sin entrada) — son OK, no zombis
```

---

## Fase 3: Separación personal/técnico

```
[ ] Verificar que no hay apuntes técnicos en diarios/ (cursos, comandos, HTB)
[ ] Verificar que no hay contenido de formación técnica en metas/ o reflexiones/
[ ] Si hay mezcla — mover a yggdrasil-formacion y documentar en DEW
```

---

## Fase 4: Metas

```
[ ] Verificar que metas/ tiene: 2026.md, Q3-2026.md, empleo.md
[ ] Verificar que las metas tienen estado actualizado
[ ] Verificar que no hay metas de desarrollo técnico (esas van en yggdrasil-formacion o DEW issues)
```

---

## Fase 5: Cierre de auditoría

```
[ ] Actualizar now.md con estado real
[ ] Vacíace inbox.md si tiene entradas antiguas (> 1 semana)
[ ] Notificar en DEW: diario del día + ESTADO-ISLA-TRACKING
```

---

_Creado: 2026-07-16 · F14 Protocolo Auditoría Tracking v1.0 · Perplexity MCP_
