---
tags: [troubleshooting, local-brain, ollama, rag, errores]
fecha: 2026-06-23
ruta-obsidian: tools/local-brain/TROUBLESHOOTING.md
---

# Troubleshooting — Local Brain RAG

## Ollama no responde en :11434

```bash
# Síntoma
curl: (7) Failed to connect to localhost port 11434

# Solución
ollama serve   # en terminal aparte
# o como servicio:
sudo systemctl start ollama
```

## Error al instalar con Docker (`tls: bad record MAC`)

```
# NO usar docker pull para Ollama
# Usar el instalador nativo:
curl -fsSL https://ollama.com/install.sh | sh
```

## ChromaDB — IDs duplicados al re-indexar

```
Error: ID already exists

# El endpoint /index ya hace delete_collection antes de indexar
# Si persiste, borra el directorio manualmente:
rm -rf ~/Projects/local-brain/chroma_db
curl -X POST http://127.0.0.1:8001/index
```

## BM25 — índice corrupto

```bash
# Borrar cache de BM25 y forzar rebuild:
rm ~/Projects/local-brain/bm25_index.pkl
rm ~/Projects/local-brain/bm25_corpus.pkl
curl -X POST http://127.0.0.1:8001/index
```

## uv no encontrado tras instalación

```bash
source $HOME/.local/bin/env
# o añadir al .bashrc / .zshrc:
export PATH="$HOME/.local/bin:$PATH"
```

## Ollama genera muy lento (~1-2 tok/s)

- Comprobar que la GPU está siendo usada: `nvidia-smi`
- Si usa CPU, puede que VRAM esté llena
- Solución: usar modelo más pequeño (`qwen2.5:3b` en lugar de `:7b`)

## El vault no se encuentra

```bash
# Comprobar ruta:
echo $OBSIDIAN_VAULT
ls $OBSIDIAN_VAULT

# Si la ruta es distinta, exportar antes de arrancar:
export OBSIDIAN_VAULT=/ruta/correcta/a/tu/vault
./deploy_brain.sh
```
