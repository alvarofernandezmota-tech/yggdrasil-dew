---
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/diarios/2026-07-06-plan-vidapersonal.md
tags: [plan, vidapersonal, thdora, python, integracion]
status: pendiente
---

# 📋 Plan 2026-07-06 — VIDAPERSONAL + integración ecosistema

> Continuación de la sesión del 05-07-2026.
> Plan técnico de lo que VIDAPERSONAL necesita del ecosistema.

---

## Limpieza VIDAPERSONAL

Detalle completo → [`VIDAPERSONAL/00_sistema/PENDIENTE-MANANA.md`](https://github.com/alvarofernandezmota-tech/VIDAPERSONAL/blob/main/00_sistema/PENDIENTE-MANANA.md)

Resumen técnico:
- Unificar estructura de diarios: un archivo por día, carpetas por mes `YYYY-MM/`
- Eliminar duplicados: `03_proyectos` y `05_proyectos` → uno solo
- Mover diario de hoy al sitio correcto `2026-07/`

---

## Pipeline Python → VIDAPERSONAL

Objetivo: analizar los datos del tracking diario con Python.

```
VIDAPERSONAL (diarios, tracking, entrenamiento)
     ↓
Python / Jupyter (análisis, patrones, tendencias)
     ↓
Grafana en Madre (dashboards personales)
     ↓
THDORA bot (consultas desde móvil)
```

ADR pendiente: documentar esta decisión cuando se implemente.

---

## Integración THDORA → VIDAPERSONAL

Escribir en el diario desde Telegram sin abrir GitHub:

| Comando | Acción |
|---|---|
| `/diario "texto"` | Commit en `01_traking_diario/01_diarios/YYYY-MM/YYYY-MM-DD.md` |
| `/meta "texto"` | Append en `02_metas/` |
| `/reflexion "texto"` | Commit en `03_reflexiones/` |
| `/curiosidad "texto"` | Commit en `04_curiosidad/` |

Implementación: GitHub API desde THDORA bot. ADR-002 cuando se decida.

---

## Formación — separación definitiva

| Dónde | Qué vive |
|---|---|
| `VIDAPERSONAL/02_formacion/` | Formación personal: libros de vida, crecimiento, cursos no técnicos |
| `wiki/islas/formacion.md` | Plan de aprendizaje técnico del ecosistema |

No hay que mover nada. Son contextos distintos.

---

_Escrito: 2026-07-06 00:09 CEST · Perplexity-MCP_
