---
tipo: auditoria
author: Alvaro Fernandez Mota
fecha: 2026-07-18
ruta: docs/canon/AUDITORIA-GAPS-REPOS.md
tags: [auditoria, gaps, repos, huecos, pendiente]
status: vigente
---

# AUDITORÍA DE GAPS — Qué falta en cada repo

> Mapa completo de huecos detectados en el ecosistema.
> Fuente: auditoría Perplexity-MCP 2026-07-18 03:07 CEST
> Actualizar cuando se cierre un hueco.

---

## Leyenda

| Símbolo | Significado |
|---|---|
| ✅ | Existe y está bien |
| 🟡 | Existe pero incompleto/desactualizado |
| 🔴 | Falta — debe crearse |
| ⏳ | Pendiente de terminal/input humano |

---

## Mapa de gaps por repo

### `yggdrasil-dew` (Canon/Gobernanza)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | ✅ | — |
| AGENT.md | ✅ | — |
| CONTEXT.md | ✅ | — |
| ESTADO-SISTEMA.md | ✅ F29 | — |
| docs/canon/PROTOCOLO-INTER-REPOS.md | ✅ Recién creado | — |
| docs/sesiones/ | ✅ | — |
| docs/runbooks/ | 🟡 Incompleto | Completar con datos reales (Issue #60) |
| scripts/ygg-madre.sh | ✅ | — |
| scripts/env-checker.sh | ✅ | — |
| .github/workflows/check-names.yml | 🔴 | Crear GitHub Action (Issue #66) |

### `yggdrasil-orquestador` (Orquestador)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar con rol actual |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🔴 | **CREAR** — falta completamente |
| BOOTSTRAP.md | ✅ v2 | — |

### `WIKI---PERSONAL` (Conocimiento)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar con lista de islas activas |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar con islas actuales |
| INDEX.md | 🟡 | Actualizar — refleja islas antiguas |
| islas/formacion.md | 🟡 | Parcial (Issue #56) |
| islas/filosofia.md | 🟡 | Parcial — Bloque 2 requiere input (Issue #57) |
| islas/impresion3d.md | 🟡 | Parcial (Issue #56) |
| islas/conocimiento.md | 🟡 | Parcial |
| islas/dev-labs.md | 🟡 | Parcial |
| islas/scripts.md | 🟡 | Parcial |
| islas/vida.md | 🟡 | Parcial |

### `madre-config` (Infra)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | ✅ | — |
| .env.template | 🔴 | **CREAR** — Issue #60 |
| docker/ estructura | 🟡 | Organizar por servicio |
| docs/SERVICIOS.md | 🔴 | **CREAR** — tabla de servicios + estado real |

### `ollama-stack` (IA Local)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar con modelos reales |
| .env.template | 🔴 | **CREAR** |
| docs/MODELOS.md | 🔴 | **CREAR** — pendiente `ollama list` en Madre |

### `yggdrasil-tracking` (Personal)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar |
| plantillas/PLANTILLA-DIARIO.md | 🔴 | **CREAR** (Issue #61) |
| diarios/ estructura canónica | 🟡 | Refactor pendiente (Issue #61) |

### `yggdrasil-formacion` (Formación)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar |
| INDEX.md | 🔴 | **CREAR** |

### `yggdrasil-secops` (Seguridad)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar |
| HAL/ estructura | 🟡 | Organizar HALs por prioridad |

### `yggdrasil-scripts` (Scripts)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar |
| scripts/ directorio | 🔴 | Mover scripts aquí desde otros repos |

### `acer-config` (Workstation)
| Archivo | Estado | Acción |
|---|---|---|
| README.md | 🟡 | Actualizar |
| AGENT.md | ✅ | — |
| CONTEXT.md | 🟡 | Actualizar |

---

## Resumen ejecutivo de gaps

| Categoría | Total | ✅ OK | 🟡 Incompleto | 🔴 Falta |
|---|---|---|---|---|
| README.md | 10 | 1 | 9 | 0 |
| AGENT.md | 10 | 10 | 0 | 0 |
| CONTEXT.md | 10 | 3 | 6 | 1 |
| Archivos específicos por tipo | 15 | 4 | 5 | 6 |

**Total archivos a crear/actualizar: ~20**
**Prioridad MCP (sin terminal): ~15**
**Prioridad terminal: ~5**

---

## Orden de ejecución recomendado (MCP)

### Bloque A — Archivos que crea Perplexity ahora (sin terminal)
1. `yggdrasil-orquestador/CONTEXT.md` — CREAR
2. `madre-config/docs/SERVICIOS.md` — CREAR
3. `ollama-stack/docs/MODELOS.md` — CREAR (esqueleto, datos reales tras SSH)
4. `yggdrasil-formacion/INDEX.md` — CREAR
5. `yggdrasil-tracking/plantillas/PLANTILLA-DIARIO.md` — CREAR
6. `madre-config/.env.template` — CREAR
7. `ollama-stack/.env.template` — CREAR
8. Todos los `README.md` desactualizados — ACTUALIZAR (x9)
9. Todos los `CONTEXT.md` incompletos — ACTUALIZAR (x6)

### Bloque B — Requieren terminal o input humano
1. `ollama-stack/docs/MODELOS.md` — datos reales: `ollama list`
2. `yggdrasil-tracking/diarios/` — refactor estructura (Issue #61)
3. `madre-config/docker/` — organizar servicios reales
4. `WIKI---PERSONAL/islas/*.md` incompletas — input Alvaro

---

_Creado: 2026-07-18 03:07 CEST · F29 · Perplexity-MCP_
