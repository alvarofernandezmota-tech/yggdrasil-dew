---
tipo: adr
numero: ADR-002
titulo: Triángulo maestro DEW ↔ WIKI ↔ VIDAPERSONAL
estado: Vigente
fecha: 2026-07-12
author: Alvaro Fernandez Mota
supercede: —
superada_por: —
tags: [adr, triangulo, dew, wiki, vidapersonal, ecosistema]
---

# ADR-002 — Triángulo maestro DEW ↔ WIKI ↔ VIDAPERSONAL

## Contexto

Tres repos acumulaban contenido solapado sin reglas claras de qué vive dónde:
- `yggdrasil-dew` — cerebro operativo y estado del sistema
- `yggdrasil-wiki` — conocimiento técnico y documentación de islas
- `VIDAPERSONAL` — segundo cerebro personal, diarios, hábitos

Sin fronteras claras, el mismo concepto aparecía en los tres repos con versiones distintas.

## Decisión

La **regla de oro del triángulo**:

| Repo | Qué contiene | Qué NO contiene |
|---|---|---|
| **DEW** | Estado operativo, HALs, canon del sistema, ADRs, sesiones | Conocimiento general, datos personales |
| **WIKI** | Conocimiento técnico, fichas de islas, how-tos, arquitectura | Estado operativo en tiempo real, datos personales |
| **VIDAPERSONAL** | Diarios, hábitos, metas, proyectos personales | Infra, conocimiento técnico replicable |

Cada repo enlaza a los otros dos en su README. El índice de islas vive ÚNICAMENTE en `yggdrasil-wiki/wiki/islas/INDEX.md`.

## Alternativas consideradas

| Alternativa | Por qué se descartó |
|---|---|
| Todo en DEW | DEW se convierte en un cajón de sastre inutilizable |
| Fusionar WIKI y VIDAPERSONAL | Mezcla conocimiento técnico público con datos personales privados |
| Sin reglas, gestión caso a caso | Estado previo: demostró generar deuda de desorientación |

## Consecuencias

- **Positivas:** Un solo sitio verdad por tipo de contenido. DEW puede ser público algún día sin exponer vida personal.
- **Negativas / trade-offs:** Requiere decidir conscientemente dónde va cada documento nuevo.

## Referencias

- [Issue #47 DEW — triángulo cerrado](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/47)
- [wiki/islas/INDEX.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/INDEX.md)
- [wiki/islas/VIDAPERSONAL.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/VIDAPERSONAL.md)

---

_Creado: 2026-07-13 · Decisión tomada 2026-07-12 · Perplexity-MCP_
