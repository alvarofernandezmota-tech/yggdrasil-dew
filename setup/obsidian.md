---
tags: [setup, obsidian, ia, plugins, configuracion, open-source]
fecha-actualizacion: 2026-06-20
---

# 🟣 Obsidian — Setup completo + IA integrada

## Qué es

Obsidian es el vault local del segundo cerebro yggdrasil-dew.
Archivos Markdown puro en `~/Projects/yggdrasil-dew/` — sincronizados con GitHub.

> ⚠️ No existe plugin oficial de Microsoft Copilot open-source.
> Lo que sí existe es un ecosistema de plugins libres y gratuitos que meten IA real dentro de Obsidian.

---

## 🧠 IA en Obsidian — Mapa real (jun 2026)

### 🟩 Opción A — Local AI (100% gratis, open-source, sin nube)

```
Settings → Community Plugins → Browse → "Local AI" → Install
```

| Característica | Valor |
|---|---|
| Coste | ✅ Gratis |
| Open-source | ✅ Sí |
| Privacidad | ✅ Todo en local — nada sale fuera |
| Offline | ✅ Funciona sin internet |
| Modelos | LLaMA, Mistral, Phi-3, Gemma, qwen2.5 |
| Requisito | PC con 8-16 GB RAM |

**Para tu setup:** conectar a Ollama en Madre vía Tailscale:
```
Ollama URL: http://100.91.112.32:11434
Modelo recomendado: qwen2.5:7b (mejor en castellano)
```
Gratis para siempre. Sin API key. Sin datos fuera.

---

### 🟦 Opción B — Obsidian-Copilot (open-source, 7k+ estrellas GitHub)

```
Settings → Community Plugins → Browse → "Copilot" → Install
```

| Característica | Valor |
|---|---|
| Coste | ✅ Gratis si usas modelos locales |
| Open-source | ✅ Sí — https://github.com/logancyang/obsidian-copilot |
| Con modelos locales | ✅ 100% gratis |
| Con modelos nube | ⚠️ Necesita API key (Claude, GPT, Gemini) |

Qué permite:
- Chat contextual con tus notas
- Agentes sobre el vault
- Resumen de notas
- Modo completamente local conectado a Ollama

**Config para modo local (gratis):**
```
Copilot Settings → Model: Ollama
Ollama Base URL: http://100.91.112.32:11434
Model name: qwen2.5:7b
```

---

### 🟨 Opción C — Smart Connections (RAG sobre el vault)

```
Settings → Community Plugins → Browse → "Smart Connections" → Install
```

- Busca conexiones semánticas entre notas automáticamente
- Muestra qué notas están relacionadas sin que las hayas enlazado
- Puede usar embeddings locales (gratis) o OpenAI (de pago)
- **Usar modo local:** embeddings con modelo descargado

---

## 🔌 Plugins esenciales (sin IA) — instalar todos

### 1. Obsidian Git — auto-sync con GitHub (el más importante)
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
> Escribes una nota → se sube sola a GitHub en 10 min. Nunca más `git push` manual.

### 2. Dataview — queries sobre el vault
```
Settings → Community Plugins → Browse → "Dataview" → Install
```
Ejemplo — ver todos los proyectos activos:
````
```dataview
TABLE estado, fecha-actualizacion FROM "proyectos"
WHERE estado = "activo"
SORT fecha-actualizacion DESC
```
````

### 3. Templater — plantillas automáticas
```
Settings → Community Plugins → Browse → "Templater" → Install
```
Plantilla diario (`templates/diario.md`):
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
- 🐾 Thea:

## Links
- [[HOME]]
```

### 4. Calendar — navegación por diarios
```
Settings → Community Plugins → Browse → "Calendar" → Install
```
Calendario visual en el panel lateral — clic en un día → abre su diario.

---

## 📈 Tabla de decisión — qué IA elegir

| Objetivo | Plugin | Coste |
|---|---|---|
| IA local gratis sin nube | **Local AI** + Ollama Madre | ✅ 0€ |
| Chat potente open-source | **Obsidian-Copilot** + Ollama | ✅ 0€ |
| Conexiones semánticas auto | **Smart Connections** local | ✅ 0€ |
| Chat con Claude/GPT (nube) | Obsidian-Copilot + API key | 💰 de pago |

**Recomendación para tu setup:**
```
Obsidian-Copilot + Ollama en Madre (100.91.112.32:11434)
→ Gratis · open-source · potente · en castellano con qwen2.5:7b
```

---

## ⚙️ Configuración base de Obsidian

```
Settings → Files & Links:
  Default location for new notes: inbox/
  New link format: Relative path
  Use [[Wikilinks]]: ON

Settings → Editor:
  Readable line length: ON

Settings → Appearance:
  Theme: Minimal (recomendado)
```

---

## ✅ Orden de instalación (hazlo así)

- [ ] `git pull` en `~/Projects/yggdrasil-dew`
- [ ] Abrir Obsidian → vault `~/Projects/yggdrasil-dew`
- [ ] Settings → Community Plugins → activar
- [ ] Instalar **Obsidian Git** → configurar auto-sync
- [ ] Instalar **Obsidian-Copilot** → conectar a Ollama Madre
- [ ] Instalar **Dataview**
- [ ] Instalar **Templater** → crear plantilla diario
- [ ] Instalar **Calendar**
- [ ] Settings → Files → Default location: `inbox/`
- [ ] Abrir HOME.md → verificar grafo con `Ctrl+G`
- [ ] Probar chat en Copilot → pregunta algo sobre tus notas

---

_Ver también: [[setup/varopc]] · [[agentes/perplexity]] · [[agentes/AGENT-SCRIPT]] · [[HOME]]_
