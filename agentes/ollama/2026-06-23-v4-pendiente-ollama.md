---
tags: [ollama, pendiente, v4, checklist]
fecha: 2026-06-23
estado: pendiente
tipo: checklist
ruta-obsidian: agentes/ollama/2026-06-23-v4-pendiente-ollama.md
fuente: inbox/2026-06-23-v4-pendiente-ollama.md
---

# Pendientes Ollama — v4 2026-06-23

## Inmediato (hoy)

- [ ] Terminar descarga 3 imágenes Docker
- [ ] `docker compose up -d`
- [ ] Verificar Ollama: `curl http://localhost:11434/api/tags`
- [ ] Verificar Open WebUI: http://localhost:3000
- [ ] Verificar Qdrant: http://localhost:6333

## Post-arranque

- [ ] Pull qwen2.5:3b
- [ ] Pull qwen2.5:7b
- [ ] Pull bge-m3
- [ ] Pull nomic-embed-text
- [ ] Crear colección Qdrant `yggdrasil`
- [ ] Conectar Open WebUI con Ollama

## Esta semana

- [ ] Instalar Tailscale en Madre
- [ ] Configurar SSH Madre ↔ Acer
- [ ] Script Python indexar yggdrasil-dew en Qdrant
- [ ] Test RAG: primera pregunta al cerebro

## Referencias
- [[agentes/ollama/2026-06-23-ollama-ecosistema-prep]]
- [[setup/2026-06-23-estado-descargas-madre]]
- [[inbox/MASTER-PENDIENTES]]
