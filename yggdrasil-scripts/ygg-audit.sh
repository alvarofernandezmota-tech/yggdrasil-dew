#!/usr/bin/env bash
# =============================================================================
# ygg-audit.sh — Auditoría completa del ecosistema Yggdrasil
# Repo: yggdrasil-dew
# Uso: bash ygg-audit.sh [--full] [--repos] [--servicios] [--help]
# =============================================================================

set -euo pipefail

# ─── Colores ─────────────────────────────────────────────────────────────────
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ─── Config ──────────────────────────────────────────────────────────────────
REPORT_FILE="$HOME/ygg-audit-report-$(date +%Y-%m-%d-%H%M).txt"
GITHUB_USER="alvarofernandezmota-tech"
REPOS_DIR="$HOME/repos"
DATE_NOW=$(date '+%Y-%m-%d %H:%M CEST')

# Repos del ecosistema
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

# Archivos canon obligatorios por repo
FILES_REQUIRED=("README.md" "AGENT.md" "CONTEXT.md" ".gitignore")

# Servicios Docker críticos
SERVICIOS_CRITICOS=(
  "thdora_bot"
  "thdora_api"
  "yggdrasil-mcp"
  "qdrant"
  "ollama"
  "open-webui"
  "n8n"
  "vaultwarden"
  "portainer"
  "pihole"
  "nginx"
  "grafana"
  "prometheus"
  "log_guardian_bot"
  "local_tripwire"
)

# ─── Funciones de output ─────────────────────────────────────────────────────
log()    { echo -e "${NC}$*${NC}" | tee -a "$REPORT_FILE"; }
ok()     { echo -e "  ${GREEN}✅ $*${NC}" | tee -a "$REPORT_FILE"; }
warn()   { echo -e "  ${YELLOW}⚠️  $*${NC}" | tee -a "$REPORT_FILE"; }
err()    { echo -e "  ${RED}🔴 $*${NC}" | tee -a "$REPORT_FILE"; }
header() { echo -e "\n${BOLD}${CYAN}══════════════════════════════════════${NC}" | tee -a "$REPORT_FILE";
           echo -e "${BOLD}${CYAN}  $*${NC}" | tee -a "$REPORT_FILE";
           echo -e "${CYAN}══════════════════════════════════════${NC}" | tee -a "$REPORT_FILE"; }

# ─── Ayuda ───────────────────────────────────────────────────────────────────
usage() {
  cat <<EOF
Uso: bash ygg-audit.sh [OPCION]

Opciones:
  --repos      Solo auditar repos (estructura, archivos, commits)
  --servicios  Solo auditar servicios Docker en Madre
  --full       Auditoría completa (repos + servicios + disco + red)
  --help       Mostrar esta ayuda

Sin opciones: ejecuta --full

Ejemplos:
  bash ygg-audit.sh
  bash ygg-audit.sh --repos
  bash ygg-audit.sh --servicios
EOF
  exit 0
}

