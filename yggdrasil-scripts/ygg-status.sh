#!/usr/bin/env bash
# =============================================================================
# ygg-status.sh — Estado rápido del ecosistema (versión compacta, < 30 seg)
# Uso: bash ygg-status.sh
# =============================================================================

set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "\n${BOLD}${CYAN}=== YGG STATUS — $(date '+%Y-%m-%d %H:%M') ===${NC}\n"

# ─── Docker servicios ─────────────────────────────────────────────────────────
if command -v docker &>/dev/null; then
  echo -e "${BOLD}🐳 Servicios Docker:${NC}"
  docker ps --format '  {{.Names}}\t{{.Status}}' | \
    awk '{
      if ($2 == "Up") printf "  \033[0;32m✅ %-30s %s %s\033[0m\n", $1, $2, $3
      else             printf "  \033[0;31m🔴 %-30s %s %s\033[0m\n", $1, $2, $3
    }'

  echo ""
  echo -e "${BOLD}🔴 Caídos/con problemas:${NC}"
  docker ps -a --filter 'status=exited' --filter 'status=created' \
    --format '  🔴 {{.Names}} — {{.Status}}' || echo "  (ninguno)"
else
  echo -e "  ${YELLOW}Docker no disponible — ejecutar en Madre${NC}"
fi

# ─── Recursos ─────────────────────────────────────────────────────────────────
echo -e "\n${BOLD}💻 Recursos:${NC}"
echo -e "  Disco:  $(df -h / | awk 'NR==2 {print $3"/"$2" ("$5" usado)"}')"
echo -e "  RAM:    $(free -h | awk '/^Mem:/ {print $3"/"$2}') usada"
echo -e "  Load:   $(uptime | awk -F'load average: ' '{print $2}')"

# ─── Tailscale ────────────────────────────────────────────────────────────────
echo -e "\n${BOLD}🔗 Tailscale:${NC}"
if command -v tailscale &>/dev/null; then
  tailscale status 2>/dev/null | head -5 | sed 's/^/  /'
else
  echo -e "  ${YELLOW}Tailscale no disponible${NC}"
fi

# ─── Issues críticos conocidos ────────────────────────────────────────────────
echo -e "\n${BOLD}🔴 Issues críticos conocidos:${NC}"
cat <<'EOF'
  #74 — THDORA token caducado (renovar en BotFather)
  #75 — yggdrasil-mcp caído (puerto 3000/3001)
  #71 — Qdrant unhealthy (falso positivo telemetría)
  #46 — log_guardian_bot crash loop
  #15 — Puerto 21 FTP expuesto en router
EOF

echo -e "\n${BOLD}Runbooks disponibles:${NC}"
echo -e "  docs/runbooks/RUNBOOK-THDORA-TOKEN.md"
echo -e "  docs/runbooks/RUNBOOK-MCP-ARRANQUE.md"
echo -e "  docs/runbooks/RUNBOOK-CRITICOS-TERMINAL.md"

echo -e "\n${CYAN}=== FIN STATUS ===${NC}\n"
