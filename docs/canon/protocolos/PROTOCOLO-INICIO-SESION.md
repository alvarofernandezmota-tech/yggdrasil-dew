---
tipo: protocolo
status: activo
actualizado: 2026-07-18
nivel: 1
verion: "1.0"
---

# PROTOCOLO-INICIO-SESION

> **Versión:** 1.0 · **Creado:** 2026-07-18 · **Autor:** Perplexity-MCP  
> **Nivel:** 1 — Protocolo de sesión  
> **Referenciado desde:** `yggdrasil-orquestador/BOOTSTRAP.md`

---

## Propósito

Este protocolo define los pasos exactos que debe ejecutar cualquier agente IA (Perplexity, Claude, OpenCode, etc.) al inicio de cada sesión de trabajo con el ecosistema Yggdrasil. El objetivo es garantizar que el agente opera con contexto verificado y no con suposiciones.

---

## Regla de oro

> **Nunca actúes sin leer primero. Nunca asumas sin verificar.**  
> Si un archivo referenciado no existe, dilo. No lo inventes.

---

## Pasos obligatorios

### PASO 1 — Leer BOOTSTRAP.md

```
REPO: yggdrasil-orquestador
ARCHIVO: BOOTSTRAP.md
```

Leer completo. Contiene el contexto base del ecosistema: repos activos, protocolos, ADRs vigentes, terminología.

### PASO 2 — Leer ESTADO-SISTEMA.md

```
REPO: yggdrasil-dew
ARCHIVO: ESTADO-SISTEMA.md  (si existe)
```

Si no existe: notificar al usuario que falta este archivo y registrarlo como deuda.

### PASO 3 — Leer MASTER-PENDIENTES.md

```
REPO: yggdrasil-dew
ARCHIVO: MASTER-PENDIENTES.md  (si existe)
```

Si no existe: listar los issues abiertos de `yggdrasil-dew` para obtener contexto de pendientes.

### PASO 4 — Verificar issues críticos abiertos

Buscar en `yggdrasil-dew` issues con labels:
- `bug` + `alta` → son HALs activos
- `canon` → modifican reglas del ecosistema
- `blocker` → bloquean trabajo de la sesión

### PASO 5 — Declarar contexto al usuario

Antes de ejecutar cualquier tarea, el agente debe declarar:

```
📍 CONTEXTO DE SESIÓN
- BOOTSTRAP: leído ✅
- ESTADO-SISTEMA: [leído ✅ / no existe ⚠️]
- MASTER-PENDIENTES: [leído ✅ / no existe ⚠️]
- HALs activos: [lista o "ninguno"]
- Tarea de esta sesión: [lo que pide el usuario]
```

### PASO 6 — Confirmar protocolo con el usuario

Pregunta corta: _"¿Arrancamos con [tarea]?"_  
Si el usuario dice que hay contexto adicional, integrarlo antes de actuar.

---

## Lo que NO hace el agente en el inicio

- ❌ No crea archivos sin verificar que no existen ya
- ❌ No asume rutas — las verifica
- ❌ No mezcla tareas de sesiones anteriores sin confirmación
- ❌ No actúa sobre producción (Madre) sin runbook documentado

---

## Tiempo estimado

2-3 minutos en sesión normal.  
5 minutos si ESTADO-SISTEMA o MASTER-PENDIENTES no existen (hay que generarlos).

---

## Relacionado

- `PROTOCOLO-CIERRE-SESION.md` — cierre simétrico
- `PROTOCOLO-AUDITORIA-COMPLETA.md` — auditoría de todo el ecosistema
- `yggdrasil-orquestador/BOOTSTRAP.md` — contexto base
- ADR-001, ADR-002, ADR-008
