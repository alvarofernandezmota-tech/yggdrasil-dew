---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
ruta: protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md
tags: [protocolo, auditoria, ecosistema, alineacion]
status: vigente
---

# Protocolo Auditoría Conjunta del Ecosistema

> Frecuencia: trimestral o tras cualquier renombrado de repo.
> Requiere que las auditorías individuales de cada repo estén al día.
> Ver ADR-002 para el contexto completo.

## Fase 1 — Verificar capa común (todos los repos)

Para cada uno de los 4 repos (`yggdrasil-dew`, `WIKI---PERSONAL`, `yggdrasil-tracking`, `yggdrasil-formacion`):

- [ ] `README.md` existe y está actualizado
- [ ] `now.md` existe y tiene menos de 2 semanas
- [ ] `inbox/` existe
- [ ] `_archivo/` existe

## Fase 2 — Verificar que cada archivo está en el repo correcto

- [ ] ¿Hay protocolos o ADRs fuera de DEW? → mover a DEW
- [ ] ¿Hay conocimiento genérico en tracking? → mover a wiki
- [ ] ¿Hay formación en tracking o DEW? → mover a formacion
- [ ] ¿Hay vida personal en DEW o wiki? → mover a tracking

## Fase 3 — Consistencia de nombres

- [ ] Ejecutar `PROTOCOLO-NOMBRES.md` — buscar nombres incorrectos de repos
- [ ] Verificar que todos los links entre repos usan nombres canónicos
- [ ] Comprobar que el INDEX de la wiki lista todos los repos actuales

## Fase 4 — Frontmatter y tags

- [ ] Muestra aleatoria de 10 archivos por repo — ¿tienen frontmatter completo?
- [ ] Tags consistentes entre repos (mismo vocabulario)
- [ ] Campos `tipo`, `status`, `tags`, `author` presentes en todos

## Fase 5 — Referencias cruzadas

- [ ] Links entre repos funcionan (no rotos)
- [ ] Las ADRs de DEW referencian correctamente los repos implicados
- [ ] El diario de tracking referencia los issues de DEW cuando aplica

## Resultado

Documentar el resultado en un diario de tracking:
`yggdrasil-tracking/diarios/YYYY/MM-mes/YYYY-MM-DD.md`

Y actualizar `docs/ECOSISTEMA-CANON.md` con el nuevo estado.

---
_Creado: 2026-07-13 · Perplexity MCP_
