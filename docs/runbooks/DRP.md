---
title: DRP — Disaster Recovery Plan — Yggdrasil
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/runbooks/DRP.md
tags: [drp, recovery, runbook, emergencia]
status: esqueleto — completar con datos reales
---

# 🚨 DRP — Disaster Recovery Plan

> **RTO objetivo: < 2 horas** para recuperación completa del stack.
> **RPO objetivo: < 24 horas** (frecuencia mínima de backup de volúmenes Docker).
>
> ⚠️ Este documento tiene datos de estructura. Completar las secciones marcadas con `[COMPLETAR]`
> con valores reales de Madre antes del 2026-07-20.

---

## 1. Identidad del sistema

| Campo | Valor |
|---|---|
| Nodo primario | Madre (PC torre fija) |
| Nodo secundario | varpc (portátil) |
| Repositorio maestro | `yggdrasil-dew` |
| Gestor de secretos | Vaultwarden (en Madre) |
| Red privada | Tailscale |
| Dirección Tailscale Madre | `[COMPLETAR]` |
| Dirección LAN Madre | `[COMPLETAR]` |
| Usuario SSH | `[COMPLETAR]` |

---

## 2. Inventario de volúmenes críticos

Ejecutar en Madre para obtener la lista real:
```bash
docker volume ls --format 'table {{.Name}}\t{{.Driver}}'
```

| Volumen | Servicio | Contenido crítico |
|---|---|---|
| `[COMPLETAR]` | Ollama | Modelos LLM descargados |
| `[COMPLETAR]` | Open WebUI | Historial de conversaciones + RAG |
| `[COMPLETAR]` | n8n | Flujos y credenciales |
| `[COMPLETAR]` | LiteLLM | Configuración y logs |
| `[COMPLETAR]` | Vaultwarden | Secretos cifrados |

---

## 3. Procedimiento de reconstrucción completa

### Paso 1: Provisionar OS (30 min)

```bash
# Instalar Arch Linux en nuevo hardware
# Instalar dependencias base
pacman -S docker docker-compose git curl
systemctl enable --now docker
```

### Paso 2: Clonar repos y configurar red (15 min)

```bash
# Configurar Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

# Clonar repos del Tridente
git clone git@github.com:alvarofernandezmota-tech/yggdrasil-dew.git
git clone git@github.com:alvarofernandezmota-tech/WIKI---PERSONAL.git
# yggdrasil-secops: clonar separado por ser privado
```

### Paso 3: Restaurar secretos (10 min)

```bash
# 1. Restaurar .env desde backup cifrado o Vaultwarden
# NUNCA desde un repo Git
cp /backup/.env.bak ~/.env
# Verificar que .env tiene todas las variables
# (cuando env-checker.sh exista):
# ./scripts/env-checker.sh .env.template .env
```

### Paso 4: Restaurar volúmenes Docker (30-60 min según tamaño)

```bash
# Opción A: desde backup en disco externo
rsync -avz /backup/docker-volumes/ /var/lib/docker/volumes/

# Opción B: re-descargar modelos Ollama (más lento)
docker run --rm -v ollama:/root/.ollama ollama pull [COMPLETAR: lista de modelos]
```

### Paso 5: Levantar stack (10 min)

```bash
# Validar .env antes de levantar
docker compose -f ~/docker-compose.maestro.yml config > /dev/null && echo "✅ config OK"

# Levantar
docker compose -f ~/docker-compose.maestro.yml up -d

# Verificar
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
```

### Paso 6: Verificación post-recovery

```bash
# Todos los contenedores healthy
docker ps | grep -v "healthy\|Up"
# Si hay algo en estado distinto → ver logs:
docker logs --tail 50 [nombre_contenedor]

# Verificar Open WebUI accesible
curl -s http://localhost:[COMPLETAR: puerto]/health

# Verificar LiteLLM
curl -s http://localhost:[COMPLETAR: puerto]/health

# Verificar Thdora-bot activo en Telegram
# Enviar /ping al bot y esperar respuesta
```

---

## 4. Contactos y tokens críticos

| Servicio | Dónde revocar/regenerar | Notas |
|---|---|---|
| Telegram Bot Token | BotFather → /mybots → Revoke | Rotar PRIMERO antes de levantar el bot |
| LiteLLM Master Key | Dashboard LiteLLM | Necesaria para que los agentes conecten |
| Tailscale Auth Key | dashboard.tailscale.com | Puede expirar — verificar |
| SSH keys | `~/.ssh/` | Hacer backup de `id_rsa` + `authorized_keys` |

---

## 5. Backup preventivo (a implementar — F7.5)

```bash
# Script de backup diario de volúmenes críticos
# [PENDIENTE]: crear scripts/backup-volumes.sh
# Objetivo: backup diario a disco externo + snapshot semanal

# Verificar integridad HDD (relacionado con #31)
sudo smartctl -a /dev/sda | grep -i 'reallocated\|pending\|uncorrectable'

# btrfs scrub semanal (si filesystem es btrfs)
sudo btrfs scrub start /
```

---

## 6. Checklist rápido de emergencia

```
☐ 1. ¿El problema es hardware o software?
☐ 2. Si es hardware → ir a Paso 1-6 arriba
☐ 3. Si es software → docker logs [servicio]
☐ 4. ¿Se tocó algo en producción sin PR? → git log --oneline -10 en madre-config
☐ 5. ¿El .env está corrupto? → restaurar desde backup
☐ 6. ¿Token expuesto? → ir a docs/secrets.md → Procedimiento de rotación
☐ 7. Documentar el incidente como HAL-XXX en yggdrasil-secops
```

---

_Creado: 2026-07-13 · Perplexity-MCP · F7.2 del Plan Maestro · Estado: ESQUELETO — completar antes 2026-07-20_
