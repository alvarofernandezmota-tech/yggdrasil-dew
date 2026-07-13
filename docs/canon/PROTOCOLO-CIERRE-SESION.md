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
> Sin cierre formal, las decisiones y cambios se pierden o quedan descolgados.
> Orden: DEW primero → WIKI segundo → repos operativos tercero.

---

## Árbol de decisiones — ¿dónde va cada cosa?

```
¿Qué tipo de contenido es?
│
├── Decisión de arquitectura o cambio estructural
│   └── → ADR nuevo en docs/adr/ADR-0XX.md
│       + actualizar ADRs relacionados que lo referencian
│       + actualizar docs/adr/INDEX.md
│
├── Qué se hizo en la sesión, decisiones, issues cerrados
│   └── → docs/diarios/YYYY-MM-DD.md (crear o añadir sección)
│
├── Tarea pendiente o bug accionable con fecha
│   └── → Issue en yggdrasil-dew (o repo afectado)
│       + reflejar en MASTER-PENDIENTES.md
│
├── Norma nueva del ecosistema
│   └── → NORMAS.md (sección correspondiente)
│       + si es cambio grande → ADR también
│
├── Estado de una isla (qué hay, qué falta, auditoría)
│   └── → docs/islas/ESTADO-ISLA-NOMBRE.md
│       + actualizar wiki/islas/NOMBRE.md si cambia el concepto
│       + actualizar wiki/islas/INDEX.md con el nuevo estado
│
├── Concepto, relación entre islas, mapa mental
│   └── → wiki/islas/NOMBRE.md o wiki/mapas/
│
├── Hallazgo técnico (bug, vulnerabilidad, incidente)
│   └── → docs/hallazgos/HAL-XXX.md
│       + Issue en yggdrasil-secops si es seguridad
│
├── Config operativa de un servicio
│   └── → madre-config/ o repo del servicio
│
└── Vida personal, diario, meta, reflexión
    └── → yggdrasil-tracking
        + formación técnica → yggdrasil-formacion-
```

---

## Checklist de cierre — orden obligatorio

### 1️⃣ DEW — Cerebro (siempre primero)

- [ ] **Diario** `docs/diarios/YYYY-MM-DD.md` creado o actualizado
  - Decisiones tomadas
  - Issues cerrados con número
  - Estado del sistema al cierre
  - Próxima sesión — qué sigue
- [ ] **ADRs** — ¿se tomó alguna decisión estructural? → ADR nuevo
- [ ] **ADRs relacionados** — ¿alguno ya existente quedó desactualizado? → actualizar
- [ ] **ADR INDEX** actualizado si hay ADR nuevo
- [ ] **MASTER-PENDIENTES.md** — estado real de fases + próximas tareas
- [ ] **NORMAS.md** — ¿se estableció alguna norma nueva? → añadir
- [ ] **Issues** — cerrar los resueltos, crear los nuevos detectados
- [ ] **Zombis** — verificar que no hay archivos vacíos en raíz dew

### 2️⃣ WIKI — Conocimiento (segundo)

- [ ] **INDEX.md** actualizado si cambió el estado de alguna isla
- [ ] **Isla afectada** `wiki/islas/NOMBRE.md` actualizada si cambió su concepto o repo
- [ ] **VIDAPERSONAL.md** o cualquier isla deprecada → marcada como redirect
- [ ] Números del INDEX (islas totales, completas, stubs) al día

### 3️⃣ Repos operativos (si aplica)

- [ ] `madre-config` — ¿se hizo algún cambio en servicios? → documentar
- [ ] `yggdrasil-tracking` — ¿hay algo de vida personal pendiente de registrar?
- [ ] `yggdrasil-secops` — ¿hay hallazgo de seguridad nuevo? → issue HAL-XXX
- [ ] Cualquier otro repo afectado por la sesión

---

## Preguntas de cierre — el agente siempre hace estas

Antes de cerrar la sesión, el agente pregunta:

1. **¿Se tomó alguna decisión importante hoy?** → Si sí → ADR
2. **¿Algún archivo quedó colgado?** → Si sí → actualizar o borrar
3. **¿Algún issue nuevo detectado?** → Si sí → crear issue
4. **¿Algún issue cerrado que no esté cerrado en GitHub?** → Cerrar
5. **¿El diario refleja todo lo que pasó?** → Si no → completar

---

## Regla de propagación entre repos

Cuando un cambio afecta a más de un repo, la cadena de propagación es:

```
Decisión
  ↓
DEW (ADR + diario + MASTER-PENDIENTES)
  ↓
WIKI (isla + INDEX)
  ↓
Repo operativo afectado (si aplica)
```

Nunca al revés. Nunca saltarse un nivel. Nunca actualizar solo el repo operativo sin dejar rastro en DEW.

---

## Frecuencia

| Tipo de sesión | Cierre requerido |
|---|---|
| Sesión larga (+1h) | Cierre completo (checklist entero) |
| Sesión corta (15-30min) | Mínimo: diario + issues |
| Ritual semanal (domingo) | Cierre completo + MASTER-PENDIENTES semanal |
| Emergencia/hotfix | Mínimo: hallazgo HAL-XXX + diario |

---

_Creado: 2026-07-13 · ADR-012 · Perplexity MCP_
