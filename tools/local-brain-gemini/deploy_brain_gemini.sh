#!/usr/bin/env bash
# ==============================================================================
# DEPLOY LOCAL BRAIN: Gemini API + ChromaDB RAG Híbrido
# Adaptado para yggdrasil-dew en Madre (varopc)
# Requiere: GEMINI_API_KEY en el entorno
# ==============================================================================
set -e

OBSIDIAN_VAULT="${HOME}/Projects/yggdrasil-dew"
BACKEND_DIR="${HOME}/Projects/local-brain-gemini"
PORT="8002"

if [ -z "$GEMINI_API_KEY" ]; then
    echo "[-] Falta GEMINI_API_KEY. Añádela con: export GEMINI_API_KEY=tu_clave"
    exit 1
fi

echo "==== 1. Creando directorio ====='
mkdir -p "$BACKEND_DIR"
cd "$BACKEND_DIR"

echo "==== 2. Copiando main.py ===="
cp "$(dirname "$0")/main_gemini.py" "$BACKEND_DIR/main.py"

echo "==== 3. Entorno virtual con uv ===="
if ! command -v uv &> /dev/null; then
    curl -sSf https://astral.sh/uv/install.sh | sh
    source $HOME/.local/bin/env
fi

uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install fastapi uvicorn chromadb requests rank_bm25 pydantic

echo "============================================================"
echo "[+] LISTO. Arrancando en :$PORT"
echo "============================================================"

export OBSIDIAN_VAULT="$OBSIDIAN_VAULT"
export LLM_MODEL="gemini-2.0-flash"
export EMBED_MODEL="text-embedding-004"

uvicorn main:app --host 127.0.0.1 --port $PORT --reload
