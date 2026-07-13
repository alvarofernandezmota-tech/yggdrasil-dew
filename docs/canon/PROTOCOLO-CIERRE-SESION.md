---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-CIERRE-SESION.md
tags: [canon, cierre, sesion, protocolo, ritual]
status: vigente
---

# 🔒 Protocolo de Cierre de Sesión

> Toda sesión de trabajo con MCP termina ejecutando este protocolo.
> Orden estricto: DEW primero → WIKI segundo → repos operativos tercero.
> El agente no da la sesión por cerrada sin pasar este checklist.

---

## Árbol de decisiones — ¿dónde va exactamente cada cosa?

```
¿Qué tipo de contenido es?
│
├── Decisión de arquitectura o cambio estructural importante
│   ├── → docs/adr/ADR-0XX-nombre-decision.md  (nuevo)
│   ├── → docs/adr/INDEX.md                   (actualizar tabla + nº siguiente libre)
│   └── → ADRs existentes relacionados        (añadir nota «Actualizado por ADR-0XX»)
│
├── Registro de lo que se hizo en la sesión
│   └── → docs/diarios/YYYY-MM-DD.md           (crear o añadir sección si ya existe)
│
├── Norma nueva del ecosistema
│   ├── → NORMAS.md                            (sección ## Regla de XXX)
│   ├── → docs/canon/NORMAS-TRIDENTE.md        (si afecta al Tridente)
│   └── → ADR si la norma es decisión estructural
│
├── Tarea pendiente / bug accionable
│   ├── → Issue en yggdrasil-dew (o repo afectado)
│   └── → MASTER-PENDIENTES.md               (tabla de fases + próxima sesión)
│
├── Estado del ecosistema cambió (repos, números, servicios)
│   ├── → docs/canon/ESTADO-SISTEMA.md        (números, repos, issues abiertos)
│   └── → docs/canon/ownership-matrix.md      (si cambió dueño o SLA de un servicio)
│
├── Estado de una isla específica
│   ├── → docs/islas/ESTADO-ISLA-NOMBRE.md    (estado operativo, deuda, pendiente)
│   ├── → wiki/islas/NOMBRE.md               (actualizar concepto si cambia)
│   └── → wiki/islas/INDEX.md                (columna Estado de la isla)
│
├── Nueva isla / nuevo repo al ecosistema
│   ├── → docs/islas/ESTADO-ISLA-NOMBRE.md    (obligatorio — NORMA-ENTRADA-NUEVA-ISLA)
│   ├── → wiki/islas/NOMBRE.md               (isla nueva)
│   ├── → wiki/islas/INDEX.md                (añadir fila + actualizar números)
│   ├── → docs/islas/MAPA-ISLAS-DEPENDENCIAS.md (añadir nodo)
│   ├── → NORMAS.md tabla de repos            (añadir fila)
│   ├── → docs/canon/ESTADO-SISTEMA.md        (añadir repo a la tabla)
│   └── → ADR si es decisión de crear el repo
│
├── Hallazgo técnico (bug, incidente, vulnerabilidad)
│   ├── → docs/hallazgos/HAL-XXX.md           (evidencia + impacto + resolución)
│   └── → Issue en yggdrasil-secops si es seguridad
│
├── Config operativa de un servicio
│   └── → madre-config/ o repo del servicio (NUNCA en DEW ni WIKI)
│
└── Vida personal / formación
    ├── Diario personal, metas, reflexión  → yggdrasil-tracking
    └── Apuntes técnicos, cursos, HTB     → yggdrasil-formacion-
```

---

## Checklist de cierre — archivo por archivo, orden obligatorio

### 1️⃣ yggdrasil-dew — Cerebro (siempre primero)

