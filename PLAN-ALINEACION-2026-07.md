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
> Este documento NO repite el análisis — solo define qué hacer, en qué orden y con qué criterio de "hecho".
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

## Fase 1 — Purga y consolidación de WIKI---PERSONAL

> WIKI ya está en privado. Esta fase se ejecuta en local.

- [ ] Mover contenido vigente de `docs/adr/` (WIKI) → fusionar con `docs/canon/` (Dew)
- [ ] Mover `docs/diarios/`, `docs/seguridad/hallazgos/`, `docs/arquitectura/` (WIKI) → Dew / secops
- [ ] `_archivo/` → borrar o mover a `yggdrasil-archive` privado
- [ ] `inbox/` → procesar pendientes y borrar, o repo propio `yggdrasil-inbox`
- [ ] `hardware/` → fusionar con `wiki/islas/infra.md` o mover a `madre-config`
- [ ] Borrar `.obsidian/` del repo + añadir a `.gitignore`
- [ ] Confirmar `relaciones/` — rellenar o eliminar

**Criterio de salida:** `git ls-files` en WIKI solo devuelve `wiki/`, `.github/`, y los README/HOME/CHANGELOG/CONTEXT/CONTRIBUTING/AGENT de raíz.

---

## Fase 2 — Resolver duplicados y completar el canon

- [ ] Crear `docs/canon/INDICE-ADR.md` en Dew
- [ ] Renombrar ADRs duplicados de WIKI al siguiente número libre
- [ ] Escribir ADR-002 (Seguridad), ADR-003 (IA local/RAG), ADR-004 (Agentes/MCP)
- [ ] Arreglar enlace `HOME.md` → `infra.md` (no `infraestructura.md`)
- [ ] Unificar los tres índices de islas en `wiki/islas/INDEX.md`
- [ ] Crear `INDICE-HALLAZGOS.md` en secops
- [ ] Documentar estado de HAL-001, HAL-003, HAL-006
- [ ] Service ownership matrix en `docs/canon/`
- [ ] Resolver ambigüedad `thdora` vs `THDORA-PERSONAL`

**Criterio de salida:** cero ADR o HAL duplicados; un índice de islas; ownership matrix existe.

---

## Fase 3 — Consolidar diarios

- [ ] Fusionar los 11 archivos `2026-07-05-noche-*.md` en uno solo
- [ ] Añadir regla a `NORMAS.md`: un diario = una sesión real
- [ ] Borrar `diarios/` (WIKI), `inbox/diarios/`, `inbox/diary/`

**Criterio de salida:** máximo 1-2 archivos de diario por día.

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
2. **Siguiente sesión larga:** Fase 1 (purga de WIKI)
3. **Sesiones cortas en paralelo:** Fase 2 y Fase 3
4. **Tareas sueltas:** Fase 4
5. **Cuando 0-4 cerradas:** Fase 5
6. **Para siempre:** Fase 6

---

_Creado: 2026-07-06 · Actualizado: 2026-07-06 13:10 CEST · Fase 0 ✅_
