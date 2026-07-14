---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 3.0
tags: [sesion, cierre, push, diario, ecosistema]
status: vigente
---

# PROTOCOLO-CIERRE-SESION v3

> El agente NO declara cierre hasta completar las 9 fases en orden.
> Saltarse una fase es un incidente. Si no se puede completar una fase, se documenta el motivo.
> Este protocolo cierra el bucle: diario → repos → estado → issue → próxima sesión.

---

## CONTRATO DEL AGENTE

```
No declaro "sesión cerrada" hasta que:
  1. El diario de hoy en yggdrasil-tracking está cerrado con resumen.
  2. Todos los repos tocados tienen sus cambios pusheados.
  3. ESTADO-SISTEMA.md y MASTER-PENDIENTES.md reflejan el estado real.
  4. Existe un issue de apertura para la próxima sesión.
```

---

## FASE 1 — Inventario de repos tocados

Listar todos los repos modificados en esta sesión:

```
REPOS TOCADOS EN ESTA SESIÓN:
  [ ] yggdrasil-dew
  [ ] yggdrasil-wiki
  [ ] yggdrasil-tracking
  [ ] formacion-tech
  [ ] investigacion-ia
  [ ] madre-config
  [ ] acer-config
  [ ] ollama-stack
  [ ] local-brain
  [ ] THDORA-PERSONAL
  [ ] yggdrasil-secops
  [ ] yggdrasil-scripts
  [ ] dev-labs
```

---

## FASE 2 — Cerrar el diario del día

**Repo:** `yggdrasil-tracking`
**Archivo:** `diarios/YYYY/YYYY-MM-DD.md`

Completar la sección `## Cierre` del diario de hoy:

```markdown
## Cierre
- Hora fin: HH:MM CEST
- Status: cerrado
- Repos tocados: [lista]
- Logros principales:
  - [logro 1]
  - [logro 2]
- Pendientes que quedan abiertos:
  - [pendiente 1]
- Bloqueos encontrados:
  - [bloqueo o "ninguno"]
- Notas para mañana:
  - [nota o "ninguna"]
```

**Estado del frontmatter:** Cambiar `status: abierto` → `status: cerrado`

---

## FASE 3 — Verificar commits (Conventional Commits)

Para cada repo tocado, verificar que los commits siguen el formato:

```
tipo(alcance): descripción en minúsculas

tipos válidos: feat, fix, docs, refactor, chore, test, ci, perf
```

**Referencia:** `CONVENCIONES.md` en `yggdrasil-dew`

```
¿Algún commit incumple el formato?
  SÍ → Amend del último commit o nota en el diario como deuda técnica.
  NO → Continuar.
```

---

## FASE 4 — Verificar push (la más crítica)

**Para CADA repo tocado, confirmar que el push se hizo:**

| Repo | ¿Pusheado? | Último commit |
|---|---|---|
| `yggdrasil-dew` | ✅/❌ | [SHA] |
| `yggdrasil-tracking` | ✅/❌ | [SHA] |
| [otros repos tocados] | ✅/❌ | [SHA] |

```
¿Algún repo tiene commits locales sin pushear?
  SÍ → PUSH INMEDIATO antes de continuar. Esto no es opcional.
  NO → Continuar.
```

**Regla:** Si no se puede hacer push (sin conexión, sin permisos), documentarlo en el diario
y crear una tarea en `MASTER-PENDIENTES.md` con `prioridad:alta`.

---

## FASE 5 — Actualizar ESTADO-SISTEMA.md

**Repo:** `yggdrasil-dew`
**Archivo:** `ESTADO-SISTEMA.md`

Actualizar:
- Última actividad de cada repo tocado hoy
- Estado (✅/🟡/🔴) si cambió
- Fecha de actualización del documento

**Repos activos a revisar:**

