---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-ALINEACION.md
tags: [canon, alineacion, protocolo, ecosistema, sincronizacion]
status: vigente
version: 1
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
| `WIKI---PERSONAL` | `yggdrasil-wiki`, `wiki`, `WIKI` |
| `yggdrasil-tracking` | `vidapersonal`, `VIDAPERSONAL`, `vida-personal`, `tracking` |
| `yggdrasil-formacion` | `yggdrasil-formacion-` *(con guión final)*, `formacion` |
| `madre-config` | `madre`, `Madre-config` |
| `THDORA-PERSONAL` | `thdora-personal`, `thdora`, `THDORA` |
| `yggdrasil-secops` | `secops`, `yggdrasil-security` |
| `local-brain` | `local_brain`, `localbrain` |
| `acer-config` | `acer`, `Acer-config` |
| `dev-labs` | `labs`, `yggdrasil-labs` |
| `yggdrasil-scripts` | `scripts` |

---

## Paso 2 — Verificar mapas del ecosistema

Los 3 mapas deben estar sincronizados entre sí y con la realidad:

| Mapa | Ruta | Qué verifica |
|---|---|---|
| Mapa general | `WIKI---PERSONAL/wiki/00-mapa.md` | Todos los repos con nombres correctos |
| Mapa islas | `WIKI---PERSONAL/wiki/mapa-islas.md` | Todas las islas con repos y estados correctos |
| Índice islas | `WIKI---PERSONAL/wiki/islas/INDEX.md` | Conteo y estado de cada isla |

**Checklist por mapa:**
- [ ] Nombres de repos coinciden con tabla canónica
- [ ] No hay filas de islas/repos que no existen
- [ ] No faltan islas/repos que sí existen
- [ ] Estados (✅/⚠️/🔴) reflejan la realidad actual
- [ ] Fecha de actualización es reciente

---

## Paso 3 — Verificar AGENT.md y CONTEXT.md en cada repo

Cada repo operativo debe tener ambos archivos en raíz:

| Repo | AGENT.md | CONTEXT.md | Plantilla origen |
|---|---|---|---|
| `yggdrasil-dew` | ✅ obligatorio | ✅ obligatorio | `docs/canon/AGENT-template.md` |
| `WIKI---PERSONAL` | ✅ obligatorio | ✅ obligatorio | `docs/canon/AGENT-template.md` |
| `yggdrasil-tracking` | ✅ obligatorio | ✅ obligatorio | `docs/canon/AGENT-template.md` |
| `THDORA-PERSONAL` | ✅ obligatorio | ✅ obligatorio | `docs/canon/AGENT-template.md` |
| `madre-config` | 🟡 recomendado | 🟡 recomendado | `docs/canon/AGENT-template.md` |
| `yggdrasil-secops` | 🟡 recomendado | 🟡 recomendado | `docs/canon/AGENT-template.md` |
| `local-brain` | 🟡 recomendado | 🟡 recomendado | `docs/canon/AGENT-template.md` |

**Checklist por repo:**
- [ ] `AGENT.md` existe en raíz
- [ ] `CONTEXT.md` existe en raíz
- [ ] Variables `{{VARIABLE}}` sustituidas (no hay placeholders)
- [ ] Nombre del repo en `AGENT.md` es el nombre canónico
- [ ] Protocolos de inicio y cierre referenciados

---

## Paso 4 — Verificar ESTADO-SISTEMA.md

Ruta: `yggdrasil-dew/docs/canon/ESTADO-SISTEMA.md`

- [ ] Número de repos coincide con repos reales
- [ ] Número de ADRs coincide con archivos en `docs/adr/`
- [ ] Número de islas coincide con `wiki/islas/INDEX.md`
- [ ] Número de issues abiertos aproximado a la realidad
- [ ] Lista de servicios Docker actualizada
- [ ] HALs activos listados
- [ ] Fecha de actualización es de esta sesión

---

## Paso 5 — Verificar protocolos disponibles

Todos estos archivos deben existir en `yggdrasil-dew/docs/canon/`:

- [ ] `PROTOCOLO-INICIO-SESION.md` ✅
- [ ] `PROTOCOLO-CIERRE-SESION.md` ✅
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

_Creado: 2026-07-16 · v1 · Perplexity MCP_
