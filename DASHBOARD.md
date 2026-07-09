---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-09 15:53 CEST
ruta: DASHBOARD.md
tags: [dashboard, planes, estado, navegacion]
status: vigente
---

# 👁️ Dashboard — Ecosistema Yggdrasil

> Una página. Todo el contexto. Actualizar la columna `Fase actual` al avanzar.
> Última verificación en vivo: 2026-07-09 15:53 CEST (Perplexity MCP)

---

## Planes activos

| Plan | Qué resuelve | Fase actual | Próxima acción |
|---|---|---|---|
| [PLAN-ALINEACION-2026-07.md](./PLAN-ALINEACION-2026-07.md) | Estructura Dew + WIKI | ⚠️ CASI completo — ADR-005/006 sin indexar | Añadir ADR-005/006 a `INDICE-ADR.md` |
| [PLAN-ALINEACION-SECOPS-2026-07.md](./PLAN-ALINEACION-SECOPS-2026-07.md) | Estructura secops + colisión IDs | 🟠 En progreso — rutas y symlinks resueltos | Poner secops en **privado** (clic manual) |
| [PLAN-DEUDA-TECNICA-2026-07.md](./PLAN-DEUDA-TECNICA-2026-07.md) | Token, puertos, logging, tests | 🟠 Tier 1 parcial — token THDORA rotado ✅ | smartctl HDD + watchdog logs |
| [docs/canon/FASE6-MANTENIMIENTO.md](./docs/canon/FASE6-MANTENIMIENTO.md) | Mantenimiento permanente | ♾️ Activo siempre | Ritual cierre de sesión |

---

## Sesión actual 2026-07-09 — completado hoy ✅

- [x] Token Telegram THDORA rotado — BotFather revoke + nuevo token en `.env` + stack recreado
- [x] Symlink `~/repos/thdora` → `/home/varopc/Projects/thdora` creado
- [x] Symlink `~/repos/yggdrasil-secops` → `/home/varopc/yggdrasil-secops` creado
- [x] Archivos basura 0-bytes THDORA limpiados
- [x] Rutas físicas reales de THDORA y secops verificadas con `docker inspect`
- [x] `ownership-matrix.md` actualizado con rutas reales + columna capa Docker
- [x] `MAPA-REPOS-MADRE.md` en WIKI actualizado con sección secops completa
- [x] `docs/auditorias/thdora-personal.md` creada
- [x] `docs/auditorias/yggdrasil-secops.md` creada
- [x] `docs/canon/PLANTILLA-REPO-ONBOARDING.md` creada
- [x] Diario 2026-07-09 documentado con incidentes, pérdida de datos y lecciones

---

## Pendiente — continuar esta sesión

- [ ] **1. `yggdrasil-secops` → privado** — GitHub web → Settings → Danger Zone (clic manual tuyo)
- [ ] **2. `sudo smartctl -a /dev/sda`** en Madre — HAL-005 HDD en riesgo
- [ ] **3. `docker logs --tail 300 yggdrasil_watchdog`** + restart
- [ ] **4. Abrir HAL nuevo** — tercera exposición secretos THDORA
- [ ] **5. Añadir ADR-005/006 a `INDICE-ADR.md`**
- [ ] **6. Verificar `/home/varopc/docker-compose.yml` raíz** — qué servicios define
- [ ] **7. SSH/FTP/Ollama** — Tier 2 deuda técnica

---

## Incidentes activos

| ID | Problema | Estado |
|---|---|---|
| HAL-001/003 | Token Telegram THDORA expuesto | ✅ Rotado 2026-07-09 |
| HAL nuevo | Tercera exposición secretos — `.env` completo en chat | 🔴 Sin abrir aún |
| HAL-001💥 | Colisión: HAL-001 = Telegram en Dew Y FTP en secops | 🔴 Sin resolver |
| — | `yggdrasil-secops` público con IP real router | 🔴 Sin hacer privado |
| — | ADR-005/006 sin indexar en `INDICE-ADR.md` | ⚠️ Pendiente |
| — | `docs/pentesting/` y `docs/seguridad/` perdidos en secops | 🟡 Documentado — irrecuperable |
| — | `docs/hallazgos/SEC-001-ref.md` en secops apunta a ruta inexistente | 🟡 Fase 1 secops |

---

## Sin prisa (próximas sesiones)

- Documentar internamente `thdora-personal` y `yggdrasil-secops` (README/CONTEXT/AGENT/ECOSYSTEM)
- Auditoría Dew + WIKI con Claude — análisis Grok pendiente de revisar
- Fase 2 secops: purga duplicados internos
- Fase 3 secops: alinear gobernanza con Dew
- Tier 3: logging estructurado Thdora
- Tier 4: BATS testing scripts críticos
- Tier 5: Ansible en Acer para Madre
- Workflow sync automático WIKI←Dew
- MCP Server de Madre

---

## Herramientas de verificación

| Herramienta | Cómo ejecutar |
|---|---|
| `check-ecosistema.py` | `python3 check-ecosistema.py` en Madre |
| CI `validate-canon.yml` | Automático en cada push |
| CI `gitleaks.yml` | Automático en cada push |
| `docs/canon/RUNBOOKS.md` | Consultar antes de improvisar |

---

## Regla de oro

> Si no está en este dashboard o en uno de los 3 planes, no existe como tarea.
> Si surge algo nuevo → añadir aquí primero, luego al plan correspondiente.
> No abrir un cuarto plan sin cerrar los que ya existen.

---

_Actualizado: 2026-07-09 15:53 CEST · Perplexity-MCP · sesión 2026-07-09_
