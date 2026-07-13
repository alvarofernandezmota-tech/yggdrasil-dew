---
tipo: template
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
ruta: docs/templates/ESTADO-ISLA-TEMPLATE.md
tags: [template, isla, estado]
status: vigente
---

# Template: ESTADO-ISLA-[NOMBRE].md

> Un archivo por isla. Actualizar en Fase 4 del protocolo de cierre.  
> El agente lee SOLO los relevantes para la sesión en curso.

---

## Contenido del archivo

```markdown
---
tipo: estado-isla
isla: [NOMBRE]
actualizado: YYYY-MM-DD
status: 🟢 Operativa | 🟡 Parcial | 🔴 Caída | 🔧 En obras
---

# 🏝️ Estado Isla — [NOMBRE COMPLETO]

> Resumen ejecutivo del estado actual de esta isla.
> No es documentación técnica — es instantánea de estado para contexto rápido.

---

## Estado actual

| Campo | Valor |
|---|---|
| Estado | 🟢 Operativa |
| Última revisión | YYYY-MM-DD |
| Responsable | Álvaro |
| Repos relacionados | `repo-1`, `repo-2` |
| Issues activos | #N, #N |

---

## Servicios / componentes

| Servicio | Estado | Notas |
|---|---|---|
| [nombre] | 🟢 | — |
| [nombre] | 🟡 | [qué falla] |
| [nombre] | 🔴 | HAL-#N abierto |

---

## Cambios recientes

| Fecha | Cambio | Issue |
|---|---|---|
| YYYY-MM-DD | [qué se hizo] | #N |

---

## Próximos pasos

- [ ] [Issue #N] — [acción concreta]
- [ ] [Issue #N] — [acción concreta]

---

## Notas y contexto

[Contexto relevante para el agente. Decisiones tomadas, deuda técnica, dependencias.]
```

---

## Islas que necesitan su archivo (pendiente de crear)

| Archivo | Isla | Prioridad |
|---|---|---|
| `ESTADO-ISLA-INFRA.md` | Hardware Madre, Docker, IaC | 🔴 Alta |
| `ESTADO-ISLA-SEGURIDAD.md` | SecOps, HAL, secretos, certificados | 🔴 Alta |
| `ESTADO-ISLA-THDORA.md` | Bot Telegram, THDORA-PERSONAL | 🟠 Media |
| `ESTADO-ISLA-IA-LOCAL.md` | Ollama, RAG, LiteLLM, Qdrant, local-brain | 🟠 Media |
| `ESTADO-ISLA-TRACKING.md` | Vida personal, diarios, metas, yggdrasil-tracking | 🟡 Normal |
| `ESTADO-ISLA-SCRIPTS.md` | CI, GitHub Actions, scripts bash | 🟡 Normal |
| `ESTADO-ISLA-FORMACION.md` | Formación técnica activa, recursos | 🟡 Normal |

---

_Template v1 · 2026-07-13 · ADR-012_
