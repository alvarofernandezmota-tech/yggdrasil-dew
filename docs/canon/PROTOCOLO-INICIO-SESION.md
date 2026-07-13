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
> Objetivo: llegar al primer commit con contexto completo, objetivo claro y cero sorpresas.
> Tiempo estimado: 5–10 minutos.
> Simétrico a: `PROTOCOLO-CIERRE-SESION.md`

---

## Fase 1 — Contexto del ecosistema (leer, no editar)

Orden de lectura obligatorio:

### 1.1 — Estado general
- [ ] `docs/canon/ESTADO-SISTEMA.md` — foto del ecosistema: repos, ADRs, islas, servicios
- [ ] `MASTER-PENDIENTES.md` — estado de fases + qué quedó pendiente
- [ ] `docs/diarios/YYYY-MM-DD.md` — última sesión: dónde quedamos, qué sigue

### 1.2 — Issues prioritarios
- [ ] Issues 🔴🔴 — ¿hay bloqueante crítico de seguridad o hardware? → va primero
- [ ] Issues 🔴 — ¿hay algo que bloquee otros issues? → priorizarlo
- [ ] Issues 🟠 — qué se puede atacar hoy con terminal
- [ ] Issues 🟡 — qué puede ejecutar MCP solo sin terminal

### 1.3 — Estado de servicios (si aplica)
- [ ] `docs/canon/ownership-matrix.md` — ¿alguno caído desde la última sesión?
- [ ] Si hay servicio caído 🔴 → issue HAL-XXX primero antes de cualquier otra cosa

---

## Fase 2 — Declarar el objetivo de la sesión

Antes de escribir una sola línea de código o hacer un commit:

- [ ] **¿Qué quiero tener cerrado al acabar esta sesión?**
  - Máximo 3 objetivos concretos
  - Cada objetivo vinculado a un issue o fase
- [ ] **¿Necesito terminal hoy?** → Si sí → preparar SSH Madre primero
- [ ] **¿Es sesión larga (+1h) o corta (30min)?** → Ajustar alcance

### Plantilla de declaración

```
Sesión YYYY-MM-DD HH:MM
Objetivo 1: [issue/fase] — [acción concreta]
Objetivo 2: [issue/fase] — [acción concreta]
Objetivo 3: [issue/fase] — [acción concreta]
Requiere terminal: Sí / No
Tipo: Larga / Corta / Emergencia
```

---

## Fase 3 — Verificación rápida de consistencia

Sólo si la última sesión fue hace más de 24h:

- [ ] `docs/adr/INDEX.md` — ¿el último ADR conocido sigue siendo el más reciente?
- [ ] `wiki/islas/INDEX.md` — ¿los números cuadran con lo que recuerdas?
- [ ] `NORMAS.md` — ¿hay alguna regla nueva que no recuerdas? → leerla
- [ ] Zombis raíz dew — `ls` rápido mental: ¿hay algo raro en raíz?

---

## Preguntas de inicio — el agente hace estas al arrancar

1. **¿Cuánto tiempo tienes para esta sesión?** → Ajusta el alcance
2. **¿Tienes terminal disponible hoy?** → Si sí → atacar issues 🔴 primero
3. **¿Hay algo urgente que no esté en los issues?** → Crear issue antes de trabajarlo
4. **¿Se decidió algo fuera de sesión (chat, reflexión, idea)?** → Documentar antes de ejecutar

---

## Mapa de repos — cuándo abrir cada uno al inicio

| Repo | Abrir si... |
|---|---|
| `yggdrasil-dew` | Siempre — es el punto de entrada |
| `yggdrasil-wiki` | Si hay isla que actualizar o consultar |
| `yggdrasil-tracking` | Si hay algo personal/vital que registrar |
| `yggdrasil-formacion-` | Si la sesión incluye aprendizaje técnico |
| `madre-config` | Si hay cambio en servicios Docker de Madre |
| `yggdrasil-scripts` | Si hay script o Action que crear/modificar |
| `yggdrasil-secops` | Si hay hallazgo de seguridad o HAL nuevo |
| `THDORA-PERSONAL` | Si la sesión incluye trabajo en el bot |
| `ollama-stack` | Si la sesión incluye LLM local o RAG |

---

## Regla de oro del inicio

> **Nunca empezar a ejecutar sin leer primero.**
> Un commit sin contexto genera deuda documental.
> 5 minutos de lectura evitan 30 minutos de deshace.

---

_Creado: 2026-07-13 · ADR-012 · Simétrico a PROTOCOLO-CIERRE-SESION.md · Perplexity MCP_
