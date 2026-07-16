---
tipo: protocolo
subtipo: inicio-sesion
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
status: vigente
---

# ▶️ Protocolo de Inicio de Sesión

> Aplicable a cualquier repo del ecosistema Yggdrasil.
> Ejecutar en orden. No saltarse pasos.

---

## Paso 1 — Identificar el repo objetivo

```
¿En qué repo voy a trabajar?
→ yggdrasil-wiki     → leer wiki/islas/ del área
→ yggdrasil-dew      → leer CONTEXT.md + issues abiertos
→ THDORA-PERSONAL    → leer AGENT.md + CONTEXT.md
→ madre-config       → leer AGENT.md + CONTEXT.md
→ otro repo          → leer AGENT.md si existe
```

## Paso 2 — Leer los ficheros de contexto

1. **`AGENT.md`** del repo — identidad, rol, bloqueantes
2. **`CONTEXT.md`** del repo — estado actual
3. **`ECOSYSTEM-STATE.md`** si existe — contexto global
4. **Issues abiertos** en yggdrasil-dew con etiqueta del repo

## Paso 3 — Verificar bloqueantes

Antes de proponer trabajo nuevo:
- ¿Hay issues P0 (HAL) abiertos que bloqueen el trabajo propuesto?
- Si sí → resolver bloqueante primero o documentar dependencia
- Si no → continuar

## Paso 4 — Declarar objetivo de sesión

Formato:
```
SESIÓN [FECHA]: [objetivo en una línea]
Repo(s) afectados: [...]
Issues relacionados: [...]
Bloqueantes conocidos: [...]
```

## Paso 5 — Ejecutar

Trabaja en el repo. Documenta decisiones importantes como comentarios en issues o ADRs.
