---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-16
ruta: protocolo/INDEX.md
tags: [protocolo, indice, canon]
status: vigente
---

# Índice de Protocolos — Ecosistema Yggdrasil

> Inventario completo de todos los protocolos vigentes.
> Actualizar cada vez que se crea, versiona o depreca un protocolo (TIPO E del PROTOCOLO-ACTUALIZACION).

---

## Protocolos de sesión (globales)

| Protocolo | Versión | Cuándo ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-APERTURA-SESION](../docs/canon/PROTOCOLO-INICIO-SESION.md) | v1.0 | Inicio de cada sesión | ✅ Vigente |
| [PROTOCOLO-CIERRE-SESION](./PROTOCOLO-CIERRE-SESION.md) | v2.0 | Fin de cada sesión | ✅ Vigente |

> ⚠️ Nota 2026-07-16: PROTOCOLO-APERTURA-SESION está en docs/canon/ (versión anterior). Pendiente mover a protocolo/ v2.0.

---

## Protocolos de ecosistema (orquestación)

| Protocolo | Versión | Cuándo ejecutar | Estado |
|---|---|---|---|
| [PROTOCOLO-ACTUALIZACION-ECOSISTEMA](./PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md) | v1.0 | Cada vez que algo cambia estructuralmente | ✅ Vigente |
| [PROTOCOLO-AUDITORIA-ECOSISTEMA](./PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | v1.0 | Mensual / tras cambios grandes | ✅ Vigente |
| [PROTOCOLO-NOMBRES](./PROTOCOLO-NOMBRES.md) | v2.0 | Al renombrar repos/archivos | ✅ Vigente |
| [PROTOCOLO-BORRADO](./PROTOCOLO-BORRADO.md) | v1.0 | Al borrar archivos del ecosistema | ✅ Vigente |

---

## Protocolos de contexto (por repo)

| Protocolo | Versión | Repo | Estado |
|---|---|---|---|
| [PROTOCOLO-CONTEXTO-DEW](./PROTOCOLO-CONTEXTO-DEW.md) | v1.0 | yggdrasil-dew | ✅ Vigente |
| [PROTOCOLO-CONTEXTO-WIKI](./PROTOCOLO-CONTEXTO-WIKI.md) | v1.0 | yggdrasil-wiki | ✅ Vigente |
| [PROTOCOLO-CONTEXTO-TRACKING](./PROTOCOLO-CONTEXTO-TRACKING.md) | v1.0 | yggdrasil-tracking | ✅ Vigente |
| [PROTOCOLO-CONTEXTO-FORMACION](./PROTOCOLO-CONTEXTO-FORMACION.md) | v1.0 | yggdrasil-formacion | ✅ Vigente |

---

## Protocolos de auditoría (por repo)

| Protocolo | Versión | Repo | Frecuencia | Estado |
|---|---|---|---|---|
| [PROTOCOLO-AUDITORIA-DEW](./PROTOCOLO-AUDITORIA-DEW.md) | v1.0 | yggdrasil-dew | Mensual | ✅ Vigente |
| [PROTOCOLO-AUDITORIA-WIKI](./PROTOCOLO-AUDITORIA-WIKI.md) | v1.0 | yggdrasil-wiki | Mensual | ✅ Vigente |
| [PROTOCOLO-AUDITORIA-TRACKING](./PROTOCOLO-AUDITORIA-TRACKING.md) | v1.0 | yggdrasil-tracking | Mensual | ✅ Vigente |
| [PROTOCOLO-AUDITORIA-FORMACION](./PROTOCOLO-AUDITORIA-FORMACION.md) | v1.0 | yggdrasil-formacion | Mensual | ✅ Vigente |

---

## Pendiente — próximas versiones (F15)

| Protocolo | Prioridad | Notas |
|---|---|---|
| PROTOCOLO-ACTUALIZACION-DEW | 🟡 Media | Variante específica para DEW |
| PROTOCOLO-ACTUALIZACION-WIKI | 🟡 Media | Variante específica para WIKI |
| PROTOCOLO-ACTUALIZACION-TRACKING | 🟡 Media | Variante específica para TRACKING |
| PROTOCOLO-ACTUALIZACION-FORMACION | 🟡 Media | Variante específica para FORMACION |
| PROTOCOLO-DOCUMENTACION-ECOSISTEMA | 🟡 Media | Entrada formal de elementos nuevos |
| PROTOCOLO-APERTURA-SESION v2.0 | 🔴 Alta | Mover de docs/canon/ a protocolo/ |
| PROTOCOLO-CIERRE-SESION v2.0 | 🔴 Alta | Verificar si existe en protocolo/ |

---

## Arquitectura del sistema de protocolos

```
NIVEL 0 — TÚ
  pregunta / instrucción
        ↓
NIVEL 1 — PROTOCOLOS GLOBALES (este nivel orquesta)
  APERTURA → ACTUALIZACION → AUDITORIA → CIERRE
        ↓
NIVEL 2 — PROTOCOLOS POR REPO
  CONTEXTO-* + AUDITORIA-* × 4 repos
        ↓
NIVEL 3 — PLANTILLAS (docs/canon/PLANTILLA-*.md)
  Garantizan frontmatter correcto en todo archivo nuevo
```

---

_Actualizado: 2026-07-16 · F15 · ADR-013 · Perplexity MCP_
