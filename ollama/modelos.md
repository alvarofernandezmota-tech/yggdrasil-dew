---
tags: [ollama, modelos, ram, cpu, decisiones]
fecha-actualizacion: 2026-06-25
relacionado: [[ollama/README]] [[setup/servidor/docker-compose.yml]]
---

# Modelos Ollama — Decisiones y estado

> Hardware: i5-8400 · 16GB RAM · CPU-only · sin GPU activa  
> RAM disponible con stack activo: ~4.5GB  
> RAM disponible sin stack: ~9.5GB

---

## Estado actual (25 jun 2026)

| Modelo | Tamaño | Descargado | Contenedor | Prioridad |
|---|---|---|---|---|
| `qwen2.5:3b` | 1.9GB | ✅ | ollama | Alta — thdora |
| `qwen2.5:7b` | 4.7GB | ✅ | ollama | Alta — uso diario |
| `qwen2.5:14b` | 9.0GB | ✅ | ollama | Media — solo offline |
| `qwen2.5-coder:7b` | 4.7GB | ❌ | ollama | Alta — pentest |
| `mistral:7b` | 4.1GB | ❌ | ollama | Media |
| `llama3.1:8b` | 4.7GB | ❌ | ollama | Baja |
| `bge-m3` | 1.2GB | ❌ | ollama-embeddings | Alta — RAG |
| `nomic-embed-text` | 0.3GB | ❌ | ollama-embeddings | Media |

---

## Próximas descargas (por orden de prioridad)

```bash
# 1. PRIORITARIO — pentest y código
docker exec ollama ollama pull qwen2.5-coder:7b

# 2. PRIORITARIO — embeddings para RAG
docker exec ollama-embeddings ollama pull bge-m3
docker exec ollama-embeddings ollama pull nomic-embed-text

# 3. CUANDO HAYA ESPACIO — alternativa general
docker exec ollama ollama pull mistral:7b
```

---

## Límites de RAM por escenario

### Con stack completo activo (~11.5GB usados)
- ✅ Modelos viables: 3b, 7b (uno a la vez)
- ❌ Prohibido: 14b, dos 7B simultáneos

### Sin stack (solo ollama corriendo)
- ✅ Modelos viables: cualquiera incluyendo 14b
- Liberar stack: `docker stop open-webui ollama-embeddings n8n gitea`

### Regla de oro
> Si `free -h` muestra menos de 5GB en `available` → no cargar 7B  
> Si muestra menos de 10GB → no cargar 14B

---

## Comportamiento KEEP_ALIVE

- Valor actual: `OLLAMA_KEEP_ALIVE=5m`
- El modelo se descarga de RAM solo tras 5 min de inactividad
- `ollama ps` vacío = normal, no es error
- `ollama stop <modelo>` falla si ya se descargó = esperado
- Para sesiones largas: hacer warm-up al inicio

```bash
# Warm-up antes de una sesión larga
docker exec ollama ollama run qwen2.5:7b ""
# Confirmar que está en RAM
docker exec ollama ollama ps
```
