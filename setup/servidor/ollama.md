---
tags: [ollama, llm, docker, cpu, modelos]
fecha-actualizacion: 2026-06-25
relacionado: [[setup/servidor/docker-compose.yml]] [[ollama/modelos]]
---

# Ollama — LLM Local en Madre (CPU-only)

> Stack validado para i5-8400 · 16GB RAM · **SIN GPU** (GTX 1060 no usada)  
> Config activa en: `setup/servidor/docker-compose.yml`  
> Documentado por Perplexity · 25 junio 2026

---

## ⚠️ Restricciones de hardware

| Límite | Valor | Motivo |
|---|---|---|
| RAM disponible con stack activo | ~4.5GB libres | Stack completo usa ~11.5GB |
| Modelo máximo con stack activo | qwen2.5:7b | 4.7GB caben en lo disponible |
| Modelo máximo sin stack | qwen2.5:14b | Necesita ~9GB libres |
| `OLLAMA_MAX_LOADED_MODELS` | 1 | Nunca dos 7B+ simultáneos → OOM |
| `OLLAMA_NUM_THREADS` | 3 | Máx seguros en i5-8400 |

> **NUNCA** cargar qwen2.5:14b con el stack completo activo → OOM Killer

---

## Modelos descargados — estado actual

| Modelo | Tamaño | Estado | Uso |
|---|---|---|---|
| `qwen2.5:3b` | 1.9GB | ✅ listo | Chat rápido · thdora-bot |
| `qwen2.5:7b` | 4.7GB | ✅ listo | Chat equilibrado · uso diario |
| `qwen2.5:14b` | 9.0GB | ✅ listo | Investigación profunda (solo offline) |
| `llama3.1:8b` | 4.7GB | ❌ pendiente | Alternativa general |
| `mistral:7b` | 4.1GB | ❌ pendiente | Análisis técnico |
| `qwen2.5-coder:7b` | 4.7GB | ❌ pendiente | Pentest · scripts · CVEs |
| `bge-m3` | 1.2GB | ❌ pendiente | Embeddings RAG (ollama-embeddings) |
| `nomic-embed-text` | 0.3GB | ❌ pendiente | Embeddings rápidos |

---

## Comandos esenciales

```bash
# Ver modelos en disco
docker exec ollama ollama list

# Ver modelo cargado en RAM ahora mismo
docker exec ollama ollama ps

# Descargar modelo
docker exec ollama ollama pull qwen2.5-coder:7b

# Forzar descarga de RAM (solo si está activo)
docker exec ollama ollama stop qwen2.5:7b

# Warm-up: cargar modelo en RAM inmediatamente
docker exec ollama ollama run qwen2.5:7b ""
```

---

## Flujo para usar qwen2.5:14b (investigación profunda)

```bash
# 1. Liberar RAM parando servicios no críticos
docker stop open-webui ollama-embeddings

# 2. Verificar RAM libre (debe ser > 9GB)
free -h

# 3. Correr el 14B
docker exec ollama ollama run qwen2.5:14b

# 4. Al terminar, restaurar stack
docker compose up -d
```

---

## Comportamiento de memoria (KEEP_ALIVE)

- `OLLAMA_KEEP_ALIVE=5m` (valor actual en compose) → el modelo se descarga de RAM automáticamente tras 5 min de inactividad
- `ollama ps` vacío = normal, modelo está en disco pero no en RAM
- `ollama stop` da error si el modelo ya fue descargado automáticamente → es esperado, no es un bug
- Para investigaciones largas sin interrupciones, hacer warm-up antes de empezar

---

## Integración con thdora-bot

```python
# thdora llamando a ollama local
import httpx

response = httpx.post(
    "http://ollama:11434/api/generate",
    json={"model": "qwen2.5:3b", "prompt": "...", "stream": False}
)
```

> Usar `qwen2.5:3b` para thdora (respuesta rápida) · `qwen2.5:7b` para análisis

---

## Ver también

- [[ollama/modelos]] — Modelfiles y perfiles personalizados
- [[setup/servidor/docker-compose.yml]] — Config completa del stack
- [[setup/servidor/ollama-cpu-setup]] — Notas de optimización CPU
