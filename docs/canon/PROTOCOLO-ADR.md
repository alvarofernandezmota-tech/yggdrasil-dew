---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-ADR.md
tags: [canon, adr, protocolo, decisiones, arquitectura]
status: vigente
adr: ADR-008
---

# 📐 Protocolo ADR — Architecture Decision Records

> Un ADR documenta una decisión de arquitectura: qué se decidió, por qué, y qué alternativas se descartaron.
> Referencia formal: `docs/adr/ADR-008-adr-obligatorio-por-decision.md`
> Índice de todos los ADRs: `docs/adr/INDEX.md`

---

## Cuándo crear un ADR — obligatorio vs opcional

### ❌ Obligatorio — sin ADR la decisión no es oficial

| Tipo de decisión | Ejemplo |
|---|---|
| Crear o eliminar un repo del ecosistema | Crear yggdrasil-tracking |
| Cambiar la estructura del Tridente | Separar VIDAPERSONAL en dos repos |
| Adoptar una nueva tecnología o stack | Usar Qdrant como vector store |
| Definir un protocolo nuevo (inicio, cierre, auditoría) | PROTOCOLO-CIERRE-SESION.md |
| Cambiar cómo se organiza el canon | Nueva convención de islas |
| Deprecar un repo o isla | VIDAPERSONAL → deprecado |
| Decidir cómo se gestiona la seguridad | Blue team, tripwires, canary |
| Cambio en la estrategia de CI/CD | Scripts centralizados en yggdrasil-scripts |

### ✅ Opcional — puede ir solo en diario o issue

| Tipo | Dónde va si no hay ADR |
|---|---|
| Cambio puntual de configuración | Issue + commit en madre-config |
| Fix de bug o incidente | HAL-XXX + issue |
| Refactor interno sin cambio estructural | Commit descriptivo + diario |
| Decisión revertible en menos de 1 sesión | Diario |

### Regla rápida

> Si dentro de 6 meses alguien (o tú mismo) se preguntaría «¿por qué está esto así?» → ADR obligatorio.

---

## Cómo numerarlo

1. Consultar `docs/adr/INDEX.md` — ver fila **“Próximo ADR libre”**
2. Usar ese número con cero a la izquierda: `ADR-013`, `ADR-014`...
3. El nombre del archivo sigue el patrón: `ADR-0XX-nombre-corto-con-guiones.md`
4. Nunca reutilizar un número, aunque el ADR se deprece

---

## Secciones obligatorias de un ADR

Todo ADR debe tener exactamente estas secciones en este orden:

```markdown
## Contexto
¿Qué situación o problema llevó a tomar esta decisión?
Sin contexto, la decisión no se puede evaluar en el futuro.

## Decisión
¿Qué se decide exactamente? Una frase clara y directa.

## Alternativas consideradas
| Alternativa | Por qué se descartó |
|---|---|
| Opción A | Motivo |
| Opción B | Motivo |

## Consecuencias
- Qué cambia en el ecosistema
- Qué archivos hay que actualizar
- Qué ADRs anteriores quedan afectados
- Deuda técnica o riesgos que introduce

## Estado
Vigente / Deprecado / Superado por ADR-0XX
```

---

## Qué actualizar cuando se crea un ADR nuevo

Obligatorio en el mismo commit o en la misma sesión:

- [ ] `docs/adr/INDEX.md` — añadir fila + actualizar “Próximo ADR libre”
- [ ] ADRs existentes afectados — añadir nota: `Actualizado por ADR-0XX (YYYY-MM-DD)`
- [ ] `docs/diarios/YYYY-MM-DD.md` — registrar la decisión en el diario de la sesión
- [ ] `docs/canon/ESTADO-SISTEMA.md` — actualizar número de ADRs vigentes
- [ ] `MASTER-PENDIENTES.md` — si el ADR abre nuevas tareas → crear issues

Opcional según el alcance:
- [ ] `NORMAS.md` — si el ADR establece una norma operativa
- [ ] `docs/canon/NORMAS-TRIDENTE.md` — si afecta a la filosofía del Tridente
- [ ] `wiki/islas/NOMBRE.md` — si afecta al concepto de una isla

---

## Plantilla lista para copiar

```markdown
---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
ruta: docs/adr/ADR-0XX-nombre-corto.md
tags: [adr, TEMA]
status: vigente
---

# ADR-0XX — Título de la decisión

## Contexto

[Describe la situación o problema]

## Decisión

[Una frase directa: «Se decide X»]

## Alternativas consideradas

| Alternativa | Por qué se descartó |
|---|---|
| | |

## Consecuencias

- [Qué cambia]
- [Archivos a actualizar]
- [ADRs afectados]
- [Deuda o riesgos]

## Estado

Vigente · YYYY-MM-DD

---

_Creado: YYYY-MM-DD · Perplexity MCP_
```

---

## Ciclo de vida de un ADR

```
Necesidad detectada
    ↓
Consultar INDEX.md → número libre
    ↓
Crear ADR-0XX con plantilla
    ↓
Actualizar INDEX.md + ADRs afectados + ESTADO-SISTEMA
    ↓
Registrar en diario de sesión
    ↓
[Vigente]
    ↓ (si se supera)
[Deprecado — superado por ADR-0YY]
```

---

_Creado: 2026-07-13 · Referencia ADR-008 · Próximo libre: ADR-013 · Perplexity MCP_
