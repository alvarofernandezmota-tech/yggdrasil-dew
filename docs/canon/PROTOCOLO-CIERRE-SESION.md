---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-CIERRE-SESION.md
tags: [canon, cierre, sesion, protocolo]
status: vigente
version: 2
---

# 🔴 Protocolo de Cierre de Sesión

> Toda sesión termina ejecutando este protocolo.  
> Objetivo: dejar el ecosistema en estado conocido y verificado para la próxima sesión.  
> Simétrico a: `PROTOCOLO-INICIO-SESION.md`

**Tiempo estimado:** 3–5 min sesión normal · 8–10 min si hubo muchos cambios

---

## CONTRATO AGENTE IA

> **El agente NO declara la sesión cerrada hasta completar todos los pasos.**

---

## Paso 1 — Documentar lo ejecutado

### 1.1 Crear o actualizar el diario del día

```
Archivo: docs/sesiones/YYYY-MM-DD-diario.md
→ Si no existe → crearlo desde plantilla (PROTOCOLO-VERIFICACION-COMMITS.md)
→ Si existe → añadir bloque de esta sesión
```

El diario **debe contener**:
- Resumen en 2-3 frases de qué se hizo
- Tabla de commits: repo · SHA · mensaje · archivos afectados
- Pendientes generados en esta sesión
- Decisiones tomadas (si aplica)

### 1.2 Verificar commits ↔ documentación

```
Ejecutar PROTOCOLO-VERIFICACION-COMMITS.md — Fases 2 y 3:
→ Todo commit de esta sesión → en el diario
→ Todo archivo mencionado en el diario → existe en el repo
```

---

## Paso 2 — Actualizar estado del ecosistema

- [ ] `ESTADO-SISTEMA.md` — actualizar fecha y números si cambiaron
- [ ] `wiki/islas/INDEX.md` — actualizar estados de islas tocadas
- [ ] `MASTER-PENDIENTES.md` — mover tareas completadas, añadir nuevas
- [ ] Issues GitHub — cerrar los resueltos, abrir los nuevos detectados

---

## Paso 3 — Verificar repos tocados

Para cada repo que se tocó en la sesión:

- [ ] ¿Tiene `AGENT.md`? (si no → añadir a PROXIMA-SESION.md como pendiente)
- [ ] ¿Todos los cambios tienen commit y push?
- [ ] ¿No hay archivos zombi o sin clasificar en la raíz?

**Repos que requieren AGENT.md — pendientes actuales:**
- `yggdrasil-tracking` ⚠️
- `THDORA-PERSONAL` ⚠️

---

## Paso 4 — Actualizar PROXIMA-SESION.md

```
Archivo: docs/sesiones/PROXIMA-SESION.md
→ Actualizar con:
   - Estado verificado de esta sesión (✅/⚠️/🔴)
   - Pendientes reales para la próxima sesión
   - Primera acción al arrancar (la más importante)
   - Tabla de lo ejecutado hoy
```

**PROXIMA-SESION.md es la fuente de verdad del cierre.**  
Si este archivo está actualizado, el cierre se hizo bien.

---

## Paso 5 — Checklist final

```
[ ] Diario del día creado/actualizado con todos los commits
[ ] Todos los commits documentados en el diario
[ ] ESTADO-SISTEMA.md actualizado
[ ] INDEX.md islas actualizado (si se tocó la wiki)
[ ] MASTER-PENDIENTES.md actualizado
[ ] Issues cerrados/abiertos correctamente
[ ] PROXIMA-SESION.md refleja estado real y pendientes exactos
[ ] No hay archivos zombi en ningún repo tocado
[ ] Repos tocados tienen AGENT.md (o pendiente documentado)
```

---

## 🔗 Protocolos relacionados

- [`PROTOCOLO-INICIO-SESION.md`](PROTOCOLO-INICIO-SESION.md)
- [`PROTOCOLO-VERIFICACION-COMMITS.md`](PROTOCOLO-VERIFICACION-COMMITS.md)
- [`PROTOCOLO-AUDITORIA.md`](PROTOCOLO-AUDITORIA.md)

---

_v2 · 2026-07-16 · Integrada verificación commits + PROXIMA-SESION como fuente de verdad · Perplexity MCP_
