---
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-13
ruta: docs/adr/ADR-005-normas-tridente-dew-wiki-vidapersonal.md
tags: [adr, tridente, normas, tracking, formacion]
status: vigente
---

# ADR-005 — Normas del Tridente: DEW + WIKI + vida

## Contexto

Convenio formal de qué va en cada vértice del Tridente para evitar duplicados y desalineaciones.

> **Actualización 2026-07-13 (ADR-011):** `VIDAPERSONAL` fue reemplazado por `yggdrasil-tracking` (vida personal)
> y `yggdrasil-formacion-` (aprendizaje técnico). Las normas aplican igualmente a los dos repos nuevos.

## Normas

### DEW (`yggdrasil-dew`)
- Decisiones de arquitectura (ADRs)
- Diarios técnicos de sesión
- Estado del sistema (ESTADO-SISTEMA.md)
- Normas del ecosistema (este archivo referencia NORMAS.md)
- Hallazgos técnicos

### WIKI (`yggdrasil-wiki`)
- Islas temáticas: qué existe y por qué
- MODELO-MENTAL y mapas conceptuales
- Referencias a repos canonicos para cada tema
- Sin comandos, sin secretos, sin operaciones

### TRACKING (`yggdrasil-tracking`) — antes VIDAPERSONAL
- Diarios personales (no técnicos)
- Metas de vida
- Reflexiones y filosofía personal
- Hábitos y tracking personal
- Proyectos personales no técnicos

### FORMACIÓN (`yggdrasil-formacion-`)
- Apuntes técnicos por área
- Cursos y plataformas de aprendizaje
- HTB, TryHackMe y similares
- Skills y competencias en desarrollo

## Criterio de desempate

```
¿Es accionable con fecha?       → DEW (issue)
¿Es concepto o mapa?            → WIKI
¿Es vida personal o reflexión? → TRACKING
¿Es aprendizaje técnico?       → FORMACIÓN
¿No encaja en ninguno?          → Nueva isla + ADR
```

## Relacionado

- ADR-002: el triángulo
- ADR-011: separación tracking/formacion
- NORMAS.md: Regla de fronteras personales/técnicas

---

_Creado: 2026-07-06 · Actualizado: 2026-07-13 (ADR-011 — VIDAPERSONAL → tracking+formacion) · Perplexity MCP_