#### Registro de sesión
- [ ] `docs/diarios/YYYY-MM-DD.md`
  - Secciones: decisiones tomadas · issues cerrados (#N) · estado al cierre · próxima sesión
  - Si ya existe el archivo del día → añadir sección, no crear nuevo

#### Arquitectura y decisiones
- [ ] `docs/adr/ADR-0XX-nombre.md` — crear si se tomó decisión estructural
- [ ] `docs/adr/INDEX.md` — actualizar tabla + próximo ADR libre
- [ ] ADRs relacionados existentes — añadir nota de actualización si los afecta

#### Normas y canon
- [ ] `NORMAS.md` — añadir regla nueva si se estableció alguna
- [ ] `docs/canon/NORMAS-TRIDENTE.md` — actualizar si cambia la filosofía del Tridente
- [ ] `docs/canon/ESTADO-SISTEMA.md` — actualizar números, repos, issues, estado servicios
- [ ] `docs/canon/ownership-matrix.md` — actualizar si cambió dueño o SLA de algún servicio

#### Estado e islas
- [ ] `docs/islas/ESTADO-ISLA-NOMBRE.md` — crear/actualizar para cada isla tocada
- [ ] `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` — actualizar si entró o salió una isla

#### Pendientes y tareas
- [ ] `MASTER-PENDIENTES.md` — estado de fases + tabla próxima sesión
- [ ] Issues — cerrar resueltos · crear nuevos detectados
- [ ] Zombis — verificar raíz dew sin archivos vacíos

### 2️⃣ yggdrasil-wiki — Conocimiento (segundo)

- [ ] `wiki/islas/NOMBRE.md` — actualizar concepto/estado de cada isla tocada
- [ ] `wiki/islas/INDEX.md` — columna Estado al día + números (islas totales, completas, stubs)
- [ ] Islas deprecadas — verificar que tienen redirect y status: deprecado en frontmatter

### 3️⃣ Repos operativos (si aplican en la sesión)

- [ ] `madre-config/` — ¿cambió algún servicio o docker-compose? → commit en ese repo
- [ ] `yggdrasil-tracking` — ¿hay algo personal pendiente de registrar?
- [ ] `yggdrasil-secops` — ¿nuevo hallazgo HAL-XXX?
- [ ] `yggdrasil-scripts` — ¿se creó o modificó algún script o Action?
- [ ] Cualquier otro repo directamente afectado por la sesión

---

## 5 preguntas de cierre — el agente siempre hace estas

1. **¿Se tomó alguna decisión estructural hoy?** → Sí → ADR
2. **¿Algún archivo quedó colgado entre repos?** → Sí → propagar según árbol
3. **¿Algún issue nuevo detectado?** → Sí → crear en repo correcto
4. **¿Algún issue resuelto sin cerrar en GitHub?** → Cerrar con nota
5. **¿El ESTADO-SISTEMA refleja el estado real ahora mismo?** → No → actualizar

---

## Regla de propagación entre repos

```
Decisión tomada
  ↓
DEW — ADR + diario + MASTER-PENDIENTES + ESTADO-SISTEMA
  ↓
WIKI — isla afectada + INDEX
  ↓
Repo operativo afectado (si aplica)
```

Nunca al revés. Nunca saltar un nivel. Nunca actualizar solo el repo operativo sin rastro en DEW.

---

## Frecuencia y profundidad

| Tipo de sesión | Mínimo obligatorio | Completo |
|---|---|---|
| Sesión larga (+1h) | Todo el checklist | ✔️ |
| Sesión corta (15-30min) | Diario + issues + MASTER-PENDIENTES | Si hay decisión → ADR también |
| Ritual semanal (domingo) | Todo + ESTADO-SISTEMA semanal | ✔️ |
| Emergencia / hotfix | HAL-XXX + diario | — |

---

## Archivos canon — mapa completo

| Archivo | Repo | Actualizar cuando |
|---|---|---|
| `docs/diarios/YYYY-MM-DD.md` | dew | Siempre — cada sesión |
| `MASTER-PENDIENTES.md` | dew | Siempre — cada sesión |
| `docs/canon/ESTADO-SISTEMA.md` | dew | Cuando cambia número de repos, issues, ADRs, islas |
| `NORMAS.md` | dew | Cuando se establece norma nueva |
| `docs/adr/ADR-0XX.md` | dew | Cuando se toma decisión estructural |
| `docs/adr/INDEX.md` | dew | Cuando hay ADR nuevo |
| `docs/canon/NORMAS-TRIDENTE.md` | dew | Cuando cambia filosofía del Tridente |
| `docs/canon/ownership-matrix.md` | dew | Cuando cambia dueño o SLA de servicio |
| `docs/islas/ESTADO-ISLA-NOMBRE.md` | dew | Cuando se audita o cambia una isla |
| `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` | dew | Cuando entra/sale isla del ecosistema |
| `wiki/islas/NOMBRE.md` | wiki | Cuando cambia concepto o repo de la isla |
| `wiki/islas/INDEX.md` | wiki | Cuando cambia estado de cualquier isla |

---

_Creado: 2026-07-13 · v2 — archivo por archivo · ADR-012 · Perplexity MCP_
