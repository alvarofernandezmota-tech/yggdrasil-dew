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

## Fase 0 — Seguridad (crítico, primeras 24-48h)

- [x] `WIKI---PERSONAL` → privado — **hecho 2026-07-06**
- [x] `yggdrasil-dew` → público (carta de presentación técnica) — **hecho 2026-07-06**
- [x] `VIDAPERSONAL` → privado — **hecho 2026-07-06**
- [ ] Decidir sobre las IPs Tailscale ya commiteadas en `ESTADO-SISTEMA.md`: con el repo en privado el riesgo baja mucho; opcional purgar historial con `git filter-repo` si quieres borrar el rastro por completo
- [ ] Ampliar `.github/workflows/validate-canon.yml` (Dew) para detectar IPv4 y emails, no solo `TOKEN|SECRET|PASSWORD|PRIVATE_KEY|BEGIN RSA`:
  ```python
  if re.search(r'\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b', content):
      errors.append(f'IP ENCONTRADA: {path}')
  if re.search(r'[\w.+-]+@[\w-]+\.[\w.-]+', content):
      errors.append(f'EMAIL ENCONTRADO: {path}')
  ```
- [ ] Replicar `validate-canon.yml` (o equivalente) en `WIKI---PERSONAL` y `yggdrasil-secops` — hoy solo protege Dew
- [ ] Evaluar `gitleaks` como pre-commit hook en los 3 repos activos (sugerencia Perplexity, más robusto que el regex casero)

**Criterio de salida:** los 3 repos activos (WIKI, Dew, secops) tienen CI de secretos+IP+email, y los dos repos con datos personales están en privado.

**Progreso: 3/7 ✅**

---

## Fase 1 — Purga y consolidación de WIKI---PERSONAL

> Nota: como WIKI ya está en privado, esta fase la ejecutas tú directamente en local/GitHub; yo no puedo re-auditar el repo hasta que me des acceso o pegues contenido.

- [ ] Mover contenido vigente de `docs/adr/` (WIKI) → fusionar con `docs/canon/` (Dew), resolviendo numeración en Fase 2
- [ ] Mover contenido vigente de `docs/diarios/`, `docs/seguridad/hallazgos/`, `docs/arquitectura/` (WIKI) → repos canónicos (Dew / secops)
- [ ] `_archivo/` completo → borrar, o mover a repo `yggdrasil-archive` privado si quieres conservar histórico
- [ ] `inbox/` completo → decidir: repo propio (`yggdrasil-inbox`) si el sistema de triage sigue en uso, o procesar pendientes y borrar
- [ ] `hardware/` (raíz de WIKI) → fusionar con `wiki/islas/infra.md` o mover a `madre-config`, no dejar en dos sitios
- [ ] Borrar `.obsidian/` del repo + añadir a `.gitignore`
- [ ] Confirmar `relaciones/` (WIKI) — Perplexity señala que puede estar vacía o incompleta; rellenar o eliminar

**Criterio de salida:** `git ls-files` en WIKI solo devuelve `wiki/`, `.github/`, y los README/HOME/CHANGELOG/CONTEXT/CONTRIBUTING/AGENT de raíz.

---

## Fase 2 — Resolver duplicados y completar el canon

- [ ] Crear `docs/canon/INDICE-ADR.md` en Dew con la lista completa de ADRs y el siguiente número libre
- [ ] Renombrar duplicados detectados en WIKI:
  - `ADR-003-ssh-github-sin-passphrase.md` → próximo número libre
  - `ADR-004-seguridad-privilege-explosion.md` → próximo número libre
- [ ] Completar los ADR que Perplexity marca como faltantes en Dew:
  - ADR-002 — Seguridad (arquitectura de capas de defensa)
  - ADR-003 — IA local / RAG (por qué Ollama + qué modelos)
  - ADR-004 — Agentes / MCP (por qué ese diseño de orquestación)
- [ ] Arreglar enlace en `HOME.md`: apuntar a `infra.md`, no a `infraestructura.md` (stub deprecado)
- [ ] Unificar los tres índices de islas (`README.md`, `HOME.md`, `wiki/islas/INDEX.md`) en uno solo
- [ ] Crear `INDICE-HALLAZGOS.md` en `yggdrasil-secops`
- [ ] Cerrar o documentar el estado real de HAL-001, HAL-003, HAL-006
- [ ] Crear service ownership matrix completa en `docs/canon/`
- [ ] Resolver ambigüedad `thdora` vs `THDORA-PERSONAL`

**Criterio de salida:** cero números de ADR o HAL duplicados; un solo índice de islas; ownership matrix existe.

---

## Fase 3 — Consolidar diarios

- [ ] Fusionar los 11 archivos `2026-07-05-noche-*.md` en el `2026-07-05.md` único
- [ ] Añadir regla explícita a `NORMAS.md`: un diario = una sesión de trabajo real
- [ ] Borrar `diarios/` (raíz de WIKI), `inbox/diarios/`, `inbox/diary/`

**Criterio de salida:** máximo 1-2 archivos de diario por día real de trabajo.

---

## Fase 4 — Gobernanza

- [ ] Branch protection en WIKI, Dew y secops
- [ ] Labels y milestones pendientes
- [ ] Transferir issues #32 y #29 de WIKI → Dew
- [ ] Cerrar issue #4 de Dew
- [ ] Actualizar lista de repos en `NORMAS.md`
- [ ] Evaluar Dependabot/Renovate
- [ ] Definir CODEOWNERS activo

**Criterio de salida:** ninguna casilla ❌ pendiente en la sección "GitHub" de `ESTADO-SISTEMA.md`.

---

## Fase 5 — Madurez operativa (a medio plazo, no bloqueante)

- [ ] Diagrama C4 (Context + Container) en Mermaid, en Dew
- [ ] Risk register / threat model (STRIDE básico)
- [ ] Testing strategy mínima para scripts críticos
- [ ] Runbooks estandarizados por incidente recurrente
- [ ] Evaluar IaC ligero (Ansible) para Madre

**Criterio de salida:** no es bloqueante — abordar solo cuando Fases 0-4 estén al 100%.

---

## Fase 6 — Mantenimiento continuo (regla permanente)

- Cada cierre de sesión: actualizar `MASTER-PENDIENTES.md` + `ESTADO-SISTEMA.md`
- Cada PR a `docs/` o `wiki/`: CI valida frontmatter + secretos + IPs/emails
- Revisión mensual: archivos `status: borrador` con >30 días → promocionar o archivar
- Nuevo ADR o HAL: registrar primero en el índice central

---

## Orden de ejecución recomendado

1. **Hoy:** Fase 0 completa
2. **Próxima sesión larga:** Fase 1
3. **En paralelo, sesiones cortas:** Fase 2 y Fase 3
4. **Tareas sueltas de 5 min:** Fase 4
5. **Cuando 0-4 estén cerradas:** Fase 5
6. **Para siempre:** Fase 6

---

_Creado: 2026-07-06 · Actualizado: 2026-07-06 12:55 CEST · Basado en auditorías de Claude y Perplexity del 2026-07-05_