# ─── Módulo: auditoría de repos ──────────────────────────────────────────────
audit_repos() {
  header "AUDITORÍA DE REPOS"
  log "Directorio base: $REPOS_DIR"
  log ""

  local errores=0
  local warnings=0

  for repo in "${REPOS[@]}"; do
    local repo_path="$REPOS_DIR/$repo"
    log "\n${BOLD}📁 $repo${NC}"

    # Verificar que el directorio existe
    if [[ ! -d "$repo_path" ]]; then
      warn "Directorio no encontrado: $repo_path"
      warn "  → Clonar con: git clone git@github.com:$GITHUB_USER/$repo.git $repo_path"
      ((warnings++)) || true
      continue
    fi

    # Verificar archivos obligatorios
    for file in "${FILES_REQUIRED[@]}"; do
      if [[ -f "$repo_path/$file" ]]; then
        ok "$file existe"
      else
        err "FALTA: $file"
        ((errores++)) || true
      fi
    done

    # Verificar que .env NO está trackeado
    if git -C "$repo_path" ls-files --error-unmatch .env &>/dev/null 2>&1; then
      err ".env TRACKEADO EN GIT — URGENTE: purgar con BFG + rotar secretos"
      ((errores++)) || true
    else
      ok ".env no trackeado"
    fi

    # Verificar último commit
    local last_commit_date
    last_commit_date=$(git -C "$repo_path" log -1 --format='%ar' 2>/dev/null || echo 'sin commits')
    local last_commit_msg
    last_commit_msg=$(git -C "$repo_path" log -1 --format='%s' 2>/dev/null || echo 'sin commits')
    local days_since
    days_since=$(git -C "$repo_path" log -1 --format='%ct' 2>/dev/null | awk '{print int((systime()-$1)/86400)}' 2>/dev/null || echo '999')

    if [[ "$days_since" -gt 30 ]]; then
      warn "Último commit hace ${days_since} días: $last_commit_msg"
      ((warnings++)) || true
    else
      ok "Último commit: $last_commit_date — $last_commit_msg"
    fi

    # Verificar rama principal
    local current_branch
    current_branch=$(git -C "$repo_path" branch --show-current 2>/dev/null || echo 'desconocida')
    if [[ "$current_branch" == "main" ]]; then
      ok "Rama: main"
    else
      warn "Rama actual: $current_branch (esperado: main)"
      ((warnings++)) || true
    fi

    # Verificar CONTEXT.md no muy desactualizado
    if [[ -f "$repo_path/CONTEXT.md" ]]; then
      local context_age
      context_age=$(find "$repo_path/CONTEXT.md" -mtime +14 2>/dev/null | wc -l)
      if [[ "$context_age" -gt 0 ]]; then
        warn "CONTEXT.md no actualizado en más de 14 días"
        ((warnings++)) || true
      else
        ok "CONTEXT.md reciente"
      fi
    fi

  done

  log ""
  log "${BOLD}Resumen repos: ${RED}$errores errores${NC} ${YELLOW}$warnings warnings${NC}"
}

# ─── Módulo: auditoría de servicios Docker ───────────────────────────────────
audit_servicios() {
  header "AUDITORÍA DE SERVICIOS DOCKER"

  # Verificar que Docker está disponible
  if ! command -v docker &>/dev/null; then
    err "Docker no disponible en este equipo"
    warn "Este módulo requiere ejecutarse en Madre (ssh varopc@100.91.112.32)"
    return 1
  fi

  local errores=0
  local warnings=0

  log "\n${BOLD}Estado de todos los contenedores:${NC}"
  docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' | tee -a "$REPORT_FILE"

  log "\n${BOLD}Verificando servicios críticos:${NC}"
  for servicio in "${SERVICIOS_CRITICOS[@]}"; do
    local status
    status=$(docker inspect --format='{{.State.Status}}' "$servicio" 2>/dev/null || echo 'no_encontrado')
    local health
    health=$(docker inspect --format='{{if .State.Health}}{{.State.Health.Status}}{{else}}sin_healthcheck{{end}}' "$servicio" 2>/dev/null || echo 'no_encontrado')

    if [[ "$status" == 'no_encontrado' ]]; then
      warn "$servicio — no encontrado en Docker"
      ((warnings++)) || true
    elif [[ "$status" == 'running' ]] && [[ "$health" == 'healthy' || "$health" == 'sin_healthcheck' ]]; then
      ok "$servicio — running [$health]"
    elif [[ "$status" == 'running' ]] && [[ "$health" == 'unhealthy' ]]; then
      warn "$servicio — running pero UNHEALTHY"
      ((warnings++)) || true
    else
      err "$servicio — $status [$health]"
      ((errores++)) || true
    fi
  done

  log ""
  log "${BOLD}Puertos expuestos (no-localhost):${NC}"
  sudo ss -tlnp 2>/dev/null | grep -v '127.0.0.1\|::1' | grep LISTEN | tee -a "$REPORT_FILE" || warn "ss no disponible"

  log ""
  log "${BOLD}Resumen servicios: ${RED}$errores errores${NC} ${YELLOW}$warnings warnings${NC}"
}

