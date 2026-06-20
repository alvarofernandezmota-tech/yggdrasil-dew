---
tags: [inbox, auditoria, personal, migracion, tracking, formacion]
fecha: 2026-06-20
fuente: auditoria manual repo personal
destino-pendiente: multiples (ver tabla)
estado: planificacion
---

# 📊 Auditoría repo `personal` — Plan de migración

> INBOX. No migrar nada hasta decidirlo aquí primero.
> El repo `personal` NO se toca mientras el curso de Python siga activo.
> Se va migrando poco a poco, carpeta por carpeta, sin prisa.

---

## 🗂️ Estructura actual de `personal`

```
personal/
├── 00_sistema/        ← prompts, sistema, diccionario IA
├── 00_yo/             ← identidad, objetivos, reflexiones
├── 01_traking_diario/ ← ⭐ VIDA DIARIA — hábitos, diarios 2025
├── 02_formacion/      ← ⭐ CURSO PYTHON — activo, no tocar
├── 03_proyectos/      ← proyectos anteriores
├── 04_curiosidad/     ← notas sueltas, recursos, links
├── 05_contenido/      ← contenido creado
├── 05_proyectos/      ← duplicado de 03? — auditar
├── sql/               ← prácticas SQL — activo
├── docs/              ← documentación general
├── CHANGELOG.md
└── README.md
```

---

## 🛋️ Plan de migración — carpeta por carpeta

| Carpeta | Contenido | Destino en ygg | Prioridad | Tocar? |
|---|---|---|---|---|
| `01_traking_diario/` | Diarios 2025 · hábitos · tracking | `diarios/2025/` + `yo/habitos.md` | 🟡 media | ⏳ planificar |
| `02_formacion/` | Curso Python M01-M07 · SQL | **NO TOCAR** — sigue activo aquí | 🔴 nunca mover | ❌ dejar |
| `00_yo/` | Identidad · objetivos · reflexiones | `yo/` en ygg | 🟡 media | ⏳ planificar |
| `00_sistema/` | Prompts · diccionario IA | `agentes/prompts.md` | 🟢 baja | ⏳ futuro |
| `04_curiosidad/` | Notas sueltas · recursos · links | `inbox/` ygg → decidir | 🟢 baja | ⏳ futuro |
| `03_proyectos/` | Proyectos anteriores | `proyectos/` o `archive/` | 🟢 baja | ⏳ futuro |
| `05_proyectos/` | Duplicado? — auditar primero | A decidir | 🟢 baja | ⏳ auditar |
| `sql/` | Prácticas SQL activas | **NO TOCAR** — sigue activo | 🔴 nunca mover | ❌ dejar |
| `05_contenido/` | Contenido creado | `yo/contenido/` o `archive/` | 🟢 baja | ⏳ futuro |

---

## 🗓️ `01_traking_diario/` — Vida diaria y hábitos

> Esta es la carpeta más valiosa para migrar.
> Contiene el historial de vida de 2025 — diarios, hábitos, tracking.

### ¿Cómo seguir el tracking desde hoy?

**Opción A — Seguir en `personal` (más simple):**
- Abrir `personal/01_traking_diario/` desde Obsidian
- Añadir entradas 2026 directamente allí
- Migrar a ygg cuando `personal` se archive

**Opción B — Continuar en `yggdrasil-dew` desde hoy (recomendado):**
- Tracking 2025 → se queda en `personal` como histórico
- Tracking 2026 → `diarios/` en ygg (ya empezamos hoy)
- `yo/habitos.md` en ygg → tracking de hábitos activo
- `personal` queda como archivo histórico 2025

> ⭐ **Recomendación: Opción B.** El diario de hoy (20 jun 2026) ya está en ygg.
> El corte es limpio: 2025 en `personal`, 2026 en `yggdrasil-dew`.

### Migrar diarios 2025 (cuando haya tiempo)

```
personal/01_traking_diario/01_diarios/2025/
        ↓ (cuando se decida)
yggdrasil-dew/diarios/2025/
```
No urgente. El histórico no desaparece — sigue en `personal` con Git.

---

## 🐍 `02_formacion/` — Curso Python (NO TOCAR)

> El curso vive en `personal` y **termina allí**.
> Los aprendizajes se documentan en [[formacion/python]] de ygg.
> El repo `personal` no se archiva hasta terminar el curso.

```
personal/02_formacion/02_python/
  ├── M01/ ✅
  ├── M02/ ✅
  ├── M03/ ✅
  ├── M04/ ✅
  ├── M05/ ⏳ ← SIGUIENTE
  ├── M06/ ⏳
  └── M07/ ⏳
```

Lo que sí se hace: documentar conceptos aprendidos en [[formacion/python]] después de cada módulo.

---

## ✅ Acciones antes de archivar esta nota

- [ ] Decidir Opción A o B para tracking diario → confirmado: **Opción B** (2026 en ygg)
- [ ] Crear `yo/habitos.md` en ygg → tracking de hábitos 2026
- [ ] Auditar `05_proyectos/` en personal → ¿es duplicado de `03_proyectos/`?
- [ ] Terminar M05 Python → documentar en [[formacion/python]]
- [ ] Cuando termine el curso → archivar `personal` completo
- [ ] Mover esta nota a [[diarios/2026-06-20]] cuando procesada

---

_Repo personal: https://github.com/alvarofernandezmota-tech/personal_
_Ver también: [[formacion/python]] · [[diarios/2026-06-20]] · [[inbox/MASTER-PENDIENTES]] · [[HOME]]_
