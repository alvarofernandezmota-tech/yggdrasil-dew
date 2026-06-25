# STACK-MADRE — Documentación al milímetro

> **Máquina:** Madre — i5-8400, 16 GB RAM, sin GPU, Arch Linux  
> **Última validación:** 2026-06-25  
> **Estado actual:** Fase 1 activa — ollama + qdrant + open-webui

---

## Arquitectura del stack

```
┌─────────────────────────────────────────────────────┐
│  ~/docker-compose.yml  ←  cp desde setup/servidor/  │
│                                                     │
│  ┌──────────────┐   ┌──────────────┐               │
│  │    ollama    │   │   qdrant     │               │
│  │  :11434      │   │  :6333       │               │
│  │  qwen2.5:7b  │   │  RAG store   │               │
│  └──────┬───────┘   └──────┬───────┘               │
│         │                  │                        │
│  ┌──────▼──────────────────▼───────┐               │
│  │          open-webui :3001        │               │
│  │   (depende de ollama healthy)    │               │
│  └──────────────────────────────────┘               │
└─────────────────────────────────────────────────────┘
```

---

## Servicios

### ollama (chat)
| Parámetro | Valor | Por qué |
|---|---|---|
| `OLLAMA_NUM_THREADS` | 3 | i5-8400 tiene 6 núcleos; 3 seguros sin saturar SO |
| `OLLAMA_NUM_PARALLEL` | 1 | Prohibido procesar 2 peticiones a la vez |
| `OLLAMA_MAX_LOADED_MODELS` | 1 | Solo 1 modelo en RAM simultáneo |
| `OLLAMA_KEEP_ALIVE` | 5m | Libera RAM cuando no se usa |
| `OLLAMA_FLASH_ATTENTION` | 1 | Optimización CPU |
| RAM límite | 7 GB | qwen2.5:7b ocupa ~6.5 GB |
| CPU límite | 3.5 cores | Deja margen al SO |
| Puerto | 11434 | Estándar Ollama |

### ollama-embeddings (RAG)
| Parámetro | Valor | Por qué |
|---|---|---|
| `OLLAMA_NUM_THREADS` | 2 | Solo embeddings, no necesita más |
| `OLLAMA_KEEP_ALIVE` | 10m | bge-m3 tarda en cargar, mejor mantenerlo |
| RAM límite | 2 GB | bge-m3 ocupa ~600 MB |
| Puerto | 11435 | Distinto a ollama-chat para no colisionar |

### qdrant (memoria vectorial)
| Parámetro | Valor |
|---|---|
| Puerto | 6333 (HTTP) + 6334 (gRPC) |
| RAM límite | 2 GB |
| Volumen | `qdrant_storage:/qdrant/storage` |
| Healthcheck | `wget -qO- http://localhost:6333/healthz` |

### open-webui (interfaz)
| Parámetro | Valor |
|---|---|
| Puerto | 3001 (mapeado desde 8080 interno) |
| RAM límite | 1 GB |
| Depende de | `ollama: condition: service_healthy` |
| RAG | `VECTOR_DB=qdrant`, `QDRANT_URI=http://qdrant:6333` |

---

## Healthchecks — por qué son así

**Problema histórico:** `curl` no está en las imágenes de Ollama ni Qdrant.  
**Solución aplicada el 2026-06-25:**

```yaml
# ollama — usa el propio binario
healthcheck:
  test: ["CMD-SHELL", "ollama list > /dev/null 2>&1"]
  start_period: 20s   # tiempo para que el servidor arranque

# qdrant — tiene wget, responde {"result":"ok"}
healthcheck:
  test: ["CMD-SHELL", "wget -qO- http://localhost:6333/healthz | grep -q ok"]
  start_period: 15s

# open-webui — tiene wget
healthcheck:
  test: ["CMD-SHELL", "wget -qO- http://localhost:8080/health | grep -q ok || exit 1"]
  start_period: 30s
```

---

## Workflow de despliegue

```bash
# 1. Sincronizar repo
cd ~/yggdrasil-dew && git pull

# 2. Activar compose (siempre desde el repo, no editar ~/docker-compose.yml)
cp setup/servidor/docker-compose.yml ~/docker-compose.yml

# 3. Lanzar stack
cd ~
docker compose up -d ollama qdrant
sleep 30
docker compose up -d open-webui
docker compose ps

# 4. Verificar
docker compose logs -f ollama   # ver que cargó el servidor
curl http://localhost:11434/api/tags  # desde el host
```

## Workflow de apagado

```bash
docker compose down          # para y elimina contenedores (datos en volúmenes)
docker compose down -v       # ⚠️  DESTRUYE volúmenes también — solo si reseteo total
```

---

## Errores conocidos y soluciones

### `address already in use :11434`
**Causa:** ollama corriendo como proceso del sistema antes del contenedor.  
**Fix:**
```bash
pkill ollama
docker compose up -d ollama
```

### `lsof: command not found`
**Causa:** lsof no instalado en Arch.  
**Fix:** usar `pkill` o `ss -lptn | grep 11434`

### `container ollama is unhealthy` con curl
**Causa:** curl no existe en la imagen ollama/ollama.  
**Fix:** usar `CMD-SHELL ollama list` (ya corregido en compose v2026-06-25)

### `version is obsolete` warning
**Causa:** campo `version:` deprecado en Docker Compose v2.  
**Fix cosmético:** eliminar la línea `version: '3.8'` del compose (no afecta funcionamiento)

---

## RAM estimada con stack activo

| Servicio | RAM |
|---|---|
| ollama (qwen2.5:7b) | ~6.5 GB |
| ollama-embeddings (bge-m3) | ~0.6 GB |
| qdrant | ~0.3 GB |
| open-webui | ~0.3 GB |
| THDORA + bots | ~1.0 GB |
| Grafana + Prometheus | ~0.5 GB |
| SO + sistema | ~2.0 GB |
| **TOTAL** | **~11.2 GB / 16 GB ✅** |

⚠️ **NUNCA** cargar `qwen2.5:14b` con el stack activo → OOM Killer  
⚠️ **NUNCA** dos modelos 7B+ simultáneos → swap constante

---

## Accesos

| Servicio | URL local | URL Tailscale |
|---|---|---|
| open-webui | http://localhost:3001 | http://madre:3001 |
| ollama API | http://localhost:11434 | http://madre:11434 |
| qdrant dashboard | http://localhost:6333/dashboard | http://madre:6333/dashboard |

---

## Próximos pasos (Fase 2)

- [ ] Migrar de Ollama a **llama.cpp puro** para mejor rendimiento CPU (2-4 semanas)
- [ ] Añadir Prometheus + Grafana para monitorización de RAM/CPU
- [ ] Script de arranque automático al boot (`systemd` o `@reboot cron`)
- [ ] Cargar modelo bge-m3 en ollama-embeddings tras primer arranque

---

*Documento mantenido por Álvaro. Norma: si cambias algo en el stack, actualiza este archivo en el mismo commit.*
