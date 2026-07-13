---
tipo: protocolo
subtipo: roadmap-contexto
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: protocolo/PROTOCOLO-CONTEXTO-ROADMAP.md
tags: [protocolo, contexto, roadmap, mapa, agente-ia]
status: vigente
version: 1.0
audiencia: [humano, agente-ia]
---

# 🗺️ ROADMAP DE PROTOCOLOS DE CONTEXTO

> Mapa vivo de todos los protocolos de contexto del ecosistema.  
> **Regla:** Cuando se crea un nuevo protocolo de contexto, se registra aquí primero.  
> **Regla:** Cuando un protocolo pasa de manual a script/action/bot, se actualiza la columna "Nivel".

---

## NIVEL 0 — ECOSISTEMA (maestro)

| Protocolo | Descripción | Nivel actual | Candidato a |
|-----------|-------------|--------------|-------------|
| `PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | Contexto completo del ecosistema. El agente lo ejecuta al inicio de sesión multi-repo | 0 — Manual | 1 — Script |

---

## NIVEL 1 — POR REPO (context-packs)

| Protocolo | Repo objetivo | Estado | Nivel actual | Candidato a |
|-----------|--------------|--------|--------------|-------------|
| `CONTEXT-PACK-WIKI.md` | `yggdrasil-wiki` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-TRACKING.md` | `yggdrasil-tracking` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-INFRA.md` | `madre-config` + `acer-config` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-THDORA.md` | `THDORA-PERSONAL` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-SECOPS.md` | `yggdrasil-secops` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-FORMACION.md` | `formacion-tech` + `investigacion-ia` | 🔲 pendiente | — | 0 — Manual |
| `CONTEXT-PACK-IA-LOCAL.md` | `ollama-stack` + `local-brain` | 🔲 pendiente | — | 0 — Manual |

---

## NIVEL 2 — POR DOMINIO DE VIDA

| Protocolo | Dominio | Estado | Nivel actual | Candidato a |
|-----------|---------|--------|--------------|-------------|
| `PROTOCOLO-CONTEXTO-VIDA-PERSONAL.md` | Tracking: metas, diarios, filosofía, yo | 🔲 pendiente | — | 0 — Manual |
| `PROTOCOLO-CONTEXTO-ORQUESTADOR.md` | THDORA como orquestador cross-repo | 🔲 pendiente | — | 3 — Bot |
| `PROTOCOLO-CONTEXTO-FORMACION.md` | formacion-tech + investigacion-ia como sistema de aprendizaje | 🔲 pendiente | — | 0 — Manual |

---

## NIVEL 3 — AUTOMATIZADOS (scripts / actions / bot)

| Protocolo/Script | Origen | Tipo | Estado |
|-----------------|--------|------|--------|
| _(vacío — a poblar cuando protocolo manual madure)_ | — | — | — |

---

## PRIORIDAD DE CONSTRUCCIÓN

```
🔴 ALTA — construir esta semana
  1. CONTEXT-PACK-WIKI.md          (second brain, se usa en casi todas las sesiones)
  2. CONTEXT-PACK-TRACKING.md      (vida personal, sesiones de revisión personal)
  3. PROTOCOLO-CONTEXTO-VIDA-PERSONAL.md   (el "tridente" que engloba tracking)

🟡 MEDIA — construir este mes
  4. CONTEXT-PACK-THDORA.md        (cuando arranque THDORA de nuevo)
  5. CONTEXT-PACK-INFRA.md         (cuando se toque madre-config o acer-config)
  6. PROTOCOLO-CONTEXTO-ORQUESTADOR.md    (cuando THDORA sea el centro)

🔵 BAJA — construir cuando el repo madure
  7. CONTEXT-PACK-SECOPS.md
  8. CONTEXT-PACK-FORMACION.md
  9. CONTEXT-PACK-IA-LOCAL.md
```

---

## PLANTILLA PARA NUEVO CONTEXT-PACK

Cuando se crea un CONTEXT-PACK nuevo, usar esta estructura mínima:

```markdown
---
tipo: context-pack
repo-objetivo: <nombre-repo>
actualizado: YYYY-MM-DD
status: vigente
audiencia: [humano, agente-ia]
---

# CONTEXT-PACK — <NOMBRE-REPO>

## Qué es este repo
<una línea>

## Qué NO es este repo
<una línea — evita ambigüedad con otros repos>

## Archivos clave
| Archivo | Para qué sirve |
|---------|---------------|
| ... | ... |

## Reglas de operación para el agente
- ...

## Relaciones con otros repos
- ...

## Cuándo actualizar este CONTEXT-PACK
- ...
```

---

_Creado: 2026-07-13 · Perplexity-MCP · v1.0_
