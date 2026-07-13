---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-CIERRE-SESION.md
tags: [canon, cierre, sesion, protocolo, ritual]
status: vigente
adr: ADR-012
---

# 🔴 Protocolo de Cierre de Sesión

> Toda sesión de trabajo termina ejecutando este protocolo.
> Objetivo: dejar el ecosistema consistente, sin archivos colgados, con toda decisión trazada.
> Tiempo estimado: 5–15 minutos.
> Simétrico a: `PROTOCOLO-INICIO-SESION.md`

---

## Árbol de decisiones — ¿dónde va exactamente cada cosa?

```
¿Qué tipo de contenido generaste hoy?
│
├── Decisión de arquitectura o cambio estructural
│   ├── → docs/adr/ADR-0XX-nombre.md          (nuevo)
│   ├── → docs/adr/INDEX.md                    (actualizar tabla + próximo libre)
│   └── → ADRs existentes relacionados         (añadir nota de actualización)
│
├── Registro de lo que se hizo
│   └── → docs/diarios/YYYY-MM-DD.md            (crear o añadir sección)
│
├── Norma nueva del ecosistema
│   ├── → NORMAS.md                             (sección ## Regla de XXX)
│   ├── → docs/canon/NORMAS-TRIDENTE.md         (si afecta al Tridente)
│   └── → ADR si la norma es decisión estructural
│
├── Tarea pendiente / bug accionable
│   ├── → Issue en yggdrasil-dew (o repo afectado)
│   └── → MASTER-PENDIENTES.md                 (tabla fases + próxima sesión)
│
├── Estado del ecosistema cambió
│   ├── → docs/canon/ESTADO-SISTEMA.md          (números: repos, ADRs, islas, issues)
│   └── → docs/canon/ownership-matrix.md        (si cambió servicio, puerto o SLA)
│
├── Estado de una isla específica cambió
│   ├── → docs/islas/ESTADO-ISLA-NOMBRE.md      (estado operativo + deuda)
│   ├── → wiki/islas/NOMBRE.md                  (concepto/repo si cambia)
│   └── → wiki/islas/INDEX.md                   (columna Estado + números)
│
├── Nueva isla / nuevo repo al ecosistema
│   ├── → docs/islas/ESTADO-ISLA-NOMBRE.md      (obligatorio — 5 pasos NORMA-ENTRADA)
│   ├── → wiki/islas/NOMBRE.md                  (isla nueva)
│   ├── → wiki/islas/INDEX.md                   (fila nueva + actualizar números)
│   ├── → docs/islas/MAPA-ISLAS-DEPENDENCIAS.md (nodo nuevo)
│   ├── → docs/canon/ESTADO-SISTEMA.md          (repo nuevo en tabla)
│   └── → ADR si la creación fue una decisión
│
├── Hallazgo técnico (bug, incidente, vulnerabilidad)
│   ├── → docs/hallazgos/HAL-XXX.md             (evidencia + impacto + resolución)
│   └── → Issue en yggdrasil-secops si es seguridad
│
├── Cambio en servicio Docker de Madre
│   ├── → madre-config/ (commit en ese repo)
│   └── → docs/canon/ownership-matrix.md        (actualizar estado del servicio)
│
├── Script o Action nuevo/modificado
│   └── → yggdrasil-scripts/ (commit en ese repo)
│
├── Vida personal, diario, reflexión, meta
│   └── → yggdrasil-tracking
└── Aprendizaje técnico, curso, apuntes
    └── → yggdrasil-formacion-
```

---

## Checklist de cierre — archivo por archivo, orden obligatorio

### 1️⃣ yggdrasil-dew — Cerebro (siempre primero)

#### Registro de sesión
- [ ] `docs/diarios/YYYY-MM-DD.md`
  - Qué bloques se trabajaron
  - Decisiones tomadas (con ADR si aplica)
  - Issues cerrados con número y título
  - Estado al cierre (números clave)
  - Próxima sesión: objetivos + prioridades

#### Canon y normas
- [ ] `NORMAS.md` — ¿regla nueva? → añadir
- [ ] `docs/canon/NORMAS-TRIDENTE.md` — ¿cambia filosofía del Tridente?
- [ ] `docs/canon/PROTOCOLO-INICIO-SESION.md` — ¿cambió algo que afecte al inicio?

#### Decisiones
- [ ] `docs/adr/ADR-0XX-nombre.md` — crear si hay decisión estructural
- [ ] `docs/adr/INDEX.md` — actualizar si hay ADR nuevo (tabla + próximo libre)
- [ ] ADRs existentes relacionados — añadir nota si los afecta

#### Estado del sistema
- [ ] `docs/canon/ESTADO-SISTEMA.md` — números al día (repos, ADRs, islas, issues abiertos)
- [ ] `docs/canon/ownership-matrix.md` — si cambió estado/puerto/SLA de algún servicio

