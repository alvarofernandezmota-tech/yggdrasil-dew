---
tipo: canon
author: Alvaro Fernandez Mota
actualizado: 2026-07-10T00:50 CEST
ruta: docs/canon/ESTADO-SISTEMA.md
tags: [canon, estado, sistema, madre, ecosistema]
status: vigente
---

# Estado del Sistema — Yggdrasil

> Snapshot del estado real del ecosistema. Actualizado manualmente tras cada sesión de trabajo.
> Última actualización: **2026-07-10 00:50 CEST**

---

## Madre (servidor principal)

| Componente | Estado | Notas |
|------------|--------|-------|
| HDD | 🟡 Monitorizar | 28.811h, SMART sin fallos activos |
| Stack IA (ollama + qdrant + webui) | ✅ Running | ~11.5 GB RAM / 16 GB |
| `.env` raíz | 🔴 Roto | HAL-007 — malformado, comandos bash mezclados |
| log_guardian_bot | 🔴 Crash loop | HAL-009 — reinicio #971, no operativo |
| local_tripwire | 🔴 Crash loop | HAL-009 — reinicio #486, no operativo |
| Watchdog | 🟡 Activo | Detectando crashes pero no resuelve |
| Puerto 21 FTP | 🟡 Filtered | No open, pendiente confirmar desde IP pública |
| IaC | 🔴 Sin versionar | 16+ compose files en /home/varopc/ sin repo |
| Secretos Telegram | 🔴 Rotar AHORA | HAL-008 — expuestos en chat esta sesión |

---

## Issues abiertos por prioridad (2026-07-10)

### 🔴 CRÍTICO — hacer el próximo domingo

| # | Título | Bloque |
|---|--------|--------|
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 Rotar secretos expuestos (Telegram token AHORA) | 0 — antes de dormir |
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007 Arreglar `.env` malformado | Domingo bloque 1 |
| [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | HAL-009 Arreglar crash loop log_guardian_bot | Domingo bloque 2 |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | IaC Madre — versionar 16 docker-compose | Domingo bloque 3 |

### 🟡 ALTA — próximas sesiones

| # | Título |
|---|--------|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | smartctl HDD — monitorizar mensualmente |
| [#32](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/32) | docker logs watchdog — revisar y restart |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP — confirmar desde red externa |
| [#34](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/34) | Verificar docker-compose raíz `/home/varopc/` |

### 📋 PENDIENTE — backlog ordenado

| # | Título |
|---|--------|
| [#13](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/13) | Limpieza git — rm basura + estructura definitiva |
| [#18](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/18) | Gobernanza — auditar reglas, naming, estructura |
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | AUDIT-002 DEW con Claude/Grok |
| [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | AUDIT-003 thdora-personal |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | AUDIT-004 yggdrasil-secops |
| [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | CI — ampliar secret-scanning (IPv4 + email) |
| [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | CI — confirmar gitleaks en push |
| [#40](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/40) | Canon — completar ownership-matrix |
| [#41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41) | Arquitectura — diagrama C4 Mermaid |
| [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | AUDIT-005 — consolidar agentes/ y MCP |
| [#19](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/19) | Stack completo — Wazuh + Suricata + Pihole + SearXNG |

---

## Próxima sesión — Domingo 2026-07-13

### Orden de ejecución (obligatorio respetar dependencias)

```
⚡ ANTES DE DORMIR HOY:
   BotFather → revocar TELEGRAM_BOT_TOKEN → nuevo token → actualizar .env

DOMINGO BLOQUE 1 (30 min) — Fix .env (#44)
   ssh varopc@varpc.taileb8343.ts.net
   cp /home/varopc/.env /home/varopc/.env.bak-2026-07-10
   nano /home/varopc/.env  → una var por línea, sin comandos bash
   chmod 600 /home/varopc/.env
   docker compose -f /home/varopc/docker-compose.yml config > /dev/null && echo OK

DOMINGO BLOQUE 2 (20 min) — Fix crash loop (#46)
   docker logs --tail 200 log_guardian_bot 2>&1
   docker logs --tail 200 local_tripwire 2>&1
   docker restart log_guardian_bot local_tripwire
   docker ps | grep -E 'log_guardian|tripwire'

DOMINGO BLOQUE 3 (30 min) — IaC versionar (#43)
   find /home/varopc -name 'docker-compose*.yml' 2>/dev/null
   mkdir -p ~/madre-config/docker/{ia,dev,monitoring,secops}
   # copiar cada compose a su subcarpeta

DOMINGO BLOQUE 4 (20 min) — Diarios
   Diario 2026-07-10 (viernes)
   Retrospectiva S28

DOMINGO BLOQUE 5 (30 min) — VIDAPERSONAL limpieza (#14)
   git commands del Issue #14
```

---

## Ecosistema — 18 repos

| Repo | Rol | Estado |
|------|-----|--------|
| yggdrasil-dew | Cerebro operativo | ✅ Activo |
| yggdrasil-wiki | Conocimiento | ✅ Activo |
| VIDAPERSONAL | Vida personal | 🟡 Limpiar |
| madre-config | IaC servidor | 🔴 Vacío |
| thdora-personal | Bot IA | 🟡 Auditar |
| yggdrasil-secops | Blue team | 🟡 Privado |
| yggdrasil-labs | Experimentos | 🟡 En construcción |

_Actualizado: 2026-07-10 00:50 CEST · Perplexity-MCP_
