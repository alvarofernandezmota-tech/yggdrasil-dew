---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
tags: [protocolo, index, gobernanza]
status: vigente
---

# Índice de Protocolos — Ecosistema Yggdrasil

> Este archivo es el punto de entrada a todos los protocolos del ecosistema.
> Cada protocolo cubre **una sola cosa** y está nombrado para que se entienda sin abrirlo.
>
> Los protocolos viven en `yggdrasil-dew/protocolo/` porque DEW es el canon técnico y de gobernanza.
> Son la capa operativa que conecta DEW + WIKI + tracking + formacion + Madre + hardware.

---

## Nivel 0 — Sesión (uso diario)

> Los que tocas en cada sesión de trabajo con IA o en el ecosistema.

| Protocolo | Para qué | Cuándo usarlo |
|---|---|---|
| [PROTOCOLO-APERTURA-SESION](./PROTOCOLO-APERTURA-SESION.md) | Cómo empezar una sesión con IA correctamente | Al inicio de cada sesión |
| [PROTOCOLO-CIERRE-SESION](./PROTOCOLO-CIERRE-SESION.md) | Cómo cerrar una sesión — issues, diario, commits | Al final de cada sesión |
| [PROTOCOLO-IA](./PROTOCOLO-IA.md) | Reglas de uso de agentes IA en el ecosistema | Siempre que trabajas con Perplexity, Claude, TOKI |

---

## Nivel 1 — Gobernanza (uso ocasional)

> Los que definen cómo crece y se mantiene el ecosistema.

| Protocolo | Para qué | Cuándo usarlo |
|---|---|---|
| [PROTOCOLO-NUEVO-REPO](./PROTOCOLO-NUEVO-REPO.md) | Checklist al crear un repo nuevo | Al crear un repo |
| [PROTOCOLO-NOMBRES](./PROTOCOLO-NOMBRES.md) | Nombres canónicos de repos, archivos, ramas | Cuando hay duda sobre cómo nombrar algo |
| [PROTOCOLO-ADR](./PROTOCOLO-ADR.md) | Cómo redactar y registrar una ADR | Al tomar una decisión técnica importante |
| [PROTOCOLO-ISSUE](./PROTOCOLO-ISSUE.md) | Cómo abrir, gestionar y cerrar issues bien | Al abrir cualquier issue en DEW |
| [PROTOCOLO-NUEVA-ISLA](./PROTOCOLO-NUEVA-ISLA.md) | Cómo crear una isla nueva en WIKI---PERSONAL | Al añadir conocimiento nuevo a la wiki |

---

## Nivel 2 — Operacional / Infraestructura (uso técnico)

> Los que cubren el día a día de Madre y sus servicios.

| Protocolo | Para qué | Cuándo usarlo |
|---|---|---|
| [PROTOCOLO-DOCKER-DEPLOY](./PROTOCOLO-DOCKER-DEPLOY.md) | Cómo hacer cambios en servicios Docker de Madre | Antes de cualquier `docker compose up` en prod |
| [PROTOCOLO-NUEVO-SERVICIO](./PROTOCOLO-NUEVO-SERVICIO.md) | Checklist al añadir un servicio nuevo a Madre | Al levantar un servicio nuevo |
| [PROTOCOLO-NUEVA-MAQUINA](./PROTOCOLO-NUEVA-MAQUINA.md) | Onboarding de hardware nuevo al ecosistema | Al añadir Madre 2, Thea 2, SBC, etc. |
| [PROTOCOLO-BACKUP](./PROTOCOLO-BACKUP.md) | Qué se hace backup, cuándo, y DRP si Madre muere | Semanal + antes de cambios grandes |

---

## Nivel 3 — Seguridad (uso crítico)

> Los que protegen el ecosistema. Prioridad máxima si algo falla.

