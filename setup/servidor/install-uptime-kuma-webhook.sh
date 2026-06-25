#!/usr/bin/env bash
# install-uptime-kuma-webhook.sh — Instala el servicio webhook Uptime Kuma → Telegram
# Ejecutar como root o con sudo
set -euo pipefail

SERVICE_FILE="/etc/systemd/system/uptime-kuma-webhook.service"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cp "$SCRIPT_DIR/setup/servidor/uptime-kuma-webhook.service" "$SERVICE_FILE"
systemctl daemon-reload
systemctl enable uptime-kuma-webhook
systemctl start uptime-kuma-webhook

echo "Servicio instalado y activo:"
systemctl status uptime-kuma-webhook --no-pager
echo ""
echo "Siguiente paso en Uptime Kuma:"
echo "  Settings > Notifications > Add > Webhook"
echo "  URL: http://localhost:8001/webhook"
echo "  Method: POST"
