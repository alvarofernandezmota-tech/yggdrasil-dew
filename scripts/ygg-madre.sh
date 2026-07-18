#!/usr/bin/env bash
# =============================================================================
# ygg-madre.sh — Script maestro Terminus → Madre
# Ecosistema Yggdrasil · yggdrasil-dew/scripts/
# Protocolo: PROTOCOLO-TERMINUS-MADRE.md
# =============================================================================
# USO:
#   ./scripts/ygg-madre.sh setup     → Configura alias SSH madre en Terminus
#   ./scripts/ygg-madre.sh check     → Verifica conectividad Tailscale + SSH
#   ./scripts/ygg-madre.sh connect   → Conecta SSH a Madre
#   ./scripts/ygg-madre.sh audit     → Ejecuta auditoría FASE 4 remota
#   ./scripts/ygg-madre.sh health    → Health-check rápido de servicios Docker
#   ./scripts/ygg-madre.sh logs      → Ver logs de un servicio (interactivo)
#   ./scripts/ygg-madre.sh help      → Muestra esta ayuda
# =============================================================================

set -euo pipefail

# ── Colores ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ── Constantes ───────────────────────────────────────────────────────────────
SCRIPT_VERSION="1.0"
SCRIPT_NAME="ygg-madre.sh"
SSH_CONFIG="$HOME/.ssh/config"
SSH_KEY="$HOME/.ssh/id_ed25519"
HOST_ALIAS="madre"

# ── Helpers ──────────────────────────────────────────────────────────────────
log_ok()   { echo -e "${GREEN}✅ $*${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $*${NC}"; }
log_err()  { echo -e "${RED}❌ $*${NC}"; }
log_info() { echo -e "${CYAN}→  $*${NC}"; }
log_head() { echo -e "\n${BOLD}${BLUE}═══ $* ═══${NC}\n"; }

separator() { echo -e "${BLUE}────────────────────────────────────────${NC}"; }

# ── COMANDO: help ─────────────────────────────────────────────────────────────
cmd_help() {
  echo -e "${BOLD}${CYAN}ygg-madre.sh v${SCRIPT_VERSION}${NC} — Terminus → Madre"
  echo ""
  echo -e "${BOLD}Comandos:${NC}"
  echo "  setup    Configura el alias SSH 'madre' en ~/.ssh/config"
  echo "  check    Verifica Tailscale + SSH (sin conectar)"
  echo "  connect  Conecta SSH interactivo a Madre"
  echo "  audit    Auditoría FASE 4 remota (Docker, disco, red)"
  echo "  health   Health-check rápido de contenedores"
  echo "  logs     Ver logs de un servicio (te pregunta cuál)"
  echo "  help     Esta ayuda"
  echo ""
  echo -e "${BOLD}Protocolo:${NC} docs/canon/protocolos/PROTOCOLO-TERMINUS-MADRE.md"
  echo -e "${BOLD}Repo:${NC}      yggdrasil-dew/scripts/ygg-madre.sh"
}

