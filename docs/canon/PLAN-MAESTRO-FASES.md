---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-13
ruta: docs/canon/PLAN-MAESTRO-FASES.md
tags: [canon, plan, fases, roadmap, estado]
status: vigente
---

# Plan Maestro por Fases — Yggdrasil 2026

> **Single Source of Truth del plan.** Cada bloque tiene su issue en DEW.
> Lo que puedo hacer con MCP lo hago directamente. Lo que requiere terminal queda como issue con comandos exactos.
> Actualizado cada sesión.

---

## Estado global — 2026-07-13

| Bloque | Estado | Issues |
|--------|--------|--------|
| 🔴 **BLOQUEANTES** | Pendiente terminal | #44 #45 #46 |
| ✅ **F0 — Repos privados** | Completado | — |
| ✅ **F1 — ADRs indexados** | Completado | — |
| ✅ **F5 — CI completo** | Completado 2026-07-13 | #38 #39 cerrados |
| 🟡 **F2 — Auditoría Madre** | Bloqueado por #44 #45 | #31 #32 #34 #43 |
| 🟡 **F3 — Purga WIKI** | En progreso | #24 #42 |
| 🟡 **F4 — Gobernanza C4** | Parcial — C4 creado | #18 #40 #41 |
| 🟡 **F6 — Islas** | Fichas creadas, auditorías pendientes | #49–#55 |
| ⚪ **F7 — Seguridad blue team** | Bloqueado por #44 #45 | #15 #19 #37 |
| ⚪ **F8 — IaC Madre** | Pendiente terminal | #13 #43 |
| ⚪ **F9 — VIDAPERSONAL** | Pendiente terminal | #48 |

---

## BLOQUE 0 — Bloqueantes críticos (requieren terminal)

> Estos 3 issues desbloquean el 80% del resto del plan.

### #44 — HAL-007: arreglar .env malformado
```bash
cp /home/varopc/.env /home/varopc/.env.bak-$(date +%Y%m%d)
nano /home/varopc/.env
# — línea 7: quitar el comando bash que no es variable
# — línea 2: separar en dos líneas CODE_SERVER_PASSWORD y CODE_SERVER_SUDO
chmod 600 /home/varopc/.env
docker compose config > /dev/null && echo OK
```

### #45 — HAL-008: rotar token Telegram
```bash
# 1. BotFather → /mybots → bot → API Token → Revoke → copiar nuevo token
# 2. nano /home/varopc/.env → actualizar TELEGRAM_BOT_TOKEN
# 3. docker restart thdora_api thdora_bot
```

### #46 — HAL-009: reiniciar log_guardian + local_tripwire
```bash
# Solo ejecutar DESPUÉS de cerrar #44 y #45
docker logs --tail 50 log_guardian_bot
docker logs --tail 50 local_tripwire
docker restart log_guardian_bot local_tripwire
docker ps --format 'table {{.Names}}\t{{.Status}}' | grep -E 'guardian|tripwire'
```

---

## BLOQUE 1 — Infra Madre (requieren terminal)

### #31 — HAL-005: smartctl HDD
```bash
sudo smartctl -a /dev/sda | grep -E 'Reallocated|Pending|Uncorrectable|Power_On'
```

### #32 — watchdog restart
```bash
docker logs --tail 300 yggdrasil_watchdog
docker restart yggdrasil_watchdog
```

### #34 — docker-compose.yml raíz
```bash
cat /home/varopc/docker-compose.yml
docker compose -f /home/varopc/docker-compose.yml ps
```

### #43 — IaC: versionar 16 servicios en madre-config
> Estructura objetivo: `madre-config/docker/{ia,dev,monitoring,secops}/`

---

## BLOQUE 2 — Auditorías isla (mayoría por MCP)

| Issue | Isla | Bloqueado por | MCP? |
|-------|------|---------------|------|
| #49 | Orquestador (n8n + THDORA + MCP) | #44 #45 | Parcial |
| #55 | IA Local (Ollama) | Acceso SSH | No |
| #42 | AUDIT-005 MCP disperso | — | ✅ Sí |
| #37 | AUDIT-004 secops | — | ✅ Sí |
| #36 | AUDIT-003 thdora-personal | #44 #45 | Parcial |
| #35 | AUDIT-002 dew completa | — | ✅ Sí |

---

## BLOQUE 3 — Gobernanza y arquitectura (todo por MCP)

| Issue | Tarea | Estado |
|-------|-------|--------|
| #41 | Diagrama C4 Mermaid | ✅ Creado 2026-07-13 |
| #40 | Ownership matrix completa | 🟡 Actualizada, pendiente verificar con `docker ps` |
| #18 | Gobernanza: labels, templates, convenciones | 🟡 Parcial |
| #50 | GOB-001 Filosofía: validar principios | ⚪ Pendiente (requiere Alvaro) |

---

## BLOQUE 4 — Seguridad blue team (requieren terminal)

| Issue | Tarea | Bloqueado por |
|-------|-------|---------------|
| #15 | Puerto 21 FTP cerrar en router | Acceso router |
| #19 | Levantar Wazuh + Suricata + Pihole + SearXNG | #44 #45 primero |
| #37 | AUDIT-004 secops Fase 1 | — |

---

## BLOQUE 5 — Auditorías islas menores (requieren terminal o acción manual)

| Issue | Isla | Acción |
|-------|------|--------|
| #51 | Acer | Encender Acer + revisar |
| #52 | Thea (iPhone) | Revisar apps manualmente |
| #53 | Impresión 3D | Inventario físico |
| #54 | Formación | Reflexión + actualización |
| #48 | VIDAPERSONAL | Terminal + domingo |

---

## Regla de oro

> Todo lo que puede hacer Perplexity-MCP, lo hace directamente y crea el commit.
> Todo lo que requiere terminal, sale como issue con los comandos exactos.
> Nunca una tarea pendiente en un chat. Siempre en un issue.

---

_Actualizado: 2026-07-13 · Perplexity-MCP_
