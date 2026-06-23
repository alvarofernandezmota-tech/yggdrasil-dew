#!/usr/bin/env bash
# ==============================================================================
# DEPLOY LOCAL BRAIN: Ollama (embeddings locales) + Claude API (razonamiento)
# Vault: ~/Projects/yggdrasil-dew
# Puerto: 8002
# Requiere: ANTHROPIC_API_KEY en el entorno
# ==============================================================================
set -e

OBSIDIAN_VAULT="${HOME}/Projects/yggdrasil-dew"
BACKEND_DIR="${HOME}/Projects/local-brain-claude"
PORT="8002"

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "[-] Falta ANTHROPIC_API_KEY. Añádela con: export ANTHROPIC_API_KEY=tu_clave"
    exit 1
fi

if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "[-] Ollama no responde en :11434. Arráncalo con: ollama serve"
    exit 1
fi

echo "==== 1. Creando directorio ===="
mkdir -p "$BACKEND_DIR" && cd "$BACKEND_DIR"

echo "==== 2. Copiando main.py ===="
cp "$(dirname "$0")/main_claude.py" "$BACKEND_DIR/main.py"

echo "==== 3. Entorno virtual con uv ===="
if ! command -v uv &> /dev/null; then
    curl -sSf https://astral.sh/uv/install.sh | sh
    source $HOME/.local/bin/env
fi

uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install fastapi uvicorn chromadb requests rank_bm25 pydantic anthropic

echo "============================================================"
echo "[+] LISTO. Arrancando Local Brain (Claude) en :$PORT"
echo "============================================================"

export OBSIDIAN_VAULT="$OBSIDIAN_VAULT"
export EMBED_MODEL="nomic-embed-text"
export CLAUDE_MODEL="claude-sonnet-4-5"

uvicorn main:app --host 127.0.0.1 --port $PORT --reload
