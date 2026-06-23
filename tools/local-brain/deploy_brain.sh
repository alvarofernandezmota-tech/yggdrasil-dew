#!/usr/bin/env bash
# ==============================================================================
# LOCAL BRAIN v2 — Ollama RAG 100% local
# Embeddings: nomic-embed-text (Ollama)
# LLM:        qwen2.5:3b (Ollama) — mejor español que llama3.2:3b
# Puerto:     8001
# ==============================================================================
set -e

OBSIDIAN_VAULT="${HOME}/Projects/yggdrasil-dew"
BACKEND_DIR="${HOME}/Projects/local-brain"
PORT="8001"

echo "==== Comprobando Ollama ===="
if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "[-] Ollama no responde. Instala y arranca:"
    echo "    curl -fsSL https://ollama.com/install.sh | sh"
    echo "    ollama serve"
    exit 1
fi

echo "==== Comprobando modelos ===="
if ! ollama list | grep -q "qwen2.5:3b"; then
    echo "[*] Descargando qwen2.5:3b..."
    ollama pull qwen2.5:3b
fi
if ! ollama list | grep -q "nomic-embed-text"; then
    echo "[*] Descargando nomic-embed-text..."
    ollama pull nomic-embed-text
fi

echo "==== Preparando entorno ===="
mkdir -p "$BACKEND_DIR" && cd "$BACKEND_DIR"
cp "$(dirname "$0")/main.py"         "$BACKEND_DIR/main.py"
cp "$(dirname "$0")/requirements.txt" "$BACKEND_DIR/requirements.txt"

if ! command -v uv &> /dev/null; then
    curl -sSf https://astral.sh/uv/install.sh | sh
    source $HOME/.local/bin/env
fi

uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install -r requirements.txt

export OBSIDIAN_VAULT="$OBSIDIAN_VAULT"
export LLM_MODEL="qwen2.5:3b"
export EMBED_MODEL="nomic-embed-text"

echo "=================================================="
echo "[+] Local Brain v2 arrancando en :$PORT"
echo "    LLM:    $LLM_MODEL"
echo "    Embed:  $EMBED_MODEL"
echo "    Vault:  $OBSIDIAN_VAULT"
echo "=================================================="
uvicorn main:app --host 127.0.0.1 --port $PORT --reload
