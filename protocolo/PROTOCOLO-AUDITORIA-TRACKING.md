---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-14
version: 1.0
tags: [auditoria, yggdrasil-tracking, diarios, sesiones]
status: vigente
---

# PROTOCOLO-AUDITORIA-TRACKING v1

> Auditoría milimétrica del repo `yggdrasil-tracking`.
> Es el repo de vida personal, diarios 2026, metas, reflexiones, filosofía, contenido.
> Nuevo repo (activo desde 2026-07-13, migrado de yggdrasil-formacion-).
> Se audita en 4 bloques.

---

## REPO OBJETIVO

```
Repo: yggdrasil-tracking
Capa: 📓 Vida Personal & Tracking
Visibilidad: 🔒 Privado
Activo desde: 2026-07-13 (migración de yggdrasil-formacion-)
Estructura esperada:
  README.md                    ← qué es y cómo está organizado
  ESTADO-ISLA-TRACKING.md      ← estado actual (si existe)
  diarios/                     ← diarios 2026 organizados por fecha
  metas/                       ← metas personales y de sistema
  reflexiones/                 ← reflexiones y retros
  filosofia/                   ← pensamiento, valores
  04_curiosidad/               ← curiosidades y aprendizajes
  05_contenido/                ← contenido a crear o consumir
  inbox/                       ← captura sin clasificar
```

---

## BLOQUE A — Secretos y contenido sensible (🔴 BLOQUEA TODO)

### A1 — Scan de secretos técnicos

Buscar patrones:
```
ghp_, sk-, AIza, eyJ, password=, token=, APIKEY=
```

```
¿Se encuentra algún patrón en archivos técnicos?
  SÍ → 🔴 CRÍTICO. No debería haber archivos técnicos con secretos en tracking.
  NO → ✅ Continuar.
```

### A2 — Datos de terceros

```
¿Hay información personal de terceros que no debería estar en git?
(emails específicos, números de teléfono, documentos escaneados)
  SÍ → 🔴 Eliminar y mover a almacenamiento local encriptado.
  NO → ✅ Continuar.
```

---

## BLOQUE B — Integridad de los diarios

### B1 — Diarios abiertos sin cerrar

```
Buscar en diarios/ todos los archivos con "status: abierto" en frontmatter:
¿Hay diarios de días anteriores con status: abierto?
  SÍ → 🟡 Cada diario abierto es una sesión que no se cerró correctamente.
       Cerrar retroactivamente con nota: "[CIERRE RETROACTIVO YYYY-MM-DD]"
  NO → ✅ Continuar.
```

### B2 — Continuidad de diarios

```
¿Hay huecos de más de 7 días sin entrada de diario?
  SÍ → 🟡 Normal si hubo pausa, pero documentarlo.
       Crear entrada retroactiva o nota de pausa si se considera relevante.
  NO → ✅ Continuar.
```

### B3 — Estructura del diario del día

Cada diario debe tener:
```markdown
---
fecha: YYYY-MM-DD
status: abierto/cerrado
sesion_inicio: HH:MM CEST
---
## Apertura
## Trabajo realizado
## Cierre
```

```
¿Los diarios recientes (últimos 7 días) tienen esta estructura?
  NO → 🟡 Refactorizar los que falten.
```

---

## BLOQUE C — Estructura del repo

### C1 — Archivos obligatorios

| Archivo | ¿Existe? | Notas |
|---|---|---|
| `README.md` | ✅/❌ | Debe explicar toda la estructura |
| `ESTADO-ISLA-TRACKING.md` | ✅/❌ | Deuda si no existe |

### C2 — inbox/ al día

```
¿Hay más de 10 ítems sin clasificar en inbox/?
  SÍ → 🟡 Sesión de clasificación pendiente.
  NO → ✅ Continuar.
```

### C3 — Migración de yggdrasil-formacion- completa

```
¿Todo el contenido relevante de yggdrasil-formacion- fue migrado?
¿Hay referencias en otros repos que apuntan a yggdrasil-formacion- en lugar de yggdrasil-tracking?
  SÍ → 🟡 Actualizar referencias en ECOSYSTEM-ARCHITECTURE.md y MASTER-PENDIENTES.md.
```

---

## BLOQUE D — Conectividad con el ecosistema

### D1 — Aparece correctamente en dew

```
¿yggdrasil-tracking aparece como ✅ Activo en ECOSYSTEM-ARCHITECTURE.md?
¿ESTADO-SISTEMA.md (yggdrasil-dew) refleja su estado real?
¿MASTER-PENDIENTES.md tiene tareas de tracking desactualizadas?
```

### D2 — Nomenclatura

**Referencia:** `CONVENCIONES.md` en `yggdrasil-dew`

```
¿Los diarios siguen el formato YYYY-MM-DD.md?
¿Las carpetas siguen kebab-case?
¿Los commits del repo siguen Conventional Commits?
```

---

## INFORME FINAL

```
[AUDITORÍA TRACKING COMPLETADA]
Fecha: YYYY-MM-DD HH:MM CEST

BLOQUE A (Secretos):         ✅/🟡/🔴
BLOQUE B (Diarios):          ✅/🟡/🔴
BLOQUE C (Estructura):       ✅/🟡/🔴
BLOQUE D (Conectividad):     ✅/🟡/🔴

Diarios abiertos sin cerrar: [N]
Ítems en inbox sin clasificar: [N]
Referencias rotas a formacion-: [N]

ESTADO FINAL: ✅ LIMPIO / 🟡 CON DEUDAS / 🔴 CRÍTICO
```

---

_v1.0 · 2026-07-14 · Milimétrico a yggdrasil-tracking real_
