---
title: Plan Maestro de Alineación — Ecosistema Yggdrasil
tipo: plan
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-09
actualizado: 2026-07-13 11:20 CEST
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

## Fase 1 — Canon de Dew (ADRs, índices) ✅ COMPLETADA 2026-07-13

| Punto | Estado |
|---|---|
| ADR-001 a ADR-010 creados e indexados | ✅ Hecho — commit `9dd29199` + `4ed2f42e` |
| `docs/adr/INDEX.md` maestro creado | ✅ Hecho |
| ADR-005/006 referenciados con repo WIKI | ✅ Hecho |
| HOME.md enlaza a docs/adr/ | ✅ Hecho |

> Fase 1 cerrada. No requiere más acción.

---

## Fase 2 — Unificar los 3 índices de islas

Verificado: `wiki/islas/INDEX.md` ya se autodeclara *"fuente de verdad única"*, pero `README.md` (7 islas)
y `HOME.md` (8 islas, contenido distinto) **siguen teniendo tablas propias en vez de enlazar a él**.

**Fix:** en `README.md` y `HOME.md` de WIKI, sustituir la tabla completa de islas por:
```markdown
## 🌊 Islas del ecosistema
Ver [wiki/islas/INDEX.md](wiki/islas/INDEX.md) — fuente de verdad única.
```
Una sola tabla real, dos punteros. MCP lo ejecuta en esta sesión.

- [ ] README.md WIKI → puntero a INDEX.md
- [ ] HOME.md WIKI → puntero a INDEX.md

---

## Fase 3 — Purga real de `docs/` en WIKI (el fallo más grande)

Verificado: **279 archivos `.md`** en 30 subcarpetas + 56 archivos sueltos en `docs/` raíz.
`docs/misc/` tiene 34 archivos — es, literalmente, la carpeta "no sé dónde meter esto".
`docs/archivo/` tiene 22 — si ya es archivo, no debería seguir contando como docs activo.

**Esto no se resuelve con más reclasificación. Se resuelve reduciendo.**

- [ ] Todo `docs/misc/` (34 archivos) → revisar uno a uno: o tiene isla clara → mover, o no aporta → borrar
- [ ] Todo `docs/archivo/` (22 archivos) → mover fuera de `docs/` a `_archivo/` en la raíz
- [ ] Los 56 archivos sueltos en `docs/` raíz → cada uno: ¿es isla? → `wiki/islas/`. ¿Es histórico? → archivo. ¿Duplicado en Dew? → borrar
- [ ] Objetivo numérico: bajar de 279 a menos de 80 archivos en WIKI

> ⏳ Sesión larga — requiere decisión manual de Alvaro sobre cada archivo.

---

## Fase 4 — Consolidar MCP y agentes

Verificado: contenido de MCP disperso en 6 archivos sin relación entre sí en WIKI.

- [ ] Fusionar los 6 en `wiki/islas/mcp.md` — fuente única de verdad del protocolo MCP
- [ ] Auditar `wiki/agentes/` (thdora.md, perplexity.md, README.md) — decidir si es isla o fusionar con `cerebro.md`

> MCP puede ejecutar en esta sesión tras F2.

---

## Fase 5 — Seguridad CI y enforcement ✅ COMPLETADA 2026-07-13

| Punto | Estado |
|---|---|
| `validate-canon.yml` con secret-patterns (IPv4, email, TOKEN/SECRET/PASSWORD) | ✅ Hecho — commit `1cbd1f10` |
| `gitleaks.yml` confirmado corriendo en push | ✅ Confirmado |
| `markdownlint.yml` añadido | ✅ Hecho |
| `docs/canon/CONVENCIONES-SEGURIDAD.md` creado | ✅ Hecho |

> Fase 5 cerrada. No requiere más acción.

---

## Fase 6 — Mantenimiento activo (permanente)

Ritual semanal:

```bash
# 0. Verificar visibilidad de repos privados (NO NEGOCIABLE)
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/WIKI---PERSONAL/main/README.md | head -1
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/yggdrasil-secops/main/README.md | head -1
# Ambos deben dar 404. Si alguno da 200 → arreglar ANTES de seguir.

# 1. Actualizar ESTADO-SISTEMA.md
# 2. Revisar issues abiertos críticos
# 3. docker ps en Madre — verificar todos healthy
```

