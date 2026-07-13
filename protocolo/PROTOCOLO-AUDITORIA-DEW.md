---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
ruta: protocolo/PROTOCOLO-AUDITORIA-DEW.md
tags: [protocolo, auditoria, dew]
status: vigente
---

# Protocolo Auditoría DEW

> Frecuencia: mensual o tras cambios grandes en el ecosistema.

## Checklist

### Estructura base
- [ ] `README.md` actualizado y refleja el estado real
- [ ] `now.md` actualizado (no más de 2 semanas de antigüedad)
- [ ] `inbox/` revisado — convertir items en issues o borrar
- [ ] `_archivo/` — mover aquí todo lo obsoleto, nunca borrar sin archivar

### Issues
- [ ] Issues abiertos revisados — ¿alguno se puede cerrar?
- [ ] Issues sin label → añadir label
- [ ] Issues sin milestone → asignar o marcar `backlog`
- [ ] ¿Hay issues duplicados? Cerrar con `duplicate`

### Protocolos (`protocolo/`)
- [ ] Todos los protocolos tienen frontmatter completo
- [ ] No hay protocolos contradictorios entre sí
- [ ] `PROTOCOLO-CIERRE-SESION.md` sigue siendo válido

### Docs y ADRs (`docs/`)
- [ ] Todos los ADRs tienen status (`propuesto` / `aceptado` / `obsoleto`)
- [ ] No hay docs sin frontmatter
- [ ] Referencias a otros repos usan nombres canónicos (#65)

### Canon
- [ ] `docs/ECOSISTEMA-CANON.md` refleja el estado actual
- [ ] Tabla de repos en README actualizada

---
_Creado: 2026-07-13 · Perplexity MCP_
