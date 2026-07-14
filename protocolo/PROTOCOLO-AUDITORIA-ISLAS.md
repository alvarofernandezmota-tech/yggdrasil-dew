---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-14
version: 1.0
tags: [auditoria, islas, ecosistema, macro, todos-los-repos]
status: vigente
---

# PROTOCOLO-AUDITORIA-ISLAS v1

> Auditoría macro de TODOS los repos activos del ecosistema Yggdrasil.
> Este protocolo orquesta las auditorías de cada isla en el orden correcto.
> Es el dominó completo: ningún repo se queda sin ver.

---

## CUÁNDO EJECUTAR

```
- Primer lunes de cada mes (auditoría mensual)
- Después de crear o deprecar un repo
- Cuando ESTADO-SISTEMA.md tiene 3 o más islas en 🟡 o 🔴
- Antes de una migración de arquitectura importante
- Cuando el usuario pide "audita todo"
```

---

## ORDEN DE EJECUCIÓN — EL DOMINÓ

El orden importa. Las capas superiores definen las reglas que las inferiores deben cumplir.

```
PASO 0 — Prerequisito
  └→ Ejecutar PROTOCOLO-CONTEXTO-MACRO
       (cargar estado actual antes de auditar)

PASO 1 — Cerebro / Ley máxima
  └→ PROTOCOLO-AUDITORIA-DEW
       (yggdrasil-dew — si hay 🔴 aquí, todo el ecosistema está en riesgo)

PASO 2 — Cerebro / Conocimiento
  └→ PROTOCOLO-AUDITORIA-WIKI
       (yggdrasil-wiki)

PASO 3 — Tracking / Vida personal
  └→ PROTOCOLO-AUDITORIA-TRACKING
       (yggdrasil-tracking)

PASO 4 — Repos activos sin protocolo específico
  └→ PROTOCOLO-AUDITORIA-PROYECTO (aplicar a cada uno)
       Orden por prioridad:
       4a. formacion-tech
       4b. investigacion-ia
       4c. madre-config
       4d. acer-config
       4e. ollama-stack
       4f. local-brain
       4g. THDORA-PERSONAL
       4h. yggdrasil-secops
       4i. osint-stack
       4j. yggdrasil-scripts
       4k. dev-labs

PASO 5 — Verificar repos deprecados
  └→ Confirmar que siguen archivados y no reciben commits nuevos:
       - yggdrasil-formacion- (migrado 2026-07-13)
       - thea-ia
       - ai-toolkit
       - image-calculator
       - impresion-3d
```

---

## CHECKLIST MÍNIMO POR REPO (PASO 4)

Para cada repo en el PASO 4, verificar al menos:

| Check | Pregunta |
|---|---|
| 🔑 Secretos | ¿Hay secretos expuestos? Scan de patrones. |
| 📄 README | ¿Existe README.md actualizado? |
| 🏝️ Estado isla | ¿Existe ESTADO-ISLA.md? ¿Está actualizado? |
| 📋 Issues | ¿Hay issues de `prioridad:alta` sin asignar? |
| 🌿 Branches | ¿Hay branches muertos (>14 días sin actividad)? |
| 📝 Commits | ¿Los últimos 5 commits siguen Conventional Commits? |
| 🔗 Ecosistema | ¿Aparece en ECOSYSTEM-ARCHITECTURE.md con el estado correcto? |

---

## TABLA DE ESTADO — LLENAR DURANTE LA AUDITORÍA

| Repo | Secretos | README | Estado isla | Issues urgentes | Commits | Ecosistema | Estado final |
|---|---|---|---|---|---|---|---|
| `yggdrasil-dew` | — | — | — | — | — | — | — |
| `yggdrasil-wiki` | — | — | — | — | — | — | — |
| `yggdrasil-tracking` | — | — | — | — | — | — | — |
| `formacion-tech` | — | — | — | — | — | — | — |
| `investigacion-ia` | — | — | — | — | — | — | — |
| `madre-config` | — | — | — | — | — | — | — |
| `acer-config` | — | — | — | — | — | — | — |
| `ollama-stack` | — | — | — | — | — | — | — |
| `local-brain` | — | — | — | — | — | — | — |
| `THDORA-PERSONAL` | — | — | — | — | — | — | — |
| `yggdrasil-secops` | — | — | — | — | — | — | — |
| `osint-stack` | — | — | — | — | — | — | — |
| `yggdrasil-scripts` | — | — | — | — | — | — | — |
| `dev-labs` | — | — | — | — | — | — | — |

**Leyenda:** ✅ OK · 🟡 Deuda · 🔴 Crítico · ❌ No existe

---

## ACCIONES POST-AUDITORÍA

### Issues a crear

Por cada 🔴 detectado → crear issue en el repo correspondiente con:
```
Título: [AUDITORÍA] [CRÍTICO] Descripción del problema
Label: tipo:bug + prioridad:alta + capa:[nombre]
Body: Resultado del bloque de auditoría + pasos de resolución
```

Por cada 🟡 detectado → crear issue con:
```
Título: [AUDITORÍA] [DEUDA] Descripción del problema
Label: tipo:deuda + prioridad:media + capa:[nombre]
```

### Actualizar ESTADO-SISTEMA.md

Después de la auditoría, actualizar el estado de cada isla en `yggdrasil-dew/ESTADO-SISTEMA.md`.

---

## INFORME FINAL MACRO

```
[AUDITORÍA-ISLAS COMPLETADA]
Fecha: YYYY-MM-DD HH:MM CEST
Duración: [X horas]

RESUMEN:
  Repos auditados: 14
  Repos limpios (✅): [N]
  Repos con deudas (🟡): [N] — [lista]
  Repos críticos (🔴): [N] — [lista]

ISSUES CREADOS:
  Críticos: [N]
  Deudas: [N]
  Total: [N]

DEPRECADOS verificados: 5 (todos archivados ✅/❌)

PRÓXIMAS ACCIONES (por orden de prioridad):
  1. [acción más urgente]
  2. [segunda acción]
  ...

ESTADO DEL ECOSISTEMA: ✅ SANO / 🟡 CON DEUDAS / 🔴 ATENCIÓN REQUERIDA
```

---

_v1.0 · 2026-07-14 · Dominó completo — 14 repos activos del ecosistema Yggdrasil_
