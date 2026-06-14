# Migración personal → personal-v2

## Qué es

Hoja de ruta para migrar el contenido valioso de la repo antigua ([personal](https://github.com/alvarofernandezmota-tech/personal)) a este second brain (personal-v2). La repo antigua era la versión 1 sin estructura consolidada. personal-v2 es la madre — todo el conocimiento centralizado aquí.

---

## Estado actual

**Auditado:** 14 junio 2026  
**Progreso migración:** 0% — pendiente de ejecutar

---

## Auditoría de personal (repo origen)

### Estructura completa de personal

```
personal/
├── 00_sistema/            → setup y configuración de máquinas
├── 00_yo/                 → perfil personal
├── 01_traking_diario/     → diarios y tracking antiguo (2025–ene 2026)
├── 02_formacion/
│   ├── 01_diarios/        → diarios de formación
│   ├── 02_python/         ← CURSO PYTHON ESCUELA MUSK (M1–M5 completados)
│   ├── 03_so2-kernel/     ← Sistemas Operativos II
│   ├── 04_lenguaje-c/     ← Lenguaje C
│   ├── 05_sql/            ← SQL
│   ├── 06_cursos-externos/
│   ├── 07_linux/          ← Linux
│   └── chuletas/          ← chuletas rápidas de consulta
├── 03_proyectos/
├── 04_curiosidad/
├── 05_contenido/
├── 05_proyectos/          (duplicado de numeración — pendiente fix)
└── sql/                   (SQL en raíz — duplicado, fusionar)
```

### Inventario de valor por carpeta

| Carpeta | Valor | Destino en personal-v2 | Prioridad |
|---|---|---|---|
| `02_formacion/02_python/` | ⭐⭐⭐ ALTO — curso activo M1–M5 + tests | `formacion/python/` | 🔥 1ª |
| `02_formacion/chuletas/` | ⭐⭐⭐ ALTO — referencia rápida | `formacion/chuletas/` | 🔥 1ª |
| `02_formacion/03_so2-kernel/` | ⭐⭐ MEDIO — apuntes SO2 | `formacion/so2-kernel/` | 2ª |
| `02_formacion/04_lenguaje-c/` | ⭐⭐ MEDIO — apuntes C | `formacion/lenguaje-c/` | 2ª |
| `02_formacion/05_sql/` | ⭐⭐ MEDIO — apuntes SQL | `formacion/sql/` | 2ª |
| `02_formacion/07_linux/` | ⭐⭐ MEDIO — apuntes Linux | `formacion/linux/` | 2ª |
| `00_yo/` | ⭐⭐ MEDIO — perfil antiguo | revisar vs `yo/` actual | 3ª |
| `01_traking_diario/` | ⭐ BAJO — contexto histórico 2025 | `diarios/2025/` | 3ª |
| `03_proyectos/` + `05_proyectos/` | ⭐⭐ MEDIO — proyectos anteriores | `proyectos/` | 3ª |
| `04_curiosidad/` | ⭐ BAJO — notas sueltas | revisar antes de migrar | 4ª |
| `05_contenido/` | ⭐ BAJO — contenido Instagram/redes | revisar antes de migrar | 4ª |
| `sql/` (raíz) | ⭐⭐ MEDIO — fusionar con formacion/sql | `formacion/sql/` | 2ª |

---

## Estado del curso Python — Escuela Musk

*Última auditoría del curso: 29 abril 2026*

| Módulo | Contenido | Lecciones | Tests | Estado |
|---|---|---|---|---|
| M1 | Introducción a Python | 38/38 | — | ✅ 100% |
| M2 | Fundamentos | 67/67 | — | ✅ 100% |
| M3 | POO Básica | 23/23 | — | ✅ 100% |
| M4 | POO Avanzada | 49/49 | — | ✅ 100% |
| M5 | Manipulación de datos (Pandas, NumPy, archivos) | 48/49 | 26/26 ✅ | ✅ 100% |
| CE | Clases Extra (SQL, Lambda, PCA, Testing) | 0/6 | 0 | 🔥 Siguiente |
| M6 | Git & GitHub | 0 | 0 | ⏳ Pendiente |
| M7 | Proyecto Final | 0 | 0 | ⏳ Pendiente |

**Progreso general: ~75%**

---

## Decisiones tomadas

- personal-v2 es la madre — todo el conocimiento va aquí
- personal (v1) queda como archivo histórico — no se borra, se referencia
- python-snippets queda como repo pública de proyectos Python — se referencia desde `formacion/python/`
- La migración es progresiva — primero Python, luego resto de formación, luego proyectos
- El setup de entorno (Python, venv, herramientas) se documenta en `setup/python.md`

---

## TODO próximo

- [ ] Migrar `02_formacion/02_python/` → `formacion/python/` (M1–M5 + auditoría)
- [ ] Crear `setup/python.md` con entorno completo documentado
- [ ] Migrar chuletas → `formacion/chuletas/`
- [ ] Migrar SO2, C, SQL, Linux → `formacion/`
- [ ] Revisar `00_yo/` vs `yo/` actual — fusionar lo útil
- [ ] Migrar diarios 2025 → `diarios/2025/`
- [ ] Revisar proyectos v1 → `proyectos/`
- [ ] Archivar/deprecar personal (v1) cuando migración esté completa

---

## Historial

| Fecha | Acción |
|---|---|
| 14 jun 2026 | Auditoría completa de personal (v1) — plan de migración creado |
