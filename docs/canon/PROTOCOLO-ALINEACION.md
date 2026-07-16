---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-ALINEACION.md
tags: [canon, alineacion, protocolo, ecosistema, sincronizacion]
status: vigente
version: 2
---

# 🔄 Protocolo de Alineación del Ecosistema

> Ejecutar cuando se detecte desincronización entre repos, mapas o archivos de estado.  
> También ejecutar al inicio de cada nueva fase del Plan Maestro.

---

## Cuándo ejecutar

- Nombres de repos incorrectos detectados en archivos `.md`
- Un mapa (00-mapa.md, mapa-islas.md, INDEX.md) no refleja la realidad
- Se renombró un repo y hay referencias viejas por actualizar
- Inicio de nueva fase del Plan Maestro
- Tras incorporar un agente IA nuevo al ecosistema
- Cada 30 días como mantenimiento preventivo

---

## Paso 1 — Verificar tabla canónica de nombres

La tabla canónica de nombres de repos es **única fuente de verdad**.  
Cualquier referencia en cualquier `.md` debe usar exactamente estos nombres:

| Nombre canónico | Aliases prohibidos |
|---|---|
| `yggdrasil-dew` | `dew`, `Dew`, `DEW-repo` |
| `yggdrasil-wiki` | `WIKI---PERSONAL`, `wiki`, `WIKI` |
| `yggdrasil-tracking` | `vidapersonal`, `VIDAPERSONAL`, `vida-personal`, `tracking` |
| `yggdrasil-formacion` | `yggdrasil-formacion-` *(con guión final)*, `formacion` |
| `madre-config` | `madre`, `Madre-config` |
| `THDORA-PERSONAL` | `thdora-personal`, `thdora`, `THDORA` |
| `yggdrasil-secops` | `secops`, `yggdrasil-security` |
| `ollama-stack` | `local-brain`, `local_brain`, `localbrain` |
| `acer-config` | `acer`, `Acer-config` |
| `dev-labs` | `labs`, `yggdrasil-labs` |
| `yggdrasil-scripts` | `scripts` |

---

## Paso 2 — Verificar mapas del ecosistema

Los 3 mapas deben estar sincronizados entre sí y con la realidad:

| Mapa | Ruta | Qué verifica |
|---|---|---|
| Mapa general | `yggdrasil-wiki/wiki/00-mapa.md` | Todos los repos con nombres correctos |
| Mapa islas | `yggdrasil-wiki/wiki/mapa-islas.md` | Todas las islas con repos y estados correctos |
| Índice islas | `yggdrasil-wiki/wiki/islas/INDEX.md` | Conteo y estado de cada isla |

**Checklist por mapa:**
- [ ] Nombres de repos coinciden con tabla canónica
- [ ] No hay filas de islas/repos que no existen
- [ ] No faltan islas/repos que sí existen
- [ ] Estados (✅/⚠️/🔴) reflejan la realidad actual
- [ ] Fecha de actualización es reciente

---

## Paso 3 — Verificar AGENT.md y CONTEXT.md en cada repo

Cada repo operativo debe tener ambos archivos en raíz:

| Repo | AGENT.md | CONTEXT.md | Estado |
|---|---|---|---|
| `yggdrasil-dew` | ✅ obligatorio | ✅ obligatorio | ✅ Hecho |
| `yggdrasil-wiki` | ✅ obligatorio | ✅ obligatorio | ✅ Hecho |
| `yggdrasil-tracking` | ✅ obligatorio | ✅ obligatorio | ⚠️ Pendiente |
| `THDORA-PERSONAL` | ✅ obligatorio | ✅ obligatorio | ⚠️ Pendiente |
| `madre-config` | 🟡 recomendado | 🟡 recomendado | ❓ Sin verificar |
| `yggdrasil-secops` | 🟡 recomendado | 🟡 recomendado | ❓ Sin verificar |
| `ollama-stack` | 🟡 recomendado | 🟡 recomendado | ❓ Sin verificar |

**Checklist por repo:**
- [ ] `AGENT.md` existe en raíz
- [ ] `CONTEXT.md` existe en raíz
- [ ] Variables `{{VARIABLE}}` sustituidas (no hay placeholders)
- [ ] Nombre del repo en `AGENT.md` es el nombre canónico
- [ ] Protocolos de inicio y cierre referenciados

---

## Paso 4 — Verificar ESTADO-SISTEMA.md

Ruta: `yggdrasil-dew/ESTADO-SISTEMA.md` *(raíz del repo — no en docs/canon)*

- [ ] Número de repos coincide con repos reales
- [ ] Número de ADRs coincide con archivos en `docs/adr/`
- [ ] Número de islas coincide con `yggdrasil-wiki/wiki/islas/INDEX.md`
- [ ] Número de issues abiertos aproximado a la realidad
- [ ] Lista de servicios Docker actualizada
- [ ] HALs activos listados
- [ ] Fecha de actualización es de esta sesión

---

## Paso 5 — Verificar protocolos disponibles

Todos estos archivos deben existir en `yggdrasil-dew/docs/canon/`:

- [ ] `PROTOCOLO-INICIO-SESION.md` ✅
- [ ] `PROTOCOLO-CIERRE-SESION.md` ✅
- [ ] `PROTOCOLO-VERIFICACION-COMMITS.md` ✅
- [ ] `PROTOCOLO-AUDITORIA.md` ✅
- [ ] `PROTOCOLO-ALINEACION.md` ← este archivo ✅
- [ ] `AGENT-template.md` ✅
- [ ] `CONTEXT-template.md` ✅
- [ ] `PLANTILLA-ADR.md` ✅
- [ ] `PLANTILLA-PROTOCOLO.md` ✅
- [ ] `PLANTILLA-ISLA-WIKI.md` ✅
- [ ] `NORMAS-TRIDENTE.md` ✅

---

## Resultado de la alineación

Documentar en el diario de sesión:

```markdown
## Alineación ecosistema — YYYY-MM-DD

| Verificación | Estado | Acción tomada |
|---|---|---|
| Tabla nombres | ✅/❌ | |
| Mapa 00-mapa.md | ✅/❌ | |
| Mapa mapa-islas.md | ✅/❌ | |
| Índice INDEX.md | ✅/❌ | |
| AGENT.md repos core | ✅/❌ | |
| CONTEXT.md repos core | ✅/❌ | |
| ESTADO-SISTEMA.md | ✅/❌ | |
| Protocolos completos | ✅/❌ | |

Estado final: ALINEADO / CON DEUDA / CRÍTICO
```

---

_v2 · 2026-07-16 · Corregidos nombres canónicos: yggdrasil-wiki, ollama-stack · ESTADO-SISTEMA apunta a raíz · Perplexity MCP_
