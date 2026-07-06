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
- [x] `yggdrasil-dew` → público (carta de presentación técnica) — **hecho 2026-07-06**
- [x] `VIDAPERSONAL` → privado — **hecho 2026-07-06**
- [x] CI `validate-canon.yml` completo en Dew (IPs, emails, tokens, MACs, rutas, SSH keys) — **hecho 2026-07-06**
- [x] CI `validate-canon.yml` completo en secops — **hecho 2026-07-06**
- [x] CI `validate-canon.yml` completo en WIKI---PERSONAL — **hecho 2026-07-06**
- [x] Gitleaks en Dew, secops y WIKI---PERSONAL — **hecho 2026-07-06**

**Criterio de salida ✅:** los 3 repos activos tienen CI de secretos+IP+email+gitleaks, y los repos con datos personales están en privado.

---

## ✅ Fase 1 — Purga y consolidación de WIKI---PERSONAL — COMPLETADA 2026-07-06

- [x] Borrados stubs vacíos en `docs/` (28 bytes) — **hecho 2026-07-06**
- [x] Borrados duplicados mayúsculas/kebab en `docs/` — **hecho 2026-07-06**
- [x] Archivados temporales fechados en `docs/archivo/` — **hecho 2026-07-06**
- [x] Carpetas técnicas del `inbox/` eliminadas (agentes, ollama, osint, infra, hardware, thdora...) — **hecho 2026-07-06**
- [x] `_archivo/AUDITORIA-COMPLETA-YGG.md` migrado → `dew/docs/auditorias/` — **hecho 2026-07-06**
- [x] `_archivo/` eliminado de WIKI — **hecho 2026-07-06**
- [x] `diarios/` eliminado de WIKI (diario 05 ya estaba en dew) — **hecho 2026-07-06**
- [x] `hardware/` eliminado de WIKI — **hecho 2026-07-06**
- [x] `.obsidian/` ya en `.gitignore`, fuera del tracking — **hecho 2026-07-06**
- [x] `relaciones/` — no existía, no aplica

**Criterio de salida ✅:** raíz de WIKI solo contiene `wiki/`, `docs/`, `inbox/`, `.github/` y archivos de raíz (README, HOME, CHANGELOG, CONTEXT, CONTRIBUTING, AGENT, .gitignore).

---

## ✅ Fase 2 — Resolver duplicados y completar el canon — COMPLETADA 2026-07-06

- [x] Crear `docs/canon/INDICE-ADR.md` en Dew — **hecho 2026-07-06**
- [x] Renombrar ADRs duplicados de WIKI al siguiente número libre — **hecho 2026-07-06** (ADR-003-ssh→ADR-005, ADR-004-privilege→ADR-006)
- [x] Escribir ADR-002 (Seguridad), ADR-003 (IA local/RAG), ADR-004 (Agentes/MCP) — **hecho 2026-07-06**
- [x] Arreglar enlace `HOME.md` → `infra.md` (no `infraestructura.md`) — **hecho 2026-07-06**
- [x] Unificar los tres índices de islas en `wiki/islas/INDEX.md` — **hecho 2026-07-06**
- [x] Crear `INDICE-HALLAZGOS.md` en secops — **hecho 2026-07-06**
- [x] Documentar estado de HAL-001, HAL-003, HAL-006 — **hecho 2026-07-06**
- [x] Service ownership matrix en `docs/canon/` — **hecho 2026-07-06**
- [x] Resolver ambigüedad `thdora` vs `THDORA-PERSONAL` — **hecho 2026-07-06**

**Criterio de salida ✅:** cero ADR o HAL duplicados; un índice de islas; ownership matrix existe.

---

## Fase 3 — Consolidar diarios

- [ ] Fusionar los 11 archivos `2026-07-05-noche-*.md` en uno solo
- [ ] Añadir regla a `NORMAS.md`: un diario = una sesión real
- [ ] Borrar `diarios/` (WIKI) ✅ ya hecho, `inbox/diarios/`, `inbox/diary/`
- [ ] Crear plantilla estándar de diario diario con secciones por isla
- [ ] Crear diario de hoy: `2026-07-06.md` con todo lo hecho en la sesión

**Criterio de salida:** máximo 1-2 archivos de diario por día; plantilla publicada en `docs/canon/`.

---

## Fase 4 — Gobernanza

- [ ] Branch protection en WIKI, Dew y secops
- [ ] Labels y milestones pendientes
- [ ] Transferir issues #32 y #29 de WIKI → Dew
- [ ] Cerrar issue #4 de Dew
- [ ] Actualizar lista de repos en `NORMAS.md`
- [ ] Evaluar Dependabot/Renovate
- [ ] Definir CODEOWNERS activo

**Criterio de salida:** sin casillas ❌ en sección GitHub de `ESTADO-SISTEMA.md`.

---

## Fase 5 — Madurez operativa (no bloqueante)

- [ ] Diagrama C4 en Mermaid en Dew
- [ ] Risk register / STRIDE básico
- [ ] Testing strategy para scripts críticos
- [ ] Runbooks estandarizados
- [ ] Evaluar Ansible para Madre

---

## Fase 6 — Mantenimiento continuo (regla permanente)

- Cada cierre de sesión: actualizar `MASTER-PENDIENTES.md` + `ESTADO-SISTEMA.md`
- Cada PR: CI valida frontmatter + secretos + IPs/emails
- Revisión mensual: borradores >30 días → promocionar o archivar
- Nuevo ADR o HAL: registrar primero en el índice central

---

## Orden de ejecución

1. ✅ ~~Fase 0~~ — completada 2026-07-06
2. ✅ ~~Fase 1~~ — completada 2026-07-06
3. ✅ ~~Fase 2~~ — completada 2026-07-06
4. **Siguiente:** Fase 3 (diarios)
5. **Tareas sueltas:** Fase 4
6. **Cuando 0-4 cerradas:** Fase 5
7. **Para siempre:** Fase 6

---

_Creado: 2026-07-06 · Actualizado: 2026-07-06 19:51 CEST · Fases 0+1+2 ✅_
