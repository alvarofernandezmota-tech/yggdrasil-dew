---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-INICIO-SESION.md
tags: [canon, inicio, sesion, protocolo, ritual]
status: vigente
version: 5
adr: ADR-012
---

# 🟢 Protocolo de Inicio de Sesión

> Toda sesión de trabajo empieza ejecutando este protocolo.  
> Objetivo: contexto completo + ecosistema verificado antes del primer commit.  
> Simétrico a: `PROTOCOLO-CIERRE-SESION.md`

**Tiempo estimado:** 3–5 min sesión normal · 8–10 min si +48h sin sesión

---

## CONTRATO AGENTE IA — lectura obligatoria antes de actuar

> **El agente NO ejecuta ninguna acción hasta completar esta fase.**

```
ORDEN DE LECTURA OBLIGATORIA AL INICIO DE SESIÓN:

[1] docs/sesiones/PROXIMA-SESION.md
    → Estado verificado del cierre anterior, pendientes exactos
    → Si algo está marcado como ⚠️ → resolverlo ANTES de objetivos nuevos

[2] ESTADO-SISTEMA.md (raíz dew)
    → Números actuales: repos, ADRs, islas, issues, servicios
    → Si hay 🔴 en servicios → HAL activo → va antes que todo

[3] MASTER-PENDIENTES.md (raíz dew)
    → Fases del plan, prioridad de esta sesión
```

---

## Paso 0 — Verificar cierre anterior (SIEMPRE)

### 0.1 Leer PROXIMA-SESION.md
- [ ] ¿Existe `docs/sesiones/PROXIMA-SESION.md`?
- [ ] ¿Todos los ✅ del cierre anterior están realmente ejecutados?
- [ ] ¿Hay ⚠️ pendientes? → resolverlos ahora antes de continuar

### 0.2 Verificar commits ↔ documentación (PROTOCOLO-VERIFICACION-COMMITS.md)
```
Ejecutar rápido:
1. ¿Existe diario de hoy? docs/sesiones/YYYY-MM-DD-diario.md
   → Si no → CREARLO ahora (usar plantilla del protocolo)
2. ¿Los commits de la última sesión están en algún log?
   → Si no → añadirlos al diario antes de continuar
3. ¿Todo lo apuntado en el log existe en el repo?
   → Si no → marcar como pendiente en PROXIMA-SESION.md
```

### 0.3 Resultado

| Resultado | Acción |
|---|---|
| ✅ Todo correcto | Continuar a Fase 1 |
| ⚠️ Hay pendientes del cierre | Resolverlos → luego Fase 1 |
| 🔴 Cierre no se hizo | Reconstruir desde commits reales → luego Fase 1 |

---

## Fase 1 — Lectura de contexto (sin editar todavía)

### 1.1 — Núcleo de estado (siempre)

| Archivo | Ruta | Qué extraer |
|---|---|---|
| Próxima sesión | `docs/sesiones/PROXIMA-SESION.md` | Pendientes, estado verificado |
| Estado sistema | `ESTADO-SISTEMA.md` | Números: repos, ADRs, islas, servicios |
| Pendientes | `MASTER-PENDIENTES.md` | Fases activas, prioridad sesión |
| Índice islas | `wiki/islas/INDEX.md` | Estado real de las 21 islas |

### 1.2 — Decisiones vigentes (si la sesión toca arquitectura)

| Archivo | Cuándo |
|---|---|
| `docs/adr/INDEX.md` | Sesión toca arquitectura |
| `docs/canon/PLAN-MAESTRO-FASES.md` | Sesión toca roadmap |

### 1.3 — Islas afectadas (solo las relevantes para hoy)

| ESTADO-ISLA | Cuándo leerlo |
|---|---|
| `ESTADO-ISLA-INFRA.md` | Madre, Docker, IaC, servicios |
| `ESTADO-ISLA-SEGURIDAD.md` | SecOps, HAL, vulnerabilidades |
| `ESTADO-ISLA-THDORA.md` | Bot Telegram o THDORA-PERSONAL |
| `ESTADO-ISLA-IA-LOCAL.md` | Ollama, RAG, LiteLLM, Qdrant |
| `ESTADO-ISLA-TRACKING.md` | Vida personal, diarios, metas |
| `ESTADO-ISLA-SCRIPTS.md` | CI, Actions, scripts bash |

---

## Fase 2 — Declarar objetivo de la sesión (antes del primer commit)

El agente hace estas **4 preguntas siempre**:

1. **¿Cuánto tiempo tienes y tienes terminal?**
2. **¿Algún servicio caído o cambio crítico?**
3. **¿Alguna decisión fuera de sesión sin documentar?**
4. **¿El objetivo de hoy tiene issue abierto?**

### Plantilla de declaración

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SESIÓN: YYYY-MM-DD HH:MM CEST
TIPO: Larga (+1h) / Corta (30min) / Emergencia
TERMINAL: Sí / No
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OBJETIVO 1: [issue #N] — [acción concreta y medible]
OBJETIVO 2: [issue #N] — [acción concreta y medible]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NO ENTRAR EN: [qué queda explícitamente fuera]
REPOS A TOCAR: [lista]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Fase 3 — Verificación de consistencia (si +48h sin sesión)

- [ ] `docs/adr/INDEX.md` — número de ADRs cuadra con archivos reales
- [ ] `wiki/islas/INDEX.md` — 21 islas cuadra con archivos reales en disco
- [ ] `ESTADO-SISTEMA.md` — no tiene más de 48h de antigüedad
- [ ] `MASTER-PENDIENTES.md` — refleja el estado real del backlog
- [ ] Raíz dew — sin archivos zombi
- [ ] Issues con label `bloqueado` — ¿siguen bloqueados?

---

## Mapa de repos — cuándo abrir cada uno

| Repo | Abrir si... |
|---|---|
| `yggdrasil-dew` | **Siempre** — punto de entrada |
| `yggdrasil-wiki` | Hay isla que consultar o actualizar |
| `yggdrasil-tracking` | Hay algo personal o vital que registrar |
| `madre-config` | Cambio en servicios Docker de Madre |
| `yggdrasil-scripts` | Script o Action nuevo |
| `yggdrasil-secops` | Hallazgo de seguridad |
| `THDORA-PERSONAL` | Bot Telegram o prompts IA |
| `ollama-stack` | LLM local, RAG, modelos |
| `acer-config` | Dotfiles Arch/Hyprland |

---

## Prioridad de issues al inicio

| Prioridad | Cuándo | Acción |
|---|---|---|
| 🔴🔴 Crítico | Seguridad o hardware | Bloquea todo — resolver primero |
| 🔴 Alta | Servicio caído, bot inoperativo | Resolver en esta sesión si hay terminal |
| 🟠 Media-terminal | Requiere SSH a Madre | Agrupar y ejecutar juntos |
| 🟡 Media-MCP | MCP puede ejecutar sin terminal | Candidatos principales |
| ⚪ Baja | No bloquea nada | Solo si sobra tiempo |

---

_v5 · 2026-07-16 · Integrada verificación commits + PROXIMA-SESION como fuente de verdad · Perplexity MCP_
