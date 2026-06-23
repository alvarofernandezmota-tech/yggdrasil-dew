---
tags: [setup, docker, madre, descargas, estado]
fecha: 2026-06-23
estado: en-progreso
ruta-obsidian: setup/2026-06-23-estado-descargas-madre.md
fuente: inbox/2026-06-23-estado-descargas-madre.md
---

# Estado descargas Docker — Madre 2026-06-23

## Imágenes a descargar

| Imagen | Tamaño | Estado |
|---|---|---|
| `ollama/ollama:latest` | ~3.2GB | ⏳ retry activo |
| `ghcr.io/open-webui/open-webui:main` | ~2GB | ⏳ pendiente |
| `qdrant/qdrant:latest` | ~300MB | ⏳ pendiente |

## Problema encontrado

Error `tls: bad record MAC` — corrupción de paquete TCP durante descarga grande.
Causa: WiFi inestable + HTTP/2 reset. Solución: script retry con bucle `until`.

## Script retry

```bash
until docker pull ollama/ollama:latest; do echo 'reintentando...'; sleep 5; done
until docker pull ghcr.io/open-webui/open-webui:main; do sleep 5; done
until docker pull qdrant/qdrant:latest; do sleep 5; done
docker compose up -d
```

## Post-instalación

- [ ] `docker compose up -d`
- [ ] `curl http://localhost:11434/api/tags`
- [ ] Open WebUI en http://localhost:3000
- [ ] Pull modelos: `qwen2.5:7b`, `qwen2.5:3b`, `bge-m3`, `nomic-embed-text`
