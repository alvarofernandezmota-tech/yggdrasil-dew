---
title: Runbook — Recuperar stack Ollama sin perder RAG
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/runbooks/ollama-recovery.md
tags: [ollama, rag, recovery, runbook]
status: esqueleto — completar con datos reales
---

# 🦙 Runbook — Recuperar Ollama sin perder el RAG

> Este runbook cubre cómo reconstruir el stack de Ollama + Open WebUI
> preservando el RAG (base de conocimiento indexada) y el historial de conversaciones.

---

## El riesgo

Ollama almacena los modelos en un volumen Docker (`~/.ollama` o volumen nombrado).
Open WebUI almacena el RAG y el historial en otro volumen.
Si el contenedor muere pero el **volumen sobrevive**, la recuperación es trivial.
Si el **volumen se borra** (ej: `docker volume prune`), el RAG se pierde permanentemente.

**Regla de oro:** NUNCA ejecutar `docker volume prune` sin hacer backup primero.

---

## Caso 1: Contenedor caído, volumen intacto (el más común)

```bash
# Verificar que el volumen existe
docker volume ls | grep -i ollama
docker volume ls | grep -i webui

# Reiniciar sin borrar datos
docker compose -f ~/docker-compose.maestro.yml restart ollama open-webui

# Verificar
docker logs --tail 20 open-webui
```

---

## Caso 2: Imagen rota, volumen intacto

```bash
# Bajar solo el contenedor (no el volumen)
docker compose -f ~/docker-compose.maestro.yml down ollama open-webui
# NO usar --volumes

# Actualizar imagen
docker pull ollama/ollama:latest
docker pull ghcr.io/open-webui/open-webui:main

# Levantar de nuevo — volumen se reutiliza automáticamente
docker compose -f ~/docker-compose.maestro.yml up -d ollama open-webui
```

---

## Caso 3: Volumen perdido — reconstrucción desde cero

### 3a. Restaurar modelos Ollama

```bash
# Opción A: desde backup
rsync -avz /backup/docker-volumes/ollama/ /var/lib/docker/volumes/[COMPLETAR: nombre_volumen]/_data/

# Opción B: re-descargar (lento, depende de la conexión)
docker exec -it ollama ollama pull [COMPLETAR: nombre_modelo_1]
docker exec -it ollama ollama pull [COMPLETAR: nombre_modelo_2]
# Lista de modelos usados: [COMPLETAR]
```

### 3b. Restaurar RAG de Open WebUI

```bash
# El RAG es la parte más valiosa — sin backup, se pierde
# Restaurar desde backup
rsync -avz /backup/docker-volumes/open-webui/ /var/lib/docker/volumes/[COMPLETAR: nombre_volumen]/_data/

# Si no hay backup: re-indexar los archivos Markdown del WIKI
# (proceso manual — ir a Open WebUI → Documents → Upload)
```

---

## Backup preventivo del RAG

```bash
# A ejecutar semanalmente (añadir a cron)
# [COMPLETAR: nombre del volumen de open-webui]
VOLUME_NAME="[COMPLETAR]"
BACKUP_DIR="/backup/docker-volumes/open-webui-$(date +%F)"

mkdir -p $BACKUP_DIR
docker run --rm \
  -v $VOLUME_NAME:/data \
  -v $BACKUP_DIR:/backup \
  alpine tar czf /backup/open-webui-backup.tar.gz /data

echo "✅ Backup RAG completado en $BACKUP_DIR"
```

---

## Pendiente completar

- [ ] Rellenar `[COMPLETAR]` con nombres reales de volúmenes (`docker volume ls`)
- [ ] Rellenar lista de modelos Ollama instalados (`docker exec -it ollama ollama list`)
- [ ] Crear script `scripts/backup-rag.sh` con el backup preventivo arriba
- [ ] Añadir al cron de Madre

---

_Creado: 2026-07-13 · Perplexity-MCP · F7.2 del Plan Maestro · Estado: ESQUELETO_
