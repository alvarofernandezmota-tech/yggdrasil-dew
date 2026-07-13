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

## Estado global — 2026-07-13 (actualizado 09:52 CEST)

| Bloque | Estado | Issues |
|--------|--------|--------|
| 🔴 **BLOQUEANTES** | Pendiente terminal | #44 #45 #46 |
| ✅ **F0 — Repos privados** | Completado | — |
| ✅ **F1 — ADRs indexados** | Completado | — |
| ✅ **F5 — CI completo** | Completado 2026-07-13 | #38 #39 cerrados |
| ✅ **F4 — Gobernanza C4** | Completado 2026-07-13 | #40 #41 cerrados |
| ✅ **AUDIT-005 MCP** | Completado 2026-07-13 | #42 cerrado |
| 🟡 **F2 — Auditoría Madre** | Bloqueado por #44 #45 | #31 #32 #34 #43 |
| 🟡 **F3 — Purga WIKI** | En progreso | #24 |
| 🟡 **F6 — Islas** | 8 islas auditadas, 2 pendientes input | #49–#56 |
| ⚪ **F7 — Seguridad blue team** | Bloqueado por #44 #45 | #15 #19 #37 |
| ⚪ **F8 — IaC Madre** | Pendiente terminal | #13 #43 |
| ⚪ **F9 — VIDAPERSONAL** | Parcial — canon ok, limpieza pendiente | #48 |

---

## LOG DE SESIÓN — 2026-07-13

### Commits realizados por Perplexity-MCP

| Hora | Repo | Commit | Qué |
|------|------|--------|-----|
| 09:10 | yggdrasil-dew | `PLAN-MAESTRO-FASES.md` creado | Plan maestro inicial |
| 09:15 | yggdrasil-dew | `ARQUITECTURA-C4.md` creado | Diagrama C4 Context + Container |
| 09:20 | yggdrasil-dew | `ownership-matrix.md` actualizada | 16 servicios documentados |
| 09:35 | yggdrasil-wiki | 6 islas expandidas | acer, thea, labs, thdora, cerebro, seguridad |
| 09:44 | VIDAPERSONAL | `01_diarios/2026-07-13.md` | Diario — cierre ritual vela blanca |
| 09:45 | yggdrasil-dew | #41 cerrado | C4 completado |
| 09:49 | yggdrasil-dew | #56 creado | Islas formacion + impresion3d |
| 09:51 | yggdrasil-wiki | `wiki/islas/mcp.md` creado | AUDIT-005 consolidado |
| 09:51 | yggdrasil-dew | #42 cerrado | AUDIT-005 completado |

### Issues cerrados esta sesión
- ✅ [#41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41) — Diagrama C4 Mermaid
- ✅ [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) — AUDIT-005 MCP consolidado

### Issues creados esta sesión
- 🟡 [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) — Islas formacion.md + impresion3d.md (requiere input Alvaro)

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
| #37 | AUDIT-004 secops | — | ✅ Sí |
| #36 | AUDIT-003 thdora-personal | #44 #45 | Parcial |
| #35 | AUDIT-002 dew completa | — | ✅ Sí |
| #56 | Islas formacion + impresion3d | Input Alvaro | ⚪ Pendiente |

---

## BLOQUE 3 — Gobernanza y arquitectura

| Issue | Tarea | Estado |
|-------|-------|--------|
| #41 | Diagrama C4 Mermaid | ✅ Cerrado 2026-07-13 |
| #42 | AUDIT-005 MCP consolidado | ✅ Cerrado 2026-07-13 |
| #40 | Ownership matrix completa | 🟡 Actualizada, verificar con `docker ps` |
| #18 | Gobernanza: labels, templates, convenciones | 🟡 Parcial |
| #50 | GOB-001 Filosofía: validar principios | ⚪ Pendiente (requiere Alvaro) |

---

## BLOQUE 4 — Seguridad blue team (requieren terminal)

| Issue | Tarea | Bloqueado por |
|-------|-------|---------------|
| #15 | Puerto 21 FTP cerrar en router | Acceso router |
| #19 | Levantar Wazuh + Suricata + Pihole + SearXNG | #44 #45 primero |
| #37 | AUDIT-004 secops Fase 1 | — (puedo hacer por MCP) |

---

## BLOQUE 5 — Auditorías islas menores

| Issue | Isla | Acción |
|-------|------|--------|
| #51 | Acer | Encender Acer + revisar |
| #52 | Thea (iPhone) | Revisar apps manualmente |
| #53 | Impresión 3D | Inventario físico + input Alvaro |
| #54 | Formación | Reflexión + input Alvaro |
| #48 | VIDAPERSONAL | Terminal + limpieza carpetas |

---

## Regla de oro

> Todo lo que puede hacer Perplexity-MCP, lo hace directamente y crea el commit.
> Todo lo que requiere terminal, sale como issue con los comandos exactos.
> Nunca una tarea pendiente en un chat. Siempre en un issue.
> Cada sesión se loguea en este archivo y en el diario VIDAPERSONAL del día.

---

_Actualizado: 2026-07-13 09:52 CEST · Perplexity-MCP_
