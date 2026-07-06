---
title: Plan de Alineación del Ecosistema
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: PLAN-ALINEACION-2026-07.md
tags: [plan, alineacion, deuda-tecnica, seguridad, gobernanza]
status: vigente
fuentes:
  - docs/auditorias/analisis-claude-2026-07-05.md
  - docs/auditorias/analisis-perplexity-2026-07-05.md
---

# 🧭 Plan de Alineación — Ecosistema Yggdrasil

> Plan ejecutable derivado de las dos auditorías en `docs/auditorias/`.
> Este documento NO repite el análisis — solo define qué hacer, en qué orden y con qué criterio de “hecho”.
> Actualizar el checkbox y la fecha al completar cada punto.

---

## ✅ Fase 0 — Seguridad — COMPLETADA 2026-07-06

- [x] `WIKI---PERSONAL` → privado — **hecho 2026-07-06**
- [x] `yggdrasil-dew` → público — **hecho 2026-07-06**
- [x] `VIDAPERSONAL` → privado — **hecho 2026-07-06**
- [x] CI `validate-canon.yml` en Dew, secops y WIKI — **hecho 2026-07-06**
- [x] Gitleaks en Dew, secops y WIKI — **hecho 2026-07-06**

**Criterio de salida ✅:** los 3 repos activos tienen CI de secretos+IP+email+gitleaks.

---

## ✅ Fase 1 — Purga y consolidación de WIKI---PERSONAL — COMPLETADA 2026-07-06

- [x] Stubs vacíos, duplicados, temporales eliminados — **hecho 2026-07-06**
- [x] `_archivo/`, `diarios/`, `hardware/` eliminados de WIKI — **hecho 2026-07-06**
- [x] `.obsidian/` en `.gitignore` — **hecho 2026-07-06**

**Criterio de salida ✅:** raíz de WIKI solo contiene `wiki/`, `docs/`, `inbox/`, `.github/`.

---

## ✅ Fase 2 — Resolver duplicados y completar el canon — COMPLETADA 2026-07-06

- [x] `INDICE-ADR.md`, ADR-002/003/004, ownership matrix — **hecho 2026-07-06**
- [x] Colisiones ADR-003/004 en WIKI renumerados a ADR-005/006 — **hecho 2026-07-06**
- [x] `INDICE-HALLAZGOS.md` + HAL-001/003/006 documentados — **hecho 2026-07-06**
- [x] HOME.md, islas INDEX, thdora ambigüedad resuelta — **hecho 2026-07-06**

**Criterio de salida ✅:** cero ADR o HAL duplicados; ownership matrix existe.

---

## ✅ Fase 3 — Consolidar diarios — COMPLETADA 2026-07-06

- [x] 11 fragmentos `noche-*.md` fusionados en `2026-07-05.md` — **hecho 2026-07-06**
- [x] Regla un diario = un día en NORMAS.md — **hecho 2026-07-06**
- [x] `PLANTILLA-DIARIO.md` en `docs/canon/` — **hecho 2026-07-06**

**Criterio de salida ✅:** máximo 1 archivo de diario por día; plantilla en canon.

---

## ✅ Fase 4 — Gobernanza — COMPLETADA 2026-07-06 20:49 CEST

- [x] Branch protection `main` en Dew, WIKI, secops — **hecho 2026-07-06 20:49 CEST — Blink/iPhone — gh v2.92.0**
- [x] Issue templates (ADR, hallazgo, tarea) + PR template — **hecho 2026-07-06**
- [x] NORMAS.md con 14 repos documentados — **hecho 2026-07-06**
- [x] Dependabot activo — **hecho 2026-07-06**
- [x] CODEOWNERS con 5 rutas críticas — **hecho 2026-07-06**
- [x] Issues transferidos y cerrados — **hecho 2026-07-05/06**

**Criterio de salida ✅:** branch protection activo en 3 repos. Sin casillas pendientes.

---

## ✅ Fase 5 — Madurez operativa — COMPLETADA 2026-07-06 20:55 CEST

- [x] Diagrama C4 (Context + Container) en Mermaid — **hecho 2026-07-06** — `docs/arquitectura/C4-ecosistema.md`
- [x] Risk register / STRIDE básico — **hecho 2026-07-06** — `docs/seguridad/STRIDE-risk-register.md` — 14 amenazas
- [x] Testing strategy para scripts críticos — **hecho 2026-07-06** — `docs/canon/TESTING-STRATEGY.md` — BATS
- [x] Runbooks estandarizados — **hecho 2026-07-06** — `docs/canon/RUNBOOKS.md` — 6 runbooks (RB-001 a RB-006)
- [x] Evaluar Ansible para Madre — **hecho 2026-07-06** — `docs/infra/ansible/ANSIBLE-EVALUACION.md` — RECOMENDADO

**Criterio de salida ✅:** 5 documentos de madurez operativa creados y en canon.

---

## Fase 6 — Mantenimiento continuo (regla permanente)

- Cada cierre de sesión: actualizar `MASTER-PENDIENTES.md` + `ESTADO-SISTEMA.md`
- Cada PR: CI valida frontmatter + secretos + IPs/emails
- Revisión mensual: borradores >30 días → promocionar o archivar
- Nuevo ADR o HAL: registrar primero en el índice central
- STRIDE: revisar trimestralmente o tras incidente

---

## Orden de ejecución

1. ✅ ~~Fase 0~~ — completada 2026-07-06
2. ✅ ~~Fase 1~~ — completada 2026-07-06
3. ✅ ~~Fase 2~~ — completada 2026-07-06
4. ✅ ~~Fase 3~~ — completada 2026-07-06
5. ✅ ~~Fase 4~~ — completada 2026-07-06 20:49 CEST
6. ✅ ~~Fase 5~~ — completada 2026-07-06 20:55 CEST
7. **♾️ Fase 6 — mantenimiento permanente**

---

_Creado: 2026-07-06 · Actualizado: 2026-07-06 20:55 CEST · ✅ Fases 0+1+2+3+4+5 COMPLETADAS_
