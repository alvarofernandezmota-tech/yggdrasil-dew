---
tipo: protocolo
subtipo: sesion
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-01-01
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-APERTURA-SESION.md
tags: [protocolo, sesion, apertura, agente-ia, contexto]
status: vigente
version: 2.0
audiencia: [humano, agente-ia]
nivel-escalado: 0 — Manual
candidato-a: 1 — Script
---

# 🟢 PROTOCOLO DE APERTURA DE SESIÓN v2

> **Propósito:** Garantizar que cada sesión de trabajo —propia o del agente— parte con contexto completo, objetivo declarado y sin deuda de información.
> **Cuándo ejecutar:** Al inicio de cualquier sesión de trabajo en el ecosistema.
> **Tiempo estimado (agente):** ~3 min. **Tiempo estimado (humano):** ~5 min.

---

## 👤 PARA EL HUMANO

### ¿Por qué este protocolo existe?

Cada sesión que empieza sin contexto pierde los primeros 20 minutos reorientándose. Este protocolo convierte la apertura en un ritual de 5 minutos que da contexto total antes de tocar nada.

### Pasos para el humano

1. **Busca el issue de apertura** — el cierre de la sesión anterior crea un issue con el estado exacto donde lo dejaste. Si existe, léelo primero.
2. **Lee `ESTADO-SISTEMA.md`** — ¿hay algo roto o bloqueado que cambie tu plan?
3. **Lee `MASTER-PENDIENTES.md`** — ¿cuál es el pendiente de mayor prioridad hoy?
4. **Define tu objetivo** — escríbelo en una frase antes de empezar. Sin objetivo declarado, no abras ningún editor.
5. **Declara qué NO vas a tocar hoy** — opcional pero muy útil para evitar scope creep.

### Cuándo NO seguir este protocolo

- Sesiones de < 15 minutos con un objetivo muy acotado y conocido
- Emergencias (usar PROTOCOLO-INCIDENTE.md directamente)

---

## 🤖 PARA EL AGENTE IA

> **CONTRATO:** No ejecutes ninguna acción sobre el ecosistema hasta completar los pasos 1-6 y haber declarado el contexto. Si un paso falla (archivo no encontrado, estado incierto), detente y reporta al usuario antes de continuar.

### PASO 1 — Buscar issue de apertura

Buscar en el repo activo un issue abierto con label `apertura-sesion` o título que empiece por `[APERTURA]`.

- **Si existe:** leerlo completo. Contiene: estado anterior, objetivo, repos tocados, bloqueos y notas.
- **Si no existe:** registrar como primer contexto conocido = vacío. Continuar.

### PASO 2 — Leer el mapa del ecosistema

Archivo: [`ECOSYSTEM-ARCHITECTURE.md`](../ECOSYSTEM-ARCHITECTURE.md)  
Retener: repos activos, jerarquía de reglas, tabla "dónde va cada cosa", dispositivos disponibles.

### PASO 3 — Leer estado del sistema

Archivo: [`ESTADO-SISTEMA.md`](../ESTADO-SISTEMA.md)  
Retener: repos en 🔴 CRÍTICO, deudas técnicas activas, última fecha de actualización.  
⚠️ Si fecha > 7 días: advertir al usuario que el estado puede estar desactualizado.

### PASO 4 — Leer pendientes globales

Archivo: [`MASTER-PENDIENTES.md`](../MASTER-PENDIENTES.md)  
Retener: pendientes 🔴 ALTA, bloqueos activos, si el objetivo actual ya está registrado.

### PASO 5 — Leer normas de operación

Archivo: [`NORMAS.md`](../NORMAS.md)  
Retener: reglas de commits (Conventional Commits), regla COMPAT-BLINK, qué NO hacer sin confirmación.

### PASO 6 — Confirmar objetivo de sesión

Si el usuario no ha declarado el objetivo explícitamente → preguntar:
```
¿Cuál es el objetivo de esta sesión? (Si tienes el issue de apertura, puedo leerlo primero)
```

No actuar hasta tener objetivo declarado.

### DECLARACIÓN DE APERTURA (obligatoria)

```
[SESIÓN ABIERTA]
Fecha: YYYY-MM-DD HH:MM
Contexto cargado: ECOSYSTEM-ARCHITECTURE ✅ | ESTADO-SISTEMA ✅ | MASTER-PENDIENTES ✅ | NORMAS ✅
Repos críticos: [lista o NINGUNO]
Pendientes alta prioridad: N
Objetivo declarado: [objetivo en una frase]
NO tocar hoy: [lista o NO DEFINIDO]
```

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script | `scripts/apertura-sesion.sh` | 🔲 pendiente |
| 2 — GitHub Action | `.github/workflows/apertura.yml` | 🔲 pendiente |
| 3 — Bot THDORA | Comando `/apertura` en Telegram | 🔲 pendiente |

---

## 📋 MANTENIMIENTO

Actualizar este protocolo cuando:
- Cambie la estructura de archivos de contexto obligatorios
- Se añada un nuevo tipo de issue de apertura
- El ecosistema supere los 20 repos activos (revisar pasos)

_Actualizado: 2026-07-14 · v2.0_
