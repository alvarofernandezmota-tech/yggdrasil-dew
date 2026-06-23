---
tags: [adr, docs-as-code, repos, cerebro, arquitectura]
fecha: 2026-06-23
estado: decision-tomada
tipo: adr
ruta-obsidian: docs/adr/2026-06-23-adr-docs-as-code-repos-cerebro.md
fuente: inbox/2026-06-23-adr-docs-as-code-repos-cerebro.md
---

# ADR — Docs as Code: cómo enlazar repos Docker con el cerebro

> Architecture Decision Record · Sesión 2026-06-23

## Contexto

Cada proyecto tiene su propio repo GitHub (ollama-stack, osint-stack, etc.).
El cerebro (yggdrasil-dew) necesita documentar esos proyectos sin duplicar.

## Decisión

### Regla: el cerebro documenta, el repo implementa

- **Repo del proyecto** (`ollama-stack/`) → código, docker-compose, README técnico
- **Cerebro** (`yggdrasil-dew/setup/servidor/docker-stack.md`) → decisiones, contexto, wikilinks

### Estructura de enlace

```
Cerebro (yggdrasil-dew)
  setup/servidor/docker-stack.md
    → enlaza a: github.com/alvarofernandezmota-tech/ollama-stack
    → documenta: qué hace, por qué, decisiones tomadas

Repo implementación (ollama-stack)
  README.md
    → enlaza a: yggdrasil-dew para contexto
    → contiene: docker-compose.yml, instrucciones técnicas
```

## Consecuencias

- El cerebro no tiene docker-compose.yml — solo documentación
- Los repos de proyectos son autocontenidos técnicamente
- Los wikilinks van del cerebro al repo, no al revés

## Referencias
- [[docs/decisiones/2026-06-23-decision-arquitectura-proyectos]]
- [[setup/servidor/docker-stack]]
