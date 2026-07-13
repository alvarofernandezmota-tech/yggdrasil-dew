---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-13T10:13:00+02:00
ruta: docs/canon/PLAN-MAESTRO-FASES.md
tags: [canon, plan, fases, roadmap, estado]
status: vigente
---

# Plan Maestro por Fases — Yggdrasil 2026

> **Single Source of Truth del plan.** Cada bloque tiene su issue en DEW.
> Lo que puedo hacer con MCP lo hago directamente. Lo que requiere terminal queda como issue con comandos exactos.
> Actualizado cada sesión.

---

## Estado global — 2026-07-13 (actualizado 10:13 CEST)

| Bloque | Estado | Issues |
|--------|--------|--------|
| 🔴 **BLOQUEANTES** | Pendiente terminal | #44 #45 #46 #31 #15 |
| ✅ **F0 — Repos privados** | Completado | — |
| ✅ **F1 — ADRs indexados** | Completado | ADR-001…ADR-010 |
| ✅ **F4 — Gobernanza C4** | Completado 2026-07-13 | #40 #41 ✅ |
| ✅ **F5 — CI completo** | Completado 2026-07-13 | #38 #39 ✅ |
| ✅ **AUDIT-005 MCP** | Completado 2026-07-13 | #42 ✅ |
| ✅ **Auditoría 19 repos** | Completado 2026-07-13 | issues en todos |
| ✅ **Wiki 25 islas** | Completado 2026-07-13 | INDEX.md actualizado |
| 🟡 **F2 — Auditoría Madre** | Bloqueado por #44 #45 | #31 #32 #34 #43 |
| 🟡 **F3 — Purga WIKI** | Solapamientos detectados | labs≡dev-labs, cerebro≈ia-local |
| 🟡 **F6 — Islas** | 11 completas, 11 parciales, 3 stubs | #56 |
| ⚪ **F7 — Seguridad blue team** | Bloqueado por #44 #45 | #15 #19 #37 |
| ⚪ **F8 — IaC Madre** | Pendiente terminal | #13 #43 |
| ⚪ **F9 — VIDAPERSONAL** | Parcial | #48 |

---

## LOG DE SESIÓN — 2026-07-13

### Commits por Perplexity-MCP

| Hora | Repo | Qué |
|------|------|-----|
| 09:10 | yggdrasil-dew | PLAN-MAESTRO-FASES.md creado |
| 09:15 | yggdrasil-dew | ARQUITECTURA-C4.md creado (C4 Context + Container) |
| 09:20 | yggdrasil-dew | ownership-matrix.md — 16 servicios |
| 09:35 | yggdrasil-wiki | 6 islas expandidas |
| 09:44 | VIDAPERSONAL | diario 2026-07-13.md |
| 09:51 | yggdrasil-wiki | mcp.md creada — AUDIT-005 |
| 09:51 | yggdrasil-dew | #41, #42 cerrados |
| 10:07 | yggdrasil-wiki | 5 islas nuevas: ollama-stack, osint, dev-labs, investigacion-ia, scripts |
| 10:07 | yggdrasil-dew | ESTADO-SISTEMA.md — 19 repos auditados |
| 10:07 | ollama-stack | #1 AUDIT-013 creado |
| 10:07 | osint-stack | #1 OSINT-001 creado |
| 10:07 | investigacion-ia | #1 IA-001 creado |
| 10:07 | acer-config | #1 ACER-001 creado |
| 10:07 | local-brain | #1 BRAIN-001 creado |
| 10:07 | yggdrasil-dew | #58 ADR-011 creado (decisión thea-ia) |
| 10:13 | yggdrasil-wiki | INDEX.md — 25 islas + desalineaciones documentadas |
| 10:13 | yggdrasil-dew | PLAN-MAESTRO actualizado (esta entrada) |

