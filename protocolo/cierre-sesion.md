---
tipo: protocolo
subtipo: cierre-sesion
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
status: vigente
---

# ⏹️ Protocolo de Cierre de Sesión

> Ejecutar siempre al terminar una sesión de trabajo, sin excepción.
> El objetivo: que la próxima sesión (tuya o de otro agente) pueda arrancar sin preguntas.

---

## Checklist obligatorio

### En el repo donde se trabajó

- [ ] `CONTEXT.md` actualizado con estado post-sesión
- [ ] `AGENT.md` actualizado si cambió algo estructural
- [ ] `CHANGELOG.md` actualizado si hubo cambios de código
- [ ] `docs/sesiones/YYYY-MM-DD.md` creado con resumen

### En yggdrasil-dew

- [ ] Issues nuevos creados para trabajo pendiente identificado
- [ ] Issues resueltos cerrados con comentario de cierre
- [ ] `CONTEXT.md` actualizado si cambió el estado del ecosistema

### Handoff

- [ ] El resumen de sesión incluye: qué se hizo, qué quedó pendiente, próximo paso inmediato
- [ ] Si hay un bloqueante nuevo → issue HAL creado con prioridad p0

---

## Formato del log de sesión

```markdown
---
fecha: YYYY-MM-DD
agente: [nombre-agente]
tipo: [tipo-trabajo]
resultado: [completado|parcial|bloqueado]
---

# Sesión YYYY-MM-DD — [objetivo]

## Resumen
[2-3 frases de qué se hizo]

## Acciones realizadas
- ✅ [acción completada]
- ✅ [acción completada]
- ❌ [acción NO completada — por qué]

## Bloqueantes pendientes
- 🚨 [bloqueante] → [issue]

## Siguiente sesión
1. [próximo paso inmediato]
2. [segundo paso]
```

---

## Regla de oro

> Si alguien abre este repo mañana sin haber estado hoy,  
> debe poder entender qué pasó y qué hacer a continuación  
> solo leyendo `AGENT.md` + `CONTEXT.md` + el último log de sesión.
