---
tipo: backlog
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-06 21:48 CEST
ruta: MASTER-PENDIENTES.md
tags: [backlog, pendientes, tareas]
status: vigente
---

# 📋 MASTER PENDIENTES

> Backlog priorizado del ecosistema Yggdrasil.
> Actualizar al inicio y cierre de cada sesión.
> Fuente de verdad: `PLAN-DEUDA-TECNICA-2026-07.md` para seguridad, `PLAN-ALINEACION-SECOPS-2026-07.md` para secops.

---

## 🔴 URGENTE — MAÑANA PRIMERO

- [ ] **Tier 1** Rotar token Telegram THDORA (HAL-001 + HAL-003) — ver `PLAN-DEUDA-TECNICA-2026-07.md`
  ```bash
  cd ~/repos/THDORA-PERSONAL
  git log --all --full-history -p | grep -n "bot:" | head -50
  # Luego BotFather → Revoke → nuevo token en .env de Madre
  ```
- [ ] **secops → privado** — GitHub Settings → yggdrasil-secops → Danger Zone → Private
- [ ] **Tier 2** Cerrar SSH puerto 22 público en Madre (Tailscale ya funciona) — ver `PLAN-DEUDA-TECNICA-2026-07.md`
- [ ] **Tier 2** Puerto 21 FTP — cerrar en router Digi `http://192.168.1.1` (HAL-006)
- [ ] **Tier 2** Verificar Ollama :11434 no expuesto: `nmap -p 11434 <IP-publica>` desde datos móviles

---

## 🟡 ESTA SEMANA

- [ ] Fase 0 secops: CI ampliar a `.env*`, `.yml`, `.sh` + detección IP pública — ver `PLAN-ALINEACION-SECOPS-2026-07.md`
- [ ] Fase 1 secops: resolver colisión ID HAL (FTP es HAL-001 en secops pero HAL-006 en Dew) — ver plan secops
- [ ] Revisar historial commits `.env.template` de todos los bots de secops
- [ ] Marcar HAL-001 y HAL-003 como RESUELTO tras rotar token — `INDICE-HALLAZGOS.md`
- [ ] Crear perfil profesional README en `alvarofernandezmota-tech`

---

## 🟢 PRÓXIMAMENTE

- [ ] Fase 2 secops: purga de duplicados internos (6 archivos del 2026-07-01, arquitectura fragmentada…)
- [ ] Fase 3 secops: alinear con gobernanza de Dew
- [ ] Tier 3 deuda técnica: logging estructurado en Thdora
- [ ] Tier 4 deuda técnica: BATS testing — refactorizar `inbox-commit.sh` y `session-logger.sh`
- [ ] Tier 5 deuda técnica: Ansible en Acer para Madre
- [ ] Fixear `log_guardian_bot` y `yggdrasil_watchdog` unhealthy en Madre
- [ ] Rellenar fichas de islas en `WIKI---PERSONAL/wiki/islas/`
- [ ] Instalar Obsidian Git plugin + configurar con parámetros de CONVENCIONES.md §5.5
- [ ] Archivar repos obsoletos: `thea-ia`, `image-calculator`, `impresion-3d`
- [ ] MCP Server de Madre (`mcp_server.py` + tools MVP)
- [ ] Observabilidad OTel (Collector + Loki + Alertmanager)
- [ ] THDORA Fase 10 multi-usuario (bloqueador F10)
- [ ] Estructurar `acer-config`, `ollama-stack`, `local-brain`, `investigacion-ia`

---

## ✅ COMPLETADO HOY — 2026-07-06

- [x] Fase 0 Plan de Alineación: CI secretos+gitleaks, visibilidad repos — 20:00 CEST
- [x] Fase 1 Plan de Alineación: purga WIKI---PERSONAL completa — 20:00 CEST
- [x] Fase 2 Plan de Alineación: ADRs, ownership matrix, INDICE-HALLAZGOS — 20:00 CEST
- [x] Fase 3 Plan de Alineación: diarios fusionados, plantilla creada — 20:00 CEST
- [x] Fase 4 Plan de Alineación: gobernanza completa (CODEOWNERS, Dependabot, templates) — 20:00 CEST
- [x] Branch protection `main` en Dew + WIKI + secops — 20:49 CEST — Blink/iPhone/Madre
- [x] Fase 5 Plan de Alineación: C4 + STRIDE + BATS + Runbooks + Ansible — 20:55 CEST
- [x] FASE6-MANTENIMIENTO.md: rituales de cierre + cron + bot — 21:45 CEST
- [x] PLANTILLA-HAL.md: proceso de apertura de hallazgos — 21:45 CEST
- [x] PLAN-ALINEACION-SECOPS-2026-07.md: plan completo secops (Claude) — 21:45 CEST
- [x] PLAN-DEUDA-TECNICA-2026-07.md: remediación sistema real (Claude) — 21:48 CEST
- [x] Issue #25 cerrado (branch protection) — 20:49 CEST

---

_Actualizado: 2026-07-06 21:48 CEST · Perplexity-MCP · Cierre de sesión_
