---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
ruta: protocolo/PROTOCOLO-AUDITORIA-WIKI.md
tags: [protocolo, auditoria, wiki]
status: vigente
---

# Protocolo Auditoría Wiki

> Frecuencia: mensual o al añadir más de 5 islas nuevas.

## Checklist

### Estructura base
- [ ] `README.md` actualizado
- [ ] `now.md` actualizado
- [ ] `inbox/` revisado — ideas sin isla → crear isla o descartar
- [ ] `INDEX.md` de islas refleja todas las islas existentes

### Islas (`wiki/islas/`)
- [ ] Todas las islas tienen frontmatter completo (`tipo`, `tags`, `status`)
- [ ] No hay islas con `status: borrador` de más de 1 mes
- [ ] No hay islas huérfanas (sin referencias desde ningún lado)
- [ ] Islas con `status: obsoleto` → mover a `_archivo/`

### Referencias cruzadas
- [ ] Los links internos entre islas funcionan (no rotos)
- [ ] Referencias a repos del ecosistema usan nombres canónicos (#65)
- [ ] La isla `madre.md` refleja el hardware actual

### Consistencia
- [ ] Todas las islas usan el mismo formato de frontmatter
- [ ] Tags consistentes con el vocabulario canónico
- [ ] No hay contenido duplicado entre dos islas

---
_Creado: 2026-07-13 · Perplexity MCP_
