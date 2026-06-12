# Gemini — Ecosistema Google

> Última actualización: 12 junio 2026

---

## Qué es y para qué lo usamos

Gemini es la IA de Google. Se integra con todo el ecosistema Google (Docs, Drive, Gmail, Calendar, Meet) y tiene capacidades multimodales — voz, imagen, vídeo y texto largo.

En nuestro flujo de trabajo, **Gemini es la capa de entrada y diseño**. Perplexity es la capa de acción sobre GitHub.

---

## Capacidades que usamos

### 🎤 Voz
- Dictar notas, ideas o tareas en lugar de escribir
- Capturar reflexiones rápidas mientras haces otra cosa
- **Flujo:** dictas a Gemini → limpias el texto → Perplexity lo sube al repo

### 🖼️ Visual / Multimodal
- Analizar capturas de pantalla (errores, código, diseños)
- **OCR:** fotos de libros, apuntes en papel, pizarras → texto digital
- Entender diagramas o esquemas
- **Flujo:** foto a Gemini → texto/análisis → Perplexity lo estructura en el repo

### 📝 Documentación larga
- Redactar documentos técnicos extensos (arquitecturas, propuestas)
- Generar borradores de README muy detallados
- Escribir informes o análisis largos
- **Flujo:** Gemini redacta → Álvaro revisa → Perplexity sube al repo

### 🔧 Diseño técnico
- Arquitectura de sistemas (servidor casa, Barrier, red)
- Planificación de infraestructura
- Razonamiento profundo sobre problemas complejos
- **Flujo:** Gemini diseña → Perplexity implementa en el repo

---

## Integración con el ecosistema Google

| Herramienta Google | Uso concreto |
|---|---|
| **Google Docs** | Documentos largos antes de subir al repo |
| **Google Drive** | Almacenamiento de archivos grandes (PDFs, imágenes, vídeos) |
| **Gmail** | Gestión de comunicaciones profesionales, templates |
| **Google Calendar** | Planificación de sesiones de estudio, recordatorios |
| **Google Workspace** | Colaboración si trabaja en equipo |
| **NotebookLM** | RAG sobre documentos propios (apuntes, libros, PDFs) |

> **Nota:** Los archivos grandes (PDFs, imágenes, vídeos) viven en Google Drive, no en GitHub. El repo solo tiene texto y código.

---

## Limitaciones

- ❌ No puede modificar GitHub directamente
- ❌ No tiene acceso en tiempo real a este repo
- ❌ No mantiene memoria persistente entre sesiones (salvo Gems configurados)
- ⚠️ El contexto hay que dárselo manualmente si se cambia de sesión

---

## Protocolo de handoff con Perplexity

```
Gemini → Álvaro → Perplexity

1. Gemini genera el contenido (voz, visual, texto largo, diseño)
2. Álvaro copia/revisa el resultado
3. Álvaro se lo pasa a Perplexity con: "sube esto a [ruta]"
4. Perplexity lo estructura y lo sube al repo
5. Queda documentado con commit en GitHub
```

**Regla de oro:** Si tiene que acabar en GitHub → pasa por Perplexity.
Si es voz, foto o documento Google → empieza en Gemini.

---

## Casos de uso habituales

### OCR de apuntes o libros
```
1. Foto del libro/apunte con el móvil
2. Gemini: "extrae el texto de esta imagen"
3. Revisar y limpiar
4. Perplexity: "sube esto a formacion/python/apuntes-YYYY-MM-DD.md"
```

### Dictar una idea para un proyecto
```
1. Gemini por voz: "tengo una idea para..."
2. Gemini transcribe y estructura
3. Perplexity: "añade esto a proyectos/ideas.md"
```

### Diseñar arquitectura del servidor
```
1. Gemini: describir el setup, pedir arquitectura
2. Gemini devuelve diseño técnico + diagrama
3. Perplexity: sube a setup/servidor/arquitectura.md
```

---

## Objetivo 2026

Integrar Gemini como capa de entrada natural (voz + visual) para que **capturar conocimiento sea más rápido que escribir**. Todo lo capturado acaba estructurado en este repo mediante Perplexity.

---

_Ver también: `agentes/perplexity.md` | `agentes/prompts.md` | `AGENT.md`_
