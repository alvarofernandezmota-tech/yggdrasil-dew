---
tags: [setup, docker, scripts, madre, pull]
fecha: 2026-06-23
estado: activo
ruta-obsidian: setup/2026-06-23-pull-stack-madre.md
fuente: inbox/2026-06-23-pull-stack-madre.md
---

# Pull stack Madre — script robusto

## Script completo

```bash
#!/bin/bash
# pull-stack-robusto.sh — descarga con retry automático

echo '=== [1/3] Ollama ==='
until docker pull ollama/ollama:latest; do
  echo '⚠️  Fallo — reintentando en 5s...'
  sleep 5
done
echo '✅ Ollama listo'

echo '=== [2/3] Open WebUI ==='
until docker pull ghcr.io/open-webui/open-webui:main; do
  echo '⚠️  Fallo — reintentando en 5s...'
  sleep 5
done
echo '✅ Open WebUI listo'

echo '=== [3/3] Qdrant ==='
until docker pull qdrant/qdrant:latest; do
  echo '⚠️  Fallo — reintentando en 5s...'
  sleep 5
done
echo '✅ Qdrant listo'

echo '=== DONE — 3 imágenes listas ==='
docker compose up -d
```

## Uso
```bash
chmod +x pull-stack-robusto.sh
./pull-stack-robusto.sh
```
