---
tipo: canon
author: Alvaro Fernandez Mota
actualizado: 2026-07-13T09:16 CEST
ruta: docs/canon/ESTADO-SISTEMA.md
tags: [canon, estado, sistema, madre, ecosistema]
status: vigente
---

# Estado del Sistema — Yggdrasil

> Snapshot del estado real del ecosistema. Actualizado manualmente tras cada sesión de trabajo.
> Última actualización: **2026-07-13 09:16 CEST**

---

## Madre (servidor principal)

| Componente | Estado | Notas |
|------------|--------|-------|
| HDD | 🟡 Monitorizar | 28.811h+ — [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) |
| Stack IA (ollama + qdrant + webui) | ✅ Running | ~11.5 GB RAM / 16 GB |
| `.env` raíz `/home/varopc/.env` | 🔴 Roto | HAL-007 [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) — línea 7 key con espacio |
| thdora-bot | 🔴 Caído | Falla por `.env` malformado — depende de cerrar #44 |
| log_guardian_bot | 🔴 Crash loop | HAL-009 [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) — reinicio #971+ |
| local_tripwire | 🔴 Crash loop | HAL-009 [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) — reinicio #486+ |
| Watchdog | 🟡 Activo | Detectando crashes, no los resuelve |
| Puerto 21 FTP | 🟡 Filtered | Pendiente confirmar desde IP pública [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) |
| IaC docker-compose | 🔴 Sin versionar | 16+ compose files sin repo [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) |
| Secretos Telegram | 🔴 Rotar | HAL-008 [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) — expuestos en sesión 2026-07-10 |

---

## Issues abiertos por prioridad — 2026-07-13

### 🔴 BLOQUE 0 — Hacer HOY antes de cualquier otra cosa

| # | Título | Acción concreta |
|---|--------|-----------------|
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 Rotar secretos expuestos | BotFather → revocar TELEGRAM_BOT_TOKEN → nuevo token → `.env` |
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007 Arreglar `.env` malformado | `nano /home/varopc/.env` — línea 7: quitar espacio en clave |

### 🔴 BLOQUE 1 — Después de cerrar #44 y #45

| # | Título | Acción concreta |
|---|--------|-----------------|
| [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | HAL-009 Crash loop log_guardian + tripwire | `docker restart log_guardian_bot local_tripwire` |
| [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) | AUDIT-003 thdora-personal | Auditoría repo + levantar bot con nuevo token |

### 🟡 BLOQUE 2 — Alta prioridad, próximas sesiones

| # | Título |
|---|--------|
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | IaC Madre — versionar 16 docker-compose en madre-config |
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | smartctl HDD — monitorizar mensualmente |
| [#32](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/32) | docker logs watchdog — revisar y restart |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP — confirmar desde red externa |
| [#34](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/34) | Verificar docker-compose raíz `/home/varopc/` |

### 📋 BACKLOG — Ordenado por fases

| # | Fase | Título |
|---|------|--------|
| [#38](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/38) | F5 CI | Ampliar secret-scanning (IPv4 + email) |
| [#39](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/39) | F5 CI | Confirmar gitleaks en push |
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | F2 Audit | AUDIT-002 DEW con Claude/Grok |
| [#37](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/37) | F2 Audit | AUDIT-004 yggdrasil-secops |
| [#40](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/40) | F4 Canon | Completar ownership-matrix |
| [#41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41) | F4 Arq | Diagrama C4 Mermaid |
| [#42](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/42) | F4 MCP | AUDIT-005 — consolidar agentes/ y MCP |
| [#13](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/13) | F3 Repo | Limpieza git — rm basura + estructura definitiva |
| [#18](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/18) | F4 Gov | Gobernanza — auditar reglas, naming, estructura |
| [#19](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/19) | F6 Stack | Stack completo — Wazuh + Suricata + Pihole + SearXNG |
| [#48](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/48) | F2 Vida | AUDIT-006 VIDAPERSONAL — carpetas duplicadas + alineación |

---

## Fases del plan maestro 2026-07

| Fase | Título | Estado |
|------|--------|--------|
| F0 | Seguridad repos privados | ✅ Completada 2026-07-09 |
| **F1** | **ADRs indexados** | **✅ Completada 2026-07-13** |
| F2 | Auditoría islas (secops, thdora, dew, vida) | 🟡 En progreso — #35 #36 #37 #48 |
| F3 | Purga docs WIKI | 🔴 Pendiente |
| F4 | Gobernanza completa (C4, ownership, MCP) | 🔴 Pendiente — #40 #41 #42 |
| F5 | CI secret-scanning completo | 🔴 Pendiente — #38 #39 |
| F6 | Stack completo (Wazuh, Pihole, SearXNG) | 🔴 Pendiente — #19 |

---

## Triángulo maestro

```
         🧠 DEW (cerebro)
        /           \
       ↕             ↕
📖 WIKI ←——————→ 🏠 VIDAPERSONAL
```

✅ **Cerrado 2026-07-12** — los tres repos se enlazan mutuamente.
Regla de oro: [ADR-002](../adr/ADR-002-triangulo-dew-wiki-vida.md)

---

## Ecosistema — repos activos

| Repo | Isla | Estado |
|------|------|--------|
| yggdrasil-dew | 🧠 Cerebro | ✅ Activo |
| yggdrasil-wiki | 📖 Wiki | ✅ Activo |
| VIDAPERSONAL | 🏠 Vida Personal | 🟡 Limpiar |
| madre-config | 🏗️ Infra | 🔴 Vacío — IaC sin versionar |
| THDORA-PERSONAL | 🤖 THDORA | 🔴 Bot caído — `.env` HAL-007 |
| yggdrasil-secops | 🛡️ Seguridad | 🟡 En auditoría — privado |
| ollama-stack | 🧬 IA Local | 🟡 Running, sin auditar |
| dev-labs | 🔬 Labs | 🟡 En construcción |

---

_Actualizado: 2026-07-13 09:16 CEST · Fase 1 completada · Perplexity-MCP_
