# Estructura de directorios — Madre

> Dónde vive cada cosa en Madre.
> Si instalas algo nuevo → documenta aquí dónde lo pusiste.

---

## Estructura general

```
/home/varopc/
├── Projects/
│   ├── yggdrasil-dew/          ← repo cerebro (este repo)
│   ├── thdora/                 ← agente IA THDORA
│   └── [futuros proyectos]/
│
├── Obsidian/
│   └── yggdrasil/              ← vault Obsidian = clon de yggdrasil-dew
│
├── .config/
│   ├── hypr/                   ← Hyprland config
│   └── [apps]/
│
└── .local/share/
    └── [apps data]

/var/lib/docker/
└── volumes/                    ← datos persistentes Docker (NO tocar directamente)
    ├── ollama/                 ← modelos Ollama
    ├── open-webui/             ← datos WebUI
    ├── qdrant_storage/         ← vectores RAG
    ├── grafana-data/
    ├── prometheus-data/
    ├── portainer_data/
    ├── uptime-kuma/
    ├── n8n_data/
    ├── paperless-data/
    └── vaultwarden-data/
```

---

## Servicios Docker — acceso por puerto

| Servicio | URL local | URL Tailscale | Fase |
|---|---|---|---|
| Open WebUI | http://localhost:3001 | http://100.91.112.32:3001 | 1 |
| Ollama API | http://localhost:11434 | http://100.91.112.32:11434 | 1 |
| Qdrant | http://localhost:6333 | http://100.91.112.32:6333 | 1 |
| Grafana | http://localhost:3000 | http://100.91.112.32:3000 | 2 |
| Prometheus | http://localhost:9090 | http://100.91.112.32:9090 | 2 |
| Portainer | http://localhost:9000 | http://100.91.112.32:9000 | 2 |
| Uptime Kuma | http://localhost:3002 | http://100.91.112.32:3002 | 2 |
| n8n | http://localhost:5678 | http://100.91.112.32:5678 | 3 |
| Paperless | http://localhost:8010 | http://100.91.112.32:8010 | 3 |
| Vaultwarden | http://localhost:8888 | http://100.91.112.32:8888 | 3 |
| LiteLLM | http://localhost:4000 | http://100.91.112.32:4000 | 4 |
| THDORA | http://localhost:8000 | http://100.91.112.32:8000 | 0 |

---

## Comandos útiles del día a día

```bash
# Ver estado de todo el stack
bash ~/Projects/yggdrasil-dew/setup/servidor/scripts/batcueva-state.sh

# Ver logs de un servicio
docker logs -f ollama
docker logs -f open-webui

# Reiniciar un servicio
docker restart ollama

# Ver uso de recursos
docker stats

# Modelos Ollama instalados
ollama list

# Descargar modelo nuevo
ollama pull qwen2.5:7b

# Commit y push al final del día
bash ~/Projects/yggdrasil-dew/setup/servidor/scripts/cierre-sesion.sh "descripción"
```

---

## Backups — qué hay que guardar

| Dato | Dónde está | Cómo hacer backup |
|---|---|---|
| Repo yggdrasil-dew | GitHub | `git push` (automático con cierre-sesion.sh) |
| Modelos Ollama | docker volume `ollama` | `docker run --rm -v ollama:/data -v $(pwd):/backup alpine tar czf /backup/ollama-backup.tar.gz /data` |
| Vectores Qdrant | docker volume `qdrant_storage` | mismo procedimiento |
| Datos n8n | docker volume `n8n_data` | mismo procedimiento |
| Contraseñas Vaultwarden | docker volume `vaultwarden-data` | mismo procedimiento |

---
_Ver: [ESTADO-SISTEMA.md](../ESTADO-SISTEMA.md) · [ROADMAP.md](../ROADMAP.md)_
