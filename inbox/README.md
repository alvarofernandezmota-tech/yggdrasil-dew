---
tags: [inbox, procedimiento, sistema, ingenieria]
fecha-creacion: 2026-06-20
fecha-actualizacion: 2026-06-22
version: 2.0
owner: alvarofernandezmota-tech
status: activo
---

# 📥 Inbox — Sistema de Captura y Procesamiento

> **Definición:** La inbox es la única puerta de entrada al sistema de conocimiento.
> Todo elemento nuevo entra aquí antes de ser clasificado, verificado y migrado.
> Ningún archivo del sistema formal se modifica directamente desde una sesión de trabajo.

---

## 1. Propósito y Responsabilidad

La inbox actúa como **buffer de captura** entre el flujo de trabajo en tiempo real y el sistema de conocimiento permanente. Su función es:

- **Capturar** sin fricción — no decidir en el momento de capturar
- **Aislar** cambios no verificados del sistema formal
- **Garantizar** que nada se pierde entre sesiones
- **Forzar** una revisión consciente antes de que algo entre al sistema real

**Anti-patrón que este sistema previene:**
Modificar directamente archivos del sistema formal durante una sesión activa, sin verificación posterior, acumula deuda técnica de conocimiento — información incorrecta, desactualizada o duplicada que se propaga silenciosamente.

---

## 2. Estados de un Item de Inbox

Todo archivo en `inbox/` tiene exactamente uno de estos estados:

| Estado | Emoji | Definición | Acción requerida |
|---|---|---|---|
| `ACTIVO` | 🔴 | En uso esta sesión o bloque de trabajo | No tocar hasta que la tarea asociada cierre |
| `PENDIENTE` | 🟡 | Capturado, pendiente de auditoría | Auditar en la próxima revisión semanal |
| `LISTO` | 🟢 | Auditado, listo para migrar | Migrar al sistema formal en la próxima migración |
| `ARCHIVADO` | 📦 | Información histórica válida pero no activa | Mover a `diario/` o `archivados/` |
| `OBSOLETO` | 🗑️ | Información superada o incorrecta | Borrar |

**Regla:** Un archivo en inbox nunca debe estar sin estado. Si no tiene estado, es `PENDIENTE`.

---

## 3. Ciclo de Vida de un Item

```
  EVENTO DEL MUNDO REAL
  (sesión trabajo / idea / configuración / decisión)
          │
          ▼
  ┌─────────────────┐
  │   CAPTURA       │  → Crear archivo en inbox/ con fecha + tags
  │   (sin juicio)  │     Nunca editar sistema formal directamente
  └────────┬────────┘
           │
           ▼
  ┌─────────────────┐
  │   AUDITORÍA     │  → Leer contenido real (no el nombre)
  │   (1 a 1)       │     Evaluar vigencia y calidad
  └────────┬────────┘
           │
    ┌──────┴──────────────────────────────┐
    │                                     │
    ▼                                     ▼
 ¿Info válida?                      ¿Info obsoleta?
    │                                     │
    ▼                                     ▼
 DECIDIR DESTINO                     DESCARTAR
 (ver sección 5)                     o ARCHIVAR
    │
    ▼
  ┌─────────────────┐
  │   MIGRACIÓN     │  → Crear/actualizar archivo en sistema formal
  │                 │     Verificar que destino queda correcto
  └────────┬────────┘
           │
           ▼
  ┌─────────────────┐
  │   LIMPIEZA      │  → Borrar archivo de inbox/
  │                 │     Actualizar este README si cambia el inventario
  └─────────────────┘
```

---

## 4. Procedimiento de Auditoría — Protocolo Formal

### 4.1 Cuándo auditar

| Trigger | Frecuencia | Prioridad |
|---|---|---|
| Revisión semanal programada | Cada domingo | Alta |
| Inbox supera 15 archivos | Cuando ocurra | Alta |
| Antes de empezar un proyecto nuevo | Ad hoc | Media |
| Después de una sesión intensiva | Ad hoc | Media |
| **Nunca** con prisa o con contexto limitado | — | Bloqueante |

