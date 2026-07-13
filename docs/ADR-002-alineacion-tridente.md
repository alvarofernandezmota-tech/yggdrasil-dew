---
tipo: ADR
numero: ADR-002
titulo: Alineación del Tridente — auditorías individuales + conjunta del ecosistema
fecha: 2026-07-13
status: aceptado
author: Alvaro Fernandez Mota
tags: [ADR, ecosistema, auditoria, gobernanza]
---

# ADR-002 — Alineación del Tridente

## Contexto

El ecosistema Yggdrasil se compone de 4 repos con dominios bien diferenciados. Tras la limpieza del 13 julio 2026 (issues #62, #64), cada repo tiene su estructura canónica. El problema era que no existía un protocolo formal para mantener la alineación entre ellos: nombres inconsistentes, archivos en el repo equivocado, referencias rotas entre repos.

## Decisión

Se establece un sistema de auditorías en dos niveles:

1. **Auditoría individual por repo** — cada repo tiene su propio checklist, ejecutable de forma independiente.
2. **Auditoría conjunta de ecosistema** — revisa la alineación entre todos los repos: nomenclatura, frontmatter, referencias cruzadas, `now.md` actualizado.

## Los 4 dominios del ecosistema

| Repo | Dominio | Qué vive aquí |
|---|---|---|
| `yggdrasil-dew` | Sistema operativo | Issues, ADRs, protocolos, decisiones, backlog |
| `WIKI---PERSONAL` | Conocimiento | Islas de conocimiento, referencias, howtos |
| `yggdrasil-tracking` | Vida personal | Diarios, hábitos, metas, filosofía |
| `yggdrasil-formacion` | Aprendizaje | Cursos, recursos, rutas de formación |

## Capa común obligatoria (todos los repos)

Cada repo del ecosistema DEBE tener:

```
README.md        — descripción y propósito del repo
now.md           — estado actual (actualizado en cada sesión activa)
inbox/           — entrada de ideas/tareas sin clasificar
_archivo/        — contenido obsoleto que no se borra
```

## Frecuencia de auditorías

| Tipo | Frecuencia | Protocolo |
|---|---|---|
| Individual por repo | Mensual o tras cambios grandes | `PROTOCOLO-AUDITORIA-[REPO].md` |
| Conjunta ecosistema | Trimestral o tras renombrados | `PROTOCOLO-AUDITORIA-ECOSISTEMA.md` |
| Apertura de sesión | Cada sesión IA | `PROTOCOLO-APERTURA-SESION.md` |
| Cierre de sesión | Cada sesión IA | `PROTOCOLO-CIERRE-SESION.md` |

## Estado post-limpieza 13 julio 2026

| Repo | Estado | Notas |
|---|---|---|
| `yggdrasil-dew` | ✅ Limpio | Protocolos creados, ADRs en `docs/` |
| `WIKI---PERSONAL` | 🟡 Pendiente auditoría | Sin auditar en esta sesión |
| `yggdrasil-tracking` | ✅ Limpio | `sistema/` borrado, `filosofia/` creada |
| `yggdrasil-formacion` | ✅ Limpio | Ya limpio antes de esta sesión |

## Consecuencias

- Todo archivo nuevo debe entrar por el repo correcto desde el primer momento.
- Antes de crear un archivo, preguntar: ¿es sistema (DEW), conocimiento (wiki), vida personal (tracking) o aprendizaje (formacion)?
- La auditoría conjunta trimestral es el único momento para mover archivos entre repos.
- Cualquier renombrado de repo activa el `PROTOCOLO-NOMBRES.md` automáticamente.

## Refs

- Issues: #62 (limpieza tracking), #63 (este ADR), #64 (protocolos DEW), #65 (consistencia nombres)
- Diario: `yggdrasil-tracking/diarios/2026/07-julio/2026-07-13.md`
- Protocolos: `protocolo/PROTOCOLO-AUDITORIA-*.md`

---
_Redactado: 2026-07-13 · Perplexity MCP_
