---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-CIERRE-SESION.md
tags: [canon, cierre, sesion, protocolo, ritual]
status: vigente
version: 4
adr: ADR-012
---

# 🔴 Protocolo de Cierre de Sesión

> Toda sesión termina ejecutando este protocolo.  
> Objetivo: estado limpio, documentado y pusheado. La siguiente sesión arranca en 30 segundos.  
> Simétrico a: `PROTOCOLO-INICIO-SESION.md`

---

## CONTRATO AGENTE IA — cierre orquestado

> **El agente NO declara "sesión cerrada" hasta que todas las fases están completadas.**  
> El agente ejecuta las fases en orden. Sin atajos. Sin cerrar el issue-cierre antes de tiempo.

```
ORDEN DE EJECUCIÓN DEL CIERRE:

[1] Reconstruir lo hecho → lista de cambios con issue #N por cada acción
[2] Actualizar ESTADO-SISTEMA.md → números actuales
[3] Actualizar MASTER-PENDIENTES.md → reflejar estado real del backlog
[4] Actualizar islas afectadas → ESTADO-ISLA-*.md relevantes
[5] Crear diario del día → docs/diarios/YYYY-MM-DD.md
[6] Cerrar issues resueltos en GitHub → con comentario de cierre
[7] Verificar git push de TODOS los repos tocados
[8] Crear issue-cierre → label apertura-sesion → body = template
[9] Declarar sesión cerrada
```

**Regla del agente:**
> Si no hay terminal disponible → ejecutar fases 1-6 y 8-9 con MCP.  
> Si hay terminal → ejecutar las 9 fases completas.  
> Si se interrumpe el cierre → el issue-cierre queda SIN CERRAR hasta completar.

---

## Fase 1 — Reconstruir lo hecho

El agente genera la lista de cambios de la sesión:

```
CAMBIOS DE LA SESIÓN YYYY-MM-DD:

Repos tocados:
  - yggdrasil-dew: [qué se cambió]
  - [repo]: [qué se cambió]

Issues resueltos: #N, #N, #N
Issues creados: #N, #N
ADRs nuevos: ADR-0XX (si aplica)
Islas actualizadas: [nombre]
```

---

## Fase 2 — Actualizar ESTADO-SISTEMA.md

Actualizar SIEMPRE los siguientes campos:

```yaml
# Campos que actualizar en ESTADO-SISTEMA.md:
ultima_sesion: YYYY-MM-DD HH:MM CEST
issues_abiertos: N          # contar en GitHub
issues_cerrados_hoy: N      # los de esta sesión
adrs_totales: N             # contar en docs/adr/
repos_activos: N            # si cambió
# servicios: actualizar estado 🟢/🟡/🔴 si alguno cambió
```

---

## Fase 3 — Actualizar MASTER-PENDIENTES.md

- Mover issues resueltos de "En progreso" / "Pendiente" a sección completada
- Añadir issues nuevos a la prioridad correcta
- Si se crearon ADRs → referenciarlos
- Fecha de actualización al final del archivo

---

## Fase 4 — Actualizar ESTADO-ISLA-*.md afectados

Solo actualizar los que la sesión tocó realmente.

Por isla, actualizar:
- Estado actual: 🟢 Operativa / 🟡 Parcial / 🔴 Caída / 🔧 En obras
- Última actualización: YYYY-MM-DD
- Cambios de esta sesión: lista breve
- Próximo paso: issue #N

---

## Fase 5 — Crear diario del día

Ruta: `docs/diarios/YYYY-MM-DD.md`

```markdown
---
fecha: YYYY-MM-DD
sesion_inicio: HH:MM CEST
sesion_fin: HH:MM CEST
tipo: Larga / Corta / Emergencia / Formación
repos_tocados: [lista]
issues_resueltos: [#N, #N]
issues_creados: [#N, #N]
adrs_nuevos: [ADR-0XX] o ninguno
---

# Diario YYYY-MM-DD

## Qué se hizo

[Lista de cambios concretos. Un punto por issue o acción relevante.]

## Decisiones tomadas

[Solo decisiones que afectan arquitectura, normas o ecosistema. Si no hay → "Ninguna."]

## Bloqueos encontrados

[Problemas encontrados durante la sesión. Si no hay → "Ninguno."]

## Próxima sesión

- [ ] [Issue #N] — [qué falta o sigue]
- [ ] [Issue #N] — [qué falta o sigue]

## Estado al cerrar

> Todos los repos tocados tienen git push hecho: [Sí / No — motivo si No]
```

