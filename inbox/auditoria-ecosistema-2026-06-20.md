---
tags: [auditoria, migracion, ecosistema, pendiente, fix-gordo]
fecha: 2026-06-20
destino: ECOSISTEMA.md + diarios/2026-06-20.md
---

# 📋 Auditoría ecosistema completo — 20 jun 2026

> Esta nota es el mapa del fix gordo pendiente.
> Cuando se ejecute → mover a [[diarios/2026-06-20]] y archivar esta nota.

---

## ✅ Lo que ya está hecho hoy

| Archivo | Ruta | Estado |
|---|---|---|
| Baúl | `inbox/README.md` | ✅ creado |
| Índice infra | `setup/README.md` | ✅ creado |
| Ficha varopc | `setup/varopc.md` | ✅ creado |
| Ficha Madre | `setup/madre.md` | ✅ creado |
| Ficha red | `setup/red.md` | ✅ creado |
| Perfil | `yo/perfil.md` | ✅ creado |
| Ficha thdora | `proyectos/thdora.md` | ✅ creado |
| Ficha Perplexity | `agentes/perplexity.md` | ✅ creado |
| Ficha Python | `formacion/python.md` | ✅ creado |
| HOME con inbox primero | `HOME.md` | ✅ actualizado |
| Diario completo | `diarios/2026-06-20.md` | ✅ 4 sesiones |

---

## ⏳ Fichas pendientes (links rotos en HOME)

| Archivo a crear | Ruta destino | Datos de origen |
|---|---|---|
| Ficha Grok | `agentes/grok.md` | `AGENT.md` |
| Ficha Gemini | `agentes/gemini.md` | `AGENT.md` |
| Ficha OpenCode | `agentes/opencode.md` | `AGENT.md` |
| Ficha Linux | `formacion/linux.md` | `AGENT.md` + diarios |
| Ficha OSINT | `formacion/osint.md` | `osint/README.md` |
| Ficha ai-toolkit | `proyectos/ai-toolkit.md` | repo `ai-toolkit` |
| Ficha impresión 3D | `proyectos/impresion-3d.md` | repo `impresion-3d` |
| Ficha Redmi A5 | `proyectos/redmi-a5.md` | pendiente |
| Ficha HP rescate | `proyectos/hp-rescate.md` | `Informe-de-Incidencia-Disco-Duro-No-Detectado-V2.md` |
| Objetivos 2026 | `yo/objetivos-2026.md` | `yo/perfil.md` |

---

## 🚚 Migración pendiente desde `personal`

Repo: https://github.com/alvarofernandezmota-tech/personal

| Carpeta origen | Destino en yggdrasil-dew | Prioridad |
|---|---|---|
| `01_traking_diario/` | `diarios/` (con tags) | 🔴 alta |
| `02_formacion/` | `formacion/` | 🟡 media |
| `04_curiosidad/` | `inbox/` o `curiosidad/` | 🟡 media |
| `00_yo/` | `yo/` | 🟡 media |
| `03_proyectos/` + `05_proyectos/` | `proyectos/` (revisar duplicado) | 🟢 baja |
| `05_contenido/` | pendiente decidir | 🟢 baja |

**Tras migrar:** marcar `personal` como archivado en su README.

---

## 🛠️ Cómo ejecutar el fix gordo

```
1. git pull en varopc
2. Perplexity lee personal/ carpeta a carpeta
3. Push fichas pendientes a yggdrasil-dew
4. Migrar diarios de personal/ a diarios/ con tags
5. Migrar formacion/ de personal/
6. Archivar personal/
7. Actualizar HOME.md + ECOSISTEMA.md
8. git pull + ver grafo en Obsidian
```

---

_Nota creada por [[agentes/perplexity]] · 20 jun 2026 · mover a diario cuando se ejecute_