# ── COMANDO: setup ────────────────────────────────────────────────────────────
cmd_setup() {
  log_head "SETUP SSH MADRE"

  # Verificar que existe clave SSH
  if [[ ! -f "$SSH_KEY" ]]; then
    log_warn "No se encuentra clave SSH en $SSH_KEY"
    log_info "Generando clave ed25519..."
    ssh-keygen -t ed25519 -C "terminus-yggdrasil" -f "$SSH_KEY" -N ""
    log_ok "Clave generada: $SSH_KEY"
  else
    log_ok "Clave SSH encontrada: $SSH_KEY"
  fi

  # Obtener IP Tailscale de Madre
  log_info "Buscando Madre en Tailscale..."
  if ! command -v tailscale &>/dev/null; then
    log_err "Tailscale no está instalado en Terminus"
    log_info "Instala: https://tailscale.com/download"
    exit 1
  fi

  MADRE_IP=$(tailscale status --json 2>/dev/null | \
    python3 -c "
import json,sys
data=json.load(sys.stdin)
peers=data.get('Peer',{})
for k,v in peers.items():
    name=v.get('HostName','').lower()
    if 'madre' in name or 'server' in name or 'home' in name:
        ips=v.get('TailscaleIPs',[])
        if ips: print(ips[0]); break
" 2>/dev/null || echo "")

  if [[ -z "$MADRE_IP" ]]; then
    log_warn "No se detectó Madre automáticamente en Tailscale"
    tailscale status
    echo ""
    read -rp "→ Introduce la IP Tailscale de Madre (100.x.x.x): " MADRE_IP
  else
    log_ok "Madre detectada en Tailscale: $MADRE_IP"
  fi

  # Obtener usuario
  read -rp "→ Usuario en Madre (default: $USER): " MADRE_USER
  MADRE_USER=${MADRE_USER:-$USER}

  # Crear/actualizar ~/.ssh/config
  mkdir -p "$(dirname "$SSH_CONFIG")"
  chmod 700 "$(dirname "$SSH_CONFIG")"

  if grep -q "^Host $HOST_ALIAS$" "$SSH_CONFIG" 2>/dev/null; then
    log_warn "Alias '$HOST_ALIAS' ya existe en $SSH_CONFIG — actualizando..."
    # Eliminar bloque existente
    python3 - <<PY
import re
with open('$SSH_CONFIG','r') as f:
    content=f.read()
pattern=r'Host $HOST_ALIAS\n(?:[^\n]*\n)*'
content=re.sub(pattern,'',content)
with open('$SSH_CONFIG','w') as f:
    f.write(content)
PY
  fi

  # Añadir nueva entrada
  cat >> "$SSH_CONFIG" << EOF

Host $HOST_ALIAS
  HostName $MADRE_IP
  User $MADRE_USER
  IdentityFile $SSH_KEY
  ServerAliveInterval 60
  ServerAliveCountMax 3
  StrictHostKeyChecking accept-new
EOF

  chmod 600 "$SSH_CONFIG"
  log_ok "Alias '$HOST_ALIAS' configurado en $SSH_CONFIG"

  # Mostrar clave pública para copiar a Madre
  echo ""
  separator
  echo -e "${BOLD}Copia esta clave pública a Madre:${NC}"
  echo ""
  cat "${SSH_KEY}.pub"
  echo ""
  separator
  echo -e "En Madre ejecuta:"
  echo -e "  ${CYAN}echo '$(cat ${SSH_KEY}.pub)' >> ~/.ssh/authorized_keys${NC}"
  echo ""
  log_info "Cuando lo hayas hecho, ejecuta: ./scripts/ygg-madre.sh check"
}

# ── COMANDO: check ────────────────────────────────────────────────────────────
cmd_check() {
  log_head "CHECK CONECTIVIDAD"
  local ERRORS=0

  # 1. Tailscale
  log_info "Verificando Tailscale..."
  if ! command -v tailscale &>/dev/null; then
    log_err "Tailscale no instalado"; ERRORS=$((ERRORS+1))
  else
    TS_STATUS=$(tailscale status --peers=false 2>/dev/null | head -1)
    if echo "$TS_STATUS" | grep -q "Logged in"; then
      log_ok "Tailscale activo"
    else
      tailscale status --peers=false
      log_warn "Tailscale puede no estar autenticado"
    fi

    # Verificar que madre aparece
    if tailscale status 2>/dev/null | grep -qi "madre"; then
      log_ok "Madre visible en Tailscale"
    else
      log_warn "Madre no aparece en Tailscale — verifica que está encendida y con Tailscale activo"
      ERRORS=$((ERRORS+1))
    fi
  fi

  # 2. SSH config
  log_info "Verificando SSH config..."
  if grep -q "^Host $HOST_ALIAS$" "$SSH_CONFIG" 2>/dev/null; then
    MADRE_IP=$(grep -A5 "^Host $HOST_ALIAS$" "$SSH_CONFIG" | grep HostName | awk '{print $2}')
    log_ok "Alias 'madre' configurado → $MADRE_IP"
  else
    log_err "Alias 'madre' no encontrado en ~/.ssh/config"
    log_info "Ejecuta: ./scripts/ygg-madre.sh setup"
    ERRORS=$((ERRORS+1))
  fi

  # 3. Test SSH (sin shell completa)
  log_info "Test conexión SSH a Madre..."
  if ssh -o ConnectTimeout=5 -o BatchMode=yes "$HOST_ALIAS" 'echo OK' 2>/dev/null | grep -q 'OK'; then
    log_ok "SSH a Madre: FUNCIONA"
  else
    log_warn "SSH a Madre no responde — puede que la clave no esté autorizada en Madre"
    ERRORS=$((ERRORS+1))
  fi

  separator
  if [[ $ERRORS -eq 0 ]]; then
    log_ok "Todo OK — puedes ejecutar: ./scripts/ygg-madre.sh connect"
  else
    log_err "$ERRORS problema(s) detectado(s) — revisa los puntos anteriores"
    exit 1
  fi
}

# ── COMANDO: connect ──────────────────────────────────────────────────────────
cmd_connect() {
  log_head "CONECTANDO A MADRE"
  log_info "Verificando conectividad antes de conectar..."

  if ! ssh -o ConnectTimeout=5 -o BatchMode=yes "$HOST_ALIAS" 'echo OK' 2>/dev/null | grep -q 'OK'; then
    log_err "No se puede conectar a Madre"
    log_info "Ejecuta primero: ./scripts/ygg-madre.sh check"
    exit 1
  fi

  log_ok "Conexión verificada — abriendo shell en Madre"
  echo ""
  echo -e "${YELLOW}⚠️  Recuerda: Madre es producción. Sigue PROTOCOLO-TERMINUS-MADRE.md${NC}"
  echo ""
  ssh "$HOST_ALIAS"
}

# ── COMANDO: audit ────────────────────────────────────────────────────────────
cmd_audit() {
  log_head "AUDITORÍA FASE 4 — MADRE"
  log_info "Ejecutando script de auditoría remota..."
  echo ""

  ssh "$HOST_ALIAS" bash << 'REMOTE'
echo "╔══════════════════════════════════════╗"
echo "║  AUDITORÍA YGGDRASIL — MADRE         ║"
echo "║  $(date '+%Y-%m-%d %H:%M:%S CEST')  "
echo "╚══════════════════════════════════════╝"
echo ""

echo "=== 🐳 DOCKER — Contenedores activos ==="
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null || echo "Docker no disponible"
echo ""

echo "=== 💀 CONTENEDORES CAÍDOS ==="
CAIDOS=$(docker ps -a --filter 'status=exited' --filter 'status=restarting' --format '{{.Names}} — {{.Status}}' 2>/dev/null)
if [[ -z "$CAIDOS" ]]; then
  echo "✅ Ninguno"
else
  echo "$CAIDOS"
fi
echo ""

echo "=== 💾 DISCO ==="
df -h / 2>/dev/null | tail -1 | awk '{printf "Usado: %s / %s (%s libre)\n", $3, $2, $4}'
echo ""

echo "=== 🧠 MEMORIA ==="
free -h 2>/dev/null | awk '/Mem:/ {printf "Usada: %s / %s (libre: %s)\n", $3, $2, $4}'
echo ""

echo "=== ⚡ CARGA ==="
uptime
echo ""

echo "=== 🌐 TAILSCALE ==="
tailscale status --peers=false 2>/dev/null | head -3 || echo "Tailscale no disponible"
echo ""

echo "=== 🔌 PUERTOS ESCUCHANDO ==="
ss -tlnp 2>/dev/null | grep LISTEN | awk '{print $4}' | sort -t: -k2 -n | head -20
echo ""

echo "✅ Auditoría completada — $(date '+%H:%M:%S')"
REMOTE

  echo ""
  log_ok "Auditoría FASE 4 completada"
  log_info "Copia el output relevante a ESTADO-SISTEMA.md → sección Infra Madre"
}

# ── COMANDO: health ───────────────────────────────────────────────────────────
cmd_health() {
  log_head "HEALTH-CHECK RÁPIDO"

  ssh "$HOST_ALIAS" bash << 'REMOTE'
echo "🏥 Health-check Madre — $(date '+%H:%M:%S')"
echo ""
TOTAL=$(docker ps -q 2>/dev/null | wc -l)
HEALTHY=$(docker ps --filter 'health=healthy' -q 2>/dev/null | wc -l)
UNHEALTHY=$(docker ps --filter 'health=unhealthy' -q 2>/dev/null | wc -l)
CAIDOS=$(docker ps -a --filter 'status=exited' -q 2>/dev/null | wc -l)

echo "Contenedores activos:  $TOTAL"
echo "  ✅ Healthy:          $HEALTHY"
echo "  ⚠️  Unhealthy:        $UNHEALTHY"
echo "  💀 Caídos (exited):  $CAIDOS"
echo ""

if [[ $UNHEALTHY -gt 0 || $CAIDOS -gt 0 ]]; then
  echo "=== Detalle problemas ==="
  docker ps -a --filter 'health=unhealthy' --format '  UNHEALTHY: {{.Names}}' 2>/dev/null
  docker ps -a --filter 'status=exited' --format '  CAÍDO: {{.Names}} — {{.Status}}' 2>/dev/null
fi
REMOTE
}

# ── COMANDO: logs ─────────────────────────────────────────────────────────────
cmd_logs() {
  log_head "LOGS DE SERVICIO"

  # Listar servicios disponibles
  log_info "Servicios en Madre:"
  ssh "$HOST_ALIAS" 'docker ps --format "  → {{.Names}}"' 2>/dev/null
  echo ""

  read -rp "→ Nombre del servicio: " SERVICIO
  read -rp "→ Líneas a mostrar (default: 50): " LINEAS
  LINEAS=${LINEAS:-50}

  echo ""
  log_info "Logs de $SERVICIO (últimas $LINEAS líneas):"
  separator
  ssh "$HOST_ALIAS" "docker logs --tail $LINEAS $SERVICIO 2>&1"
}

# ── MAIN ──────────────────────────────────────────────────────────────────────
COMMAND=${1:-help}

case "$COMMAND" in
  setup)   cmd_setup   ;;
  check)   cmd_check   ;;
  connect) cmd_connect ;;
  audit)   cmd_audit   ;;
  health)  cmd_health  ;;
  logs)    cmd_logs    ;;
  help|--help|-h) cmd_help ;;
  *)
    log_err "Comando desconocido: $COMMAND"
    echo ""
    cmd_help
    exit 1
    ;;
esac
