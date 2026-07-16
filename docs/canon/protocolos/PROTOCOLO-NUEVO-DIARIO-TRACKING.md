---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/protocolos/PROTOCOLO-NUEVO-DIARIO-TRACKING.md
tags: [protocolo, tracking, diario, personal]
status: vigente
version: v1.0
---

# PROTOCOLO-NUEVO-DIARIO-TRACKING v1.0

> Protocolo atomico para crear una nueva entrada de diario personal en `yggdrasil-tracking`.
> Los diarios de tracking son **personales** — nunca en DEW ni en ninguna otra repo.

---

## Cuando usar este protocolo

- Al final del dia para reflexion personal
- Para registrar eventos personales relevantes
- Para hacer seguimiento de habitos, salud, estado emocional
- Al inicio de semana para intencion semanal

**NO usar para:**
- Trabajo tecnico (eso va en `docs/sesiones/` de DEW)
- Tareas del ecosistema (eso va en issues de DEW)

---

## Pasos

### 1. Determinar fecha y ruta

```
Fecha: YYYY-MM-DD
Ruta: diarios/YYYY/MM/YYYY-MM-DD.md
Ejemplo: diarios/2026/07/2026-07-16.md
```

### 2. Crear el archivo con la plantilla

Usar `PLANTILLA-DIARIO-TRACKING.md` de `yggdrasil-dew/docs/canon/`:

```markdown
---
tipo: diario-personal
fecha: YYYY-MM-DD
author: Alvaro Fernandez Mota
ruta: diarios/YYYY/MM/YYYY-MM-DD.md
tags: [diario, personal, tracking]
status: borrador
---

# Diario YYYY-MM-DD

## Como estoy

<!-- Estado fisico y emocional -->

## Que ha pasado hoy

<!-- Eventos relevantes del dia -->

## Reflexion

<!-- Una frase o pensamiento del dia -->

## Manana

<!-- Una intencion para manana -->
```

### 3. Hacer commit

```
git commit -m "diario(personal): entrada YYYY-MM-DD"
```

### 4. Verificar que NO hay informacion tecnica

Antes de commitear, revisar que no hay:
- Detalles de arquitectura del ecosistema
- Tokens o secretos
- IPs o datos de infraestructura

---

## Regla de separacion DEW / Tracking

> **DEW** = trabajo tecnico del ecosistema
> **Tracking** = vida personal de Alvaro

Nunca mezclar. Si surge trabajo tecnico durante una reflexion personal, crear issue en DEW y referenciarla.

---

## Ejemplo de entrada valida

```markdown
# Diario 2026-07-16

## Como estoy
Cansado pero satisfecho. Sesion productiva.

## Que ha pasado hoy
Sesion larga con Perplexity. Se han alineado muchas cosas del ecosistema.

## Reflexion
Cuando el sistema esta ordenado, la cabeza tambien.

## Manana
Descansar y luego terminal para resolver los HALs.
```

---

_Creado: 2026-07-16 — F17 — cierra issue #69 — Perplexity MCP_