### 4.2 Precondiciones antes de auditar

- [ ] Tienes al menos 30 minutos sin interrupciones
- [ ] Tienes contexto real de las sesiones recientes
- [ ] Conoces el estado actual del sistema (qué archivos formales existen)
- [ ] Si auditas con IA: la IA tiene acceso al repo para leer contenido real

### 4.3 Protocolo de auditoría 1 a 1

Para **cada archivo** en inbox/, en orden de prioridad (🔴 primero):

```
PASO 1 — LEER
  Abrir el archivo y leer el contenido completo.
  No decidir por el nombre del archivo.
  No asumir que el contenido es lo que parece.

PASO 2 — EVALUAR con estas preguntas:
  a) ¿La información técnica sigue siendo correcta?
  b) ¿Este contenido ya existe en el sistema formal?
  c) ¿Este contenido ha sido superado por trabajo posterior?
  d) ¿Tiene partes válidas mezcladas con partes obsoletas?
  e) ¿Existe un archivo de destino claro para esto?

PASO 3 — CLASIFICAR (elegir UNA acción):
  ✅ MOVER     → Info 100% correcta + destino claro
  ✏️  ACTUALIZAR → Info parcialmente correcta → editar → mover
  🔀 FUSIONAR  → Info válida + ya existe mejor archivo destino
  📦 ARCHIVAR  → Info histórica válida pero no operativa
  🗑️  DESCARTAR → Info obsoleta, incorrecta o duplicada

PASO 4 — EJECUTAR la acción clasificada

PASO 5 — VERIFICAR
  Si se migró: comprobar que el archivo destino quedó correcto
  Si se descartó: confirmar que no había nada único que perder

PASO 6 — SIGUIENTE ARCHIVO
```

### 4.4 Auditoría asistida con Perplexity

Cuando se hace la auditoría en sesión con IA:

```
Rol Álvaro:   Toma decisiones (✅ / ✏️ / 🔀 / 📦 / 🗑️)
Rol IA:       Abre archivos, resume contenido real en 2-3 líneas,
              ejecuta acciones en repo, actualiza este README

Flujo:
  1. Álvaro dice: "Empezamos auditoría inbox"
  2. IA abre archivo #1, resume contenido real
  3. Álvaro decide acción
  4. IA ejecuta + confirma
  5. Repetir hasta vaciar inbox
  6. IA actualiza tabla de inventario en este README
  7. IA actualiza MASTER-PENDIENTES si hay items nuevos
```

---

## 5. Criterios de Destino

### 5.1 Árbol de decisión de destino

```
¿Es una sesión de trabajo o diario?
  └─ Sí → diario/YYYY/YYYY-MM-DD.md

¿Es configuración de hardware?
  └─ Madre → hardware/madre/[componente].md
  └─ Acer  → hardware/acer/[componente].md

¿Es configuración de software?
  └─ software/[programa]/[tema].md

¿Es documentación de un agente/modelo IA?
  └─ agentes/[modelo].md

¿Es un proyecto con vida propia?
  └─ proyectos/[nombre-proyecto].md

¿Es una decisión de diseño o arquitectura?
  └─ meta/decisiones/YYYY-MM-DD-[tema].md

¿Es formación / aprendizaje?
  └─ formacion/[area]/[tema].md

¿Es investigación externa?
  └─ investigacion/YYYY-MM-DD-[tema].md

¿Es información histórica sin destino claro?
  └─ archivados/YYYY/[archivo].md
```

### 5.2 Señales de información OBSOLETA

- Hace referencia a una configuración que ya fue reemplazada
- Es un pendiente que ya está resuelto y cerrado
- Es una investigación ya integrada en un archivo formal
- Es un plan de algo que ya no vamos a hacer
- Su fecha es anterior a un cambio estructural conocido del sistema
- Está duplicado en otro archivo inbox o en el sistema formal

