---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 3.0
tags: [sesion, apertura, contexto, dew-sesiones]
status: vigente
---

# PROTOCOLO-APERTURA-SESION v3

> Protocolo de apertura milimétrico al ecosistema Yggdrasil.
> El agente NO actúa sobre ningún repo hasta completar los 6 pasos en orden.
> Cada paso referencia archivos reales que existen en el ecosistema.

---

## CONTRATO DEL AGENTE

```
Antes de tocar cualquier repo, debo completar los 6 pasos.
Si me salto uno, declaro el motivo explícitamente.
No asumo contexto de sesiones anteriores — siempre leo el estado real.
```

---

## PASO 1 — Leer issue de apertura (si existe)

**Repositorio:** `yggdrasil-dew`
**Dónde buscar:** Issues abiertos con título `[APERTURA]` o `[SESION]`

```
¿Hay issue de apertura creado en el cierre anterior?
  SÍ → Leer el issue completo. Contiene: contexto, objetivo, repos críticos, bloqueos.
  NO → Continuar desde PASO 2 sin issue de apertura.
```

**Si hay issue de apertura, extraer:**
- Objetivo declarado de la sesión anterior
- Repos que quedaron con trabajo pendiente
- Bloqueos conocidos
- Notas especiales del agente anterior

---

## PASO 2 — Contexto macro del ecosistema

**Invocar:** `PROTOCOLO-CONTEXTO-MACRO.md` (ejecución completa)

Leer en este orden exacto:

| Orden | Archivo | Repo | Qué extrae |
|---|---|---|---|
| 1 | `ECOSYSTEM-ARCHITECTURE.md` | `yggdrasil-dew` | Mapa completo, repos activos, jerarquía |
| 2 | `ESTADO-SISTEMA.md` | `yggdrasil-dew` | Estado actual de cada isla |
| 3 | `DASHBOARD.md` | `yggdrasil-dew` | Vista rápida de métricas y alertas |
| 4 | `MASTER-PENDIENTES.md` | `yggdrasil-dew` | Tareas pendientes por repo y prioridad |
| 5 | `PLAN-MAESTRO-2026-07.md` | `yggdrasil-dew` | Roadmap del mes en curso |
| 6 | `NORMAS.md` | `yggdrasil-dew` | Reglas que aplican a esta sesión |

**Salida obligatoria:**
```
[ECOSISTEMA LEÍDO]
Repos activos: 10
Críticos hoy: [lista]
Pendientes urgentes: [lista]
Roadmap mes: [objetivo principal julio 2026]
```

---

## PASO 3 — Verificar DEW-SESIONES (diario del día)

**Repositorio objetivo:** `yggdrasil-tracking`
**Ruta esperada:** `diarios/YYYY/YYYY-MM-DD.md` o estructura equivalente

```
¿Existe entrada de diario para HOY (2026-07-14)?
  SÍ + sin cerrar → La sesión anterior no cerró. Revisar qué quedó abierto.
  SÍ + cerrado    → Leer resumen del cierre para contexto.
  NO              → CREAR entrada de diario de hoy antes de continuar.
```

**Si hay que CREAR el diario de hoy, usar esta plantilla:**

```markdown
---
fecha: YYYY-MM-DD
status: abierto
sesion_inicio: HH:MM CEST
---

# Diario YYYY-MM-DD

## Apertura
- Hora inicio: HH:MM
- Objetivo declarado: [a completar en PASO 6]
- Contexto previo: [resumen del issue de apertura o "primera sesión del día"]

## Trabajo realizado
<!-- El agente completa esto durante la sesión -->

## Cierre
<!-- El agente completa esto en PROTOCOLO-CIERRE-SESION -->
```

---

## PASO 4 — Identificar repos a tocar hoy

**Fuente:** Resultado del PASO 2 (MASTER-PENDIENTES + issue apertura)

Para cada repo candidato, verificar:
- ¿Tiene trabajo pendiente en `MASTER-PENDIENTES.md`?
- ¿Hay issues abiertos con `prioridad:alta`?
- ¿El `ESTADO-SISTEMA.md` lo marca con 🔴 o 🟡?

**Tabla de repos activos del ecosistema:**

| Repo | Capa | Estado esperado | Archivo de estado |
|---|---|---|---|
| `yggdrasil-dew` | 🧠 Cerebro | ✅ Activo | `ESTADO-SISTEMA.md` |
| `yggdrasil-wiki` | 🧠 Cerebro | ✅ Activo | `ESTADO-ISLA-WIKI.md` |
| `yggdrasil-tracking` | 📓 Tracking | ✅ Activo | `ESTADO-ISLA-TRACKING.md` |
| `formacion-tech` | 📚 Formación | ✅ Activo | `README.md` |
| `investigacion-ia` | 📚 Formación | ✅ Activo | `README.md` |
| `madre-config` | 🖥️ Infra | ✅ Activo | `README.md` |
| `acer-config` | 🖥️ Infra | ✅ Activo | `README.md` |
| `ollama-stack` | 🤖 IA Local | ✅ Activo | `README.md` |
| `local-brain` | 🤖 IA Local | ✅ Activo | `README.md` |
| `THDORA-PERSONAL` | 🦾 Thdora | 🟡 Mantenimiento | `README.md` |
| `yggdrasil-secops` | 🛡️ Seguridad | ✅ Activo | `README.md` |
| `yggdrasil-scripts` | ⚙️ Auto | ✅ Activo | `README.md` |
| `dev-labs` | 🧪 Labs | ✅ Activo | `README.md` |

---

## PASO 5 — Declarar objetivo y límites de sesión

Antes de actuar, declarar explícitamente:

```
[OBJETIVO SESIÓN YYYY-MM-DD]
Objetivo principal: [qué se va a hacer]
Repos que se van a tocar: [lista]
Repos que NO se tocarán hoy: [lista]
Bloqueos conocidos: [lista o "ninguno"]
Tiempo estimado: [estimación]
```

**Regla:** Si el objetivo no cabe en una frase, está mal definido.

---

## PASO 6 — Declaración de apertura

Una vez completados los 5 pasos anteriores, declarar:

```
[SESIÓN ABIERTA]
Fecha: YYYY-MM-DD HH:MM CEST
Contexto cargado: ✅
Diario: ✅ (creado/verificado en yggdrasil-tracking)
Ecosistema: 10 repos activos leídos
Críticos: [N repos con alertas]
Objetivo: [frase]
Repos hoy: [lista]
NO tocar: [lista]

PRIMERA ACCIÓN: [la primera cosa concreta a hacer]
```

---

## ESCALADO

| Nivel | Forma | Cuándo |
|---|---|---|
| Script | `scripts/apertura.sh` | Cuando exista en `yggdrasil-scripts` |
| GitHub Action | `yggdrasil-scripts/.github/workflows/apertura.yml` | Automatización futura |
| Bot THDORA | Comando `/apertura` en Telegram | Cuando THDORA esté en producción |

---

_v3.0 · 2026-07-14 · Milimétrico al ecosistema Yggdrasil real_
