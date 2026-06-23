#!/usr/bin/env bash
# ==============================================================================
# LOCAL BRAIN — Modo Claude (LLM externo opcional)
# Core del proyecto: tools/local-brain/ (Ollama 100% local en :8001)
# Este modo: Ollama embeddings locales + Claude como LLM de razonamiento
# Puerto: 8002
# ==============================================================================
set -e

OBSIDIAN_VAULT="${HOME}/Projects/yggdrasil-dew"
BACKEND_DIR="${HOME}/Projects/local-brain-claude"
PORT="8002"

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "[-] Falta ANTHROPIC_API_KEY. Añádela con: export ANTHROPIC_API_KEY=sk-ant-..."
    exit 1
fi

if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "[-] Ollama no responde en :11434"
    echo "    Instalar: curl -fsSL https://ollama.com/install.sh | sh"
    echo "    Arrancar: ollama serve"
    exit 1
fi

mkdir -p "$BACKEND_DIR" && cd "$BACKEND_DIR"
cp "$(dirname "$0")/main_claude.py" "$BACKEND_DIR/main.py"

if ! command -v uv &> /dev/null; then
    curl -sSf https://astral.sh/uv/install.sh | sh
    source $HOME/.local/bin/env
fi

uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install fastapi uvicorn chromadb requests rank_bm25 pydantic anthropic

export OBSIDIAN_VAULT="$OBSIDIAN_VAULT"
export EMBED_MODEL="nomic-embed-text"
export CLAUDE_MODEL="claude-sonnet-4-6"

echo "[+] Arrancando Local Brain modo Claude en :$PORT"
uvicorn main:app --host 127.0.0.1 --port $PORT --reload
