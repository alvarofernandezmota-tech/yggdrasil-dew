---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-AUDITORIA-DEW.md
tags: [protocolo, auditoria, dew, canon, consistencia]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-DEW v1.0

> Protocolo de auditoría completa del repo `yggdrasil-dew`.
> Ejecutar: al inicio de cada ciclo mensual o tras cambios estructurales grandes.
> Tiempo estimado: 30-45 min con MCP.

---

## Fase 1: Estructura y zombis

```
[ ] Listar raíz del repo — verificar que no hay archivos inesperados
[ ] Verificar que docs/diarios/ solo contiene YYYY-MM-DD.md (sin sufijos)
[ ] Verificar que docs/adr/ tiene INDEX-ADR.md actualizado
[ ] Verificar que docs/islas/ tiene ESTADO-ISLA-*.md para cada isla del ecosistema
[ ] Verificar que docs/canon/ tiene: ESTADO-SISTEMA, PLANTILLA-DIARIO, NORMA-ENTRADA-NUEVA-ISLA
[ ] Verificar que protocolo/ tiene INDEX.md actualizado
[ ] Detectar archivos con 0 bytes o solo título (zombis) — borrar o completar
```

---

## Fase 2: Frontmatter

```
[ ] Verificar que todos los .md tienen frontmatter válido
[ ] Campos obligatorios: tipo, author, creado, actualizado, ruta, tags, status
[ ] Campo 'actualizado' refleja fecha real de la última modificación
[ ] Campo 'ruta' coincide con la ruta real del archivo en el repo
```

---

## Fase 3: Consistencia de nombres

```
[ ] Buscar referencias a 'yggdrasil-formacion-' (con guión) — corregir a 'yggdrasil-formacion'
[ ] Buscar referencias a 'formacion-tech' — corregir a 'yggdrasil-formacion'
[ ] Buscar referencias a 'WIKI---PERSONAL' — corregir a 'yggdrasil-wiki'
[ ] Buscar referencias a 'VIDAPERSONAL' — verificar contexto (histórico OK, activo → corregir)
[ ] Verificar tabla MAPA-ISLAS-DEPENDENCIAS coincide con repos reales del ecosistema
[ ] Verificar tabla ESTADO-SISTEMA coincide con repos reales
```

---

## Fase 4: ADRs

```
[ ] Verificar INDEX-ADR.md tiene todos los ADRs de docs/adr/
[ ] Verificar que no hay ADRs sin INDEX entry
[ ] Verificar que ADRs con status 'vigente' no tienen contradicciones entre sí
[ ] Verificar que ADR-011 y NORMAS.md tienen nombres correctos (sin guión)
```

---

## Fase 5: Protocolos

```
[ ] Verificar protocolo/INDEX.md tiene todos los protocolos de protocolo/
[ ] Verificar estado real de cada protocolo (vigente / pendiente)
[ ] Actualizar MASTER-PENDIENTES canon protocolos con estado real
```

---

## Fase 6: Issues

```
[ ] Listar issues abiertos en DEW
[ ] Verificar que MASTER-PENDIENTES refleja los issues abiertos reales
[ ] Cerrar issues que ya estén resueltos pero no cerrados
[ ] Detectar issues duplicados
```

---

## Fase 7: Cierre de auditoría

```
[ ] Actualizar docs/canon/ESTADO-SISTEMA.md con hallazgos
[ ] Actualizar MASTER-PENDIENTES.md
[ ] Actualizar docs/islas/ESTADO-ISLA-DEW.md si existe
[ ] Escribir entrada en diario del día con resumen de auditoría
[ ] Cerrar issue de auditoría si existía (#35 AUDIT-002)
```

---

_Creado: 2026-07-16 · F14 Protocolo Auditoría DEW v1.0 · Perplexity MCP_
