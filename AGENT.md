---
tipo: agent
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: AGENT.md
tags: [agent, protocolo, canon, dew]
status: vigente
version: 1
---

# AGENT.md — yggdrasil-dew

> Instrucciones para agentes IA que trabajen en este repo.  
> Leer este archivo **antes de ejecutar cualquier acción**.

---

## Identidad del repo

| Campo | Valor |
|---|---|
| **Nombre** | `yggdrasil-dew` |
| **Propósito** | Canon técnico del ecosistema: ADRs, decisiones, protocolos, issues, estado |
| **Tipo** | Canon — fuente única de verdad técnica |
| **Isla wiki** | `wiki/islas/dew.md` |
| **ADR principal** | ADR-001 (fundación del ecosistema) |

---

## Protocolo de inicio (obligatorio)

Antes de cualquier acción, leer en este orden:

1. `docs/sesiones/PROXIMA-SESION.md` — estado y bloques pendientes
2. `CONTEXT.md` — contexto del ecosistema completo
3. `docs/canon/ESTADO-SISTEMA.md` — estado actual del ecosistema
4. Issues abiertos con label `bloqueado` o `HAL` — bloqueos activos
5. `docs/canon/PROTOCOLO-INICIO-SESION.md` — protocolo completo de arranque

---

## Reglas de este repo

### ✅ Hacer siempre
- Toda decisión arquitectónica → ADR en `docs/adr/ADR-0NN.md`
- Toda tarea → issue en GitHub antes de ejecutar
- Commit message: `tipo(scope): descripción — closes #N`
- Push antes de declarar tarea completada
- Actualizar `docs/canon/ESTADO-SISTEMA.md` al final de cada sesión
- Actualizar `docs/sesiones/PROXIMA-SESION.md` al cierre

### ❌ Nunca hacer
- Hardcodear secretos o tokens en ningún archivo
- Borrar archivos sin issue de respaldo aprobado por Álvaro
- Cambiar nombres de repos sin actualizar todos los mapas del ecosistema
- Actuar sin leer el protocolo de inicio primero
- Crear ADR sin seguir `docs/canon/PLANTILLA-ADR.md`

---

## Estructura del repo

```
yggdrasil-dew/
├── docs/
│   ├── adr/           ← Decision Records (ADR-001, ADR-002...)
│   ├── canon/         ← Protocolos, plantillas, normas, estado del sistema
│   ├── islas/         ← Estados de isla (ESTADO-ISLA-*.md)
│   ├── sesiones/      ← Diarios de sesión y PROXIMA-SESION.md
│   └── runbooks/      ← Procedimientos de recuperación operativos
├── AGENT.md           ← este archivo
├── CONTEXT.md         ← contexto ecosistema
├── MASTER-PENDIENTES.md ← backlog principal y fases activas
└── README.md
```

---

## Conexiones con el ecosistema

| Repo relacionado | Relación |
|---|---|
| `WIKI---PERSONAL` | Isla `dew.md` y todos los mapas |
| `yggdrasil-tracking` | Diarios de vida referenciados desde sesiones |
| `THDORA-PERSONAL` | Bot consume protocolos y contexto de DEW |
| Todos los repos | DEW es el punto de entrada — siempre se abre primero |

---

## Protocolo de cierre (obligatorio)

Antes de terminar cualquier sesión:

1. Seguir `docs/canon/PROTOCOLO-CIERRE-SESION.md` completo
2. `docs/sesiones/PROXIMA-SESION.md` actualizado
3. `docs/canon/ESTADO-SISTEMA.md` con fecha de hoy
4. Issues cerrados en GitHub
5. `git push` limpio

---

## Contacto y decisiones

- **Dueño:** Álvaro Fernández Mota
- **Dudas:** abrir issue en este repo con label `pregunta`
- **Decisiones:** crear ADR en `docs/adr/` siguiendo `docs/canon/PLANTILLA-ADR.md`

---

_Instanciado desde: `docs/canon/AGENT-template.md`_  
_Última actualización: 2026-07-16_
