# Gemini — Ecosistema Google

> Última actualización: 12 junio 2026
> **Frecuencia de actualización: al añadir integraciones nuevas.**

---

## Qué es y para qué lo usamos

Gemini es la IA de Google. Se integra con todo el ecosistema Google y tiene capacidades multimodales — voz, imagen, vídeo y texto largo.

En nuestro flujo, **Gemini es la capa de entrada y diseño**. Perplexity es la capa de acción sobre GitHub.

---

## Herramientas Google integradas

| Herramienta | Uso concreto | Estado |
|---|---|---|
| **Gemini** | Diseño técnico, voz, visual, docs largos | ✅ Activo |
| **Google Colab** | Notebooks Python + GPU gratis conectados a GitHub | ✅ Integrado |
| **NotebookLM** | RAG sobre documentos propios (repo, PDFs, apuntes) | ✅ Integrado |
| **Google Docs** | Borradores largos antes de subir al repo | ✅ Activo |
| **Google Drive** | Archivos grandes: PDFs, imágenes, vídeos | ✅ Activo |
| **Gmail / Calendar** | Comunicaciones y planificación | ✅ Activo |

> **Regla:** Archivos grandes (PDFs, imágenes) viven en Drive. La fuente de verdad es siempre este repo Git.

---

## Google Colab → GitHub

**Para qué:** ejecutar código Python con GPU en cloud, probar modelos, scripts de automatización.

### Flujo

```
GitHub repo (personal-v2)
    ↓ git clone dentro del notebook
Colab ejecuta código Python (GPU gratis)
    ↓ resultados, modelos, scripts
Commit de vuelta al repo vía Perplexity
```

### Conexión Colab → GitHub

```python
# En el notebook de Colab
from google.colab import userdata
import subprocess

# Clonar el repo
subprocess.run([
    "git", "clone",
    "https://github.com/alvarofernandezmota-tech/personal-v2.git"
])

# O montar Drive y trabajar desde ahí
from google.colab import drive
drive.mount('/content/drive')
```

### Casos de uso

- Probar scripts Python antes de subirlos al repo
- Ejecutar modelos de ML/IA con GPU sin gastar recursos de Madre
- Análisis de datos del repo (CSVs, logs, tracking)
- Prototipar THDORA antes de desplegarlo en Acer

---

## NotebookLM → Repo como base de conocimiento

**Para qué:** hacer preguntas sobre tus propios documentos. NotebookLM indexa los archivos y responde con contexto real de tu contenido.

### Flujo

```
Archivos del repo (Markdown, PDFs, apuntes)
    ↓ subir a NotebookLM como fuentes
NotebookLM los indexa y genera resumen
    ↓ haces preguntas en lenguaje natural
Responde con citas de tus propios archivos
```

### Qué subir a NotebookLM

| Archivo / Carpeta | Para qué consultarlo |
|---|---|
| `CONTEXT.md` | ¿Qué está pasando ahora? |
| `filosofia.md` | ¿Cuál es mi principio sobre X? |
| `formacion/*.md` | ¿Qué ya sé de Python/SQL/Linux? |
| `proyectos/*.md` | ¿Dónde estaba con THDORA? |
| `diarios/2026/` | ¿Qué hice esta semana? |
| PDFs de libros / apuntes | Consultar sin releer |

### Casos de uso

- ¿Qué decídí sobre la arquitectura del servidor?
- Resumir lo aprendido en formación este mes
- Buscar algo en el repo sin abrirlo archivo por archivo
- Analizar apuntes de libros con OCR previo

---

## Capacidades de Gemini directas

### 🎤 Voz
- Dictar notas, ideas o tareas en lugar de escribir
- **Flujo:** dictas → Gemini transcribe → Perplexity sube al repo

### 🖼️ Visual / OCR
- Foto de libro, apunte, pizarra → texto digital
- Analizar capturas de pantalla (errores, código)
- **Flujo:** foto a Gemini → texto → Perplexity lo estructura en el repo

### 📝 Diseño técnico
- Arquitectura de sistemas, infraestructura, razonamiento profundo
- **Flujo:** Gemini diseña → Álvaro revisa → Perplexity sube al repo

---

## Limitaciones

- ❌ No puede modificar GitHub directamente
- ❌ No tiene acceso en tiempo real a este repo
- ❌ Sin memoria persistente entre sesiones (salvo Gems configurados)
- ⚠️ El contexto hay que darlo manualmente al cambiar de sesión

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
