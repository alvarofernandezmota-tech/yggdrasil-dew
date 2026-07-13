---
tipo: adr
numero: ADR-003
titulo: Convención de islas como unidad de organización del ecosistema
estado: Vigente
fecha: 2026-07-09
author: Alvaro Fernandez Mota
supercede: —
superada_por: —
tags: [adr, islas, convencion, organizacion, ecosistema]
---

# ADR-003 — Convención de islas como unidad de organización

## Contexto

El ecosistema tenía repos sin agrupación semántica. Era difícil comunicar qué hace cada parte del sistema o priorizar auditorías. Se necesitaba una metáfora de alto nivel que agrupara repos relacionados y permitiera razonar sobre el ecosistema completo.

## Decisión

El ecosistema se organiza en **islas**. Cada isla es un dominio funcional independiente compuesto por uno o varios repos.

### Islas actuales

| Isla | Repo principal | Rol |
|---|---|---|
| 🛡️ Seguridad | yggdrasil-secops | Blue team, auditorías, SIEM |
| 🏗️ Infra | madre-config | IaC, servidor Madre, Docker stacks |
| 🧠 Cerebro | yggdrasil-dew | Estado operativo, canon, ADRs |
| 📖 Wiki | yggdrasil-wiki | Conocimiento técnico, fichas de islas |
| 🤖 THDORA | THDORA-PERSONAL | Bot IA personal |
| 🧬 IA Local | ollama-stack | Modelos locales, embeddings |
| 🔬 Labs | dev-labs | Experimentos, prototipos |
| 🕵️ OSINT | osint-stack | Herramientas de reconocimiento |
| 🏠 Vida Personal | VIDAPERSONAL | Segundo cerebro personal |

### Reglas de la convención

1. Cada isla tiene una **ficha** en `yggdrasil-wiki/wiki/islas/`
2. El índice maestro vive en `yggdrasil-wiki/wiki/islas/INDEX.md`
3. Cada isla tiene un **ESTADO-ISLA-*.md** en `yggdrasil-dew/docs/islas/`
4. La auditoría del ecosistema se planifica isla a isla, siguiendo el orden del MAPA-ISLAS-DEPENDENCIAS.md

## Alternativas consideradas

| Alternativa | Por qué se descartó |
|---|---|
| Organización por tecnología (Docker, Python, etc.) | No refleja dominio funcional; un repo puede usar múltiples tecnologías |
| Organización plana sin agrupación | No escala al crecer el número de repos |
| Organización por equipo/persona | Solo hay un desarrollador; no aporta valor |

## Consecuencias

- **Positivas:** El estado del ecosistema completo es visible en una tabla. Auditorías planificables por isla. Fácil de explicar a terceros.
- **Negativas / trade-offs:** Un repo nuevo requiere decisión consciente sobre a qué isla pertenece.

## Referencias

- [docs/islas/MAPA-ISLAS-DEPENDENCIAS.md](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/blob/main/docs/islas/MAPA-ISLAS-DEPENDENCIAS.md)
- [wiki/islas/INDEX.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/INDEX.md)
- [Issue #35 AUDIT-002](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35)

---

_Creado: 2026-07-13 · Retroactivo a sesión 2026-07-09 · Perplexity-MCP_
