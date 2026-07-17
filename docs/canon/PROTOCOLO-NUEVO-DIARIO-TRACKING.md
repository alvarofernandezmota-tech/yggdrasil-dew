---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-17
ruta: docs/canon/PROTOCOLO-NUEVO-DIARIO-TRACKING.md
tags: [canon, protocolo, tracking, diario, vidapersonal]
status: vigente
version: 1
nota: movido desde docs/canon/protocolos/ en 2026-07-17 (issue #77)
---

# Protocolo — Nuevo Diario de Tracking

> Cómo crear una nueva entrada en el diario de tracking/vida personal.
> Repo: `yggdrasil-tracking` (antes `VIDAPERSONAL`)

---

## Cuándo usar este protocolo

- Al iniciar un nuevo período de diario (mensual, semanal o evento especial)
- Al registrar un hito personal o vital
- Al crear retrospecti va de período

---

## Pasos

### 1. Verificar fecha y período

```bash
date  # confirmar fecha actual
ls docs/diarios/  # ver última entrada
```

### 2. Crear archivo desde plantilla

Usar plantilla: `docs/canon/PLANTILLA-DIARIO-TRACKING.md`

Nombre de archivo: `YYYY-MM-DD-diario-tracking.md`

### 3. Rellenar secciones obligatorias

- [ ] Fecha y contexto
- [ ] Estado emocional / energía
- [ ] Qué pasó (hechos)
- [ ] Reflexión
- [ ] Siguiente paso concreto

### 4. Commit

```
git add docs/diarios/YYYY-MM-DD-diario-tracking.md
git commit -m "docs(tracking): diario YYYY-MM-DD"
git push
```

### 5. Actualizar índice si existe

Si existe `docs/diarios/INDEX.md` — añadir entrada.

---

_v1 · Movido a docs/canon/ en 2026-07-17 · issue #77_
