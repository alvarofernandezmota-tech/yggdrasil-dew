---
tipo: backlog
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-13 10:46 CEST
ruta: MASTER-PENDIENTES.md
tags: [backlog, pendientes, tareas]
status: vigente
---

# 📋 MASTER PENDIENTES

> Backlog priorizado del ecosistema Yggdrasil.
> Fuente de verdad: `PLAN-MAESTRO-2026-07.md` para el plan completo.
> Actualizar al inicio y cierre de cada sesión.

---

## 🔴 URGENTE — REQUIEREN TERMINAL EN MADRE (solo Alvaro)

- [ ] **#45** — Rotar `TELEGRAM_BOT_TOKEN` + `LITELLM_API_KEY` en `.env` (expuestos en chat)
- [ ] **#44** — Validar `.env` con `docker compose config` · fix malformación
- [ ] **#46** — `docker restart log_guardian_bot local_tripwire yggdrasil_watchdog`
- [ ] Recrear `thdora-bot` → `cd /home/varopc/Projects/thdora && docker compose up -d`
- [ ] **#43** — Versionar los 16 docker-compose de Madre en `madre-config` via PR
- [ ] **#15** — Cerrar puerto 21 FTP en router Digi (panel de administración)
- [ ] Verificar Ollama `:11434` no expuesto a internet pública
- [ ] **#31** — `sudo smartctl -a /dev/sda` → revisar horas + sectores reasignados

---

## 🟠 PRÓXIMA SESIÓN — POR MCP (sin terminal)

- [ ] Completar `docs/runbooks/DRP.md` con rutas reales, IPs y nombres de volúmenes Docker
- [ ] Crear `docs/secrets.md` — política de rotación de tokens sin valores reales
- [ ] Añadir ADR-005 y ADR-006 a índice ADR (verificar ubicación real del índice)
- [ ] Unificar índices de islas — sustituir tablas en `README.md` y `HOME.md` del WIKI por puntero a `wiki/islas/INDEX.md` (Fase 2 Plan Maestro)
- [ ] Auditar repo `formacion-tech` — estructura actual vs esperada
- [ ] Completar isla `thea.md` en WIKI — decidir archivar o integrar
- [ ] Completar isla `ollama-stack.md` con IaC detallado

---

## 🟡 GOBERNANZA Y DOCUMENTACIÓN

- [ ] Verificar visibilidad `WIKI---PERSONAL` sigue privado (paso 0 ritual semanal)
- [ ] Ampliar `validate-canon.yml` para detectar IPv4 y emails (Fase 5 Plan Maestro)
- [ ] Consolidar 6 ficheros MCP dispersos en `wiki/islas/mcp.md` (Fase 4)
- [ ] Purga `docs/` WIKI: bajar de 279 a menos de 80 archivos (Fase 3 — sesión larga)
- [ ] Resolver colisión HAL-001 (Telegram en Dew vs FTP en secops)
- [ ] Crear `scripts/env-checker.sh` — valida `.env` contra `.env.template` antes de deploy
- [ ] Crear `.env.template` con variables obligatorias (sin valores)
- [ ] Añadir `healthcheck` + `restart: unless-stopped` a servicios críticos en docker-compose
- [ ] Implementar `btrfs scrub` semanal por cron en Madre (#31)
- [ ] Mover `GRAFO-ECOSISTEMA.md` a raíz Wiki como `index.md` (recomendación Gemini)

---

## 🟢 PRÓXIMAMENTE

- [ ] Evaluar Promtail + Loki para agregación de logs de Docker
- [ ] Evaluar `sops` + age key para cifrado de secretos en reposo
- [ ] Limpiar historial Git con `git filter-repo` si quedan tokens viejos (HAL-001/003)
- [ ] Auditoría AUDIT-002 — yggdrasil-dew (#35)
- [ ] Auditoría AUDIT-003 — thdora-personal (#36)
- [ ] Auditoría AUDIT-004 — yggdrasil-secops (#37)
- [ ] Auditoría AUDIT-005 — agentes/MCP (#42)
- [ ] Auditoría AUDIT-006 — VIDAPERSONAL (#48)
- [ ] Ampliar CI gitleaks: detección de IPs públicas y emails (#38 #39)
- [ ] Fase 2 secops: purga duplicados internos
- [ ] Fase 3 secops: alinear gobernanza con Dew
- [ ] Tier 3: logging estructurado Thdora
- [ ] Tier 5: Ansible en Acer para Madre
- [ ] Instalar Obsidian Git plugin
- [ ] MCP Server de Madre (mcp-terminal o Desktop Commander MCP)
- [ ] THDORA Fase 10 multi-usuario

---

## ✅ COMPLETADO — 2026-07-13 (sesión mañana)

- [x] Tridente DEW + Wiki + VIDAPERSONAL documentado y alineado
- [x] 25 islas Wiki totales con scope, conexiones y status
- [x] GRAFO-ECOSISTEMA.md creado — 19 repos mapeados con dependencias
- [x] C4 arquitectura creado (`ARQUITECTURA-C4.md`)
- [x] ESTADO-SISTEMA.md actualizado
- [x] Issues de auditoría creados en los 6 repos con 0 issues
- [x] Plan Maestro consolidado — sustituye 3 planes anteriores
- [x] `docs/runbooks/DRP.md` creado — esqueleto DRP
- [x] Investigación Gemini documentada en diario + Plan Maestro Fase 7
- [x] MASTER-PENDIENTES.md actualizado con estado real
- [x] Diario 2026-07-13-dew.md cerrado y actualizado

## ✅ COMPLETADO — 2026-07-09

- [x] Token Telegram THDORA rotado — BotFather revoke + nuevo token `.env` + stack recreado
- [x] Symlinks `~/repos/thdora` y `~/repos/yggdrasil-secops` creados
- [x] Archivos basura 0-bytes THDORA limpiados
- [x] Rutas físicas reales verificadas con `docker inspect`
- [x] `ownership-matrix.md` actualizado — rutas reales + columna capa Docker
- [x] `MAPA-REPOS-MADRE.md` WIKI actualizado — sección secops completa
- [x] `docs/auditorias/thdora-personal.md` y `yggdrasil-secops.md` creadas
- [x] `docs/canon/PLANTILLA-REPO-ONBOARDING.md` creada
- [x] Diario 2026-07-09 documentado

## ✅ COMPLETADO — 2026-07-06

- [x] Fases 0–5 Plan de Alineación Dew/WIKI
- [x] Branch protection en Dew + WIKI + secops
- [x] CI validate-canon + gitleaks activos en los 3 repos
- [x] DASHBOARD.md + enlace en README
- [x] ADR-005/006 creados en WIKI
- [x] `docs/adr/` de WIKI purgada

---

_Actualizado: 2026-07-13 10:46 CEST · Perplexity-MCP · Sesión mañana_
