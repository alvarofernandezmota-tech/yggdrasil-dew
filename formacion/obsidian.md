# 🔮 Obsidian — Formación

> Área de formación: 17 junio 2026
> Estado: ⏳ **Instalar HOY** — ver checklist en [setup/obsidian.md](../setup/obsidian.md)

---

## Por qué Obsidian resuelve el problema de documentación

**Problema actual:** el vault siempre está desactualizado porque editarlo via IA tiene fricción.

**Con Obsidian:**
- Editas directamente como Notion — sin terminal, sin GitHub, sin IA intermediaria
- Plugin Git hace push automático a GitHub
- Links entre notas: `[[CONTEXT]]` → navegación instantánea
- Búsqueda local instantánea sobre todo el vault
- Dataview: queries tipo SQL sobre tus notas
- Smart Connections + Ollama = RAG local sobre todo tu historial

---

## Qué aprender (en orden)

### Fase 1 — HOY
- [ ] Instalar Obsidian en varopc: `yay -S obsidian`
- [ ] Abrir vault → `~/repos/yggdrasil-dew`
- [ ] Plugin Git: instalar, configurar auto-pull, verificar push

### Fase 2 — Esta semana
- [ ] Templater → plantilla automática para diarios
- [ ] Calendar → vista calendario del diario
- [ ] Dataview → query de proyectos activos

### Fase 3 — Este mes
- [ ] Smart Connections → conectar con Ollama local (qwen3:8b en varopc)
- [ ] Canvas → mapa visual del ecosistema

---

## Plugins plan de instalación

| Plugin | Fase | Para qué |
|---|---|---|
| **Git** | 1 - HOY | Sync automático con GitHub |
| **Templater** | 2 | Plantillas automáticas diarios |
| **Calendar** | 2 | Vista calendario |
| **Dataview** | 2 | Queries sobre notas |
| **Smart Connections** | 3 | RAG con Ollama local |

---

## Recursos

- [setup/obsidian.md](../setup/obsidian.md) ← instalación paso a paso
- [Obsidian Git plugin](https://github.com/denolehov/obsidian-git)
- [Smart Connections + Ollama](https://github.com/brianpetro/obsidian-smart-env)
