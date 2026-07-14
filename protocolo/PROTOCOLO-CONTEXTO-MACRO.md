---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-14
version: 1.0
tags: [contexto, macro, ecosistema, sesion-activa, roadmap]
status: vigente
---

# PROTOCOLO-CONTEXTO-MACRO v1

> Barrido completo del ecosistema Yggdrasil.
> Puede invocarse en cualquier momento de una sesión, no solo en apertura.
> Responde siempre a: ¿Dónde estamos? ¿Qué está activo? ¿Qué está roto? ¿Qué sigue?

---

## CUÁNDO INVOCAR

```
- Al inicio de cada sesión (PASO 2 de PROTOCOLO-APERTURA-SESION)
- Cuando el agente pierde el hilo durante la sesión
- Cuando se va a tomar una decisión que afecta a más de un repo
- Cuando han pasado más de 2 horas desde el último barrido
- Cuando el usuario dice "¿dónde estamos?" o "recuérdate de todo"
```

---

## BARRIDO — 6 capas en orden

### CAPA 1 — Arquitectura del ecosistema

**Archivo:** `ECOSYSTEM-ARCHITECTURE.md` · `yggdrasil-dew`

Extraer:
- Lista de repos activos (actualmente 13 activos + 1 mantenimiento)
- Repos DEPRECADOS (actualmente: `yggdrasil-formacion-`)
- Reglas de jerarquía (NIVEL 0 → NIVEL 3)
- Regla COMPAT-BLINK si se va a crear scripts
- Dónde va cada tipo de contenido (sección 3)

```
REPOS ACTIVOS HOY:
  🧠 yggdrasil-dew, yggdrasil-wiki, alvarofernandezmota-tech
  📓 yggdrasil-tracking
  📚 formacion-tech, investigacion-ia
  🖥️ madre-config, acer-config
  🤖 ollama-stack, local-brain
  🦾 THDORA-PERSONAL (mantenimiento)
  🛡️ yggdrasil-secops, osint-stack
  ⚙️ yggdrasil-scripts
  🧪 dev-labs
⛔ DEPRECADOS: yggdrasil-formacion- (migrado a yggdrasil-tracking 2026-07-13)
```

### CAPA 2 — Estado actual del sistema

**Archivo:** `ESTADO-SISTEMA.md` · `yggdrasil-dew`

Extraer:
- Estado de cada isla (✅ / 🟡 / 🔴)
- Alertas activas
- Última actividad por repo
- Deudas técnicas pendientes

### CAPA 3 — Dashboard de métricas

**Archivo:** `DASHBOARD.md` · `yggdrasil-dew`

Extraer:
- KPIs del ecosistema
- Issues abiertos críticos
- PRs pendientes
- Bloqueantes del día

### CAPA 4 — Tareas pendientes

**Archivo:** `MASTER-PENDIENTES.md` · `yggdrasil-dew`

Extraer:
- Tareas con `prioridad:alta` → deben resolverse esta semana
- Tareas con `prioridad:media` → esta semana si hay tiempo
- Tareas asignadas a repos con 🔴 → prioridad inmediata

### CAPA 5 — Roadmap del mes

**Archivo:** `PLAN-MAESTRO-2026-07.md` · `yggdrasil-dew`

Extraer:
- Objetivo principal del mes de julio 2026
- Hitos completados vs pendientes
- ¿Estamos en track?

### CAPA 6 — Sesión activa (si existe)

**Repo:** `yggdrasil-tracking`
**Ruta:** `diarios/YYYY/YYYY-MM-DD.md`

```
¿Hay un diario abierto (status: abierto) para hoy?
  SÍ → Leer el contexto de apertura y el trabajo realizado hasta ahora.
       Esto evita perder el hilo si el agente se reinicia a mitad de sesión.
  NO → No hay sesión activa. Si se está iniciando una, ir a PROTOCOLO-APERTURA-SESION.
```

---

## SALIDA OBLIGATORIA

Después del barrido, emitir este resumen:

```
[CONTEXTO-MACRO COMPLETADO]
Timestamp: YYYY-MM-DD HH:MM CEST

ECOSISTEMA:
  Repos activos: 13 (+ 1 mantenimiento)
  Repos deprecados: 1 (yggdrasil-formacion-)
  Repos con 🔴: [lista o "ninguno"]
  Repos con 🟡: [lista o "ninguno"]

SESIÓN ACTIVA:
  Diario: [ABIERTO/CERRADO/NO EXISTE] — yggdrasil-tracking/diarios/YYYY/YYYY-MM-DD.md
  Trabajo realizado hoy: [resumen o "ninguno"]

PENDIENTES URGENTES:
  Alta prioridad: [N tareas]
  Bloqueantes: [lista o "ninguno"]

ROADMAP JULIO 2026:
  Objetivo: [objetivo principal]
  Hitos: [X/Y completados]
  Track: [✅ en track / 🟡 con retrasos / 🔴 fuera de track]

PRÓXIMA ACCIÓN RECOMENDADA: [la cosa más importante a hacer ahora]
```

---

## DIFERENCIA CON OTROS PROTOCOLOS DE CONTEXTO

| Protocolo | Alcance | Cuándo |
|---|---|---|
| `CONTEXTO-MACRO` | Todo el ecosistema + sesión activa | Inicio de sesión, pérdida de hilo |
| `CONTEXTO-ECOSISTEMA` | Solo arquitectura y relaciones | Cuando se necesita el mapa estructural |
| `CONTEXTO-REPO` | Un repo específico en profundidad | Antes de operar en un repo concreto |
| `CONTEXTO-ROADMAP` | Solo el roadmap y las tareas | Cuando se necesita priorizar trabajo |

---

_v1.0 · 2026-07-14 · Barrido macro Yggdrasil_