### 5.3 Señales de información VÁLIDA

- Configuración activa que no ha cambiado
- Pendiente real que no aparece en ningún otro sitio
- Referencia técnica que aún no tiene archivo destino
- Decisión de diseño que explica el porqué de algo
- Información que solo existe aquí y se perdería si se borra

---

## 6. Convención de Nomenclatura

Todo archivo creado en inbox/ debe seguir este formato:

```
FORMATO:  YYYY-MM-DD[-HH]-[tema-kebab-case].md

EJEMPLOS:
  2026-06-22-tarde-netdata-agentes-llm.md   ✅
  2026-06-22-madre-ufw-ssh.md               ✅
  nota.md                                   ❌ (sin fecha)
  TODO.md                                   ❌ (sin fecha, sin tema)
  2026-06-22.md                             ⚠️  (solo si es diario general)
```

**Archivos especiales** (sin fecha, nombres en MAYÚSCULAS):
- `MASTER-PENDIENTES.md` — único registro maestro de pendientes
- `README.md` — este archivo

---

## 7. SLA — Tiempo Máximo en Inbox

| Tipo de item | Tiempo máximo en inbox | Consecuencia de no cumplir |
|---|---|---|
| Configuración activa de sistema | 7 días | Riesgo de pérdida si el sistema cambia |
| Decisión de diseño | 7 días | Se pierde el contexto y el porqué |
| Pendiente operativo | 3 días | Entra a MASTER-PENDIENTES o se pierde |
| Investigación / documentación | 14 días | Puede quedar desactualizada |
| Sesión de diario | 7 días | Pérdida de contexto temporal |
| Item con estado 🔴 ACTIVO | Sin límite | Es activo intencionalmente |

---

## 8. Integración con el Sistema

```
                    ┌─────────────┐
     Sesión work    │             │
     Telegram/TOKI  │   INBOX/    │
     Ideas rápidas  │             │
                    └──────┬──────┘
                           │ Auditoría (domingo / ad hoc)
                           ▼
            ┌──────────────────────────────┐
            │                              │
            ▼                              ▼
    ┌──────────────┐              ┌──────────────────┐
    │  SISTEMA     │              │  MASTER-         │
    │  FORMAL      │              │  PENDIENTES.md   │
    │  (repo)      │              │                  │
    └──────┬───────┘              └────────┬─────────┘
           │                               │
           ▼                               ▼
    ┌──────────────┐              ┌──────────────────┐
    │  CONTEXT.md  │              │  Sesión de       │
    │  HOME.md     │              │  trabajo futura  │
    │  AGENT.md    │              └──────────────────┘
    └──────────────┘
```

**Archivos maestros que se actualizan tras cada migración:**
- `CONTEXT.md` — estado actual del ecosistema
- `HOME.md` — si se añade una nueva sección al sistema
- `AGENT.md` — solo si cambia algo estructural del sistema
- `MASTER-PENDIENTES.md` — si hay pendientes nuevos o se cierran existentes

---

## 9. Inventario Actual (22 Jun 2026)