---

## Fase 6 — Cerrar issues en GitHub

Por cada issue resuelto en la sesión:

```
Acción: Cerrar issue #N con comentario

Comentario de cierre estándar:
✅ Resuelto en sesión YYYY-MM-DD.
[Una línea de qué se hizo exactamente.]
Diario: docs/diarios/YYYY-MM-DD.md
```

---

## Fase 7 — Verificar git push (requiere terminal)

Comprobar TODOS los repos tocados:

```bash
# Por cada repo tocado en la sesión:
cd ~/ygg/[repo]
git status          # debe estar limpio
git log --oneline -3  # verificar commits de la sesión
git push            # si no está pusheado
```

**Checklist de verificación por repo tocado:**

| Repo | git status limpio | commits ok | pushed |
|---|---|---|---|
| yggdrasil-dew | [ ] | [ ] | [ ] |
| [repo] | [ ] | [ ] | [ ] |

> ⚠️ Si no hay terminal disponible: documentar en el issue-cierre qué repos faltan por push
> y abrir sub-tarea para primera acción de la próxima sesión.

---

## Fase 8 — Crear issue-cierre (SSOT de la próxima sesión)

Crear issue en `yggdrasil-dew` con:

```
Título: [cierre] YYYY-MM-DD — [resumen 1 línea de lo hecho]
Label:  apertura-sesion
```

Body del issue:

```markdown
## Contexto para la próxima sesión

> Este issue es la fuente de verdad para el inicio de la siguiente sesión.
> El agente lo leerá PRIMERO antes de cualquier acción.

### Estado al cerrar — YYYY-MM-DD HH:MM CEST

**Repos tocados hoy:**
- `[repo]` — [qué se hizo]
- `[repo]` — [qué se hizo]

**Issues resueltos:** #N, #N, #N
**Issues creados:** #N, #N
**ADRs nuevos:** ADR-0XX / Ninguno

**Git push completado:**
- [ ] `yggdrasil-dew` — ✅ / ⚠️ pendiente
- [ ] `[repo]` — ✅ / ⚠️ pendiente

---

### Objetivos de la próxima sesión (por prioridad)

1. [Issue #N] — [acción concreta] — Prioridad: 🔴 / 🟠 / 🟡
2. [Issue #N] — [acción concreta] — Prioridad: 🔴 / 🟠 / 🟡
3. [Issue #N] — [acción concreta] — Prioridad: 🔴 / 🟠 / 🟡

**NO entrar en:**
- [Qué queda explícitamente fuera]

---

### Bloqueos activos

| Issue | Bloqueo | Desbloqueo |
|---|---|---|
| #N | [descripción] | [qué necesita] |

---

### Estado rápido del ecosistema

| Componente | Estado |
|---|---|
| Madre (hardware) | 🟢 / 🟡 / 🔴 |
| Servicios Docker | 🟢 / 🟡 / 🔴 |
| HAL pendientes | N abiertos |
| Secretos | ✅ rotados / ⚠️ pendientes |
| Git repos sin push | ✅ ninguno / ⚠️ [lista] |
```

---

## Fase 9 — Declarar sesión cerrada

El agente confirma verbalmente:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ SESIÓN CERRADA — YYYY-MM-DD HH:MM CEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Issues resueltos: #N, #N, #N
Repos pusheados: [lista] ✅ | Sin push: [lista] ⚠️
Diario creado: docs/diarios/YYYY-MM-DD.md ✅
Issue-cierre: #N abierto ✅
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Próxima sesión: leer issue #N antes de cualquier acción
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Checklist rápido de cierre (versión comprimida)

```
[ ] Fase 1 — Lista de cambios reconstruida
[ ] Fase 2 — ESTADO-SISTEMA.md actualizado
[ ] Fase 3 — MASTER-PENDIENTES.md actualizado
[ ] Fase 4 — ESTADO-ISLA-*.md relevantes actualizados
[ ] Fase 5 — docs/diarios/YYYY-MM-DD.md creado
[ ] Fase 6 — Issues resueltos cerrados en GitHub con comentario
[ ] Fase 7 — git push verificado en todos los repos tocados
[ ] Fase 8 — Issue-cierre creado con label apertura-sesion
[ ] Fase 9 — Declaración verbal de cierre
```

---

_Creado: 2026-07-13 · v4 — contrato agente + 9 fases + issue-cierre SSOT + verificación push · ADR-012 · Perplexity MCP_