```
yggdrasil-dew       → ✅/🟡/🔴
yggdrasil-wiki      → ✅/🟡/🔴
yggdrasil-tracking  → ✅/🟡/🔴
formacion-tech      → ✅/🟡/🔴
investigacion-ia    → ✅/🟡/🔴
madre-config        → ✅/🟡/🔴
acer-config         → ✅/🟡/🔴
ollama-stack        → ✅/🟡/🔴
local-brain         → ✅/🟡/🔴
THDORA-PERSONAL     → ✅/🟡/🔴
yggdrasil-secops    → ✅/🟡/🔴
yggdrasil-scripts   → ✅/🟡/🔴
dev-labs            → ✅/🟡/🔴
```

---

## FASE 6 — Actualizar MASTER-PENDIENTES.md

**Repo:** `yggdrasil-dew`
**Archivo:** `MASTER-PENDIENTES.md`

- Marcar como ✅ DONE las tareas completadas hoy
- Añadir nuevas tareas detectadas durante la sesión
- Reclasificar prioridades si cambió el contexto
- Mover a `_archivo/` las tareas DONE con más de 7 días

---

## FASE 7 — Integridad del ecosistema

Verificar que el trabajo de hoy no rompió referencias cruzadas:

```
¿Se renombró algún archivo que otros documentos referencian?
  SÍ → Actualizar todas las referencias. Buscar con grep en todos los repos tocados.
  NO → Continuar.

¿Se creó un nuevo repo, isla o componente?
  SÍ → Actualizar ECOSYSTEM-ARCHITECTURE.md + ESTADO-SISTEMA.md.
  NO → Continuar.

¿Se deprecó algo?
  SÍ → Marcarlo en ECOSYSTEM-ARCHITECTURE.md con ⚠️ DEPRECADO + fecha.
  NO → Continuar.
```

---

## FASE 8 — ADR si hubo decisión arquitectónica

```
¿Se tomó alguna decisión que afecte a más de un repo?
  SÍ → Crear ADR siguiendo PROTOCOLO-ADR.md en protocolo/
       Ruta: docs/adr/ADR-NNN-descripcion.md en yggdrasil-dew
  NO → Continuar.
```

---

## FASE 9 — Crear issue de apertura para la próxima sesión

**Repo:** `yggdrasil-dew`
**Label:** `tipo:sesion` + `prioridad:alta`

**Template obligatorio:**

```markdown
# [APERTURA] Sesión YYYY-MM-DD — [objetivo en una frase]

## Contexto de la sesión anterior
[Resumen de lo que se hizo hoy]

## Objetivo principal
[Lo más importante a hacer en la próxima sesión]

## Repos a tocar (en orden)
1. [repo 1] — [por qué]
2. [repo 2] — [por qué]

## Bloqueos conocidos
- [bloqueo o "ninguno"]

## NO tocar en la próxima sesión
- [lista o "ninguna restricción"]

## Estado del ecosistema al cerrar
- Repos con 🔴: [lista o "ninguno"]
- Pendientes urgentes: [lista]

## Link al diario de hoy
yggdrasil-tracking: diarios/YYYY/YYYY-MM-DD.md
```

---

## FASE 10 — Declaración de cierre

```
[SESIÓN CERRADA]
Fecha: YYYY-MM-DD HH:MM CEST
Duración: [X horas Y minutos]
Diario cerrado: ✅ yggdrasil-tracking/diarios/YYYY/YYYY-MM-DD.md
Push verificado:
  yggdrasil-dew      → ✅ [SHA]
  yggdrasil-tracking → ✅ [SHA]
  [otros repos]      → ✅ [SHA]
ESTADO-SISTEMA actualizado: ✅
MASTER-PENDIENTES actualizado: ✅
Issue de apertura: ✅ #[N] en yggdrasil-dew
ADR creado: ✅/N/A

Logros principales:
  - [logro 1]
  - [logro 2]

Pendientes para mañana:
  - [pendiente 1]
```

---

## ESCALADO

| Nivel | Forma | Cuándo |
|---|---|---|
| Script | `scripts/cierre.sh` | Cuando exista en `yggdrasil-scripts` |
| GitHub Action | `cierre.yml` | Automatización futura |
| Bot THDORA | Comando `/cierre` en Telegram | Cuando THDORA esté en producción |

---

_v3.0 · 2026-07-14 · 10 fases · Milimétrico al ecosistema Yggdrasil real_
