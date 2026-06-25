#!/usr/bin/env bash
# =============================================================
# migrar-inbox.sh — yggdrasil-dew
# v3 — auditado por Gemini 2026-06-25
# Uso: bash scripts/migrar-inbox.sh [--dry-run]
# =============================================================

set -euo pipefail

VAULT_ROOT="$(git rev-parse --show-toplevel)"
INBOX="$VAULT_ROOT/inbox"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

MOVIDOS=0
BORRADOS=0

mv_file() {
  local src="$INBOX/$1"
  local dst="$VAULT_ROOT/$2"
  if [[ ! -f "$src" ]]; then
    echo "[SKIP] No encontrado: $1"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  if $DRY_RUN; then
    echo "[DRY]  $1 → $2"
  else
    git mv "$src" "$dst" 2>/dev/null || mv "$src" "$dst"
    echo "[OK]   $1 → $2"
    ((MOVIDOS++))
  fi
}

del_file() {
  local src="$INBOX/$1"
  if [[ ! -f "$src" ]]; then return; fi
  if $DRY_RUN; then
    echo "[DRY-DEL] $1"
  else
    rm "$src"
    echo "[DEL]  $1"
    ((BORRADOS++))
  fi
}

echo "=== MIGRACIÓN INBOX ==="
$DRY_RUN && echo "[MODO DRY-RUN — no se mueve nada]"
echo ""

# ---- SETUP — Android / ADB / hotspot ------------------------
echo "--- setup/ ---"
mv_file "2026-06-25-ADB-ANDROID-GUIA-COMPLETA.md"        "setup/adb-android-guia.md"
mv_file "2026-06-25-ADB-MOVIL-EXPERIMENTACION.md"        "setup/adb-android-experimentacion.md"
mv_file "2026-06-25-AUDITAR-HOTSPOT-RED.md"              "docs/auditoria-hotspot-red.md"
mv_file "2026-06-25-debug-android-adb-tailscale-uup.md" "setup/android-debug-stack.md"
mv_file "investigacion-adb-scrcpy-android.md"            "docs/investigacion-adb-scrcpy.md"

# ---- DOCS — seguridad / control móvil ----------------------
echo "--- docs/ ---"
mv_file "2026-06-25-OPENSOURCE-CONTROL-MOVIL.md"         "docs/opensource-control-movil.md"
mv_file "2026-06-25-seguridad-analisis-codigo.md"        "docs/seguridad-analisis-codigo.md"

# ---- AGENTES -----------------------------------------------
echo "--- agentes/ ---"
mv_file "2026-06-25-PROMPT-COMPORTAMIENTO-IAS.md"        "agentes/comportamiento-ias.md"

# ---- TEMPORALES — ELIMINAR ---------------------------------
echo "--- eliminando temporales ---"
del_file "2026-06-25-ARRANQUE-SESION.md"
del_file "2026-06-25-AUDITORIA-INBOX-HOY.md"
del_file "2026-06-25-AUDITORIA-INBOX-HOY.md"
del_file "2026-06-25-estado-inbox-y-proximos-pasos.md"
del_file "2026-06-25-ESTADO-INBOX-ZERO.md"
del_file "2026-06-25-SCRIPT-CONTEXTO-COMPLETO-CLAUDE.md"

# ---- RESUMEN -----------------------------------------------
echo ""
echo "=================================="
RESTANTES=$(find "$INBOX" -name '*.md' ! -name '.gitkeep' | wc -l)
echo "Movidos : $MOVIDOS"
echo "Borrados: $BORRADOS"
echo "Restantes en inbox: $RESTANTES"
if [[ $RESTANTES -eq 0 ]]; then
  echo "✓ INBOX ZERO"
else
  echo "⚠ Quedan $RESTANTES archivos — revisar manualmente"
fi
echo "=================================="
echo ""
echo "Siguiente paso:"
echo "  git add -A && git commit -m 'chore: inbox zero 2026-06-25' && git push"
