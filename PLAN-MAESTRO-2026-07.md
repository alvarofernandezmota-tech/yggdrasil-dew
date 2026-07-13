---
title: Plan Maestro de Alineación — Ecosistema Yggdrasil
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-09
actualizado: 2026-07-13
ruta: PLAN-MAESTRO-2026-07.md
tags: [plan, maestro, alineacion, unico]
status: vigente
supersede:
  - PLAN-ALINEACION-2026-07.md
  - PLAN-ALINEACION-SECOPS-2026-07.md
  - PLAN-DEUDA-TECNICA-2026-07.md
fuentes:
  - Auditoría en vivo 2026-07-09 (Claude)
  - docs/auditorias/analisis-claude-2026-07-05.md
  - docs/auditorias/analisis-perplexity-2026-07-05.md
  - Investigación Gemini 2026-07-13
---

# 🎯 Plan Maestro — Ecosistema Yggdrasil

> Un solo documento. Los 3 planes anteriores (`ALINEACION`, `SECOPS`, `DEUDA-TECNICA`) quedan archivados
> como referencia histórica — este es el único que se actualiza a partir de ahora.
> Cada fase tiene: qué se dijo que estaba hecho → qué está confirmado en vivo → qué falta.

---

## OK dado — con matices

Vas por buen camino en lo estructural (Dew es sólido, workflows limpios, secops privado).
El fallo recurrente no es de arquitectura, es de **verificación**: varias cosas se dan por hechas
en el momento y luego un pull/rebase/otra sesión las revierte sin que nadie se entere hasta la próxima
auditoría. Este plan incluye un paso de verificación en vivo al final de cada fase, no solo el checkbox.

---

## Fase 0 — Seguridad (repetida porque ya falló dos veces)

| Punto | Dijiste | Verificado ahora | Acción |
|---|---|---|---|
| WIKI privado | ✅ | ❌ **Público** (verificado 2 veces hoy) | Settings → Danger Zone → private, YA |
| secops privado | ✅ | ✅ Confirmado | — |
| HAL-006 secretos rotados | ✅ | No verificable sin acceso a secops | Confía, pero re-confirma en próxima auditoría con acceso |

**Causa raíz del fallo de WIKI:** no está clara — puede ser una herramienta (Perplexity-MCP) tocando
config del repo sin querer, o un cambio manual olvidado. **Acción permanente:** añadir a la Fase 6 un
chequeo de visibilidad de los 2 repos privados como parte del ritual semanal (ver Fase 6).

---

## Fase 1 — Canon de Dew (ADRs, índices)

