#!/usr/bin/env bash
# =============================================================================
# inbox-stats.sh — Estadísticas y estado del inbox/
# =============================================================================
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
INBOX_DIR="$REPO_ROOT/inbox"

echo "📊 ESTADO DEL INBOX — $(date '+%Y-%m-%d %H:%M')"
echo "═══════════════════════════════════════"

TOTAL=$(find "$INBOX_DIR" -name "*.md" ! -name ".gitkeep" | wc -l)
POR_FECHA=$(find "$INBOX_DIR" -name "*.md" ! -name ".gitkeep" | \
  sed 's|.*/||; s/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/' | \
  sort | uniq -c | sort -rn)

echo "Total ficheros: $TOTAL"
echo ""
echo "Por fecha:"
echo "$POR_FECHA"
echo ""
echo "Tamaño total:"
du -sh "$INBOX_DIR" 2>/dev/null || echo "n/d"
echo ""
echo "5 ficheros más recientes:"
ls -t "$INBOX_DIR"/*.md 2>/dev/null | head -5 | xargs -I{} basename {}
