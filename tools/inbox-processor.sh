#!/usr/bin/env bash
# =============================================================================
# inbox-processor.sh — Migración automática de inbox/ a estructura docs/
# Repo: yggdrasil-dew
# Autor: Perplexity MCP | 2026-06-25
# =============================================================================
# USO: bash tools/inbox-processor.sh [--dry-run] [--date YYYY-MM-DD]
# REQUIERE: estar en la raíz del repo con git configurado
# =============================================================================

set -euo pipefail

DRY_RUN=false
FILTER_DATE=""
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
INBOX_DIR="$REPO_ROOT/inbox"
LOG_FILE="$REPO_ROOT/docs/MIGRACION-LOG-$(date +%Y-%m-%d).md"

# --- Parse args ---
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run) DRY_RUN=true; shift ;;
    --date) FILTER_DATE="$2"; shift 2 ;;
    *) echo "Arg desconocido: $1"; exit 1 ;;
  esac
done

echo "🌳 inbox-processor.sh — yggdrasil-dew"
echo "  Repo: $REPO_ROOT"
echo "  Dry-run: $DRY_RUN"
echo "  Filtro fecha: ${FILTER_DATE:-todos}"
echo ""

# =============================================================================
# MAPA DE CLASIFICACIÓN
# Patrón en nombre de fichero → directorio destino
# =============================================================================
declare -A CLASIFICACION=(
  ["adr-"]="docs/adr"
  ["ADR-"]="docs/adr"
  ["ollama"]="ollama"
  ["docker"]="docs/sistema"
  ["script-"]="tools"
  ["macro-script"]="tools"
  ["mega-script"]="tools"
  ["setup"]="setup"
  ["arch-linux"]="setup"
  ["kernel"]="setup"
  ["osint"]="osint"
  ["formacion"]="formacion"
  ["proyecto-"]="proyectos"
  ["PROMPT-"]="docs/ias"
  ["prompt-"]="docs/ias"
  ["sesion-"]="diarios"
  ["SESION-"]="diarios"
  ["cierre-"]="diarios"
  ["CIERRE-"]="diarios"
  ["auditoria-"]="docs"
  ["AUDITORIA-"]="docs"
  ["decision-"]="docs/decisiones"
  ["DECISION-"]="docs/decisiones"
  ["debate-"]="docs/ias"
  ["DEBATE-"]="docs/ias"
  ["bitacora-"]="diarios"
  ["BITACORA-"]="diarios"
  ["estado-"]="docs"
  ["ESTADO-"]="docs"
  ["plan-"]="docs"
  ["PLAN-"]="docs"
)

clasificar_fichero() {
  local filename="$1"
  local basename="$(basename "$filename")"
  # Quitar fecha del inicio: YYYY-MM-DD-
  local sin_fecha="${basename#????-??-??-}"

  for patron in "${!CLASIFICACION[@]}"; do
    if [[ "$sin_fecha" == *"$patron"* ]] || [[ "$basename" == *"$patron"* ]]; then
      echo "${CLASIFICACION[$patron]}"
      return
    fi
  done
  # Default: docs (para no perder nada)
  echo "docs"
}

# =============================================================================
# MAIN: iterar inbox
# =============================================================================
MIGRADOS=0
SALTADOS=0
ERRORES=0

# Inicializar log
if [[ "$DRY_RUN" == false ]]; then
  mkdir -p "$(dirname "$LOG_FILE")"
  echo "# Log Migración Inbox — $(date '+%Y-%m-%d %H:%M:%S')" > "$LOG_FILE"
  echo "" >> "$LOG_FILE"
  echo "| Fichero | Destino | Estado |" >> "$LOG_FILE"
  echo "|---------|---------|--------|" >> "$LOG_FILE"
fi

for fichero in "$INBOX_DIR"/*.md; do
  [[ -f "$fichero" ]] || continue
  [[ "$(basename "$fichero")" == ".gitkeep" ]] && continue

  basename="$(basename "$fichero")"

  # Filtrar por fecha si se especificó
  if [[ -n "$FILTER_DATE" ]] && [[ "$basename" != "$FILTER_DATE"* ]]; then
    continue
  fi

  destino_dir="$(clasificar_fichero "$basename")"
  destino_full="$REPO_ROOT/$destino_dir/$basename"

  echo "  📄 $basename"
  echo "     → $destino_dir/"

  if [[ "$DRY_RUN" == true ]]; then
    echo "     [DRY-RUN: no se mueve]"
    MIGRADOS=$((MIGRADOS + 1))
    continue
  fi

  # Crear directorio destino si no existe
  mkdir -p "$REPO_ROOT/$destino_dir"

  # Si ya existe en destino, no sobreescribir (añadir sufijo)
  if [[ -f "$destino_full" ]]; then
    destino_full="$REPO_ROOT/$destino_dir/DUPLICADO-$basename"
    echo "     ⚠️  Destino existe, guardando como DUPLICADO-"
  fi

  # git mv para mantener historial
  git mv "$fichero" "$destino_full" 2>/dev/null || {
    mv "$fichero" "$destino_full"
  }

  echo "| $basename | $destino_dir | ✅ migrado |" >> "$LOG_FILE"
  MIGRADOS=$((MIGRADOS + 1))
done

# =============================================================================
# RESUMEN
# =============================================================================
echo ""
echo "════════════════════════════════════"
echo "  RESUMEN MIGRACIÓN"
echo "  Migrados : $MIGRADOS"
echo "  Saltados : $SALTADOS"
echo "  Errores  : $ERRORES"
echo "════════════════════════════════════"

if [[ "$DRY_RUN" == false ]] && [[ $MIGRADOS -gt 0 ]]; then
  echo ""
  echo "📦 Haciendo commit..."
  git add -A
  git commit -m "chore(inbox): migración automática de $MIGRADOS ficheros [inbox-processor.sh]"
  echo "✅ Commit realizado."
  echo "   Ahora ejecuta: git push origin main"
fi
