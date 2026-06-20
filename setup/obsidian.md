---
tags: [setup, obsidian, ia, plugins, configuracion]
fecha-actualizacion: 2026-06-20
---

# 🟣 Obsidian — Setup completo + IA integrada

## Qué es

Obsidian es el vault local del segundo cerebro yggdrasil-dew.
Los archivos son Markdown puro — viven en `~/Projects/yggdrasil-dew/`.
GitHub es el backup y el puente entre agentes.

---

## 🔌 Plugins instalados (instalar en orden)

### 1. Obsidian Git — auto-sync con GitHub
```
Settings → Community Plugins → Browse → "Obsidian Git" → Install
```
Config:
```
Auto pull interval: 5 minutos
Auto push interval: 10 minutos  
Commit message: vault: auto-sync {{date}}
Default branch: main
```
> Resultado: escribes una nota → se sube sola a GitHub en 10 min. Sin `git push` manual.

### 2. Copilot — Chat IA dentro de Obsidian
```
Settings → Community Plugins → Browse → "Copilot" → Install
```

**Sí — Copilot tiene Obsidian DENTRO** — o mejor dicho: el plugin Copilot mete un chat con Claude/GPT/Gemini directamente en Obsidian, con contexto de tus notas.

Conéctalo a Claude (Anthropic API) o GPT (OpenAI API):
```
Settings → Copilot → API Keys:
  - Anthropic API Key: sk-ant-...
  - Model: claude-sonnet-4-5
```

Qué puedes hacer desde dentro de Obsidian:
- Chat con Claude con tus notas como contexto
- Mejorar una nota: seleccionar texto → "Improve Writing"
- Resumir un archivo largo
- Preguntar sobre el contenido de tu vault
- Generar nuevas notas desde el chat

### 3. Local GPT — IA 100% local con Ollama (sin API key)
```
Settings → Community Plugins → Browse → "Local GPT" → Install
```
Config:
```
Ollama URL: http://100.91.112.32:11434
Modelo: qwen2.5:7b  (mejor en castellano)
```
> Funciona vía Tailscale. Sin internet, sin coste, sin mandar datos fuera.

### 4. Smart Connections — RAG sobre tus notas
```
Settings → Community Plugins → Browse → "Smart Connections" → Install
```
Busca conexiones semánticas entre notas. Muestra qué notas están relacionadas sin que tú lo hayas enlazado.

### 5. Dataview — Queries sobre el vault
```
Settings → Community Plugins → Browse → "Dataview" → Install
```
Permite hacer queries sobre tus notas como si fueran una base de datos:
````
```dataview
TABLE estado, fecha FROM "proyectos"
WHERE estado = "activo"
SORT fecha DESC
```
````

### 6. Templater — Plantillas automáticas
```
Settings → Community Plugins → Browse → "Templater" → Install
```
Plantilla diario automática: al crear `diarios/YYYY-MM-DD.md` → rellena la estructura sola.

---

## ⚙️ Configuración base de Obsidian

```
Settings → Files & Links:
  Default location for new notes: inbox/
  New link format: Relative path
  Use [[Wikilinks]]: ON

Settings → Editor:
  Readable line length: ON
  Strict line breaks: OFF

Settings → Appearance:
  Theme: Minimal (recomendado)
```

---

## 🗓️ Plantilla diario (Templater)

Guardar en `templates/diario.md`:
```markdown
---
tags: [diario]
fecha: <% tp.date.now("YYYY-MM-DD") %>
---

# 🗓️ <% tp.date.now("dddd D MMMM YYYY") %>

## Lo más importante del día
- 

## Técnico
- 

## Reflexión


## Hábitos
- 💤 Dormir: 
- 🏋️ Ejercicio: 
- 💧 Agua: 
- 🐾 Thea: 

## Links
- [[HOME]]
```

---

## ✅ Pasos de instalación (orden correcto)

- [ ] `git pull` en `~/Projects/yggdrasil-dew`
- [ ] Abrir Obsidian → seleccionar vault `~/Projects/yggdrasil-dew`
- [ ] Settings → Community Plugins → activar
- [ ] Instalar: Obsidian Git → configurar auto-sync
- [ ] Instalar: Copilot → conectar API Claude o GPT
- [ ] Instalar: Local GPT → apuntar a Ollama Madre
- [ ] Instalar: Smart Connections
- [ ] Instalar: Dataview
- [ ] Instalar: Templater → crear plantilla diario
- [ ] Settings → Files → Default location: `inbox/`
- [ ] Abrir HOME.md → verificar grafo con `Ctrl+G`

---

_Ver también: [[setup/varopc]] · [[agentes/perplexity]] · [[HOME]]_
