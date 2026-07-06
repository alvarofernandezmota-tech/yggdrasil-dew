---
tipo: backlog
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-07 00:53 CEST
ruta: MASTER-PENDIENTES.md
tags: [backlog, pendientes, tareas]
status: vigente
---

# 📋 MASTER PENDIENTES

> Backlog priorizado del ecosistema Yggdrasil.
> Fuente de verdad: `DASHBOARD.md` para el orden del día.
> Actualizar al inicio y cierre de cada sesión.

---

## 🔴 URGENTE — MAÑANA PRIMERO

- [ ] **Tier 1** Rotar token Telegram THDORA (HAL-001 + HAL-003)
  ```bash
  cd ~/repos/THDORA-PERSONAL
  git log --all --full-history -p | grep -n "bot:" | head -50
  # BotFather → Revoke → nuevo token en .env de Madre
  docker compose -f docker-compose.maestro.yml up -d --force-recreate
  ```
- [ ] **`yggdrasil-secops` → privado** — contiene IP router real `79.116.247.44` + IP Tailscale `100.91.112.32` expuestas
- [ ] **HAL-005** `sudo smartctl -a /dev/sdX` en Madre — HDD en riesgo — plan backup urgente
- [ ] **watchdog unhealthy** `docker logs --tail 300 yggdrasil_watchdog` + `docker restart yggdrasil_watchdog`

---

## 🟠 ESTA SEMANA

- [ ] Añadir ADR-005 y ADR-006 a `docs/canon/INDICE-ADR.md` en Dew
  ```bash
  # Verificar primero:
  grep -E 'ADR-00[5-6]' docs/canon/INDICE-ADR.md
  # Si no aparece → añadir las filas manualmente o via Perplexity MCP
  ```
- [ ] Verificar WIKI `docs/adr/` limpia:
  ```bash
  ls ~/WIKI---PERSONAL/docs/adr/ 2>/dev/null || echo limpio
  ```
  Si limpio → mover `PLAN-ALINEACION-2026-07.md` a `docs/completados/` y cerrar ese plan
- [ ] Resolver colisión HAL-001 (Telegram en Dew vs FTP en secops) — Fase 1 secops
- [ ] Eliminar `docs/hallazgos/SEC-001-ref.md` en secops (apunta a ruta inexistente)
- [ ] Fase 0 secops: ampliar CI a `.env*`/`.yml`/`.sh` + detección IP pública
- [ ] Cerrar SSH puerto 22 público en Madre — Tier 2
- [ ] Cerrar FTP puerto 21 en router Digi `http://192.168.1.1` — Tier 2
- [ ] Verificar Ollama :11434: `nmap -p 11434 <IP-publica>` — Tier 2

---

## 🟡 PENDIENTE DE DECISIÓN — Análisis Grok 2026-07-07

> Análisis realizado con raw de WIKI---PERSONAL + yggdrasil-dew.
> Revisar con Claude mañana tras ejecutar lo indispensable del DASHBOARD.
> Decidir qué entra en el plan y qué se archiva.

### Hallazgos principales

- `docs/` de WIKI---PERSONAL es un **vertedero temporal** de la migración hacia Dew
- ~15-20 documentos solapan temas centrales (arquitectura, normas, estado, flujos)
- Los 4 archivos `COPILOT-*` son los más urgentes de archivar — confunden a cualquier IA
- `NORMAS-ECOSISTEMA.md` + `CONVENCIONES.md` en docs/ duplican versiones canónicas

### Candidatos a migrar/archivar (decidir con Claude)

| Archivo en WIKI/docs/ | Acción propuesta | Razón |
|---|---|---|
| `NORMAS-ECOSISTEMA.md` | Mover a Dew o eliminar | Duplica `NORMAS.md` |
| `CONVENCIONES.md` (docs/) | Consolidar | Existe versión raíz y en Dew |
| `CORE-ECOSISTEMA.md` | Mover a Dew canon/ | Contenido estructural central |
| `PLAN-MAESTRO-ECOSISTEMA.md` | Mover | Duplica planes de Dew |
| `VISION-COMPLETA-ECOSISTEMA.md` | Migrar o stub | Mejor en Dew architecture |
| `ROADMAP.md`, `SPRINTS.md` | Mover | Duplican `ROADMAP-MASTER.md` |
| `COPILOT-BRIEFING-COMPLETO.md` | Archivar | Muy volátil y operativo |
| `COPILOT-MASTER-TASKLIST.md` | Archivar | Posible duplicado de TASKS |
| `COPILOT-MASTER-TASKS.md` | Archivar | Posible duplicado de TASKLIST |
| `COPILOT-CONTEXT.md` | Archivar o mover a Dew | Muy operativo |
| `OPERATIONAL-PLAYBOOK.md` | Mover a Dew | Operativa → Dew |
| `flujo-sesiones.md` | Mover a Dew | Operativa → Dew |
| `protocolo-sesiones.md` | Mover a Dew | Operativa → Dew |

### Mantener en WIKI

- `hardware.md`, `filosofia.md` — contenido puramente conceptual
- `AGENT.md`, `CONTEXT.md` — contexto para agentes IA
- Fichas de islas y relaciones

### Acción pendiente

- [ ] Revisar análisis Grok con Claude mañana (tras DASHBOARD)
- [ ] Decidir si se genera script de migración (`git mv` + commits)
- [ ] Consolidar documentos de estado en DASHBOARD como única fuente viva

---

## 🟢 PRÓXIMAMENTE

- [ ] Fase 2 secops: purga duplicados internos
- [ ] Fase 3 secops: alinear gobernanza con Dew
- [ ] Tier 3 deuda técnica: logging estructurado en Thdora
- [ ] Tier 4: BATS testing — refactorizar `inbox-commit.sh` y `session-logger.sh`
- [ ] Tier 5: Ansible en Acer para Madre
- [ ] Fixear `log_guardian_bot` unhealthy en Madre
- [ ] Rellenar fichas de islas en `WIKI---PERSONAL/wiki/islas/`
- [ ] Instalar Obsidian Git plugin
- [ ] Archivar repos obsoletos: `thea-ia`, `image-calculator`, `impresion-3d`
- [ ] MCP Server de Madre
- [ ] THDORA Fase 10 multi-usuario

---

## ✅ COMPLETADO HOY — 2026-07-06

- [x] Fases 0–5 Plan de Alineación Dew/WIKI
- [x] Branch protection en Dew + WIKI + secops
- [x] C4 + STRIDE + BATS + Runbooks + Ansible (Fase 5)
- [x] FASE6-MANTENIMIENTO.md + PLANTILLA-HAL.md
- [x] PLAN-ALINEACION-SECOPS-2026-07.md + PLAN-DEUDA-TECNICA-2026-07.md
- [x] DASHBOARD.md + enlace en README
- [x] Conflicto merge `docs/diario-2026-07-06.md` — resuelto con rebase
- [x] ADR-005/006 creados en WIKI (ssh-github-sin-passphrase, seguridad-privilege-explosion)
- [x] `docs/adr/` de WIKI purgada — colisión ADR-003/004 resuelta renombrando

---

_Actualizado: 2026-07-07 00:53 CEST · Análisis Grok integrado · Perplexity-MCP_
