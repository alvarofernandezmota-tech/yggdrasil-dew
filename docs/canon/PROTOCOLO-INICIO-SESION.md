---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-INICIO-SESION.md
tags: [canon, inicio, sesion, protocolo, ritual]
status: vigente
version: 4
adr: ADR-012
---

# 🟢 Protocolo de Inicio de Sesión

> Toda sesión de trabajo empieza ejecutando este protocolo.  
> Objetivo: contexto completo en menos de 10 minutos, sin asumir nada del estado anterior.  
> Simétrico a: `PROTOCOLO-CIERRE-SESION.md`

---

## CONTRATO AGENTE IA — lectura obligatoria antes de actuar

> **El agente NO ejecuta ninguna acción hasta completar esta fase.**  
> El agente lee estos archivos en este orden exacto. Sin excepciones.

```
ORDEN DE LECTURA OBLIGATORIA AL INICIO DE SESIÓN:

[1] Issue de apertura (label: apertura-sesion) — el más reciente abierto
    → Contexto exacto: dónde quedamos, qué toca hoy, repos tocados, bloqueos
    → Si no existe → avisar a Álvaro antes de continuar

[2] ESTADO-SISTEMA.md (raíz dew)
    → Números actuales: repos, ADRs, islas, issues abiertos, servicios caídos
    → Si hay 🔴 en servicios → HAL activo → va antes que todo

[3] MASTER-PENDIENTES.md (raíz dew)
    → Fases del plan, prioridad de esta sesión, qué está bloqueado

[4] docs/canon/ownership-matrix.md
    → Solo si hay servicio en estado 🔴 o sesión toca infra

ARCHIVOS DE CONTEXTO SECUNDARIO — solo si la sesión los necesita:
[5] docs/diarios/YYYY-MM-DD.md (fecha última sesión) — leer si +24h sin sesión
[6] docs/islas/ESTADO-ISLA-*.md — solo los relevantes para los objetivos de hoy
[7] docs/adr/INDEX.md — solo si la sesión toca decisiones de arquitectura
```

**Regla de oro del agente:**
> Nunca asumir que el estado es igual que ayer.  
> Nunca actuar sin haber leído el issue de apertura.  
> Si hay contradicción entre archivos → preguntar a Álvaro antes de resolver.

---

## Paso 0 — Verificar que el cierre anterior fue correcto

Antes de arrancar, comprobar que la sesión anterior quedó bien cerrada.  
Si algo faltó → **corregirlo ahora, antes de declarar objetivos de hoy.**

### Checklist de verificación del cierre anterior

**yggdrasil-dew:**
- [ ] `docs/diarios/YYYY-MM-DD.md` (última sesión) — ¿existe y tiene bloque de cierre con issues cerrados?
- [ ] `MASTER-PENDIENTES.md` — ¿fecha de actualización corresponde a la última sesión?
- [ ] `ESTADO-SISTEMA.md` — ¿números cuadran con lo que recuerdas?
- [ ] `docs/adr/INDEX.md` — ¿número de ADRs cuadra?
- [ ] Issues GitHub — ¿alguno resuelto en diario pero aún abierto?
- [ ] Raíz dew — ¿hay archivos zombi o sin clasificar?

**yggdrasil-wiki:**
- [ ] `wiki/islas/INDEX.md` — ¿número de islas y estados cuadran?

**Repos operativos tocados en última sesión:**
- [ ] ¿Todos tienen `git push` hecho? (madre-config, scripts, tracking, secops...)

| Resultado | Acción |
|---|---|
| ✅ Todo correcto | Continuar a Fase 1 |
| ❌ Falta algo | Corregirlo ahora → luego Fase 1 |
| ❓ No recuerdo | Leer último diario y reconstruir |

---

## Fase 1 — Lectura de contexto (orden estricto, no editar todavía)

### 1.1 — Núcleo de estado (siempre)

| Archivo | Ruta | Qué extraer |
|---|---|---|
| Issue apertura | GitHub — label `apertura-sesion` | Objetivo sesión, repos a tocar, bloqueos, contexto exacto |
| Estado sistema | `ESTADO-SISTEMA.md` | Números: repos, ADRs, islas, issues, servicios caídos |
| Pendientes | `MASTER-PENDIENTES.md` | Fases activas, prioridad sesión, bloqueados |
| Ownership | `docs/canon/ownership-matrix.md` | Si hay 🔴 → HAL urgente antes que todo |

### 1.2 — Decisiones vigentes (si la sesión toca arquitectura)

| Archivo | Ruta | Qué extraer |
|---|---|---|
| Índice ADRs | `docs/adr/INDEX.md` | Último ADR, próximo número libre |
| ADR relevante | `docs/adr/ADR-0XX.md` | Solo el que afecta a los objetivos de hoy |
| Plan maestro | `docs/canon/PLAN-MAESTRO-FASES.md` | Fase actual del roadmap |

### 1.3 — Islas afectadas (solo las relevantes para hoy)

