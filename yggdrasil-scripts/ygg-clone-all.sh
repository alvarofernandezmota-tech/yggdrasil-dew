#!/usr/bin/env bash
# =============================================================================
# ygg-clone-all.sh — Clonar todos los repos del ecosistema Yggdrasil
# Uso: bash ygg-clone-all.sh [--dir /ruta/destino]
# =============================================================================

set -euo pipefail

GITHUB_USER="alvarofernandezmota-tech"
DEFAULT_DIR="$HOME/repos"
DEST_DIR="${2:-$DEFAULT_DIR}"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPOS=(
  "yggdrasil-dew"
  "WIKI---PERSONAL"
  "yggdrasil-tracking"
  "yggdrasil-orquestador"
  "madre-config"
  "yggdrasil-formacion"
  "yggdrasil-secops"
  "THDORA-PERSONAL"
  "ollama-stack"
  "yggdrasil-scripts"
  "acer-config"
)

echo -e "${GREEN}Clonando repos Yggdrasil en $DEST_DIR${NC}"
mkdir -p "$DEST_DIR"

for repo in "${REPOS[@]}"; do
  dest="$DEST_DIR/$repo"
  if [[ -d "$dest/.git" ]]; then
    echo -e "  ${YELLOW}↻ $repo — ya existe, haciendo pull${NC}"
    git -C "$dest" pull --ff-only 2>/dev/null || echo "    ⚠️  Pull fallido — verificar manualmente"
  else
    echo -e "  ${GREEN}↓ Clonando $repo...${NC}"
    git clone "git@github.com:$GITHUB_USER/$repo.git" "$dest" 2>/dev/null || \
      git clone "https://github.com/$GITHUB_USER/$repo.git" "$dest" || \
      echo "  🔴 Falló clonar $repo — puede ser privado, verificar credenciales"
  fi
done

echo ""
echo -e "${GREEN}✅ Todos los repos procesados en $DEST_DIR${NC}"
echo "   Siguiente paso: bash ygg-audit.sh"
