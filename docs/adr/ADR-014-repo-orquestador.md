---
tipo: adr
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17
ruta: docs/adr/ADR-014-repo-orquestador.md
tags: [adr, orquestador, agentes, bootstrap, mcp]
status: aceptado
version: 1
---

# ADR-014 — Repo yggdrasil-orquestador como contexto cross-repo para agentes IA

## Estado

**Aceptado** — 2026-07-17

## Contexto

El ecosistema Yggdrasil tiene 14 repos activos, 13 ADRs, +79 issues y protocolos distribuidos en `yggdrasil-dew`. Cada vez que un agente IA (Claude, Perplexity, Gemini) arranca una sesión, necesita re-explicar el ecosistema desde cero o leer decenas de archivos antes de poder actuar.

No existía un punto de entrada único que:
1. Diera contexto completo del ecosistema en un solo documento
2. Tuviera instrucciones específicas por repo/isla
3. Contuviera el BOOTSTRAP raw para pegar en cualquier agente
4. Estuviera siempre sincronizado con el estado real de `yggdrasil-dew`

## Decisión

Crear el repo `yggdrasil-orquestador` como **capa de contexto cross-repo** con la siguiente estructura:

```
yggdrasil-orquestador/
├── BOOTSTRAP.md          ← contexto raw completo (pegar en Claude)
├── AGENT.md              ← instrucciones para agente en este repo
├── CONTEXT.md            ← mapa del ecosistema
├── CHANGELOG.md
├── protocols/
│   ├── boot.md            ← arranque agente nuevo
│   ├── session.md         ← sesión activa
│   └── shutdown.md        ← cierre
├── agents/
│   ├── dew.md             ← instrucciones específicas por repo
│   ├── madre.md
│   ├── thdora.md
│   └── ...
└── .github/workflows/
    └── validate-canon.yml  ← CI que verifica consistencia
```

## Consecuencias

### Positivas
- Un agente nuevo puede arrancar el ecosistema leyendo solo `BOOTSTRAP.md`
- `protocols/boot.md` es el punto de entrada único verificado
- `BOOTSTRAP.md` actúa como prompt de sistema listo para cualquier LLM
- Separa contexto de operación: el orquestador describe, dew ejecuta

### Negativas / riesgos
- **Riesgo de desincronización**: si dew cambia protocolos y el orquestador no se actualiza, los agentes recibión contexto obsoleto
- **Mitigación**: CI `validate-canon.yml` + regla de cierre de sesión: actualizar `BOOTSTRAP.md` si cambia el estado del ecosistema

## Alternativas descartadas

- **README.md gigante en dew**: demasiado acoplado al canon, difícil de separar contexto de documentación
- **AGENT.md de cada repo por separado**: ya existe, pero no da vista cross-repo
- **Notion / Obsidian externos**: fuera del ecosistema git, rompe el principio de fuente única

## Relacionado

- Issue #76 dew (creación del repo)
- Issue #78 dew (correcciones con nombres reales)
- Issue #79 dew (BOOTSTRAP.md v2 con datos terminal)
- ADR-004: MCP como capa de infraestructura
- ADR-008: ADR obligatorio por decisión

---

_v1 · 2026-07-17 · Perplexity MCP_
