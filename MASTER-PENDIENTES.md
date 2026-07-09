---
tipo: backlog
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-09 15:53 CEST
ruta: MASTER-PENDIENTES.md
tags: [backlog, pendientes, tareas]
status: vigente
---

# 📋 MASTER PENDIENTES

> Backlog priorizado del ecosistema Yggdrasil.
> Fuente de verdad: `DASHBOARD.md` para el orden del día.
> Actualizar al inicio y cierre de cada sesión.

---

## 🔴 URGENTE — AHORA

- [ ] **`yggdrasil-secops` → privado** — GitHub web → Settings → Danger Zone (clic manual)
- [ ] **`sudo smartctl -a /dev/sda`** en Madre — HAL-005 HDD en riesgo — plan backup urgente
- [ ] **`docker logs --tail 300 yggdrasil_watchdog`** + `docker restart yggdrasil_watchdog`
- [ ] **Abrir HAL nuevo** — tercera exposición secretos THDORA (`.env` completo en chat)

---

## 🟠 ESTA SESIÓN / ESTA SEMANA

- [ ] Añadir ADR-005 y ADR-006 a `docs/canon/INDICE-ADR.md` en Dew
- [ ] Verificar WIKI `docs/adr/` limpia — si limpio → mover `PLAN-ALINEACION-2026-07.md` a `docs/completados/`
- [ ] Verificar `/home/varopc/docker-compose.yml` raíz en Madre — qué servicios define
- [ ] Resolver colisión HAL-001 (Telegram en Dew vs FTP en secops)
- [ ] Eliminar `docs/hallazgos/SEC-001-ref.md` en secops (apunta a ruta inexistente)
- [ ] Fase 0 secops: ampliar CI a `.env*`/`.yml`/`.sh` + detección IP pública
- [ ] Cerrar SSH puerto 22 público en Madre — Tier 2
- [ ] Cerrar FTP puerto 21 en router Digi — Tier 2
- [ ] Verificar Ollama :11434 no expuesto — Tier 2

---

## 🟡 GOBERNANZA Y DOCUMENTACIÓN

- [ ] Documentar internamente `thdora-personal` — README/CONTEXT/AGENT con referencias al ecosistema
- [ ] Documentar internamente `yggdrasil-secops` — README/CONTEXT/AGENT con referencias al ecosistema
- [ ] Auditoría Dew + WIKI con Claude — revisar análisis Grok 2026-07-07
- [ ] Diseñar workflow sync automático WIKI←Dew
- [ ] Workflow GitHub Actions: cuando cambia `ownership-matrix.md` → notificar en WIKI
- [ ] ⚠️ WIKI descoordinada con Dew — actualizar `CONTEXT.md` y `HOME.md` en WIKI al cierre de cada sesión

---

## 🟢 PRÓXIMAMENTE

- [ ] Fase 2 secops: purga duplicados internos
- [ ] Fase 3 secops: alinear gobernanza con Dew
- [ ] Fase 4 secops: automatización cruzada
- [ ] Tier 3: logging estructurado Thdora
- [ ] Tier 4: BATS testing scripts críticos
- [ ] Tier 5: Ansible en Acer para Madre
- [ ] Rellenar fichas de islas en `WIKI---PERSONAL/wiki/islas/`
- [ ] Instalar Obsidian Git plugin
- [ ] Archivar repos obsoletos: `thea-ia`, `image-calculator`, `impresion-3d`
- [ ] MCP Server de Madre
- [ ] THDORA Fase 10 multi-usuario
- [ ] Fixear `log_guardian_bot` unhealthy en Madre

---

## ✅ COMPLETADO — 2026-07-09

- [x] Token Telegram THDORA rotado — BotFather revoke + nuevo token `.env` + stack recreado
- [x] Symlink `~/repos/thdora` → `/home/varopc/Projects/thdora`
- [x] Symlink `~/repos/yggdrasil-secops` → `/home/varopc/yggdrasil-secops`
- [x] Archivos basura 0-bytes THDORA limpiados
- [x] Rutas físicas reales verificadas con `docker inspect` (THDORA + secops)
- [x] `ownership-matrix.md` actualizado — rutas reales + columna capa Docker
- [x] `MAPA-REPOS-MADRE.md` WIKI actualizado — sección secops completa
- [x] `docs/auditorias/thdora-personal.md` creada
- [x] `docs/auditorias/yggdrasil-secops.md` creada
- [x] `docs/canon/PLANTILLA-REPO-ONBOARDING.md` creada
- [x] Diario 2026-07-09 documentado

## ✅ COMPLETADO — 2026-07-06

- [x] Fases 0–5 Plan de Alineación Dew/WIKI
- [x] Branch protection en Dew + WIKI + secops
- [x] C4 + STRIDE + BATS + Runbooks + Ansible (Fase 5)
- [x] FASE6-MANTENIMIENTO.md + PLANTILLA-HAL.md
- [x] PLAN-ALINEACION-SECOPS-2026-07.md + PLAN-DEUDA-TECNICA-2026-07.md
- [x] DASHBOARD.md + enlace en README
- [x] Conflicto merge resuelto con rebase
- [x] ADR-005/006 creados en WIKI
- [x] `docs/adr/` de WIKI purgada

---

_Actualizado: 2026-07-09 15:53 CEST · Perplexity-MCP_