#### Islas y mapa
- [ ] `docs/islas/ESTADO-ISLA-NOMBRE.md` — crear/actualizar para cada isla tocada
- [ ] `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` — si entró o salió una isla

#### Pendientes
- [ ] `MASTER-PENDIENTES.md` — estado fases + tabla próxima sesión
- [ ] Issues — cerrar resueltos · crear nuevos detectados con label correcto
- [ ] Zombis — 0 archivos vacíos en raíz dew

### 2️⃣ yggdrasil-wiki — Conocimiento (segundo)

- [ ] `wiki/islas/NOMBRE.md` — actualizar concepto/estado de cada isla tocada
- [ ] `wiki/islas/INDEX.md` — columna Estado al día + números totales
- [ ] Islas deprecadas — status: deprecado en frontmatter + redirect visible

### 3️⃣ Repos operativos (solo los tocados en la sesión)

| Repo | Qué comprobar |
|---|---|
| `madre-config` | ¿cambió algún docker-compose o .env? → commit |
| `yggdrasil-scripts` | ¿script o Action nuevo/modificado? → commit |
| `yggdrasil-secops` | ¿hallazgo nuevo HAL-XXX? → issue + docs/hallazgos/ |
| `yggdrasil-tracking` | ¿algo personal que registrar? → diario personal |
| `yggdrasil-formacion-` | ¿aprendizaje técnico de hoy? → apuntes |
| `THDORA-PERSONAL` | ¿cambio en bot o prompts? → commit |
| `ollama-stack` | ¿modelo nuevo o config cambiada? → commit |

---

## 5 preguntas de cierre — el agente hace estas siempre

1. **¿Se tomó alguna decisión estructural hoy?**
   - Sí → ADR nuevo · No → continuar
2. **¿Algún archivo quedó colgado entre repos?**
   - Sí → propagar según árbol · No → continuar
3. **¿Algún issue resuelto sin cerrar en GitHub?**
   - Sí → cerrar con nota de resolución · No → continuar
4. **¿Algún hallazgo de seguridad o hardware detectado?**
   - Sí → HAL-XXX + issue secops · No → continuar
5. **¿El ESTADO-SISTEMA y MASTER-PENDIENTES reflejan la realidad ahora mismo?**
   - No → actualizar antes de cerrar · Sí → sesión cerrada ✅

---

## Regla de propagación entre repos

```
Decisión tomada
  ↓
[1] yggdrasil-dew
    ADR + diario + MASTER-PENDIENTES + ESTADO-SISTEMA
  ↓
[2] yggdrasil-wiki
    isla afectada + INDEX
  ↓
[3] Repo operativo afectado
    madre-config / secops / scripts / tracking / formacion
```

Nunca al revés. Nunca saltar nivel. Nunca actualizar solo el repo operativo.

---

## Mapa completo de archivos canon

| Archivo | Repo | Actualizar cuando |
|---|---|---|
| `docs/diarios/YYYY-MM-DD.md` | dew | Siempre — cada sesión sin excepción |
| `MASTER-PENDIENTES.md` | dew | Siempre — cada sesión sin excepción |
| `docs/canon/ESTADO-SISTEMA.md` | dew | Cambia número repos / ADRs / islas / issues |
| `docs/canon/ownership-matrix.md` | dew | Cambia estado / SLA / puerto de servicio Docker |
| `NORMAS.md` | dew | Se establece norma nueva |
| `docs/canon/NORMAS-TRIDENTE.md` | dew | Cambia filosofía del Tridente |
| `docs/adr/ADR-0XX.md` | dew | Decisión estructural tomada |
| `docs/adr/INDEX.md` | dew | ADR nuevo (tabla + próximo libre) |
| `docs/islas/ESTADO-ISLA-NOMBRE.md` | dew | Isla auditada, creada o cambiada |
| `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` | dew | Isla entra o sale del ecosistema |
| `wiki/islas/NOMBRE.md` | wiki | Concepto, repo o filosofía de isla cambia |
| `wiki/islas/INDEX.md` | wiki | Estado de cualquier isla cambia |
| `madre-config/` | madre-config | Docker-compose o .env modificado |
| `yggdrasil-scripts/` | scripts | Script o Action creado o modificado |
| `docs/hallazgos/HAL-XXX.md` | dew | Incidente, bug crítico o vulnerabilidad |

---

## Profundidad según tipo de sesión

| Tipo | Checklist | Mínimo obligatorio |
|---|---|---|
| Sesión larga (+1h) | Completo | Todo |
| Sesión corta (15–30 min) | Parcial | Diario + issues + MASTER-PENDIENTES |
| Ritual semanal (domingo) | Completo + ESTADO-SISTEMA semanal | Todo |
| Emergencia / hotfix | Mínimo | HAL-XXX + diario |
| Sesión de formación | Parcial | Diario + apuntes en formacion- |

---

_Creado: 2026-07-13 · v3 — grado profesional · todas las repos · ADR-012 · Perplexity MCP_