| ESTADO-ISLA | Cuándo leerlo |
|---|---|
| `ESTADO-ISLA-INFRA.md` | Sesión toca Madre, Docker, IaC, servicios |
| `ESTADO-ISLA-SEGURIDAD.md` | Sesión toca SecOps, HAL, vulnerabilidades |
| `ESTADO-ISLA-THDORA.md` | Sesión toca bot Telegram o THDORA-PERSONAL |
| `ESTADO-ISLA-IA-LOCAL.md` | Sesión toca Ollama, RAG, LiteLLM, Qdrant |
| `ESTADO-ISLA-TRACKING.md` | Sesión toca vida personal, diarios, metas |
| `ESTADO-ISLA-SCRIPTS.md` | Sesión toca CI, Actions, scripts bash |

### 1.4 — Wiki (solo si hay isla que consultar o actualizar)

| Archivo | Ruta |
|---|---|
| Índice islas | `wiki/islas/INDEX.md` |
| Isla específica | `wiki/islas/NOMBRE.md` |

---

## Fase 2 — Declarar objetivo de la sesión (antes del primer commit)

El agente hace estas **4 preguntas siempre**:

1. **¿Cuánto tiempo tienes disponible y tienes terminal?**  
   → Define alcance: larga (+1h) / corta (30min) / emergencia  
   → Sin terminal: solo MCP. Con terminal: terminal + MCP

2. **¿Algún servicio caído o cambio crítico desde la última sesión?**  
   → Sí: HAL-XXX primero, antes de cualquier otra cosa  
   → No: continuar

3. **¿Se tomó alguna decisión fuera de sesión que no está documentada?**  
   → Sí: crear ADR o issue antes de ejecutar  
   → No: continuar

4. **¿El objetivo de hoy tiene issue abierto con label correcto?**  
   → No: crear el issue antes de empezar  
   → Sí: continuar

### Plantilla de declaración de sesión

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SESIÓN: YYYY-MM-DD HH:MM CEST
TIPO: Larga (+1h) / Corta (30min) / Emergencia / Formación
TERMINAL: Sí / No
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OBJETIVO 1: [issue #N] — [acción concreta y medible]
OBJETIVO 2: [issue #N] — [acción concreta y medible]
OBJETIVO 3: [issue #N] — [acción concreta y medible] (opcional)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NO ENTRAR EN: [qué queda explícitamente fuera de esta sesión]
REPOS QUE SE VAN A TOCAR: [lista]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Fase 3 — Verificación de consistencia (solo si +48h sin sesión)

- [ ] `docs/adr/INDEX.md` — número de ADRs cuadra con archivos reales en `docs/adr/`
- [ ] `wiki/islas/INDEX.md` — número de islas cuadra con archivos reales
- [ ] `ESTADO-SISTEMA.md` — fecha de actualización no tiene más de 48h de antigüedad
- [ ] `MASTER-PENDIENTES.md` — refleja el estado real del backlog GitHub
- [ ] Raíz dew — sin archivos zombi o sin clasificar
- [ ] Issues con label `bloqueado` — ¿siguen bloqueados o se desbloquearon?

---

## Mapa de repos — cuándo abrir cada uno

| Repo | Abrir si... |
|---|---|
| `yggdrasil-dew` | **Siempre** — punto de entrada obligatorio |
| `WIKI---PERSONAL` | Hay isla que consultar o actualizar |
| `yggdrasil-tracking` | Hay algo personal o vital que registrar |
| `yggdrasil-formacion` | La sesión incluye aprendizaje técnico |
| `madre-config` | Cambio en servicios Docker de Madre |
| `yggdrasil-scripts` | Script o Action nuevo o modificado |
| `yggdrasil-secops` | Hallazgo de seguridad o HAL nuevo |
| `THDORA-PERSONAL` | Trabajo en bot Telegram o prompts IA |
| `ollama-stack` | LLM local, RAG, modelos Ollama |
| `acer-config` | Dotfiles o config Arch/Hyprland |
| `dev-labs` | Experimentos o sandbox |
| `local-brain` | RAG avanzado, embeddings, pgvector |

---

## Priorización de issues al inicio

| Prioridad | Cuándo | Acción |
|---|---|---|
| 🔴🔴 Crítico | Seguridad o hardware (puerto abierto, disco, secreto expuesto) | **Bloquea todo lo demás — resolver primero** |
| 🔴 Alta | Servicio caído, bot inoperativo, bloquea otras tareas | Resolver en esta sesión si hay terminal |
| 🟠 Media-terminal | Requiere SSH a Madre, comandos locales | Agrupar y ejecutar juntos |
| 🟡 Media-MCP | MCP puede ejecutar sin terminal | Candidatos principales de la sesión |
| ⚪ Baja | No bloquea nada | Solo si sobra tiempo |

---

_Creado: 2026-07-13 · v4 — contrato agente + issue apertura + orden lectura explícito · ADR-012 · Perplexity MCP_
