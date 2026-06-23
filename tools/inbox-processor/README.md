---
tags: [python, automatizacion, inbox, watchdog, ollama]
fecha: 2026-06-23
estado: diseño
ruta-obsidian: tools/inbox-processor/README.md
---

# inbox_processor — Automatización del inbox

## Concepto

Script Python que procesa automáticamente los archivos del inbox y los mueve a su destino correcto en yggdrasil-dew.

## Flujo

```
Archivo nuevo en inbox/
      ↓
Lee frontmatter + nombre + contenido
      ↓
Llama a Ollama (llama3 local) → determina carpeta destino
      ↓
Añade frontmatter completo
      ↓
Mueve archivo a destino
      ↓
git add + commit automático
```

## Dos modos

### Modo manual (disponible ahora, sin Ollama)
- Reglas fijas por prefijo de nombre:
  - `YYYY-MM-DD-*` → `diarios/`
  - `proyecto-*` → `proyectos/`
  - `setup-*` → `setup/`
  - `grok-*` / `gemini-*` → según contenido

### Modo inteligente (requiere Ollama corriendo)
- Ollama analiza el contenido y decide destino
- Genera frontmatter automáticamente
- Detecta duplicados antes de mover

## Estado

⏳ Diseño — implementar cuando Ollama esté disponible

## Dependencias

```
watchdog
python-frontmatter
gitpython
requests  # para Ollama API
```

## Archivos

- `inbox_processor.py` — script principal (pendiente)
- `rules.py` — reglas de clasificación (pendiente)
- `config.yaml` — configuración de rutas (pendiente)
