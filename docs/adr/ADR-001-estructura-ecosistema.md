---
tipo: adr
numero: ADR-001
titulo: Estructura canónica del ecosistema Yggdrasil
estado: Vigente
fecha: 2026-07-05
author: Alvaro Fernandez Mota
supercede: —
superada_por: —
tags: [adr, ecosistema, estructura, canon]
---

# ADR-001 — Estructura canónica del ecosistema Yggdrasil

## Contexto

El ecosistema estaba compuesto por múltiples repos sin estructura coherente: documentación dispersa, convenciones inconsistentes, sin punto de entrada único. Era imposible orientarse entre repos sin conocimiento previo de la historia del sistema.

Sesión de análisis: 2026-07-05 con Perplexity y Claude.

## Decisión

Todo repo del ecosistema Yggdrasil sigue la **estructura canónica**:

```
repo/
├── README.md          ← entrada pública: qué es, cómo se usa
├── HOME.md            ← mapa interno: árbol real, enlaces rápidos
├── docs/
│   ├── canon/         ← ESTADO-SISTEMA.md, decisiones permanentes
│   ├── adr/           ← decisiones de arquitectura (este directorio)
│   └── [dominio]/     ← docs específicos del repo
└── .github/
    └── ISSUE_TEMPLATE/
```

El **triángulo DEW ↔ WIKI ↔ VIDAPERSONAL** es la columna vertebral: todo conocimiento vive en uno de estos tres repos, nunca duplicado.

## Alternativas consideradas

| Alternativa | Por qué se descartó |
|---|---|
| Un solo repo monolítico | No escala; mezcla vida personal con infra y conocimiento |
| Wiki en Notion/Confluence | Vendor lock-in, sin control de versiones, sin CI |
| Sin estructura definida | Estado previo: demostró ser insostenible en <6 meses |

## Consecuencias

- **Positivas:** Cualquier repo es comprensible en <5 min. CI puede validar estructura. Onboarding trivial.
- **Negativas / trade-offs:** Requiere disciplina de mantenimiento. Migración de repos existentes costosa.

## Referencias

- `docs/auditorias/analisis-perplexity-2026-07-05.md`
- `docs/auditorias/analisis-claude-2026-07-05.md`
- [Issue #18 — Gobernanza](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/18)

---

_Creado: 2026-07-13 · Retroactivo a sesión 2026-07-05 · Perplexity-MCP_
