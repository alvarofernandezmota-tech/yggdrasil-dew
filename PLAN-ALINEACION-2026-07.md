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
- [ ] `VIDAPERSONAL` → privado
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

**Progreso: 2/7 ✅**

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
- [ ] Unificar los tres índices de islas (`README.md`, `HOME.md`, `wiki/islas/INDEX.md`) en uno solo — recomendado: `wiki/islas/INDEX.md` como fuente única, los otros dos enlazan a él
- [ ] Crear `INDICE-HALLAZGOS.md` (en `yggdrasil-secops`, donde nace HAL-001) que liste todos los HAL de todos los repos para evitar colisión de numeración
- [ ] Cerrar o documentar el estado real de HAL-001, HAL-003, HAL-006 (mencionados por Perplexity, no verificados por mí — confirmar que existen y su estado)
- [ ] Crear service ownership matrix completa en `docs/canon/` (dueño, SLA, criticidad, estrategia de backup por servicio) — Perplexity la marca como ausente
- [ ] Resolver ambigüedad `thdora` vs `THDORA-PERSONAL`: mismo repo renombrado o dos repos distintos — decidir y unificar en ambos README

**Criterio de salida:** cero números de ADR o HAL duplicados; un solo índice de islas; ownership matrix existe.

---

## Fase 3 — Consolidar diarios

- [ ] Fusionar los 11 archivos `2026-07-05-noche-*.md` en el `2026-07-05.md` único (332 líneas), o mantener los `noche-N` como subsecciones con timestamp dentro de un solo archivo
- [ ] Añadir regla explícita a `NORMAS.md`: un diario = una sesión de trabajo real (mínimo 30 min o cierre explícito), no un diario por turno de conversación
- [ ] Borrar `diarios/` (raíz de WIKI), `inbox/diarios/`, `inbox/diary/` — un único lugar canónico: `yggdrasil-dew/docs/diarios/`

**Criterio de salida:** máximo 1-2 archivos de diario por día real de trabajo.

---

## Fase 4 — Gobernanza

- [ ] Branch protection en WIKI, Dew y secops (marcado ❌ en `ESTADO-SISTEMA.md`)
- [ ] Labels y milestones pendientes (❌ en `ESTADO-SISTEMA.md`)
- [ ] Transferir issues #32 y #29 de WIKI → Dew
- [ ] Cerrar issue #4 de Dew (diary/ vs diarios/, ya resuelto en la práctica)
- [ ] Actualizar la lista de repos en `NORMAS.md` con los ~13 repos reales del ecosistema (hoy Dew README lista 5, WIKI HOME lista 11 — ninguno es la lista completa)
- [ ] Evaluar Dependabot/Renovate para los repos con dependencias (thdora, ollama-stack) — sugerencia Perplexity
- [ ] Definir CODEOWNERS activo (existe el archivo en WIKI pero sin evidencia de que fuerce revisión)

**Criterio de salida:** ninguna casilla ❌ pendiente en la sección "GitHub" de `ESTADO-SISTEMA.md`.

---

## Fase 5 — Madurez operativa (a medio plazo, no bloqueante)

> Estas son las recomendaciones de Perplexity que van más allá de "arreglar lo roto" — son para cuando las Fases 0-4 estén cerradas.

- [ ] Diagrama C4 (Context + Container) en Mermaid, en Dew
- [ ] Risk register / threat model (STRIDE básico) para Madre y Acer
- [ ] Testing strategy mínima para scripts críticos (health_agent, tailscale_monitor)
- [ ] Runbooks estandarizados por incidente recurrente (crashloop, SSH lockout, etc.)
- [ ] Evaluar IaC ligero (Ansible) para Madre si el número de servicios sigue creciendo

**Criterio de salida:** no es bloqueante — abordar solo cuando Fases 0-4 estén al 100%.

---

## Fase 6 — Mantenimiento continuo (regla permanente, no checklist)

- Cada cierre de sesión: actualizar `MASTER-PENDIENTES.md` + `ESTADO-SISTEMA.md`
- Cada PR a `docs/` o `wiki/`: CI valida frontmatter + secretos + IPs/emails
- Revisión mensual: archivos `status: borrador` con >30 días sin `actualizado` → promocionar o archivar
- Cualquier nuevo ADR o HAL se registra primero en el índice central antes de crear el archivo (evita la duplicación de numeración que causó esto)

---

## Orden de ejecución recomendado

1. **Hoy:** Fase 0 completa (15-20 min, ya vas por la mitad)
2. **Próxima sesión larga:** Fase 1 (es la que más tiempo lleva — purga de WIKI)
3. **En paralelo, sesiones cortas:** Fase 2 y Fase 3
4. **Tareas sueltas de 5 min:** Fase 4
5. **Cuando 0-4 estén cerradas:** Fase 5
6. **Para siempre:** Fase 6

---

_Creado: 2026-07-06 · Actualizado: 2026-07-06 12:50 CEST · Basado en auditorías de Claude y Perplexity del 2026-07-05_
