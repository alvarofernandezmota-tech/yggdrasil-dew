---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/NORMAS-TRIDENTE.md
tags: [canon, tridente, normas, dew, wiki, vidapersonal]
status: vigente
---

# Normas del Tridente — DEW ↔ Wiki ↔ VIDAPERSONAL

> Este documento es la norma operativa del ecosistema.
> La filosofía detrás está en `wiki/islas/filosofia.md`.
> La decisión formal está en `docs/adr/ADR-005`.

---

## El triángulo

```
         🛠️ DEW
        /       \
    (plan)   (decisiones)
      /           \
📚 Wiki ——————— 🌱 VIDAPERSONAL
  (conocimiento)    (vida)
```

---

## Reglas por vértice

### 🛠️ DEW (`yggdrasil-dew`)
**El cerebro técnico.**

✅ Entra en DEW:
- Plan maestro, fases, roadmap
- ADRs (toda decisión técnica)
- Issues (toda tarea pendiente — nunca en el chat)
- Logs de sesión técnica
- Auditorías, incidentes HAL, diagramas C4
- Ownership matrix de servicios

❌ No entra en DEW:
- Reflexiones personales
- Rituales, emociones, vida privada
- Notas de conocimiento general (eso va en Wiki)

---

### 📚 Wiki (`yggdrasil-wiki`)
**El conocimiento del ecosistema.**

✅ Entra en Wiki:
- Islas — una ficha por dispositivo/servicio/área
- Cómo funciona cada cosa (conocimiento atemporal)
- Modelo mental y filosofía del sistema
- Agentes IA — cómo trabajar con cada uno
- Convenciones y glosario

❌ No entra en Wiki:
- Tareas pendientes (van en DEW como issues)
- Vida personal (va en VIDAPERSONAL)
- Logs operativos de sesión (van en DEW)

---

### 🌱 VIDAPERSONAL
**La vida.**

✅ Entra en VIDAPERSONAL:
- Diario diario (`01_diarios/YYYY-MM-DD.md`)
- Metas y hábitos con tracking
- Reflexiones personales, rituales, emociones
- Proyectos personales no técnicos
- `now.md` — estado semanal

❌ No entra en VIDAPERSONAL:
- Código o infra
- Issues técnicos
- Logs de sistema o auditorías

---

## Tabla de decisión rápida

| ¿Qué tengo? | ¿Dónde va? |
|-------------|----------|
| Una decisión técnica | DEW → ADR |
| Una tarea pendiente | DEW → issue |
| Una reflexión sobre cómo funciona algo | Wiki → isla |
| Una reflexión personal / emoción | VIDAPERSONAL → diario |
| Una meta o hábito | VIDAPERSONAL → metas |
| Un incidente de sistema | DEW → issue HAL |
| Cómo usar un agente IA | Wiki → wiki/agentes/ |
| Un log de sesión | DEW → docs/sesiones/ |

---

## Regla de alineación

> Cuando algo cambia en un vértice, los otros dos se actualizan en el mismo commit o en la misma sesión.

- Fix en Madre → issue DEW cerrado + isla Wiki actualizada
- Reflexión personal → diario VIDAPERSONAL + referencia en log sesión DEW
- Nueva isla Wiki → mencionada en PLAN-MAESTRO DEW + entrada en diario si fue decisión importante

---

_Creado: 2026-07-13 · Ver ADR-005 para la decisión formal_
