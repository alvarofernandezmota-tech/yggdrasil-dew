---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-ACTUALIZACION-TRACKING.md
tags: [protocolo, actualizacion, tracking, repo]
status: vigente
version: 1.0
---

# PROTOCOLO-ACTUALIZACION-TRACKING v1.0

> Ejecutar cuando un cambio estructural afecta a yggdrasil-tracking.
> Version especifica de PROTOCOLO-ACTUALIZACION-ECOSISTEMA para TRACKING.
> Tracking es privado — ninguna actualizacion lo hace publico.
> Tiempo estimado: 5-10 min.

---

## Tipos de cambio en TRACKING

```
TIPO A — Nueva carpeta de mes/ano
  [ ] Crear carpeta diarios/YYYY/MM-mes/
  [ ] Verificar nombre canonico: MM-mes (01-enero, 07-julio...)
  [ ] No crear archivos placeholder vacios

TIPO B — Cambio en estructura de metas
  [ ] Actualizar metas/README.md
  [ ] Si la meta conecta con una fase de DEW -> referenciar en MASTER-PENDIENTES

TIPO C — Nueva plantilla de diario
  [ ] La plantilla vive en DEW (docs/canon/PLANTILLA-DIARIO-TRACKING.md)
  [ ] Actualizar la plantilla en DEW, no en TRACKING
  [ ] Notificar el cambio en diario DEW del dia

TIPO D — Cambio de visibilidad (NUNCA hacer publico)
  [ ] Verificar que el repo sigue siendo PRIVADO antes y despues de cualquier cambio
  [ ] Si se duda -> consultar antes de ejecutar
```

---

## Checklist post-cambio TRACKING

```
[ ] Repo sigue siendo PRIVADO
[ ] Ningun dato personal expuesto en repos publicos
[ ] Si cambio afecta a plantilla -> actualizado en DEW (docs/canon/)
[ ] Diario DEW del dia documenta el cambio estructural
[ ] Commit con mensaje descriptivo (sin contenido personal en el mensaje)
```

---

## Relacionado

- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md (global)
- PROTOCOLO-ENTRADA-TRACKING.md
- docs/canon/PLANTILLA-DIARIO-TRACKING.md (en DEW)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
