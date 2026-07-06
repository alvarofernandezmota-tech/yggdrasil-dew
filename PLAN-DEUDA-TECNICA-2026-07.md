---
title: Plan de Remediación — Deuda Técnica y Seguridad
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: PLAN-DEUDA-TECNICA-2026-07.md
tags: [plan, seguridad, deuda-tecnica, remediacion, hallazgos]
status: vigente
fuentes:
  - docs/hallazgos/HAL-001-token-telegram-thdora.md
  - docs/hallazgos/HAL-003-token-telegram-segunda-exposicion.md
  - docs/hallazgos/HAL-006-ssh-expuesto-internet.md
  - yggdrasil-secops/hallazgos/2026-07-01-ftp-puerto21.md
---

# 🔧 Plan de Remediación — Deuda Técnica y Seguridad

> Diferencia con los otros dos planes: aquellos arreglan la **documentación** (WIKI/Dew/secops).
> Este arregla **el sistema real** — credenciales, puertos, logging, tests. Es el que más importa de los tres.
> Orden: por explotabilidad real, no por facilidad de arreglo.

---

## Tier 1 — Credenciales potencialmente comprometidas (HOY, antes que nada)

El token de Telegram de THDORA apareció **dos veces** en el historial de git (HAL-001 + HAL-003). Un token en git nunca se sabe si fue visto por alguien más — se trata como comprometido, se rota, y punto.

- [ ] Buscar todas las apariciones antes de rotar (para saber el alcance real):
  ```bash
  cd ~/repos/THDORA-PERSONAL
  git log --all --full-history -p | grep -n "bot:" | head -50
  git log --all --full-history -p | grep -n "[0-9]\{10\}:[A-Za-z0-9_-]\{35\}" | head -20
  ```
- [ ] Revocar el token actual: [t.me/BotFather](https://t.me/BotFather) → tu bot → `API Token` → `Revoke current token`
- [ ] Generar token nuevo, guardarlo **solo** en `.env` de Madre (nunca en código)
- [ ] Actualizar `docker-compose.yml` de THDORA para leer `${TELEGRAM_BOT_TOKEN}` desde el entorno
- [ ] `docker compose -f docker-compose.maestro.yml up -d --force-recreate` y probar con un mensaje
- [ ] Auditar el mismo patrón en los demás bots de `yggdrasil-secops` (guardian_bot, tailscale_monitor, network_radar, local_tripwire, log_guardian) — confirmar que ninguno tiene el token hardcodeado en historial
- [ ] Marcar HAL-001 y HAL-003 como `RESUELTO` en `INDICE-HALLAZGOS.md` con fecha + evidencia
- [ ] Si algdía planeas hacer público `THDORA-PERSONAL` → limpiar historial con `git-filter-repo` antes. Si sigue privado, no es urgente.

**Por qué primero:** es el único ítem con evidencia de exposición real ya ocurrida.

---

## Tier 2 — Superficies de red innecesariamente expuestas (esta semana)

### SSH puerto 22 en Madre (HAL-006)
```bash
# 1. Confirmar que SSH por Tailscale funciona
ssh varo@100.91.112.32

# 2. Cerrar el 22 público
sudo ufw delete allow 22
sudo ufw delete allow ssh
sudo ufw reload
sudo ufw status

# 3. Confirmar que Tailscale sigue funcionando
ssh varo@100.91.112.32

# 4. Confirmar que el público ya no responde (desde datos móviles sin Tailscale)
curl -v telnet://IP_PUBLICA_MADRE:22   # debe dar Connection refused
```

### FTP puerto 21 en el router (T-008)
- [ ] Entrar al panel del router Digi (`http://192.168.1.1`)
- [ ] Desactivar el servicio FTP
- [ ] Si necesitas transferencia de ficheros → SFTP o FTPS, nunca FTP plano
- [ ] Cambiar credenciales por defecto del router de paso
- [ ] Verificar cierre: `nmap -sV 192.168.1.1 -p 21` → debe salir `closed` o `filtered`

### Ollama :11434 (T-007 — sin confirmar)
```bash
# Desde fuera de tu red (datos móviles, sin Tailscale)
nmap -p 11434 IP_PUBLICA_MADRE

# Desde dentro de la LAN
nmap -p 11434 192.168.1.x
```
- [ ] Si aparece `open` desde internet → `sudo ufw deny 11434` inmediatamente
- [ ] Si aparece `closed`/`filtered` desde internet → correcto, no tocar nada
- [ ] En cualquier caso, anotar resultado en `ESTADO-SISTEMA.md`

**Por qué segundo:** puertas abiertas a internet, sin evidencia de explotación aún.

---

## Tier 3 — Observabilidad (este mes, no bloqueante)

### Logging estructurado en THDORA (T-009)
- [ ] Formato mínimo: JSON lines con `timestamp`, `user_id`, `comando`, `resultado`
- [ ] Añadir logging a los handlers que ejecutan comandos sobre el sistema
- [ ] Persistir logs en volumen Docker (no solo stdout — se pierden al reiniciar)
- [ ] Opcional: enviar a `log_guardian` (ya existe en secops) para centralizar

**Por qué tercero:** falta de visibilidad, no vulnerabilidad activa.

---

## Tier 4 — Testing de scripts críticos (BATS)

- [ ] Refactorizar `inbox-commit.sh` y `session-logger.sh` con guard `BASH_SOURCE`:
  ```bash
  if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    run_main
  fi
  ```
- [ ] Instalar BATS: `sudo pacman -S bats` o desde fuente
- [ ] Empezar por regresiones conocidas (bloqueo `git pull` por `.env` sin stash, crashloop sqlite)
- [ ] Un test mínimo por script: input vacío + variable de entorno ausente

**Por qué cuarto:** mejora calidad futura, no arregla nada roto ahora.

---

## Tier 5 — Ansible en Acer para gestionar Madre

- [ ] `sudo pacman -S ansible` en Acer
- [ ] Crear inventario mínimo:
  ```ini
  [madre]
  madre ansible_host=100.91.112.32 ansible_user=varo
  ```
- [ ] Empezar con `base.yml` pequeño (paquetes base, UFW, usuarios)
- [ ] Probar en contenedor o VM antes de ejecutar en Madre real

**Por qué quinto:** inversión en mantenibilidad futura, cero urgencia hoy.

---

## Resumen de orden

| Tier | Qué | Cuándo | Por qué ese orden |
|---|---|---|---|
| 1 | Rotar token Telegram (HAL-001+003) | Hoy | Único con evidencia de exposición ya ocurrida |
| 2 | Cerrar SSH/FTP, verificar Ollama | Esta semana | Puertas abiertas a internet, sin explotación aún |
| 3 | Logging THDORA | Este mes | Falta de visibilidad, no vulnerabilidad activa |
| 4 | BATS testing | Cuando toques esos scripts | Calidad, no seguridad |
| 5 | Ansible | Sin prisa | Mantenibilidad, cero riesgo actual |

---

_Creado: 2026-07-06 · Elaborado por Claude · Commiteado por Perplexity MCP · Complementa PLAN-ALINEACION-2026-07.md y PLAN-ALINEACION-SECOPS-2026-07.md_