| Protocolo | Para qué | Cuándo usarlo |
|---|---|---|
| [PROTOCOLO-SECRETOS](./PROTOCOLO-SECRETOS.md) | Reglas absolutas para no exponer `.env` ni tokens | Siempre — es una regla permanente |
| [PROTOCOLO-ROTACION-SECRETOS](./PROTOCOLO-ROTACION-SECRETOS.md) | Calendario y procedimiento de rotación periódica | Cada 3-6 meses según el secreto |
| [PROTOCOLO-INCIDENTE](./PROTOCOLO-INCIDENTE.md) | Respuesta a incidentes HAL — diagnóstico y cierre | Cuando cae un servicio o hay anomalía |

---

## Nivel 4 — Auditoría (uso periódico)

> Los que garantizan que el ecosistema no se deteriora con el tiempo.

| Protocolo | Para qué | Cuándo usarlo |
|---|---|---|
| [PROTOCOLO-AUDITORIA-DEW](./PROTOCOLO-AUDITORIA-DEW.md) | Auditar el estado de DEW — issues, ADRs, protocolos | Mensual |
| [PROTOCOLO-AUDITORIA-WIKI](./PROTOCOLO-AUDITORIA-WIKI.md) | Auditar el estado de WIKI---PERSONAL | Mensual |
| [PROTOCOLO-AUDITORIA-ECOSISTEMA](./PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | Auditoría completa de los 4 repos + hardware | Trimestral |
| [PROTOCOLO-MANTENIMIENTO](./PROTOCOLO-MANTENIMIENTO.md) | Mantenimiento preventivo de Madre | Semanal / mensual |
| [PROTOCOLO-SEMANAL](./PROTOCOLO-SEMANAL.md) | Revisión semanal del ecosistema | Cada lunes |
| [PROTOCOLO-CIERRE-MES](./PROTOCOLO-CIERRE-MES.md) | Cierre mensual — estado, métricas, planificación | Último día del mes |

---

## Nivel 5 — Sistemas avanzados (en desarrollo)

> Protocolos que dependen de componentes del ecosistema aún en construcción.

| Protocolo | Para qué | Estado |
|---|---|---|
| [PROTOCOLO-LOCAL-BRAIN](./PROTOCOLO-LOCAL-BRAIN.md) | Indexación RAG del ecosistema en Qdrant | 🟡 Borrador — depende de issue #67 |

---

## Mapa de dependencias

```
Nivel 0 (Sesión)
  └── APERTURA → IA → CIERRE

Nivel 1 (Gobernanza)
  ├── NUEVO-REPO → NOMBRES
  ├── ADR (decisiones técnicas)
  ├── ISSUE (trazabilidad)
  └── NUEVA-ISLA (wiki)

Nivel 2 (Operacional)
  ├── NUEVA-MAQUINA → NUEVO-SERVICIO → DOCKER-DEPLOY
  └── BACKUP (protege todo lo anterior)

Nivel 3 (Seguridad)
  ├── SECRETOS (regla permanente)
  ├── ROTACION-SECRETOS (periódico)
  └── INCIDENTE (reactivo)

Nivel 4 (Auditoría)
  ├── SEMANAL → CIERRE-MES
  ├── AUDITORIA-DEW + AUDITORIA-WIKI
  ├── AUDITORIA-ECOSISTEMA (trimestral)
  └── MANTENIMIENTO

Nivel 5 (Avanzado)
  └── LOCAL-BRAIN (pendiente #67)
```

---

## Stats

- **Total protocolos**: 21
- **Vigentes**: 20
- **En borrador**: 1 (LOCAL-BRAIN)
- **Última actualización**: 2026-07-13

---

> Para crear un protocolo nuevo → seguir `PROTOCOLO-ISSUE.md` y abrir un issue con label `docs`.
> Commit de nuevo protocolo: `docs: nuevo PROTOCOLO-<NOMBRE>.md`

---
_Creado: 2026-07-13 · Perplexity MCP_
