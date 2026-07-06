---
title: Plan de Alineación — yggdrasil-secops
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: PLAN-ALINEACION-SECOPS-2026-07.md
tags: [plan, alineacion, secops, seguridad, deuda-tecnica]
status: vigente
fuentes:
  - PLAN-ALINEACION-2026-07.md (yggdrasil-dew)
  - Auditoría en vivo del contenido real de yggdrasil-secops, 2026-07-06
---

# 🛡️ Plan de Alineación — yggdrasil-secops

> Mismo criterio que el plan de WIKI/Dew: checklist ejecutable, no repite análisis.
> Este repo tiene un problema añadido que WIKI no tenía: el propio `NORMAS.md` (Dew) lo declara “Privado” y ahora mismo es público — es la Fase 0 más urgente.

---

## Fase 0 — Seguridad (hoy, antes de cualquier otra cosa)

- [ ] `yggdrasil-secops` → privado (Settings → Danger Zone) — **requiere terminal Madre (admin)**
- [ ] Confirmar que el CI de `sensitive-content` también escanea `.env*`, `.yml`, `.sh` (ahora solo `*.md`)
- [ ] Añadir detección de IP pública genérica al CI:
  ```python
  (r'\b(?!10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.|100\.(6[4-9]|[7-9][0-9]|1[01][0-9]|12[0-7])\.)\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b', 'IP PÚblica')
  ```
- [ ] Revisar historial de commits de `.env.template` por si alguna vez tuvo valores reales

**Criterio de salida:** repo en privado + CI cubre `.env*`/`.yml`/`.sh` + detecta IP pública.

---

## Fase 1 — Resolver la colisión de IDs con Dew

- [ ] Decidir esquema de numeración compartido:
  - **Opción A (recomendada):** un único espacio HAL para todo el ecosistema, gestionado desde `INDICE-HALLAZGOS.md` en Dew
  - **Opción B:** prefijo por repo (`SEC-HAL-001`, `DEW-HAL-001`)
- [ ] Renombrar hallazgo FTP (actualmente `HAL-001` en secops) con el ID correcto según el esquema elegido
- [ ] Eliminar `docs/hallazgos/SEC-001-ref.md` — duplicado con ruta que ya no existe
- [ ] Actualizar `INDICE-HALLAZGOS.md` (Dew) para incluir hallazgos de secops

**Criterio de salida:** un hallazgo, un ID, un archivo. Cero referencias a rutas inexistentes.

---

## Fase 2 — Purga de duplicados internos

- [ ] Consolidar 5 archivos de arquitectura en `docs/arquitectura/` con `INDEX.md`
- [ ] Dejar un solo roadmap (eliminar duplicado `ROADMAP-COMPLETO.md` vs `docs/ROADMAP.md`)
- [ ] Fusionar 6 archivos del 2026-07-01 en un solo `diarios/2026-07-01.md`
- [ ] Documentación de bots: README del bot es fuente única, `docs/bots/*.md` pasa a índice de enlaces
- [ ] Mover prompts crudos de IA a `_prompts/` — no son canon
- [ ] Consolidar logs de guardian_bot en un solo lugar

**Criterio de salida:** un concepto, un archivo.

---

## Fase 3 — Alinear con gobernanza de Dew

- [ ] Crear `NORMAS.md`-puntero en secops (5-10 líneas, enlaza a Dew)
- [ ] Añadir frontmatter a `PRIORIDADES.md`, `ESTADO-BOTS.md`, `README.md`
- [ ] Confirmar que `.github/ISSUE_TEMPLATE/hal.yml` genera issues con ID correcto post-Fase 1
- [ ] Enlazar `yggdrasil-secops` desde `wiki/islas/seguridad.md` (WIKI) si no está

**Criterio de salida:** secops sigue el mismo patrón de gobernanza que Dew.

---

## Fase 4 — Automatización de mantenimiento cruzado

- [ ] Crear `cross-repo-check.yml` que corre semanalmente:
  1. Lee `INDICE-HALLAZGOS.md` de Dew
  2. Compara IDs usados en `yggdrasil-secops/hallazgos/`
  3. Abre Issue automático si detecta colisión de IDs
- [ ] Extender el Action para verificar que `NORMAS.md`-puntero no ha sido editado a mano
- [ ] `PLANTILLA-HAL.md` ya creada en `yggdrasil-dew/docs/canon/` ✅

**Criterio de salida:** colisión de IDs se detecta sola en 7 días máximo.

---

## Orden de ejecución

1. **Hoy (Madre):** Fase 0 — repo a privado + CI gaps — 20 min
2. **Hoy o mañana:** Fase 1 — colisión de IDs — desbloquea todo lo demás
3. **Próxima sesión larga:** Fase 2 — purga de duplicados
4. **Tareas sueltas:** Fase 3
5. **Cuando quieras automatización real:** Fase 4

---

_Creado: 2026-07-06 · Auditoría Claude + Plan Perplexity MCP · Fuente: PLAN-ALINEACION-2026-07.md_
