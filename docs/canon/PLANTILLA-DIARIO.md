---
titulo: Plantilla estándar de diario de sesión
tipo: plantilla
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/PLANTILLA-DIARIO.md
tags: [plantilla, diario, canon, norma]
status: vigente
---

# Plantilla — Diario de Sesión

> **Regla:** Un diario = un día. Máximo un archivo por fecha.  
> **Ubicación:** `yggdrasil-dew/docs/diarios/YYYY-MM-DD.md`  
> **Nombre:** siempre `YYYY-MM-DD.md` — sin sufijos, sin `noche`, sin números.

---

## Frontmatter obligatorio

```yaml
---
tipo: diario
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: YYYY-MM-DD HH:MM CEST
actualizado: YYYY-MM-DD HH:MM CEST
ruta: docs/diarios/YYYY-MM-DD.md
tags: [diario, sesion, <isla-principal>, <tema>]
status: abierto | cerrado
---
```

---

## Estructura

```markdown
# Diario — YYYY-MM-DD

> Una línea de contexto: qué sesión fue, qué se buscaba.

---

## 🟢 SESIÓN [MAÑANA / TARDE / NOCHE] — HH:MM CEST

**Objetivo:** ...
**Agente / Dispositivo:** ...
**Estado anterior:** ...

### ✅ Completado

**[Isla o repo]**
- Item concreto hecho
- Item concreto hecho

### ⚠️ Incidencias

| Incidencia | Causa | Solución |
|---|---|---|
| ... | ... | ... |

### 📋 Pendiente al cierre
- [ ] Tarea pendiente con link a issue si existe

### ✅ Cierre — HH:MM CEST

---

## 💡 Decisiones del día

| Decisión | ADR / Referencia |
|---|---|
| ... | ... |

---

_Diario cerrado: YYYY-MM-DD · Agente · HH:MM CEST_
```

---

## Reglas de uso

- Si hay varias sesiones en el día → secciones separadas dentro del **mismo archivo**
- Si durante la sesión se crea un ADR → referenciarlo en "Decisiones del día"
- Si se detecta un HAL → referenciarlo en "Incidencias" con enlace
- Al cerrar sesión → cambiar `status: abierto` a `status: cerrado`
- El agente IA **nunca crea archivos tipo `noche-2.md`** — siempre actualiza el diario del día

---

_Creado: 2026-07-06 · Fase 3 Plan de Alineación · Perplexity-MCP_
