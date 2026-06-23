---
tags: [rag, ollama, claude, chromadb, fastapi, segundo-cerebro]
fecha: 2026-06-23
estado: pendiente-desplegar
---

# Local Brain — Ollama + Claude

Backend RAG híbrido que indexa yggdrasil-dew con embeddings **locales** (Ollama)
y razona sobre el contexto recuperado con **Claude API** (Anthropic).

## Arquitectura

```
yggdrasil-dew (*.md)
        ↓ lee y chunka
  nomic-embed-text  ← Ollama :11434 (LOCAL, privado)
        ↓ vectoriza
  ChromaDB + BM25   ← índice en disco
        ↓ recupera contexto relevante
  claude-sonnet-4-5 ← Anthropic API (solo recibe el contexto, no las notas raw)
        ↓
  FastAPI :8002
```

**Privacidad:** las notas nunca salen de Madre en bruto.
Solo el fragmento de contexto recuperado va a Claude para razonar.

## Requisitos

- Ollama corriendo (`ollama serve`) en `:11434`
- Modelos: `nomic-embed-text` (`ollama pull nomic-embed-text`)
- `uv` instalado
- `ANTHROPIC_API_KEY` en el entorno

## Despliegue

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
chmod +x tools/local-brain-claude/deploy_brain_claude.sh
./tools/local-brain-claude/deploy_brain_claude.sh
```

## Endpoints

| Endpoint | Método | Para qué |
|---|---|---|
| `/health` | GET | Estado del servicio |
| `/index` | POST | Re-indexar vault completo |
| `/query` | POST | Consulta RAG híbrida |

## Modos disponibles

| Puerto | Embeddings | LLM | Cuándo usarlo |
|---|---|---|---|
| `:8001` | Ollama local | Ollama local | Sin red, 100% privado |
| `:8002` | Ollama local | **Claude** | Máximo razonamiento, 200k ctx |

## Integración con Thdora

```python
# thdora — handler
response = requests.post("http://localhost:8002/query",
    json={"prompt": user_message, "top_k": 15})
reply = response.json()["response"]
```
