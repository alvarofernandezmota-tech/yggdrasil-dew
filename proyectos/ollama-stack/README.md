---
id: 202406242252
fecha: 2026-06-24
tipo: proyecto
status: activo
repo: ollama-stack
tags: [proyecto, #repo/ollama-stack, docker, llm, ollama]
sync: true
---

# Proyecto: ollama-stack

- **Repo**: [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) — privado
- **Descripción**: Stack LLM local — Ollama + Open WebUI + LiteLLM + Qdrant
- **Lenguaje**: Docker Compose
- **Hardware**: Madre (i5-8400, 16GB RAM, CPU only)

## Stack Docker
| Contenedor | Puerto | Rol |
|---|---|---|
| ollama | 11434 | Motor LLM |
| open-webui | 3000 | UI chat |
| litellm | 4000 | API gateway |
| qdrant | 6333 | RAG vectorial |
| postgres | 5432 | BD |
| redis | 6379 | Cache |

## Estado
- ✅ Creado 24 jun 2026
- ✅ docker-compose.yml listo
- ✅ litellm-config.yaml listo
- ⚠️ Pendiente: `docker compose up -d` desde Madre

## Links
- [[ECOSISTEMA]] · [[proyectos/local-brain/README]] · [[setup/servidor/README]]