# ─── Módulo: recursos del sistema ────────────────────────────────────────────
audit_sistema() {
  header "RECURSOS DEL SISTEMA"

  log "\n${BOLD}Disco:${NC}"
  df -h --output=target,size,used,avail,pcent | grep -E 'Filesystem|/|/home' | tee -a "$REPORT_FILE"

  log "\n${BOLD}Memoria:${NC}"
  free -h | tee -a "$REPORT_FILE"

  log "\n${BOLD}Carga CPU:${NC}"
  uptime | tee -a "$REPORT_FILE"

  log "\n${BOLD}S.M.A.R.T. (disco principal):${NC}"
  if command -v smartctl &>/dev/null; then
    sudo smartctl -a /dev/sda 2>/dev/null | grep -E 'Health|Power_On_Hours|Reallocated_Sector|Pending_Sector' | tee -a "$REPORT_FILE" || warn "No se pudo leer S.M.A.R.T."
  else
    warn "smartmontools no instalado — instalar con: sudo pacman -S smartmontools"
  fi

  log "\n${BOLD}Tailscale:${NC}"
  if command -v tailscale &>/dev/null; then
    tailscale status 2>/dev/null | head -20 | tee -a "$REPORT_FILE"
  else
    warn "Tailscale no disponible en este equipo"
  fi
}

# ─── Módulo: seguridad rápida ─────────────────────────────────────────────────
audit_seguridad() {
  header "REVISIÓN DE SEGURIDAD RÁPIDA"

  log "\n${BOLD}Puerto 21 FTP (crítico — debe estar CERRADO):${NC}"
  if sudo ss -tlnp 2>/dev/null | grep -q ':21'; then
    err "PUERTO 21 ABIERTO — cerrar en router Digi http://192.168.1.1"
  else
    ok "Puerto 21 no abierto en Madre"
  fi

  log "\n${BOLD}SSH config:${NC}"
  if grep -q 'PasswordAuthentication no' /etc/ssh/sshd_config 2>/dev/null; then
    ok "SSH: autenticación por password desactivada"
  else
    warn "SSH: revisar PasswordAuthentication en /etc/ssh/sshd_config"
  fi

  log "\n${BOLD}Archivos .env expuestos en repos:${NC}"
  if [[ -d "$REPOS_DIR" ]]; then
    local env_exposed
    env_exposed=$(find "$REPOS_DIR" -name '.env' -not -path '*/.git/*' 2>/dev/null | wc -l)
    if [[ "$env_exposed" -gt 0 ]]; then
      warn "Encontrados $env_exposed archivos .env en repos — verificar que están en .gitignore"
      find "$REPOS_DIR" -name '.env' -not -path '*/.git/*' 2>/dev/null | tee -a "$REPORT_FILE"
    else
      ok "No se encontraron .env fuera de .git en repos"
    fi
  fi
}

# ─── Main ─────────────────────────────────────────────────────────────────────
main() {
  local mode="full"
  [[ "${1:-}" == '--repos' ]]     && mode="repos"
  [[ "${1:-}" == '--servicios' ]] && mode="servicios"
  [[ "${1:-}" == '--full' ]]      && mode="full"
  [[ "${1:-}" == '--help' ]]      && usage

  # Cabecera del reporte
  echo "" > "$REPORT_FILE"
  cat <<EOF | tee -a "$REPORT_FILE"
╔══════════════════════════════════════════════════════╗
║         YGG-AUDIT — Ecosistema Yggdrasil             ║
║         $DATE_NOW                   ║
╚══════════════════════════════════════════════════════╝
Modo: $mode
Reporte: $REPORT_FILE
EOF

  case "$mode" in
    repos)
      audit_repos
      ;;
    servicios)
      audit_servicios
      ;;
    full)
      audit_repos
      audit_servicios
      audit_sistema
      audit_seguridad
      ;;
  esac

  header "AUDITORÍA COMPLETADA"
  log "Reporte guardado en: $REPORT_FILE"
  log "Fecha: $DATE_NOW"
  log ""
  log "Próximos pasos:"
  log "  1. Revisar errores 🔴 — requieren acción inmediata"
  log "  2. Revisar warnings ⚠️  — atender en la próxima sesión"
  log "  3. Copiar hallazgos a un issue en yggdrasil-dew si procede"
  log "  4. Actualizar ESTADO-SISTEMA.md con el estado post-auditoría"
}

main "$@"
