---
tipo: protocolo
subtipo: sesion
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-01-01
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-CIERRE-SESION.md
tags: [protocolo, sesion, cierre, agente-ia, contexto, git]
status: vigente
version: 2.0
audiencia: [humano, agente-ia]
nivel-escalado: 0 — Manual
candidato-a: 1 — Script
---

# 🔴 PROTOCOLO DE CIERRE DE SESIÓN v2

> **Propósito:** Cerrar cada sesión de trabajo sin deuda técnica, con el estado documentado y el contexto transferido a la siguiente sesión.
> **Cuándo ejecutar:** Al terminar cualquier sesión de trabajo, antes de cerrar el editor o el chat.
> **Contrato:** El agente NO puede declarar cierre hasta que las 9 fases pasen. Si alguna falla, se reporta antes de cerrar.

---

## 👤 PARA EL HUMANO

### El cierre mínimo viable (si tienes < 5 min)

1. `git add . && git commit -m "wip: checkpoint sesión" && git push` en cada repo tocado
2. Actualizar `ESTADO-SISTEMA.md` con una línea de lo que cambió
3. Abrir un issue con título `[APERTURA] [fecha] — [lo que queda pendiente]`

### El cierre completo (recomendado)

Siguir las 9 fases del agente. Aplican igual para ti.

---

## 🤖 PARA EL AGENTE IA — 9 FASES OBLIGATORIAS

> **CONTRATO:** Ejecutar en orden. No saltar fases. Si una fase no se puede completar, reportar y esperar confirmación del usuario antes de continuar.

### FASE 1 — Inventario de repos tocados

Listar todos los repos modificados en la sesión:
```
Repos tocados esta sesión:
- [nombre-repo-1]: [qué se hizo]
- [nombre-repo-2]: [qué se hizo]
```

### FASE 2 — Verificación de commits

Para cada repo tocado, verificar:
- [ ] Todos los cambios tienen commit (no hay `git status` sucio)
- [ ] El mensaje de commit sigue Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`...)
- [ ] No hay archivos staged a medias

Si hay uncommitted changes → hacer commit antes de continuar.

### FASE 3 — Verificación de push

⚠️ **Esta fase es la más olvidada. Es obligatoria.**

Para cada repo tocado:
- [ ] `git push` ejecutado y confirmado
- [ ] Sin errores de push (conflictos, auth, etc.)

Si hay error de push → reportar al usuario con el error exacto antes de continuar.

### FASE 4 — Actualizar ESTADO-SISTEMA.md

Actualizar la sección del repo correspondiente con:
- Estado actual (✅ / 🟡 / 🔴)
- Qué cambió en esta sesión (una línea)
- Nuevas deudas técnicas generadas (si las hay)
- Fecha de actualización

### FASE 5 — Actualizar MASTER-PENDIENTES.md

- Marcar como ✅ los pendientes completados
- Añadir nuevos pendientes descubiertos durante la sesión
- Actualizar prioridades si algo cambió

### FASE 6 — Verificar integridad del ecosistema

Comprobar que los cambios de esta sesión no rompieron referencias cruzadas:
- [ ] Si se añadió/renombró un archivo referenciado por otros → actualizar referencias
- [ ] Si se cambió una estructura de directorio → actualizar `ECOSYSTEM-ARCHITECTURE.md`
- [ ] Si se deprecó un protocolo → actualizar `protocolo/INDEX.md`

### FASE 7 — Documentar decisiones arquitectónicas

Si durante la sesión se tomó alguna decisión de diseño importante (nueva estructura, cambio de tecnología, nuevo patrón):
→ Crear un ADR en `docs/adr/` siguiendo `PROTOCOLO-ADR.md`

Si no hay decisiones que documentar → omitir.

### FASE 8 — Crear issue de apertura de próxima sesión

Crear issue en `yggdrasil-dew` con:
- **Título:** `[APERTURA] [YYYY-MM-DD] — [objetivo próxima sesión o contexto heredado]`
- **Label:** `apertura-sesion`
- **Cuerpo:**

```markdown
## Estado al cierre de sesión [YYYY-MM-DD HH:MM]

### Repos tocados
- [repo]: [estado]

### Completado esta sesión
- [item]

### Pendiente para próxima sesión
- [item] — [prioridad]

### Bloqueos activos
- [bloqueo o NINGUNO]

### Notas para el agente
[contexto especial, advertencias, cosas a no olvidar]
```

### FASE 9 — Declaración de cierre

```
[SESIÓN CERRADA]
Fecha: YYYY-MM-DD HH:MM
Duración estimada: Xh Ymin
Repos con push confirmado: [lista]
ESTADO-SISTEMA actualizado: ✅ / ❌
MASTER-PENDIENTES actualizado: ✅ / ❌
Issue de apertura creado: #[número] o ❌
Decisiones arquitectónicas: [N ADRs creados o NINGUNA]
Resumen: [una frase de lo logrado]
```

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script | `scripts/cierre-sesion.sh` | 🔲 pendiente |
| 2 — GitHub Action | `.github/workflows/cierre.yml` | 🔲 pendiente |
| 3 — Bot THDORA | Comando `/cierre` en Telegram | 🔲 pendiente |

---

## 📋 MANTENIMIENTO

Actualizar este protocolo cuando:
- Se añada un nuevo archivo de estado global
- Cambie la estructura del issue de apertura
- Se automatice alguna de las fases (actualizar tabla de escalado)

_Actualizado: 2026-07-14 · v2.0_