### Issues cerrados esta sesión
- ✅ [#41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41) — Diagrama C4
- ✅ [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) — AUDIT-005 MCP

### Issues creados esta sesión
- [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) — Islas formacion + impresion3d
- [#57](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/57) — Isla filosofia.md
- [#58](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/58) — ADR-011 thea-ia
- [ollama-stack #1](https://github.com/alvarofernandezmota-tech/ollama-stack/issues/1) — AUDIT-013
- [osint-stack #1](https://github.com/alvarofernandezmota-tech/osint-stack/issues/1) — OSINT-001
- [investigacion-ia #1](https://github.com/alvarofernandezmota-tech/investigacion-ia/issues/1) — IA-001
- [acer-config #1](https://github.com/alvarofernandezmota-tech/acer-config/issues/1) — ACER-001
- [local-brain #1](https://github.com/alvarofernandezmota-tech/local-brain/issues/1) — BRAIN-001

### Desalineaciones detectadas y documentadas

| Problema | Acción pendiente | Prioridad |
|---------|-----------------|----------|
| labs.md ≡ dev-labs.md (solapamiento) | Unificar en dev-labs.md, archivar labs.md | 🟡 Media |
| cerebro.md ≈ ia-local.md (solapamiento) | Unificar en ia-local.md, archivar cerebro.md | 🟡 Media |
| conocimiento.md ≈ formacion.md | Revisar y separar por scope | ⚪ Baja |

---

## BLOQUE 0 — Bloqueantes críticos (requieren terminal)

> Estos issues desbloquean el 80% del resto del plan.

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
# 2. nano /home/varopc/.env → actualizar TELEGRAM_BOT_TOKEN + LITELLM_MASTER_KEY
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

### #31 — HAL-005: smartctl HDD 28.000h
```bash
sudo smartctl -a /dev/sda | grep -E 'Reallocated|Pending|Uncorrectable|Power_On'
```
> ⚠️ URGENTE — disco en riesgo. Hacer hoy.

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
> Estructura objetivo:
```
madre-config/docker/
├── ia/          # ollama, litellm, qdrant, open-webui
├── dev/         # n8n, code-server, thdora
├── monitoring/  # grafana, prometheus, watchtower
└── secops/      # wazuh, suricata, pihole, searxng
```

---

## BLOQUE 2 — Auditorías satélite (por MCP o parciales)

| Issue | Repo | Bloqueado por | Por MCP? |
|-------|------|---------------|----------|
| [ollama-stack #1](https://github.com/alvarofernandezmota-tech/ollama-stack/issues/1) | ollama-stack | SSH Madre | Parcial |
| [osint-stack #1](https://github.com/alvarofernandezmota-tech/osint-stack/issues/1) | osint-stack | SSH Madre | Parcial |
| [investigacion-ia #1](https://github.com/alvarofernandezmota-tech/investigacion-ia/issues/1) | investigacion-ia | — | ✅ Sí |
| [acer-config #1](https://github.com/alvarofernandezmota-tech/acer-config/issues/1) | acer-config | Encender Acer | No |
| [local-brain #1](https://github.com/alvarofernandezmota-tech/local-brain/issues/1) | local-brain | SSH Madre | Parcial |
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | DEW | — | ✅ Sí |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | secops | — | ✅ Sí |
| [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) | wiki | Input Alvaro | ⚪ |

---

## BLOQUE 3 — Wiki purga solapamientos

| Acción | Archivo | Prioridad |
|--------|---------|----------|
| Unificar labs.md + dev-labs.md → dev-labs.md | labs.md | 🟡 Media |
| Unificar cerebro.md + ia-local.md → ia-local.md | cerebro.md | 🟡 Media |
| Revisar conocimiento.md vs formacion.md | conocimiento.md | ⚪ Baja |
| Completar formacion.md stub | formacion.md | Input Alvaro |
| Completar impresion3d.md stub | impresion3d.md | Input Alvaro |

---

## BLOQUE 4 — Seguridad blue team (requieren terminal)

| Issue | Tarea | Bloqueado por |
|-------|-------|---------------|
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP cerrar | Acceso router |
| [#19](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/19) | Wazuh + Suricata + Pihole + SearXNG | #44 #45 |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | AUDIT-004 secops | — (MCP) |

---

## BLOQUE 5 — Islas pendientes input Alvaro

| Issue | Isla | Qué necesito |
|-------|------|-------------|
| [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) | formacion.md | ¿Qué estás estudiando? ¿Estructura? |
| [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) | impresion3d.md | ¿Modelos actuales? ¿Proyectos? |
| [#50](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/50) | filosofia.md | Validar 6 principios de gobernanza |
| [#58](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/58) | thea-ia | ¿Archivar, integrar o mantener como showcase? |

---

## Regla de oro

> Todo lo que puede hacer Perplexity-MCP, lo hace directamente.
> Todo lo que requiere terminal, sale como issue con comandos exactos.
> Nunca una tarea pendiente en un chat. Siempre en un issue.
> Cada sesión se loguea en este archivo y en el diario VIDAPERSONAL del día.
> El plan es el único lugar donde vive la decisión. La wiki vive el conocimiento.

---

_Actualizado: 2026-07-13 10:13 CEST · Perplexity-MCP · Sesión matinal completa_