| Punto | Dijiste | Verificado | Acción |
|---|---|---|---|
| ADR-005/006 indexados | Pendiente (issue #33) | ❌ Confirmado — `INDICE-ADR.md` solo llega a ADR-004 | Añadir 2 filas, ver bloque de código abajo |
| ADR-002/003/004 completos | ✅ | ✅ Confirmado, existen y tienen contenido real | — |
| Registro central de HAL | — | HAL-001 sigue significando cosas distintas en Dew vs secops (no verificable si se resolvió, sin acceso a secops) | Confirmar en próxima sesión con acceso |

**Fix inmediato para `docs/canon/INDICE-ADR.md`** — añadir estas 2 filas a la tabla `Registro`:
```markdown
| [ADR-005](./ADR-005-ssh-github-sin-passphrase.md) | Clave SSH GitHub sin passphrase | ✅ vigente | 2026-06-25 | WIKI---PERSONAL |
| [ADR-006](./ADR-006-seguridad-privilege-explosion.md) | Seguridad — privilege explosion | ✅ vigente | 2026-06-25 | WIKI---PERSONAL |
```
Nota la columna Repo: ambos viven físicamente en WIKI, no en Dew — es una inconsistencia de ubicación
que ya señalamos antes. Si quieres resolverla de raíz, muévelos a `yggdrasil-dew/docs/canon/` y deja
un stub en WIKI. Si no, al menos que el índice sepa dónde están de verdad.

---

## Fase 2 — Unificar los 3 índices de islas (sigue sin hacerse)

Verificado: `wiki/islas/INDEX.md` ya se autodeclara *"fuente de verdad única"*, pero `README.md` (7 islas)
y `HOME.md` (8 islas, contenido distinto) **siguen teniendo tablas propias en vez de enlazar a él**.

**Fix:** en `README.md` y `HOME.md`, sustituir la tabla completa de islas por:
```markdown
## 🌊 Islas del ecosistema
Ver [wiki/islas/INDEX.md](wiki/islas/INDEX.md) — fuente de verdad única.
```
Una sola tabla real, dos punteros. Esto es 10 minutos, no requiere decisión, solo ejecutarlo.

---

## Fase 3 — Purga real de `docs/` en WIKI (el fallo más grande)

Verificado: **279 archivos `.md`** en 30 subcarpetas + 56 archivos sueltos en `docs/` raíz.
`docs/misc/` tiene 34 archivos — es, literalmente, la carpeta "no sé dónde meter esto".
`docs/archivo/` tiene 22 — si ya es archivo, no debería seguir contando como docs activo.

**Esto no se resuelve con más reclasificación. Se resuelve reduciendo.**

- [ ] Todo `docs/misc/` (34 archivos) → revisar uno a uno: o tiene isla clara → mover, o no aporta → borrar
- [ ] Todo `docs/archivo/` (22 archivos) → mover fuera de `docs/` a un repo `yggdrasil-archive` privado, o a `_archivo/` en la raíz (fuera de `docs/`, que es para contenido vivo)
- [ ] Los 56 archivos sueltos en `docs/` raíz → cada uno decide: ¿es isla? → a `wiki/islas/`. ¿Es histórico? → archivo. ¿Es duplicado de algo en Dew? → borrar, Dew es canon
- [ ] Objetivo numérico: bajar de 279 a menos de 80 archivos en WIKI. Si después de purgar sigue por encima, probablemente hay contenido que en realidad es canon técnico y debería vivir en Dew, no en WIKI

---

## Fase 4 — Consolidar MCP y agentes (nunca auditado, confirmado)

Verificado: contenido de MCP disperso en 6 archivos sin relación entre sí:
`docs/mcp/PLAN-MCP-YGGDRASIL.md`, `docs/arquitectura/llm-mcp-investigacion.md`,
`docs/operativa/mcp-setup-multi-ia.md`, `docs/herramientas/mcp-dispositivos.md`,
`docs/herramientas/mcp-custom-setup.md`, `docs/GATEWAY-MCP.md`.

- [ ] Fusionar los 6 en un único `wiki/islas/mcp.md` (o sección dentro de `cerebro.md` si MCP no merece isla propia)
- [ ] Auditar `wiki/agentes/` (thdora.md, perplexity.md, README.md) — decidir si es isla o si se fusiona con `cerebro.md`

---

## Fase 5 — Seguridad CI y enforcement

- [ ] Ampliar `validate-canon.yml` (ya limpio de stubs) para detectar IPv4 y emails, no solo tokens/passwords
- [ ] `markdownlint` como check adicional si quieres forzar formato consistente (opcional, no crítico)

---

## Fase 6 — Mantenimiento activo (permanente, con el fallo de hoy incorporado)

Ritual semanal, ahora con el paso que faltaba:

```bash
# 0. Verificar visibilidad de los repos que deben ser privados
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/WIKI---PERSONAL/main/README.md | head -1
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/yggdrasil-secops/main/README.md | head -1
# ambos deben dar 404. Si alguno da 200 → arreglar ANTES de seguir con nada más

# 1. Abrir DASHBOARD.md / GitHub Project y actualizar estado
# 2. Actualizar ESTADO-SISTEMA.md + MASTER-PENDIENTES.md
# 3. Correr check-ecosistema.py si tienes los 3 repos clonados localmente
```

---

## Fase 7 — GitOps Real + Operabilidad (nuevo — backlog Gemini 2026-07-13)

> Ninguno de estos puntos está ejecutado todavía. Son propuestas validadas, no hechos.
> Ver análisis completo en `docs/diarios/2026-07-13-dew.md` → sección Investigación Gemini.

### 7.1 — Secretos como contratos de estado (no ficheros estáticos)

- [ ] Crear `.env.template` con todas las variables obligatorias (sin valores)
- [ ] Crear `scripts/env-checker.sh` — valida `.env` contra `.env.template` antes de `docker-compose up`
  ```bash
  alias ygg-check="cd ~/yggdrasil-dew && ./scripts/env-checker.sh .env.template .env"
  ```
- [ ] Evaluar `sops` + age key para cifrado de secretos en reposo
- [ ] Crear `docs/secrets.md` — política de rotación de tokens (sin valores reales)

### 7.2 — Runbooks y DRP

- [x] Esqueleto `docs/runbooks/DRP.md` creado — 2026-07-13
- [ ] Completar DRP con rutas reales, IPs, nombres de volúmenes Docker
- [ ] Crear `docs/runbooks/ollama-recovery.md` — reconstruir stack Ollama sin perder RAG

### 7.3 — Healthchecks en docker-compose

- [ ] Añadir `healthcheck` + `restart: unless-stopped` a servicios críticos:
  - `log_guardian_bot` (relacionado con #46)
  - `ollama`, `litellm`, `n8n`, `open-webui`
- [ ] Verificar que todos los servicios tienen `restart: unless-stopped` o `always`

### 7.4 — GitOps estricto (norma permanente)

- [ ] **Norma:** ningún cambio en producción sin PR. SSH solo para emergencias documentadas.
- [ ] Crear workflow GitHub Actions `validate-env.yml` — bloquea PR si `.env.template` no es coherente
- [ ] Relacionado con issue #43 (IaC docker-compose drift)

### 7.5 — Observabilidad (backlog largo plazo)

- [ ] Evaluar Promtail + Loki para agregación de logs de todos los servicios Docker
- [ ] Implementar `btrfs scrub` semanal automatizado en cron de Madre (relacionado con #31)

---

## Infraestructura crítica (en paralelo, no depende de nada de lo anterior)

- [ ] #31 — smartctl HDD Madre, disco en riesgo
- [ ] #15 — Cerrar puerto 21 FTP en router

---

## Orden de ejecución final

1. **Ahora:** WIKI privado (Fase 0)
2. **Hoy con terminal:** #44 + #45 + #46 (25 min)
3. **Hoy, 10 min por MCP:** Fase 1 (2 filas en índice ADR)
4. **Hoy, 10 min por MCP:** Fase 2 (unificar índices de islas)
5. **En paralelo, sin esperar:** #31 y #15 (críticas de infra)
6. **MCP próxima sesión:** completar `docs/runbooks/DRP.md` + crear `docs/secrets.md`
7. **Terminal próxima sesión:** `.env.template` + `env-checker.sh` + healthchecks en docker-compose
8. **Próxima sesión larga:** Fase 3 (purga real, la que más tarda)
9. **Cuando toque:** Fase 4 (MCP/agentes) y Fase 5 (CI)
10. **Para siempre:** Fase 6, con el paso 0 de verificación de visibilidad no negociable

---

_Creado: 2026-07-09 · Actualizado: 2026-07-13 · Consolida y sustituye los 3 planes anteriores_
_Fuentes adicionales: Investigación Gemini 2026-07-13 (ver docs/diarios/2026-07-13-dew.md)_
