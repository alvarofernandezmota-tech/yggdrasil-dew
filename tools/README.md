---
tags: [tools, scripts, apis, automatizacion, madre]
fecha-actualizacion: 2026-06-23
ruta-obsidian: tools/README.md
---

# Tools — Scripts y APIs propias

> Código que corre en Madre (varopc). Scripts, backends, automatizaciones.
> Distinto de `ia/` (IAs externas) y `ollama/` (modelos locales).

## Índice

| Tool | Estado | Puerto | Para qué |
|---|---|---|---|
| `local-brain/` | ⏳ Pendiente desplegar | `:8001` | RAG híbrido Ollama 100% local |
| `local-brain-claude/` | ⏳ Pendiente desplegar | `:8002` | RAG con Claude como LLM externo |
| `inbox-processor/` | 🔍 Por auditar | — | Procesado de inbox automático |
| `dashboard/` | 🔍 Por auditar | — | Dashboard del ecosistema |
| `rag_osint_engine.py` | ⚠️ Sin carpeta propia | — | Motor RAG para OSINT |

## Convenciones de nombre

```
tools/<nombre-descriptivo>/
  ├── README.md          ← obligatorio
  ├── main.py            ← código principal
  ├── deploy_*.sh        ← script de despliegue
  ├── requirements.txt   ← dependencias
  ├── .env.example       ← variables de entorno
  └── TROUBLESHOOTING.md ← errores comunes
```

## Añadir una tool nueva

1. Crear carpeta en `tools/<nombre>/`
2. Crear `README.md` con frontmatter completo
3. Añadirla a esta tabla
4. Crear nota en `inbox/` con el plan
5. Migrar cuando esté validada

## Ver también

- [[ollama/README]] — modelos locales que usan estas tools
- [[ia/chat/README]] — IAs externas
- [[cli-tools/README]] — herramientas de terminal
- [[inbox/2026-06-23-tools-pendientes]] — pendientes de crear
