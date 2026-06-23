---
tags: [agentes, gemini, google, colab, notebooklm, ecosistema]
fecha: 2026-06-14
estado: referencia
ruta-obsidian: agentes/gemini.md
---

# Gemini — Ecosistema Google

> Última actualización: 14 junio 2026

---

## Qué es y para qué lo usamos

Gemini es la IA de Google. En nuestro flujo, **Gemini es la capa de entrada y diseño**. Perplexity es la capa de acción sobre GitHub.

---

## Herramientas Google integradas

| Herramienta | Uso concreto | Estado |
|---|---|---|
| **Gemini** | Diseño técnico, voz, visual, docs largos | ✅ Activo |
| **Google Colab** | Notebooks Python + GPU gratis conectados a GitHub | ✅ Integrado |
| **NotebookLM** | RAG sobre documentos propios (repo, PDFs, apuntes) | ✅ Integrado |
| **Google Docs** | Borradores largos antes de subir al repo | ✅ Activo |
| **Google Drive** | Archivos grandes: PDFs, imágenes, vídeos | ✅ Activo |

> **Regla:** Archivos grandes viven en Drive. La fuente de verdad es siempre este repo Git.

---

## Google Colab → GitHub

```python
# En el notebook de Colab
import subprocess
subprocess.run(["git", "clone",
    "https://github.com/alvarofernandezmota-tech/yggdrasil-dew.git"])
```

---

## Protocolo de handoff con Perplexity

```
Gemini / Colab / NotebookLM → Álvaro → Perplexity → GitHub

1. Google genera el contenido (voz, visual, código, diseño)
2. Álvaro copia y revisa
3. Le pasa a Perplexity: "sube esto a [ruta]"
4. Perplexity estructura y sube con commit
5. Queda documentado en GitHub
```

**Regla de oro:** Si tiene que acabar en GitHub → pasa por Perplexity.
Si es voz, foto, notebook o documento Google → empieza en el ecosistema Google.

---

_Ver también: `agentes/perplexity.md` | `agentes/prompts.md` | `AGENT.md`_
