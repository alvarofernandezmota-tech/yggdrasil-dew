#!/usr/bin/env bash
# =============================================================
# migrar-inbox.sh
# Migra archivos del inbox a sus carpetas definitivas en yggdrasil-dew
# Generado: 2026-06-25
# Uso: ./scripts/migrar-inbox.sh [--dry-run]
# =============================================================

set -euo pipefail

# ---- Config --------------------------------------------------
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
    echo "[DRY] $1 → $2"
  else
    git -C "$VAULT_ROOT" mv "$src" "$dst" 2>/dev/null || mv "$src" "$dst"
    echo "[OK]  $1 → $2"
  fi
}

echo "=== MIGRACIÓN INBOX ==="
$DRY_RUN && echo "[MODO DRY-RUN — no se mueve nada]"
echo ""

# ---- OLLAMA --------------------------------------------------
echo "--- ollama/ ---"
mv_file "2026-06-23-ollama-bge-m3.md"              "ollama/modelos/bge-m3.md"
mv_file "2026-06-23-ollama-qwen2.5-3b.md"          "ollama/modelos/qwen2.5-3b.md"
mv_file "2026-06-23-ollama-qwen2.5-7b.md"          "ollama/modelos/qwen2.5-7b.md"
mv_file "2026-06-23-ollama-guia-seleccion.md"       "ollama/guia-seleccion-modelos.md"
mv_file "2026-06-23-ollama-ecosistema-prep.md"      "ollama/ecosistema-prep.md"
mv_file "2026-06-23-ollama-rag-investigacion.md"    "ollama/rag-investigacion.md"
mv_file "2026-06-23-auditoria-ollama.md"            "ollama/auditoria-2026-06-23.md"
mv_file "2026-06-23-v4-pendiente-ollama.md"         "ollama/pendientes-v4.md"
mv_file "2026-06-24-BITACORA-FINAL-OLLAMA-VS-LLAMACPP.md"   "ollama/bitacora-ollama-vs-llamacpp.md"
mv_file "2026-06-24-DEBATE-GROK-OLLAMA-VS-LLAMACPP.md"       "ollama/debate-ollama-vs-llamacpp.md"
mv_file "2026-06-24-BITACORA-GEMINI-TURNO3-LLAMACPP-MARKOV.md" "ollama/bitacora-llamacpp-markov.md"
mv_file "2026-06-24-langchain-ollama-optimizacion.md" "ollama/langchain-optimizacion.md"
mv_file "2026-06-24-ollama-modelfile-erika.md"      "ollama/modelfile-erika.md"

# ---- SETUP --------------------------------------------------
echo "--- setup/ ---"
mv_file "2026-06-23-auditoria-setup.md"             "setup/auditoria-2026-06-23.md"
mv_file "2026-06-23-local-brain-setup.md"           "setup/local-brain-setup.md"
mv_file "2026-06-24-arch-linux-optimizacion-completa.md" "setup/arch-linux-optimizacion.md"
mv_file "2026-06-24-kernel-sysctl-hardening.md"     "setup/kernel-sysctl-hardening.md"
mv_file "2026-06-24-hypridle-desactivado.md"        "setup/hypridle-desactivado.md"
mv_file "2026-06-24-hotspot-red-situacion.md"       "setup/hotspot-red.md"
mv_file "2026-06-23-systemd-plan.md"                "setup/systemd-plan.md"

# ---- PROYECTOS ----------------------------------------------
echo "--- proyectos/ ---"
mv_file "2026-06-23-proyecto-local-brain.md"        "proyectos/local-brain/README.md"
mv_file "2026-06-23-proyecto-chatbot-control.md"    "proyectos/chatbot-control/README.md"
mv_file "2026-06-23-proyecto-terminal-ia.md"        "proyectos/terminal-ia/README.md"
mv_file "2026-06-23-proyecto-thdora.md"             "proyectos/thdora/README.md"
mv_file "2026-06-24-REPOS-CREAR-CHATBOT-TERMINAL.md" "proyectos/chatbot-control/repos-crear.md"
mv_file "2026-06-24-batcueva-fase2-plan.md"         "proyectos/batcueva/fase2-plan.md"

