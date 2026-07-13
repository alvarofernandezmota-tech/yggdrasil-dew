---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, backup, drp, infra]
status: vigente
---

# Protocolo de Backup

## Qué se hace backup y cuándo

| Dato | Frecuencia | Dónde |
|---|---|---|
| Repos GitHub | Continuo (git push) | GitHub |
| Volumen Open WebUI (chats RAG) | Semanal | Script manual |
| Configuración n8n (flujos) | Tras cada cambio | `madre-config/n8n/` |
| Vaultwarden | Mensual | Export cifrado |
| `.env` de Madre | Tras cada cambio | Vaultwarden (no en git) |
| `docker-compose.yml` de cada stack | Tras cada cambio | `madre-config/docker/` |

## Backup manual de volumen Docker

```bash
# Backup
docker run --rm \
  -v <nombre_volumen>:/data \
  -v ~/backups:/backup \
  alpine tar czf /backup/<nombre>-$(date +%Y%m%d).tar.gz /data

# Restaurar
docker run --rm \
  -v <nombre_volumen>:/data \
  -v ~/backups:/backup \
  alpine tar xzf /backup/<nombre>-YYYYMMDD.tar.gz -C /
```

## DRP — Si Madre muere

1. Hardware nuevo o VM
2. Instalar Docker + Docker Compose
3. Clonar `madre-config` de GitHub
4. Restaurar `.env` desde Vaultwarden
5. `docker compose up -d` por stack en orden: infra → ia → dev → secops
6. Restaurar volúmenes desde backup
7. Verificar todos los healthchecks

## Refs
- Issue #60 F7.2 — DRP completo pendiente
- Issue #60 F7.5 — script backup RAG pendiente

---
_Creado: 2026-07-13 · Perplexity MCP_
