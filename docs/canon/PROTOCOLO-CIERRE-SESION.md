---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-CIERRE-SESION.md
tags: [canon, cierre, sesion, protocolo, ritual]
status: vigente
version: 1
adr: ADR-012
---

# 🔴 Protocolo de Cierre de Sesión

> Toda sesión de trabajo termina ejecutando este protocolo.  
> Objetivo: dejar el ecosistema en estado conocido y la próxima sesión preparada.  
> Simétrico a: `PROTOCOLO-INICIO-SESION.md`

---

## CONTRATO AGENTE IA — obligatorio antes de cerrar

> **El agente NO declara la sesión cerrada hasta completar todos los pasos.**  
> Cada paso tiene criterio de éxito binario: ✅ hecho / ❌ pendiente.

---

## Paso 1 — Documentar lo ejecutado

### 1.1 Crear/actualizar diario de sesión

Ruta: `docs/sesiones/YYYY-MM-DD-[turno]-sesion.md`  
(turno: `manana` / `tarde` / `noche` / `cierre`)

**Contenido mínimo obligatorio:**
```markdown
## Qué se hizo
- [acción concreta ejecutada] → [resultado]

## Issues cerrados esta sesión
- #N — [título]

## Issues abiertos esta sesión
- #N — [título]

## Decisiones tomadas
- [decisión] → derivar ADR si aplica

## Estado del ecosistema al cierre
| Componente | Estado |
|---|---|
| [repo/servicio] | ✅/⚠️/🔴 |

## Primera acción de la próxima sesión
> [frase exacta, accionable]
```

### 1.2 Actualizar PROXIMA-SESION.md

Ruta: `docs/sesiones/PROXIMA-SESION.md`

- [ ] Bloques de trabajo ordenados por prioridad
- [ ] Primer bloque ejecutable sin contexto adicional
- [ ] Issues críticos con número y dependencias
- [ ] Sección "Lo que NO hacer al arrancar"
- [ ] Fecha de actualización al pie

---

## Paso 2 — Cerrar issues resueltos

Por cada tarea completada esta sesión:
- [ ] Issue cerrado en GitHub con estado `completed` o `not_planned`
- [ ] Si el issue estaba bloqueando otros → verificar que los bloqueados se pueden desbloquear
- [ ] Si surgió trabajo nuevo → issue abierto antes de cerrar la sesión

---

## Paso 3 — Actualizar archivos de estado

### 3.1 ESTADO-SISTEMA.md (`docs/canon/ESTADO-SISTEMA.md`)
- [ ] Números actualizados: repos, ADRs, islas, issues abiertos
- [ ] Servicios: cambiar 🔴→✅ si se resolvió algún HAL
- [ ] Fecha de actualización al pie

### 3.2 MASTER-PENDIENTES.md (raíz DEW)
- [ ] Fases avanzadas marcadas
- [ ] Ítem completado tachado o eliminado
- [ ] Fecha de actualización al pie

### 3.3 Islas afectadas (solo las tocadas en esta sesión)
- [ ] `wiki/islas/INDEX.md` — si se añadió/borró/cambió estado de isla
- [ ] `docs/islas/ESTADO-ISLA-[X].md` — si se tocó esa isla

---

## Paso 4 — Verificar repos limpios

Por cada repo tocado en la sesión:
- [ ] `git status` limpio (no hay cambios sin commit)
- [ ] `git push` hecho — nada local sin subir
- [ ] No hay archivos zombi o temporales en raíz

**Repos que siempre hay que verificar:**

| Repo | Verificar si... |
|---|---|
| `yggdrasil-dew` | Siempre |
| `WIKI---PERSONAL` | Se tocó alguna isla o mapa |
| `yggdrasil-tracking` | Se creó/editó diario personal |
| `madre-config` | Se cambió algún compose o script |
| `THDORA-PERSONAL` | Se modificó bot o prompts |

---

## Paso 5 — Protocolos especiales (solo si aplica)

| Situación | Protocolo adicional |
|---|---|
| Se expuso un secreto | Crear HAL urgente + rotar antes de cerrar |
| Se tomó decisión arquitectónica | Crear ADR antes de cerrar |
| Se tocó infra de Madre | Actualizar `docs/canon/ownership-matrix.md` |
| Se añadió isla nueva | Seguir `docs/canon/NORMA-ENTRADA-NUEVA-ISLA.md` |
| Sesión +3h | Crear issue de revisión de energía (no forzar más) |

---

## Paso 6 — Declaración de cierre

El agente escribe esta declaración al final del diario de sesión:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CIERRE: YYYY-MM-DD HH:MM CEST
SESIÓN: [tipo] — [duración estimada]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMPLETADO:
  ✅ [issue #N] — [qué se hizo]
  ✅ [acción sin issue] — [qué se hizo]

ABIERTO HOY:
  🆕 [issue #N] — [por qué se abrió]

PENDIENTE PARA PRÓXIMA SESIÓN:
  ⏳ [issue #N] — [estado actual]

ESTADO ECOSISTEMA: ESTABLE / CON ALERTAS / CRÍTICO
PRÓXIMA SESIÓN: [primera acción exacta]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Criterio de sesión bien cerrada

> La sesión está cerrada cuando:
> 1. Existe `docs/sesiones/YYYY-MM-DD-*-sesion.md` con declaración de cierre
> 2. `PROXIMA-SESION.md` está actualizado con bloques listos
> 3. Todos los repos tocados tienen `git push` limpio
> 4. `ESTADO-SISTEMA.md` tiene fecha de hoy
> 5. Issues cerrados en GitHub coinciden con lo documentado

---

_Creado: 2026-07-16 · v1 · Simétrico a PROTOCOLO-INICIO-SESION · Perplexity MCP_