# ---- TOOLS --------------------------------------------------
echo "--- tools/ ---"
mv_file "2026-06-23-auditoria-tools.md"             "tools/auditoria-2026-06-23.md"
mv_file "2026-06-23-auditoria-tools-inbox-dashboard.md" "tools/auditoria-inbox-dashboard.md"
mv_file "2026-06-23-tools-pendientes.md"            "tools/pendientes.md"
mv_file "2026-06-24-BITACORA-GROK-PERPLEXICA-FASES.md" "tools/perplexica-fases.md"
mv_file "2026-06-24-descubrimiento-tools-local-brain.md" "tools/descubrimiento-local-brain.md"
mv_file "2026-06-24-n8n-litellm-integracion.md"     "tools/n8n-litellm-integracion.md"
mv_file "2026-06-24-nginx-proxy-manager.md"         "tools/nginx-proxy-manager.md"

# ---- OSINT --------------------------------------------------
echo "--- osint/ ---"
mv_file "2026-06-23-auditoria-osint.md"             "osint/auditoria-2026-06-23.md"
mv_file "2026-06-23-osint-rag-mover.md"             "osint/rag-mover.md"
mv_file "2026-06-24-osint-visual-personas-camaras.md" "osint/visual-personas-camaras.md"

# ---- DOCS / ADRs --------------------------------------------
echo "--- docs/ ---"
mv_file "2026-06-23-adr-docs-as-code-repos-cerebro.md" "docs/adr/ADR-001-docs-as-code.md"
mv_file "2026-06-23-adr-ollama-en-agentes.md"       "docs/adr/ADR-002-ollama-en-agentes.md"
mv_file "2026-06-24-ADR-OBSIDIAN-PLUGINS-SSOT.md"   "docs/adr/ADR-003-obsidian-plugins-ssot.md"
mv_file "2026-06-24-TESIS-ARQUITECTURA-MINIMALISTA-OPENSOUECE.md" "docs/tesis-arquitectura-minimalista.md"
mv_file "2026-06-24-DEEP-RESEARCH-ALINEACION-SSOT.md" "docs/deep-research-alineacion-ssot.md"
mv_file "2026-06-24-ECOSISTEMA-COMPLETO-MIGRACION.md" "docs/ecosistema-completo-migracion.md"
mv_file "2026-06-24-mapa-completo-repo-real.md"     "docs/mapa-completo-repo.md"
mv_file "2026-06-24-mapa-maestro-ecosistema.md"     "docs/mapa-maestro-ecosistema.md"
mv_file "2026-06-24-ecosistema-comparativa-repos.md" "docs/ecosistema-comparativa-repos.md"

# ---- AGENTES ------------------------------------------------
echo "--- agentes/ ---"
mv_file "2026-06-24-fase1-revisada-con-litellm.md"  "agentes/fase1-litellm.md"
mv_file "2026-06-24-fase3-completa.md"              "agentes/fase3-completa.md"
mv_file "2026-06-24-fase4-litellm-sops-plan.md"     "agentes/fase4-litellm-sops.md"

# ---- FORMACION ----------------------------------------------
echo "--- formacion/ ---"
mv_file "2026-06-23-auditoria-formacion.md"         "formacion/auditoria-2026-06-23.md"
mv_file "2026-06-24-formacion-python-roadmap.md"    "formacion/python-roadmap.md"

# ---- HARDWARE -----------------------------------------------
echo "--- hardware/ ---"
mv_file "2026-06-23-pull-stack-madre.md"            "hardware/stack-madre.md"
mv_file "2026-06-23-estado-descargas-madre.md"      "hardware/estado-descargas-madre.md"
mv_file "2026-06-24-ESTADO-MADRE-CIERRE.md"         "hardware/estado-madre-cierre-24jun.md"
mv_file "2026-06-24-macro-script-madre.md"          "hardware/macro-script-madre.md"
mv_file "2026-06-24-mega-script-nocturno.md"        "hardware/mega-script-nocturno.md"

# ---- SCRIPTS / CLI ------------------------------------------
echo "--- scripts/ y cli-tools/ ---"
mv_file "2026-06-24-SCRIPT-DESCARGA-GLOBAL.md"      "scripts/descarga-global.md"

# ---- YO -----------------------------------------------------
echo "--- yo/ ---"
mv_file "2026-06-23-auditoria-yo.md"                "yo/auditoria-2026-06-23.md"

