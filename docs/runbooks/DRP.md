# DRP — Disaster Recovery Plan: Yggdrasil

**Versión:** 1.0  
**Fecha:** 2026-07-13  
**RTO objetivo:** < 2 horas  
**RPO objetivo:** < 24 horas (última sesión de trabajo)

---

## 1. Identidad del sistema

| Campo | Valor |
|---|---|
| Repositorio maestro | `yggdrasil-dew` (canon técnico) |
| Nodo principal | Madre — IP local: `[COMPLETAR]` |
| Acceso remoto | Tailscale — IP VPN: `[COMPLETAR]` |
| DNS interno | `[COMPLETAR]` |
| Secretos | `/home/varopc/.env` (NO en git) |
| Estado Docker | `/var/lib/docker/volumes/` |
| Backup más reciente | `[COMPLETAR ruta backup]` |

---

## 2. Mapa de servicios críticos

| Servicio | Contenedor | Puerto | Criticidad |
|---|---|---|---|
| Ollama (LLM local) | `ollama` | 11434 | 🔴 ALTA |
| Open WebUI | `open-webui` | 3000 | 🔴 ALTA |
| LiteLLM proxy | `litellm` | 4000 | 🔴 ALTA |
| n8n orquestador | `n8n` | 5678 | 🔴 ALTA |
| THDORA bot | `thdora_bot` | — | 🟡 MEDIA |
| code-server | `code-server` | 8080 | 🟡 MEDIA |
| Portainer | `portainer` | 9000 | 🟡 MEDIA |
| log_guardian_bot | `log_guardian_bot` | — | 🟡 MEDIA |
| Qdrant (vectorDB) | `qdrant` | 6333 | 🔴 ALTA (RAG) |

---

## 3. Procedimiento de reconstrucción

### Paso 1 — Provisionar OS (20 min)
```bash
# Instalar Arch Linux + paquetes base
pacman -S docker docker-compose git openssh
systemctl enable --now docker sshd
```

### Paso 2 — Clonar repos canónicos (5 min)
```bash
git clone git@github.com:alvarofernandezmota-tech/yggdrasil-dew.git
git clone git@github.com:alvarofernandezmota-tech/madre-config.git
```

### Paso 3 — Restaurar secretos (10 min)
```bash
# Recrear /home/varopc/.env desde copia física o gestor de secretos
# NUNCA desde GitHub — el .env NO está en git
vim /home/varopc/.env
chmod 600 /home/varopc/.env

# Validar antes de levantar
./yggdrasil-dew/scripts/env-checker.sh yggdrasil-dew/.env.template .env
```

### Paso 4 — Restaurar volúmenes Docker (30 min)
```bash
# Si tienes backup en rsync:
rsync -avz /backup/docker-volumes/ /var/lib/docker/volumes/

# Si no hay backup → levantar vacío y reconfigurar
# Pérdida: RAG/VectorDB, workflows n8n, historial de chats
```

### Paso 5 — Levantar stack (10 min)
```bash
cd /home/varopc
docker compose -f docker-compose.maestro.yml up -d

# Verificar estado
docker ps --format 'table {{.Names}}\t{{.Status}}'
```

### Paso 6 — Verificación final (15 min)
```bash
# Healthcheck manual de servicios críticos
curl -f http://localhost:11434/api/tags && echo "Ollama OK"
curl -f http://localhost:3000 && echo "Open WebUI OK"
curl -f http://localhost:4000/health && echo "LiteLLM OK"
curl -f http://localhost:5678 && echo "n8n OK"
```

---

## 4. Backup — estado actual

> ⚠️ **PENDIENTE IMPLEMENTAR** — No hay backup automatizado todavía.

- [ ] Script `scripts/backup-rag.sh` — backup semanal volumen Qdrant + Open WebUI
- [ ] `btrfs scrub` semanal en cron (relacionado con issue #31)
- [ ] rsync a disco externo o NAS

**Hasta que esté implementado:** backup manual antes de cada cambio grande.
```bash
docker run --rm -v qdrant_storage:/data -v $(pwd):/backup alpine tar czf /backup/qdrant-$(date +%Y%m%d).tar.gz /data
```

---

## 5. Contactos y credenciales de emergencia

| Servicio | Dónde regenerar |
|---|---|
| Telegram bot token | BotFather → /mybots → Revoke |
| LiteLLM key | Dashboard LiteLLM |
| GitHub SSH key | github.com/settings/keys |
| Tailscale | tailscale.com/admin |

---

## 6. Lecciones aprendidas

| Fecha | Incidente | Lección |
|---|---|---|
| 2026-07-10 | HAL-007: .env malformado | Una variable por línea. Validar con env-checker antes de deploy |
| 2026-07-10 | HAL-008: tokens expuestos en chat | Nunca `cat .env` en chat. Usar `grep -c` para verificar existencia |

---

*Documento vivo — actualizar tras cada incidente*
