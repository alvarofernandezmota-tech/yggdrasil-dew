# AUDITORIA-COMPLETA-YGG.md

> **Fecha:** 2026-07-04 12:38 CEST  
> **Scope:** yggdrasil-dew — capa raíz  
> **Islas:** pendiente (próxima sesión)  
> **Generado por:** Perplexity + inventario real vía GitHub API  
> **Migrado desde:** WIKI---PERSONAL/_archivo/ — 2026-07-06  
> **Lee esto ANTES de tocar nada.**

---

## RESUMEN EJECUTIVO

Copilot ha ejecutado las fases 1→4 sobre `scripts/`. El repo tiene ahora:
- **47 workflows** en `.github/workflows/` — inventario completo abajo
- **Scripts consolidados** (orquestador-unico como canónico)
- **4 .md fuera de sitio** en `scripts/` pendientes de mover (Paso 0)
- **Duplicados de workflows** detectados — misma función, distinto nombre

### Estado por capa

| Capa | Descripción | Estado | Prioridad |
|------|-------------|--------|-----------|
| CAPA 1 | `scripts/` | 🟡 Copilot ejecutando P1→P4 | URGENTE |
| CAPA 2 | `agentes/` | 🔴 Sin auditar | Esta semana |
| CAPA 3 | `mcp/` | 🔴 Sin auditar | Esta semana |
| CAPA 4 | `.github/workflows/` | 🟠 47 detectados, duplicados a resolver | Esta semana |
| CAPA 5 | Raíz + docs + islas | 🔴 Sin auditar | Próxima sesión |

---

## INVENTARIO REAL — `.github/workflows/` (47 archivos)

### Workflows con implementación real (tamaño > 500 bytes)

| Archivo | Tamaño | Estado | Acción |
|---------|--------|--------|---------|
| `galatea.yml` | 5.8 KB | 🟢 Activo complejo | Auditar triggers |
| `repo-health.yml` | 4.4 KB | 🟢 Activo | OK |
| `repo-audit.yml` | 4.6 KB | 🟢 Activo | OK |
| `orquestador-maestro.yml` | 4.2 KB | 🟡 Posible duplicado | Revisar vs orquestador-supremo |
| `gestor-estados-inbox.yml` | 2.9 KB | 🟢 Activo | OK |
| `health-check.yml` | 2.9 KB | 🟡 Duplicado parcial | Revisar vs repo-health |
| `tripwire-repo.yml` | 2.8 KB | 🟢 Activo | OK |
| `inbox-dispatcher.yml` | 3.3 KB | 🟢 Activo | OK |
| `inbox-processor.yml` | 2.4 KB | 🟡 Duplicado parcial | Revisar vs inbox-dispatcher |
| `file-arrival-guardian.yml` | 2.4 KB | 🟢 Canónico | OK |
| `inbox-clasificador.yml` | 2.3 KB | 🟢 Canónico | OK |
| `mapa-islas-sync.yml` | 1.7 KB | 🟢 Activo | OK |
| `e2e-full-flow.yml` | 1.2 KB | 🟢 Activo | OK |
| `inbox-cleanup.yml` | 1.7 KB | 🟢 Activo | OK |
| `inbox-health.yml` | 1.4 KB | 🟡 Duplicado parcial | Revisar vs inbox-cleanup |
| `issue-creator.yml` | 2.0 KB | 🟢 Activo | OK |
| `lint-commits.yml` | 1.3 KB | 🟢 Activo | OK |
| `meta-deep-audit.yml` | 1.8 KB | 🟢 Activo | OK |
| `meta-deep-draft-pr.yml` | 526 B | 🟢 Activo | OK |
| `new-file-bootstrap.yml` | 1.3 KB | 🟢 Activo | OK |
| `orquestador-supremo.yml` | 1.0 KB | 🟡 Duplicado | Revisar vs orquestador-maestro |
| `orquestador-total.yml` | 1.5 KB | 🟡 Duplicado | Archivar o consolidar |
| `reality-check.yml` | 1.3 KB | 🟢 Activo | OK |
| `repo-health-check.yml` | 2.0 KB | 🟡 Duplicado | Revisar vs repo-health |
| `repo-research-on-push.yml` | 1.2 KB | 🟢 Activo | OK |
| `resumen-diario.yml` | 1.5 KB | 🟢 Activo | OK |
| `secret-scan.yml` | 1.6 KB | 🟢 Activo | OK |
| `session-close.yml` | 995 B | 🟢 Canónico | OK |
| `struct-auditor.yml` | 963 B | 🟢 Activo | OK |
| `sync-drive.yml` | 949 B | 🟢 Activo | OK |
| `sync-estado.yml` | 1.8 KB | 🟢 Activo | OK |
| `test-scripts.yml` | 1.9 KB | 🟢 Activo | OK |
| `tool-inventory-auditor.yml` | 1.0 KB | 🟢 Activo | OK |
| `yamllint.yml` | 943 B | 🟢 Activo | OK |
| `watchdog.yml` | 920 B | 🟢 Activo | OK |
| `watchdog-monitor.yml` | 998 B | 🟡 Duplicado | Revisar vs watchdog |
| `ci-agentes.yml` | 599 B | 🟢 Activo | OK |

### Workflows stub (< 200 bytes)

| Archivo | Tamaño | Acción recomendada |
|---------|--------|---------------------|
| `agent-monitor.yml` | 152 B | Implementar o eliminar |
| `audit-on-push.yml` | 152 B | Implementar o eliminar |
| `auditoria-auto.yml` | 193 B | Implementar o eliminar |
| `auto-investigacion.yml` | 157 B | Implementar o eliminar |
| `auto-pr.yml` | 146 B | Implementar o eliminar |
| `autonomous-cron.yml` | 154 B | ⚠️ PELIGRO: cron autónomo vacío |
| `between-sessions.yml` | 155 B | Implementar o eliminar |
| `clasificador-maestro.yml` | 159 B | Duplicado de inbox-clasificador |
| `clasificador.yml` | 151 B | Duplicado de inbox-clasificador |
| `code-drift.yml` | 149 B | Implementar o eliminar |

### Duplicados detectados

| Grupo | Canónico | A revisar/archivar |
|-------|----------|--------------------|
| Orquestadores | `orquestador-maestro.yml` | `orquestador-supremo.yml`, `orquestador-total.yml` |
| Health checks | `repo-health.yml` | `repo-health-check.yml`, `health-check.yml` |
| Inbox | `inbox-dispatcher.yml` | `inbox-processor.yml` |
| Inbox salud | `inbox-cleanup.yml` | `inbox-health.yml` |
| Watchdog | `watchdog.yml` | `watchdog-monitor.yml` |
| Clasificador | `inbox-clasificador.yml` | `clasificador.yml`, `clasificador-maestro.yml` |
| Islas sync | `mapa-islas-sync.yml` | `isla-context-sync.yml` |

---

_Migrado desde WIKI---PERSONAL/_archivo/ el 2026-07-06_
_Original: 2026-07-04 12:38 CEST · Perplexity_
