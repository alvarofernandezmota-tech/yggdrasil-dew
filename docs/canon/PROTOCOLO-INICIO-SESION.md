---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-INICIO-SESION.md
tags: [canon, inicio, sesion, protocolo, ritual]
status: vigente
adr: ADR-012
---

# 🟢 Protocolo de Inicio de Sesión

> Toda sesión de trabajo empieza con este protocolo.
> Objetivo: contexto completo + verificar que el cierre anterior fue correcto.
> Tiempo estimado: 5–10 minutos.
> Simétrico a: `PROTOCOLO-CIERRE-SESION.md`

---

## Paso 0 — Introspcción del cierre anterior

> Antes de leer el estado actual, verificar que la sesión anterior quedó bien cerrada.
> Es el checklist del cierre en modo lectura/verificación.
> Si algo faltó → corregirlo ahora antes de arrancar.

### yggdrasil-dew — verificar

- [ ] `docs/diarios/YYYY-MM-DD.md` (fecha de la última sesión) — ¿existe y tiene bloque de cierre?
- [ ] `MASTER-PENDIENTES.md` — ¿la fecha de actualización corresponde a la última sesión?
- [ ] `docs/canon/ESTADO-SISTEMA.md` — ¿los números cuadran con lo que recuerdas?
- [ ] `docs/canon/ownership-matrix.md` — ¿servicio caído sin issue HAL abierto?
- [ ] `docs/adr/INDEX.md` — ¿el número de ADRs cuadra?
- [ ] Raíz dew — ¿hay archivos zombi que no deberían estar?
- [ ] Issues — ¿alguno resuelto en el diario pero aún abierto en GitHub?

### yggdrasil-wiki — verificar

- [ ] `wiki/islas/INDEX.md` — ¿número de islas y estados cuadran?
- [ ] Islas tocadas en la última sesión — ¿están actualizadas?

### Resultado

| ¿Todo correcto? | Acción |
|---|---|
| ✅ Sí | Continuar a Fase 1 |
| ❌ Falta algo | Corregirlo ahora → luego Fase 1 |

---

## Fase 1 — Lectura obligatoria archivo por archivo

Orden estricto. No editar todavía — solo leer.

### 1.1 — Estado del ecosistema (yggdrasil-dew)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Estado del sistema | `docs/canon/ESTADO-SISTEMA.md` | Números: repos, ADRs, islas, issues abiertos, servicios caídos |
| Pendientes maestros | `MASTER-PENDIENTES.md` | Estado fases, pendientes, prioridad de esta sesión |
| Último diario | `docs/diarios/YYYY-MM-DD.md` | Dónde quedamos, qué sigue, issues cerrados |
| Ownership matrix | `docs/canon/ownership-matrix.md` | ¿Servicio Docker caído? → Si 🔴 → va antes que todo |
| Normas vigentes | `NORMAS.md` | Reglas activas — leer si +48h sin sesión |
| Normas Tridente | `docs/canon/NORMAS-TRIDENTE.md` | Qué va en cada repo — leer si hay duda |

### 1.2 — Decisiones y arquitectura (yggdrasil-dew)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Índice ADRs | `docs/adr/INDEX.md` | Último ADR vigente, próximo número libre |
| Plan maestro | `docs/canon/PLAN-MAESTRO-FASES.md` | Fases del plan, dónde estamos en el roadmap |
| ADR relevante | `docs/adr/ADR-0XX-nombre.md` | Solo si la sesión toca un área con ADR reciente |

### 1.3 — Estado de islas (yggdrasil-dew) — las relevantes para la sesión

| ESTADO-ISLA | Ruta | Leer si la sesión toca... |
|---|---|---|
| Infra | `docs/islas/ESTADO-ISLA-INFRA.md` | Madre, Docker, servicios, IaC |
| Seguridad | `docs/islas/ESTADO-ISLA-SEGURIDAD.md` | SecOps, HAL, vulnerabilidades, tripwires |
| THDORA | `docs/islas/ESTADO-ISLA-THDORA.md` | Bot Telegram, THDORA-PERSONAL, FastAPI |
| IA Local | `docs/islas/ESTADO-ISLA-IA-LOCAL.md` | Ollama, RAG, Qdrant, LiteLLM, Open-WebUI |
| Scripts | `docs/islas/ESTADO-ISLA-SCRIPTS.md` | CI, Actions, scripts bash, yggdrasil-scripts |
| Tracking | `docs/islas/ESTADO-ISLA-TRACKING.md` | Vida personal, diarios, metas, filosofía |
| Formación | `docs/islas/ESTADO-ISLA-FORMACION.md` | Cursos, apuntes técnicos, HTB |
| Acer | `docs/islas/ESTADO-ISLA-ACER.md` | Laptop, dotfiles, Arch, Hyprland |
| Labs | `docs/islas/ESTADO-ISLA-LABS.md` | dev-labs, experimentos, PoCs |
| Cerebro | `docs/islas/ESTADO-ISLA-CEREBRO.md` | local-brain, embeddings, pgvector |
| Mapa deps | `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` | Relaciones entre islas, entrada/salida repos |

