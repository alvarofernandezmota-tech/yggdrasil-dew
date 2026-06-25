#!/usr/bin/env bash
# =============================================================
# migrar-inbox.sh
# Migra archivos del inbox a sus carpetas definitivas en yggdrasil-dew
# Actualizado: 2026-06-25 — nombres reales del inbox
# Uso: bash scripts/migrar-inbox.sh [--dry-run]
# =============================================================

set -euo pipefail

VAULT_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
INBOX="$VAULT_ROOT/inbox"
DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

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
    git -C "$VAULT_ROOT" mv "$src" "$dst" 2>/dev/null || mv "$src" "$dst"
    echo "[OK]   $1 → $2"
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
  fi
}

echo "=== MIGRACIÓN INBOX ==="
$DRY_RUN && echo "[MODO DRY-RUN — no se mueve nada]"
echo ""

# ---- SETUP (ADB / Android / hotspot) ------------------------
echo "--- setup/ ---"
mv_file "2026-06-25-ADB-ANDROID-GUIA-COMPLETA.md"      "setup/adb-android.md"
mv_file "2026-06-25-ADB-MOVIL-EXPERIMENTACION.md"      "setup/adb-movil-experimentacion.md"
mv_file "2026-06-25-AUDITAR-HOTSPOT-RED.md"            "setup/hotspot-auditoria.md"
mv_file "2026-06-25-debug-android-adb-tailscale-uup.md" "setup/debug-android-adb-tailscale.md"
mv_file "investigacion-adb-scrcpy-android.md"          "setup/adb-scrcpy-android.md"

# ---- TOOLS --------------------------------------------------
echo "--- tools/ ---"
mv_file "2026-06-25-OPENSOURCE-CONTROL-MOVIL.md"       "tools/opensource-control-movil.md"

# ---- AGENTES / IAs ------------------------------------------
echo "--- agentes/ ---"
mv_file "2026-06-25-PROMPT-COMPORTAMIENTO-IAS.md"      "agentes/prompt-comportamiento-ias.md"
mv_file "2026-06-25-SCRIPT-CONTEXTO-COMPLETO-CLAUDE.md" "agentes/contexto-claude.md"

# ---- DOCS ---------------------------------------------------
echo "--- docs/ ---"
mv_file "2026-06-25-seguridad-analisis-codigo.md"      "docs/seguridad-analisis-codigo.md"

# ---- TEMPORALES — ELIMINAR ----------------------------------
echo "--- eliminando temporales ---"
del_file "2026-06-25-ARRANQUE-SESION.md"
del_file "2026-06-25-AUDITORIA-INBOX-HOY.md"
del_file "2026-06-25-estado-inbox-y-proximos-pasos.md"
del_file "2026-06-25-ESTADO-INBOX-ZERO.md"

echo ""
echo "=== MIGRACIÓN COMPLETADA ==="
echo "Ejecuta: git add -A && git commit -m 'chore: vaciar inbox 2026-06-25' && git push"
