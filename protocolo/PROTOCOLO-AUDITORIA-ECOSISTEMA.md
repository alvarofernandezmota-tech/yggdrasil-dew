---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md
tags: [protocolo, auditoria, ecosistema, global]
status: vigente
version: 1.0
---

# PROTOCOLO-AUDITORIA-ECOSISTEMA v1.0

> Revision profunda y completa de todo el ecosistema.
> Diferencia con SINCRONIZACION: la sincronizacion verifica consistencia entre maestros.
> La auditoria verifica que el contenido real es correcto, completo y sin deuda tecnica.
> Frecuencia: primer domingo de cada mes / antes de incorporar THDORA.
> Tiempo estimado: 60-90 min.

---

## Fase 1: Auditoria de repos

```
[ ] Todos los repos nucleo existen y tienen nombre canonico:
    yggdrasil-dew / yggdrasil-wiki / yggdrasil-tracking / yggdrasil-formacion
[ ] Ningun repo con nombre incorrecto (sin guion final, sin 'formacion-tech')
[ ] Repos privados que deben ser privados: tracking
[ ] Repos publicos que deben ser publicos: dew, wiki, formacion
[ ] Estado de cada repo: activo / mantenimiento / abandonado
```

---

## Fase 2: Auditoria de canon (DEW)

```
[ ] docs/canon/ESTADO-SISTEMA.md actualizado y correcto
[ ] MASTER-PENDIENTES.md refleja estado real de fases e issues
[ ] NORMAS.md vigente y sin contradicciones
[ ] docs/adr/INDEX-ADR.md completo (todos los ADRs tienen entrada)
[ ] protocolo/INDEX.md completo (todos los protocolos tienen entrada)
[ ] docs/canon/PLANTILLA-*.md existe para cada tipo de contenido
```

---

## Fase 3: Auditoria por repo

```
[ ] Ejecutar PROTOCOLO-AUDITORIA-DEW.md
[ ] Ejecutar PROTOCOLO-AUDITORIA-WIKI.md
[ ] Ejecutar PROTOCOLO-AUDITORIA-TRACKING.md
[ ] Ejecutar PROTOCOLO-AUDITORIA-FORMACION.md
```

---

## Fase 4: Auditoria de seguridad

```
[ ] Ejecutar PROTOCOLO-SECRETOS.md -> escaneo de credenciales
[ ] Verificar que ningun repo publico tiene tokens/IPs/passwords
[ ] Puerto 21 FTP -> verificar estado (issue #15)
[ ] SSH configurado correctamente en Madre
```

---

## Fase 5: Auditoria de deuda tecnica

```
[ ] Issues abiertos en DEW con mas de 30 dias -> revisar si siguen vigentes
[ ] ADRs en estado 'propuesto' con mas de 14 dias -> decidir o cerrar
[ ] Protocolos con version 1.0 y mas de 90 dias -> candidatos a revision
[ ] Islas con estado 'borrador' con mas de 30 dias -> completar o deprecar
[ ] Diarios de tracking con status 'borrador' -> completar o marcar retrospectivo
```

---

## Fase 6: Cierre de auditoria

```
[ ] Registrar resultado en diario DEW del dia
[ ] Abrir issues para cada problema encontrado (uno por problema)
[ ] Actualizar MASTER-PENDIENTES con nuevas tareas detectadas
[ ] Actualizar ESTADO-SISTEMA con fecha de ultima auditoria
[ ] Si se encontraron >5 problemas -> planificar sesion de resolucion
```

---

## Relacionado

- PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md (mas ligero, ejecutar antes)
- PROTOCOLO-AUDITORIA-DEW/WIKI/TRACKING/FORMACION.md
- PROTOCOLO-SECRETOS.md
- MASTER-PENDIENTES.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
