---
tags: [inbox, grok, obsidian, para, estructura, plugins, dashboard, segundo-cerebro]
fecha: 2026-06-20
fuente: Grok (xAI) via AGENT-SCRIPT
destino-pendiente: setup/obsidian.md · HOME.md · docs/dashboard.md
estado: revisar-antes-de-aplicar
---

# 🧠 Grok — Segundo Cerebro Pro (PARA method) — 20 jun 2026

> ⚠️ INBOX. No aplicar directamente.
> Revisar cada propuesta, decidir qué encaja con el sistema actual, mover al destino.
> La estructura actual (inbox/ setup/ proyectos/ formacion/ diarios/ agentes/ yo/) ya es sólida.
> No migrar todo de golpe — solo adoptar lo que añada valor real.

---

## 📐 Estructura propuesta por Grok (PARA numerado)

```
yggdrasil-dew/
├── 00. Inbox/              # TODO aquí primero (regla sagrada)
│   ├── personal/
│   ├── proyectos/
│   └── quick-capture.md
├── 10. Projects/           # thdora, impresion-3d, ai-toolkit
│   └── thdora/
│       ├── README.md
│       ├── inbox/
│       ├── docs/
│       └── tasks/
├── 20. Areas/              # Formación, Salud, Finanzas
├── 30. Resources/          # Python, Linux, OSINT, IA
├── 40. Archive/            # Completado / inactivo
├── 50. Atlas/              # MOCs + índices temáticos
├── 05. Journal/            # Diarios diarios
├── 99. Meta/               # AGENT.md, CONTEXT.md, ECOSISTEMA.md
├── attachments/
└── templates/
```

### ✅ Decisión antes de aplicar

> Valorar si la numeración añade valor o complica los wikilinks actuales.
> Los `[[wikilinks]]` de Obsidian no necesitan rutas completas si los nombres son únicos.
> **Propuesta más conservadora:** mantener estructura plana actual + añadir solo `40. Archive/` y `50. Atlas/`.

---

## 🔌 Plugins recomendados por Grok (2026)

### Imprescindibles (instalar ya)

| Plugin | Para qué | Prioridad |
|---|---|---|
| **Obsidian Git** | Auto-sync GitHub | 🔴 ya |
| **Dataview** | Queries vault como base de datos | 🔴 ya |
| **Templater** | Plantillas automáticas (diario, proyecto, inbox) | 🔴 ya |
| **Tasks** | Gestión tareas con queries | 🟡 semana |
| **Calendar + Daily Notes** | Navegación por diarios | 🟡 semana |

### Muy recomendados para el setup

| Plugin | Para qué |
|---|---|
| **Advanced URI** | Integración TOKI / scripts externos |
| **Canvas** | Mapas visuales del ecosistema |
| **Smart Connections** | IA local Ollama — conexiones semánticas |
| **Metadata Menu** | Frontmatter estructurado — genial para proyectos |

> Máximo 10-12 plugins activos. No sobrecargar.

---

## 📊 DASHBOARD.md — Borrador con Dataview (Grok)

> Crear en raíz del vault o en `docs/DASHBOARD.md`.
> Muestra estado del sistema en tiempo real con queries automáticas.

````markdown
---
tags: [dashboard, sistema, dataview]
---

# 📊 Dashboard — Yggdrasil-dew

## 📥 Inbox pendiente
```dataview
LIST FROM "inbox"
WHERE file.name != "README"
SORT file.mtime DESC
```

## 📁 Proyectos activos
```dataview
TABLE estado, fecha-actualizacion FROM "proyectos"
WHERE estado = "activo" OR estado = "produccion"
SORT fecha-actualizacion DESC
```

## 🗓️ Últimos diarios
```dataview
LIST FROM "diarios"
SORT file.name DESC
LIMIT 7
```

## ⏳ Tareas pendientes hoy
```tasks
not done
due today
```
````

---

## 🛠️ .gitignore mejorado (Grok)

```gitignore
# Obsidian UI state (volátil — no commitear)
.obsidian/workspace.json
.obsidian/app.json
.obsidian/appearance.json
.obsidian/workspace-cache.json

# Algunos plugins guardan data local
.obsidian/plugins/*/data.json

# Sistema
.DS_Store
Thumbs.db
*.log

# Archivos pesados (usar Git LFS si hacen falta)
attachments/*.mp4
attachments/*.zip

# Local only
.env
*.env.local
```

---

## 🔄 Flujo CODE (Tiago Forte) — versión Grok

```
Capture   → inbox/ (TOKI /inbox, quick-capture, móvil)
Organize  → mover a destino + linkar MOCs
Distill   → resumir / añadir links relevantes
Express   → usar en proyectos / thdora / formacion
```

---

## 🎤 Templates recomendadas por Grok

### Template Proyecto (guardar en `templates/proyecto.md`)

```markdown
---
tags: [proyecto, {{nombre}}]
fecha-inicio: <% tp.date.now("YYYY-MM-DD") %>
estado: activo
prioridad:
---

# 📁 {{nombre}}

## Objetivo

## Inbox del proyecto
- [[inbox/]]

## Tareas
- [ ]

## Notas

## Links
- [[HOME]] · [[CONTEXT]]
```

### Template Recurso (guardar en `templates/recurso.md`)

```markdown
---
tags: [recurso, {{tema}}]
fecha: <% tp.date.now("YYYY-MM-DD") %>
fuente:
---

# 📖 {{tema}}

## Resumen

## Conceptos clave

## Links
```

---

## ✅ Acciones a decidir (antes de mover al destino)

- [ ] **¿Adoptar numeración PARA?** — Valorar vs estructura plana actual
  - Si sí → migrar poco a poco, nunca de golpe
  - Si no → mantener actual + añadir solo `archive/` y `atlas/`
- [ ] **Crear `docs/DASHBOARD.md`** con queries Dataview de arriba → alto valor inmediato
- [ ] **Mejorar `.gitignore`** con el bloque de arriba → 5 min, sin riesgo
- [ ] **Instalar Tasks plugin** → queries de tareas en DASHBOARD
- [ ] **Instalar Advanced URI** → desbloqueador para TOKI handlers
- [ ] **Crear templates** en `templates/` → proyecto.md + recurso.md
- [ ] Mover lo validado a [[setup/obsidian]] + [[HOME]]
- [ ] Archivar esta nota en [[diarios/2026-06-20]] cuando esté procesada

---

_Fuente: Grok (xAI) · 20 jun 2026 · vía [[agentes/AGENT-SCRIPT]]_
_Destino: [[setup/obsidian]] · [[HOME]] · [[docs/DASHBOARD]]_
_Ver también: [[inbox/grok-2026-06-20-investigacion-completa]] · [[inbox/MASTER-PENDIENTES]] · [[CONTEXT]]_