### 1.4 — Wiki (yggdrasil-wiki)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Índice islas | `wiki/islas/INDEX.md` | Estado de todas las islas, números totales |
| Isla específica | `wiki/islas/NOMBRE.md` | Concepto, repo, estado — solo las relevantes |

### 1.5 — Issues (GitHub — yggdrasil-dew)

| Prioridad | Qué revisar antes de arrancar |
|---|---|
| 🔴🔴 | Seguridad o hardware crítico → bloquean el resto, van siempre primero |
| 🔴 | Bloqueantes funcionales → resolver antes de cualquier otra cosa |
| 🟠 | Requieren terminal → agrupar y ejecutar juntos |
| 🟡 | MCP puede ejecutar sin terminal → candidatos para esta sesión |

---

## Fase 2 — Declarar el objetivo de la sesión

Antes del primer commit, definir:

```
Sesión: YYYY-MM-DD HH:MM
Tipo: Larga (+1h) / Corta (30min) / Emergencia / Formación
Terminal disponible: Sí / No

Objetivo 1: [issue #N o fase FX] — [acción concreta medible]
Objetivo 2: [issue #N o fase FX] — [acción concreta medible]
Objetivo 3: [issue #N o fase FX] — [acción concreta medible]

No entrar en: [qué queda fuera de esta sesión]
```

---

## Fase 3 — Verificación de consistencia (solo si +24h sin sesión)

- [ ] `docs/adr/INDEX.md` — número de ADRs cuadra
- [ ] `wiki/islas/INDEX.md` — número de islas cuadra
- [ ] `docs/canon/ESTADO-SISTEMA.md` — fecha de actualización reciente
- [ ] `MASTER-PENDIENTES.md` — refleja la última sesión
- [ ] Raíz dew — sin archivos zombi

---

## 4 preguntas de inicio — el agente hace estas al arrancar

1. **¿Cuánto tiempo tienes y tienes terminal?** → Define alcance y tipo de issues
2. **¿Algún servicio caído o cambio desde la última sesión?** → Sí: HAL-XXX primero
3. **¿Se decidió algo fuera de sesión?** → Sí: documentar antes de ejecutar
4. **¿Hay algo urgente sin issue todavía?** → Sí: crear issue con label ahora

---

## Mapa de repos — cuándo abrir cada uno

| Repo | Abrir si... |
|---|---|
| `yggdrasil-dew` | Siempre — punto de entrada obligatorio |
| `yggdrasil-wiki` | Hay isla que consultar o actualizar |
| `yggdrasil-tracking` | Hay algo personal o vital que registrar |
| `yggdrasil-formacion-` | La sesión incluye aprendizaje técnico |
| `madre-config` | Cambio en servicios Docker de Madre |
| `yggdrasil-scripts` | Script o Action nuevo o modificado |
| `yggdrasil-secops` | Hallazgo de seguridad o HAL nuevo |
| `THDORA-PERSONAL` | Trabajo en bot Telegram o prompts |
| `ollama-stack` | LLM local, RAG, modelos Ollama |
| `acer-config` | Dotfiles o config Arch/Hyprland |
| `dev-labs` | Experimentos o sandbox |
| `local-brain` | RAG avanzado, embeddings, pgvector |

---

## Regla de oro

> **Nunca ejecutar sin contexto. Nunca asumir que el estado es igual que ayer.**
> El Paso 0 garantiza que el cierre anterior fue completo antes de seguir adelante.

---

_Creado: 2026-07-13 · v3 — Paso 0 introspeción cierre · archivo x archivo · ADR-012 · Perplexity MCP_