# ---- DIARIOS ------------------------------------------------
echo "--- diarios/ ---"
mv_file "2026-06-23-yggdrasil-v4-diario-maestro.md" "diarios/2026-06-23.md"
mv_file "2026-06-24-SESION-COMPLETA-RESUMEN.md"     "diarios/2026-06-24.md"

# ---- ARCHIVOS QUE SE BORRAN (ya procesados / duplicados) ----
echo "--- eliminando prompts/sesiones temporales ya integrados ---"
ARCHIVOS_TEMPORALES=(
  "2026-06-23-VACIADO-MAESTRO-GEMINI.md"
  "2026-06-23-actualizacion-claude-gemini.md"
  "2026-06-23-auditoria-diarios.md"
  "2026-06-23-auditoria-docs.md"
  "2026-06-23-dashboard-readme.md"
  "2026-06-23-debate-multiia-escalar-docker.md"
  "2026-06-23-decision-arquitectura-proyectos.md"
  "2026-06-23-decision-homelab-vs-proyectos.md"
  "2026-06-23-estado-auditoria-repo.md"
  "2026-06-23-inbox-clasificado.md"
  "2026-06-23-inbox-processor-implementacion.md"
  "2026-06-23-prompt-claude-ecosistema-docker.md"
  "2026-06-23-prompt-claude-refactor-repo.md"
  "2026-06-23-prompt-gemini-auditoria-inbox.md"
  "2026-06-23-script-vivo-debate-docker.md"
  "2026-06-23-sesion-completa.md"
  "2026-06-23-sesion-gemini-auditoria-inbox-perplexity.md"
  "2026-06-23-sesion-gemini-auditoria.md"
  "2026-06-23-sesion-noche-pendientes.md"
  "2026-06-23-sesion-perplexity-auditoria-gemini-inbox.md"
  "2026-06-24-AUDITORIA-MAÑANA.md"
  "2026-06-24-CIERRE-DEFINITIVO-06h00.md"
  "2026-06-24-CIERRE-SESION.md"
  "2026-06-24-CONTEXTO-NUEVA-SESION-MIGRACION.md"
  "2026-06-24-ESTADO-CIERRE-NOCHE.md"
  "2026-06-24-PLAN-PROXIMA-SESION.md"
  "2026-06-24-PLANIFICACION-DIARIA.md"
  "2026-06-24-PLANTILLA-INBOX.md"
  "2026-06-24-PROBLEMA-DOCUMENTACION-PENDIENTES.md"
  "2026-06-24-PROMPT-GEMINI-DEEP-RESEARCH-ALINEACION.md"
  "2026-06-24-PROMPT-GEMINI-ECOSISTEMA-FINAL.md"
  "2026-06-24-PROMPT-MAESTRO-DEBATE-MULTI-IA.md"
  "2026-06-24-PROMPT-MAESTRO-DOCUMENTACION-IAS.md"
  "2026-06-24-SESION-COMPLETA.md"
  "2026-06-24-SESION-INVESTIGACION-MODELOS-COMPLETA.md"
  "2026-06-24-SESION-NOCHE-MOVIL.md"
  "2026-06-24-auditoria-sesion.md"
  "2026-06-24-cierre-sesion-madrugada.md"
  "2026-06-24-contexto-manana.md"
  "2026-06-24-descargas-progreso-03h28.md"
  "2026-06-24-docker-compose-final-completo.md"
  "2026-06-24-flujo-nocturno-estrategia.md"
  "2026-06-24-investigacion-sesion-noche.md"
  "2026-06-24-estado-conexiones-vault-03h26.md"
  "2026-06-24-home-ecosistema-update.md"
  "2026-06-24-error-spiderfoot-descarga.md"
  "2026-06-24-DESCARGAS-COMPLETAS-06h10.md"
)

for f in "${ARCHIVOS_TEMPORALES[@]}"; do
  src="$INBOX/$f"
  if [[ -f "$src" ]]; then
    if $DRY_RUN; then
      echo "[DRY-DELETE] $f"
    else
      rm "$src"
      echo "[DEL] $f"
    fi
  fi
done

echo ""
echo "=== MIGRACIÓN COMPLETADA ==="
echo "Recuerda: git add -A && git commit -m 'chore: vaciar inbox migracion 2026-06-25'"