---

## Fase 7 — GitOps Real + Operabilidad (backlog Gemini 2026-07-13)

> Ninguno de estos puntos está ejecutado todavía. Son propuestas validadas, no hechos.
> Ver análisis completo en `docs/diarios/2026-07-13-dew.md` → sección Investigación Gemini.

### 7.1 — Secretos como contratos de estado

- [ ] Crear `.env.template` con todas las variables obligatorias (sin valores)
- [ ] Crear `scripts/env-checker.sh` — valida `.env` contra `.env.template` antes de `docker-compose up`
- [ ] `docs/secrets.md` creado ✅ — completar con tokens reales y fechas de rotación

### 7.2 — Runbooks y DRP

- [x] Esqueleto `docs/runbooks/DRP.md` creado — 2026-07-13
- [ ] Completar DRP con rutas reales, IPs, nombres de volúmenes Docker
- [ ] Crear `docs/runbooks/ollama-recovery.md`

### 7.3 — Healthchecks en docker-compose

- [ ] Añadir `healthcheck` + `restart: unless-stopped` a servicios críticos en `madre-config`
- [ ] Afecta: `log_guardian_bot` (#46), `ollama`, `litellm`, `n8n`, `open-webui`

### 7.4 — GitOps estricto (norma permanente)

- [ ] Norma: ningún cambio en producción sin PR. SSH solo para emergencias documentadas.
- [ ] Workflow `validate-env.yml` — bloquea PR si `.env.template` no es coherente
- [ ] Relacionado con #43 (IaC docker-compose drift)

### 7.5 — Observabilidad (backlog largo plazo)

- [ ] Evaluar Promtail + Loki para agregación de logs
- [ ] `btrfs scrub` semanal automatizado en Madre (relacionado con #31)

---

## Infraestructura crítica (en paralelo)

- [ ] #31 — smartctl HDD Madre, disco en riesgo
- [ ] #15 — Cerrar puerto 21 FTP en router
- [ ] #44 — Fix `.env` malformado (TERMINAL)
- [ ] #45 — Rotar tokens expuestos (TERMINAL)
- [ ] #46 — Reiniciar crash loop tras fix .env (TERMINAL)

---

## Orden de ejecución actualizado — 2026-07-13 11:20

### TÚ en terminal AHORA (30 min — bloquea todo lo demás)

```bash
# 1. Fix .env
cp ~/.env ~/.env.bak-$(date +%F) && nano ~/.env
# Una variable por línea. Sin comandos bash. Sin espacios en claves.

# 2. Rotar token Telegram → BotFather → /mybots → Revoke → pegar en .env
# 3. Rotar LITELLM_MASTER_KEY → dashboard LiteLLM → pegar en .env

# 4. Validar
docker compose -f ~/docker-compose.maestro.yml config > /dev/null && echo "✅ .env OK"

# 5. Reiniciar servicios caídos
docker restart log_guardian_bot local_tripwire yggdrasil_watchdog

# 6. Verificar healthy
docker ps --format 'table {{.Names}}\t{{.Status}}'

# 7. Cerrar puerto 21 en router Digi
```

### MCP en esta sesión (ya en proceso)

- [x] F1: ADR-001 a ADR-010 + INDEX.md ✅
- [x] F5: CI secret-patterns + gitleaks + markdownlint ✅
- [ ] F2: Unificar índices WIKI (README + HOME → punteros)
- [ ] F4: Consolidar 6 archivos MCP → `wiki/islas/mcp.md`
- [ ] `docs/secrets.md` creado con política de rotación
- [ ] Completar Bloques 1+3 issue #57 (filosofía)

### Próxima sesión larga

- [ ] F3: Purga WIKI 279 → 80 archivos (requiere decisión Alvaro)
- [ ] Completar DRP con datos reales de Madre
- [ ] `.env.template` + `env-checker.sh` + healthchecks docker-compose

### Para siempre (F6)

- [ ] Ritual semanal con verificación visibilidad repos privados

---

_Creado: 2026-07-09 · Actualizado: 2026-07-13 11:20 CEST · Consolida y sustituye los 3 planes anteriores_
_F1 ✅ cerrada 2026-07-13 · F5 ✅ cerrada 2026-07-13_
