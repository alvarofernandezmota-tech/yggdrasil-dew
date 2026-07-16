---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-RITUAL-SEMANAL.md
tags: [protocolo, ritual, semanal, mantenimiento]
status: vigente
version: 1.0
---

# PROTOCOLO-RITUAL-SEMANAL v1.0

> Checklist de mantenimiento semanal del ecosistema Yggdrasil.
> Ejecutar cada domingo. Duracion estimada: 30-60 minutos.
> Primera ejecucion: domingo 2026-07-19.

---

## BLOQUE 1 — Revision de maestros (10 min)

```
[ ] Leer MASTER-PENDIENTES.md — hay algo que deberia estar cerrado?
[ ] Leer ESTADO-SISTEMA.md — refleja el estado real de esta semana?
[ ] Revisar protocolo/INDEX.md — algun protocolo nuevo sin registrar?
[ ] Revisar docs/adr/INDEX-ADR.md — algun ADR nuevo sin registrar?
```

---

## BLOQUE 2 — Issues abiertos (10 min)

```
[ ] Revisar todos los issues abiertos en yggdrasil-dew
[ ] Cerrar los que esten resueltos
[ ] Actualizar los que tengan nueva informacion
[ ] Crear issues para pendientes que no esten todavia documentados
[ ] Verificar bloqueantes criticos (#31 HDD / #45 Telegram / #15 FTP)
```

---

## BLOQUE 3 — Diarios (5 min)

```
[ ] Hay diarios DEW de la semana sin completar?
[ ] Hay diarios TRACKING de la semana sin completar?
[ ] Si hay plantillas vacias -> completarlas o borrarlas
```

---

## BLOQUE 4 — Salud del ecosistema (10 min)

```
[ ] CI de yggdrasil-dew: verde?
[ ] CI de yggdrasil-wiki: verde?
[ ] CI de yggdrasil-formacion: verde?
[ ] Algun repo con PR abierta sin revisar?
[ ] Algun repo con rama huerfana?
```

---

## BLOQUE 5 — Sincronizacion rapida (5 min)

```
[ ] Ejecutar PROTOCOLO-SINCRONIZACION-ECOSISTEMA (version rapida)
[ ] Verificar que MASTER-PENDIENTES refleja el estado post-semana
[ ] Actualizar campo 'actualizado' en ESTADO-SISTEMA si cambio algo
```

---

## BLOQUE 6 — Intencion de la semana siguiente (5 min)

```
[ ] Que fase o tarea es la prioridad de la semana que viene?
[ ] Anotarlo en MASTER-PENDIENTES o en el diario DEW del domingo
[ ] Si hay bloqueantes de terminal -> agendar sesion con Madre
```

---

## Cadencia

```
RITUAL-SEMANAL    domingo         30-60 min
AUDITORIA         primer domingo  de cada mes   2-3 horas
```

---

## Relacionado

- PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md
- PROTOCOLO-AUDITORIA-ECOSISTEMA.md
- MASTER-PENDIENTES.md
- ESTADO-SISTEMA.md

---

_Creado: 2026-07-16 v1.0 F17 Perplexity MCP_
