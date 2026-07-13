---
tipo: template
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
ruta: docs/templates/TEMPLATE-ISSUE-APERTURA.md
tags: [template, issue, apertura, sesion]
status: vigente
---

# Template: Issue de Apertura de Sesión

> Usar este template para crear el issue-apertura al inicio de cada sesión.  
> Label obligatorio: `apertura-sesion`  
> El agente lee este issue PRIMERO, antes de cualquier acción.

---

## Título del issue

```
[apertura] YYYY-MM-DD — [objetivo principal en 1 línea]
```

**Ejemplos:**
- `[apertura] 2026-07-14 — migrar sistema/ en tracking + protocolos v4`
- `[apertura] 2026-07-15 — levantar THDORA y rotar secretos HAL-008`

---

## Body del issue

```markdown
## Apertura de sesión — YYYY-MM-DD

> Creado por: [Álvaro / Agente al cerrar sesión anterior]

### Contexto — dónde quedamos

[Una o dos frases de qué pasó en la última sesión.
Si viene del issue-cierre anterior → copiar sección "Estado al cerrar".]

**Última sesión:** YYYY-MM-DD HH:MM CEST
**Issue cierre anterior:** #N

---

### Objetivos de esta sesión (ordenados por prioridad)

1. [ ] [Issue #N] — [acción concreta y medible] — 🔴 / 🟠 / 🟡
2. [ ] [Issue #N] — [acción concreta y medible] — 🔴 / 🟠 / 🟡
3. [ ] [Issue #N] — [acción concreta y medible] — 🔴 / 🟠 / 🟡

**NO entrar en:**
- [Qué queda explícitamente fuera de esta sesión]

---

### Repos que se van a tocar

- [ ] `yggdrasil-dew`
- [ ] `[repo]`

---

### Bloqueos conocidos

| Issue | Bloqueo | Requiere |
|---|---|---|
| #N | [descripción] | terminal / MCP / info |

---

### Estado del ecosistema al entrar

| Componente | Estado conocido |
|---|---|
| Madre | 🟢 / 🟡 / 🔴 |
| Servicios Docker | 🟢 / 🟡 / 🔴 |
| HAL críticos | N abiertos |
| Git repos sin push | ✅ ninguno / ⚠️ [lista] |

---

### Notas para el agente

[Contexto adicional que el agente debe saber antes de actuar.
Decisiones tomadas fuera de sesión, cambios de plan, etc.]
```

---

## Instrucciones de uso

1. **Álvaro crea el issue** al abrir sesión (o el agente lo genera a partir del issue-cierre)
2. **El agente lee este issue** como fase 1 obligatoria del protocolo de inicio
3. **El agente actualiza los checkboxes** de objetivos conforme los va completando
4. **El issue se cierra** en la Fase 6 del protocolo de cierre, con referencia al diario

---

_Template v1 · 2026-07-13 · ADR-012_
