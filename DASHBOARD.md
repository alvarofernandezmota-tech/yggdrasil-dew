---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: DASHBOARD.md
tags: [dashboard, planes, estado, navegacion]
status: vigente
---

# 👁️ Dashboard — Ecosistema Yggdrasil

> Una página. Todo el contexto. Actualizar la columna `Fase actual` al avanzar.
> Última verificación en vivo: 2026-07-06 noche (Claude + Perplexity MCP)

---

## Planes activos

| Plan | Qué resuelve | Fase actual | Próxima acción |
|---|---|---|---|
| [PLAN-ALINEACION-2026-07.md](./PLAN-ALINEACION-2026-07.md) | Estructura Dew + WIKI | ⚠️ **CASI completo** — ADR-005/006 sin indexar | Añadir ADR-005/006 a `INDICE-ADR.md` |
| [PLAN-ALINEACION-SECOPS-2026-07.md](./PLAN-ALINEACION-SECOPS-2026-07.md) | Estructura secops + colisión IDs | 🔴 Fase 0 pendiente | Poner secops en **privado** |
| [PLAN-DEUDA-TECNICA-2026-07.md](./PLAN-DEUDA-TECNICA-2026-07.md) | Token, puertos, logging, tests | 🔴 Tier 1+2 urgentes | Rotar **token Telegram** |
| [docs/canon/FASE6-MANTENIMIENTO.md](./docs/canon/FASE6-MANTENIMIENTO.md) | Mantenimiento permanente | ♾️ Activo siempre | Ritual cierre de sesión |

---

## Mañana — en este orden

- [ ] **1. Rotar token Telegram THDORA** — BotFather → Revoke → nuevo token en `.env` de Madre — [Tier 1](./PLAN-DEUDA-TECNICA-2026-07.md)
- [ ] **2. `yggdrasil-secops` → privado** — GitHub Settings → Danger Zone — contiene IPs reales expuestas
- [ ] **3. `smartctl -a /dev/sdX`** en Madre — HAL-005 HDD en riesgo
- [ ] **4. `docker logs yggdrasil_watchdog`** + restart — unhealthy 4 días
- [ ] **5. Añadir ADR-005/006 a `INDICE-ADR.md`** — confirmar con: `grep -E 'ADR-00[5-6]' docs/canon/INDICE-ADR.md`
- [ ] **6. Verificar WIKI `docs/adr/`** — `ls ~/WIKI---PERSONAL/docs/adr/ 2>/dev/null || echo limpio`
  - Si limpio → mover `PLAN-ALINEACION-2026-07.md` a `docs/completados/`
- [ ] **7. SSH/FTP/Ollama** — [Tier 2](./PLAN-DEUDA-TECNICA-2026-07.md)

---

## Pendientes confirmados en vivo esta noche (Claude)

| ID | Problema | Estado verificado |
|---|---|---|
| HAL-001 | Token Telegram THDORA en historial git | 🔴 Sin rotar — mañana Tier 1 |
| HAL-001💥 | Colisión: HAL-001 = Telegram en Dew Y FTP en secops | 🔴 Sin resolver — Fase 1 secops |
| — | `yggdrasil-secops` público con IP real router `79.116.247.44` | 🔴 Sin hacer privado |
| — | ADR-005/006 creados en WIKI pero no en `INDICE-ADR.md` de Dew | ⚠️ Mañana paso 5 |
| — | `docs/hallazgos/SEC-001-ref.md` en secops apunta a ruta inexistente | 🟡 Fase 1 secops |
| — | Conflicto merge `docs/diario-2026-07-06.md` | ✅ Resuelto — rebase OK + push |

---

## Sin prisa (próximas sesiones largas)

- Fase 2 secops: purga duplicados internos
- Fase 3 secops: alinear gobernanza con Dew
- Fase 4 secops: automatización cruzada
- Tier 3: logging estructurado Thdora
- Tier 4: BATS testing scripts críticos
- Tier 5: Ansible en Acer para Madre

---

## Herramientas de verificación

| Herramienta | Qué hace | Cómo ejecutar |
|---|---|---|
| `check-ecosistema.py` | Detecta colisiones de IDs HAL/ADR entre repos | `python3 check-ecosistema.py` en Madre |
| CI `validate-canon.yml` | Secretos, IPs, emails, frontmatter | Automático en cada push |
| CI `gitleaks.yml` | Secretos en historial | Automático en cada push |
| `docs/canon/RUNBOOKS.md` | Procedimientos ante incidencias conocidas | Consultar antes de improvisar |

---

## Regla de oro

> Si no está en este dashboard o en uno de los 3 planes, no existe como tarea.
> Si surge algo nuevo → añadir aquí primero, luego al plan correspondiente.
> No abrir un cuarto plan sin cerrar los que ya existen.

---

_Actualizado: 2026-07-06 22:52 CEST · Verificación en vivo Claude + Perplexity-MCP_
