#!/usr/bin/env bash
# ==============================================================================
# yggdrasil-dew/scripts/infra/instalar-dependencias.sh
# Propósito: Instalar stack de seguridad, monitorización y dependencias OSINT
# OS: Arch Linux
# Generado: Sesión Gemini 2026-06-27
# ==============================================================================

set -euo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}[*] Iniciando provisión de dependencias en Madre...${NC}"

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[-] Este script debe ejecutarse como root (usa sudo).${NC}"
   exit 1
fi

echo -e "${BLUE}[*] Sincronizando bases de datos de pacman...${NC}"
pacman -Sy

PACKAGES=(
    "fail2ban" "ufw" "suricata" "zeek"
    "restic" "sops" "age"
    "nmap" "net-tools" "arp-scan" "tcpdump" "wireshark-cli"
    "htop" "btop" "iotop" "nvtop"
    "lm_sensors" "smartmontools"
)

echo -e "${BLUE}[*] Instalando paquetes (omitiendo los ya instalados)...${NC}"
pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo -e "${BLUE}[*] Habilitando servicios base...${NC}"
systemctl enable --now fail2ban.service
systemctl enable --now ufw.service
systemctl enable --now tailscaled.service

echo -e "${BLUE}[*] Detectando sensores de hardware...${NC}"
sensors-detect --auto || true

echo -e "${GREEN}[+] Provisión completada. Madre lista para hardening.${NC}"
