#!/usr/bin/env bash
# ==============================================================================
# DEPLOY LOCAL BRAIN: Ollama + Obsidian RAG Backend
# Adaptado para Madre (varopc) - GTX 1060 6GB
# Ollama corre en Docker en localhost:11434
# Vault: ~/Projects/yggdrasil-dew
# ==============================================================================
set -e

OBSIDIAN_VAULT="${HOME}/Projects/yggdrasil-dew"
BACKEND_DIR="${HOME}/Projects/local-brain"
PORT="8001"  # 8000 ocupado por thdora

LLM_MODEL="llama3.2:3b"       # óptimo para GTX 1060 6GB
EMBED_MODEL="nomic-embed-text"

echo "==== 1. Verificando Ollama ==="
if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "[-] Ollama no responde en localhost:11434. ¿Está el docker corriendo?"
    exit 1
fi

echo "[+] Descargando modelos..."
curl -s http://localhost:11434/api/pull -d "{\"name\": \"$LLM_MODEL\"}" | tail -1
curl -s http://localhost:11434/api/pull -d "{\"name\": \"$EMBED_MODEL\"}" | tail -1

echo "==== 2. Creando directorio de trabajo ==="
mkdir -p "$BACKEND_DIR"
cd "$BACKEND_DIR"

echo "==== 3. Generando main.py ==="
cp "$(dirname "$0")/main.py" "$BACKEND_DIR/main.py"

echo "==== 4. Entorno virtual con uv ==="
if ! command -v uv &> /dev/null; then
    echo "[*] Instalando uv..."
    curl -sSf https://astral.sh/uv/install.sh | sh
    source $HOME/.local/bin/env
fi

uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install fastapi uvicorn chromadb requests rank_bm25 pydantic

echo "==========================================================="
echo "[+] LISTO. Arrancando backend en puerto $PORT..."
echo "==========================================================="
export OBSIDIAN_VAULT="$OBSIDIAN_VAULT"
export LLM_MODEL="$LLM_MODEL"
export EMBED_MODEL="$EMBED_MODEL"

uvicorn main:app --host 127.0.0.1 --port $PORT --reload