| Archivo | Contenido | Estado | Destino previsto |
|---|---|---|---|
| `MASTER-PENDIENTES.md` | Master todos los pendientes | 🟢 activo | Permanece en inbox |
| `PENDIENTE-git-pull-y-obsidian.md` | Setup git pull + Obsidian | 🟡 auditar | ¿Resuelto ya? |
| `2026-06-22-tarde-netdata-agentes-llm.md` | Netdata + fichas LLM + prompt v2 | 🔴 activo | No mover — ronda 2 pendiente |
| `2026-06-22-plan-dia.md` | Plan del día 22 Jun | 🟡 auditar | `diario/2026/` |
| `2026-06-20-tarde.md` | Sesión general tarde 20 Jun | 🟡 auditar | `diario/2026/` |
| `2026-06-20-tarde2.md` | Continuación sesión 20 Jun | 🟡 auditar | Fusionar en diario |
| `2026-06-20-tarde3-bateria.md` | Config batería Acer | 🟡 auditar | `hardware/acer/bateria.md` |
| `2026-06-20-tarde4-optimizacion.md` | Optimización sistema Acer | 🟡 auditar | `hardware/acer/optimizacion.md` |
| `2026-06-20-tarde5-cierre-acer-inicio-madre.md` | Transición Acer→Madre | 🟡 auditar | `diario/2026/` |
| `2026-06-20-tarde6-hyprlock-dashboard.md` | Hyprlock + dashboard | 🟡 auditar | `software/hyprland/` |
| `2026-06-20-tarde7-madre-estado-red.md` | Estado red Madre | 🟡 auditar | `hardware/madre/red.md` |
| `2026-06-20-tarde8-madre-ia-local.md` | IA local setup Madre | 🟡 auditar | `hardware/madre/ia-local.md` |
| `2026-06-20-tarde9-monitores-volumen.md` | Monitores + volumen | 🟡 auditar | `hardware/madre/monitores.md` |
| `2026-06-20-tarde10-madre-ufw-ssh.md` | UFW + SSH Madre | 🟡 auditar | `hardware/madre/seguridad-red.md` |
| `2026-06-20-tarde11-volumen-hyprland.md` | Volumen Hyprland | 🟡 auditar | Fusionar en hyprland/ |
| `auditoria-ecosistema-2026-06-20.md` | Auditoría estado ecosistema | 🟡 auditar | `meta/auditorias/` |
| `auditoria-personal-repo.md` | Auditoría estructura repo | 🟡 auditar | `meta/auditorias/` |
| `decisiones-sesion-2026-06-20.md` | Decisiones 20 Jun | 🟡 auditar | `meta/decisiones/` |
| `grok-2026-06-20-investigacion-completa.md` | Investigación Grok ecosistema | 🟡 auditar | ¿Ya integrado en agentes/? |
| `grok-2026-06-20-segundo-cerebro-pro.md` | Estructura segundo cerebro pro | 🟡 auditar | `meta/segundo-cerebro/` |
| `modelos-ollama-hardware-madre.md` | Hardware Madre + modelos | 🟡 auditar | Fusionar — agentes/ ya creados |
| `proyecto-dashboard-ecosistema.md` | Plan dashboard visual | 🟡 auditar | `proyectos/` |
| `madre-servidor-pendientes.md` | Pendientes infra Madre | 🟡 auditar | `hardware/madre/pendientes.md` |
| `thdora-estado-stack.md` | Estado stack Acer | 🟡 auditar | `hardware/acer/stack.md` |
| `obsidian-configuracion.md` | Config Obsidian | 🟡 auditar | `software/obsidian/` |
| `segundo-cerebro-fix-gordo.md` | Fix estructura segundo cerebro | 🟡 auditar | `meta/segundo-cerebro/` |
| `formacion-python-osint.md` | Plan formación Python + OSINT | 🟢 activo | `formacion/` |

**Total:** 27 archivos · 🔴 1 activo · 🟢 2 permanentes · 🟡 24 pendientes de auditoría

---

## 10. Changelog

| Versión | Fecha | Cambios |
|---|---|---|
| 1.0 | 2026-06-20 | Creación inicial — procedimiento básico de captura |
| 2.0 | 2026-06-22 | Elevación a estándar de ingeniería: estados, SLA, árbol de decisión, protocolo formal de auditoría, integración con sistema, inventario completo |

---

_Owner: alvarofernandezmota-tech · Revisión programada: cada domingo_
_Ver: [[HOME]] · [[CONTEXT]] · [[AGENT]] · [[inbox/MASTER-PENDIENTES]]_
