---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-18 02:00 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, fases, canon]
status: vigente
---

# MASTER-PENDIENTES — Ecosistema Yggdrasil

> Última actualización: **2026-07-18 02:00 CEST**
> Fuente de verdad de todas las fases activas y cerradas.

---

## ✅ Fases cerradas

| Fase | Descripción | Fecha |
|---|---|---|
| F1 | Estructura base DEW + ADRs 001–007 | 2026-07-06 |
| F2 | AGENT.md + CONTEXT.md en todos los repos | 2026-07-08 |
| F3 | Wiki islas estructura base | 2026-07-09 |
| F4 | Consolidar wiki/islas/mcp.md | 2026-07-09 |
| F5 | Auditoría repo madre-config | 2026-07-09 |
| F6 | ADR-008 a ADR-011 | 2026-07-10 |
| F7 | GitOps + runbooks (parcial) | 2026-07-12 |
| F8 | Inventario servicios Madre | 2026-07-12 |
| F9 | Plan Maestro 2026-07 formalizado | 2026-07-13 |
| F10 | INDEX islas wiki v4 | 2026-07-13 |
| F11 | Regla canon DEW/tracking separados | 2026-07-15 |
| F12 | ADR-012 local-brain como orquestador RAG | 2026-07-16 |
| F13 | Ownership matrix + CONTEXT.md Madre | 2026-07-16 |
| F14 | Runbooks críticos: THDORA + MCP + CRITICOS | 2026-07-16 |
| F15 | THDORA-PERSONAL AGENT.md | 2026-07-16 |
| F16 | Protocolos canon completos + INDEX v5 | 2026-07-17 |
| F17 | Correcciones menores DEW | 2026-07-18 |
| F18 | CONTEXT.md orquestador actualizado | 2026-07-18 |
| F19 | Diario sesión 2026-07-18 mañana | 2026-07-18 |
| F21 | Fusiones wiki 22→16 islas + INDEX v6 | 2026-07-18 |
| F22 | Runbook sesiones-IA creado | 2026-07-18 |
| F23 | Diario sesión 2026-07-18 noche | 2026-07-18 |
| F24 | orquestador.md corregida — THDORA separada | 2026-07-18 |
| F24b | thdora.md isla independiente + redirect agentes | 2026-07-18 |
| F25 | MAPA-CONEXIONES.md creado en DEW | 2026-07-18 |
| F27 | BOOTSTRAP.md v2 actualizado en orquestador | 2026-07-18 |
| F28 | Auditoría completa 22 islas + ecosistema.md actualizado | 2026-07-18 |

---

## 🟡 Fases en curso / parciales

| Fase | Descripción | Bloqueado por |
|---|---|---|
| F0 | Hardware: dmidecode + SSD inventory Madre | Terminal SSH |
| F7 | GitOps: .env.template + env-checker.sh + healthchecks | Terminal SSH |
| F26 | ADR-015 local-brain como motor RAG (formalizar) | Revisar cómo lo ve Álvaro |

---

## 🔴 Pendientes críticos (requieren terminal)

| ID | Descripción | Issue |
|---|---|---|
| HAL-P0 | FTP puerto 21 EXPUESTO | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) |
| HAL-P1 | THDORA token caducado | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) |
| HAL-P2 | yggdrasil-mcp caído puerto 3000/3001 | [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75) |
| HAL-P3 | Qdrant unhealthy falso positivo | [#71](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/71) |
| HAL-P4 | log_guardian_bot crash loop | [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) |
| HAL-P5 | HDD 28k+ horas — planificar sustitución | [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) |
| HAL-P6 | SSH passwords habilitados | [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) |
| HAL-P7 | IaC docker-compose no versionado | [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) |

---

## 🟡 Pendientes documentales (MCP puede ejecutar)

| ID | Descripción | Issue |
|---|---|---|
| DOC-01 | ADR-015 formalizar local-brain como RAG | [#67](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/67) |
| DOC-02 | Isla filosofia.md — bloque 2 (requiere input Álvaro) | [#57](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/57) |
| DOC-03 | WIKI purga archivos obsoletos | [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) |
| DOC-04 | Completar formacion.md + impresion3d.md | [#56](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/56) |
| DOC-05 | Ownership matrix completar cobertura total | [#40](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/40) |
| DOC-06 | BOOTSTRAP.md — cerrar issue #79 | [#79](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/79) |
| **DOC-07** | **F29 — Protocolo maestro auditoría + agente por dominio** | [**#80**](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/80) |
| DOC-08 | PROTOCOLO-INICIO-SESION.md (referenciado en BOOTSTRAP, no existe) | — |
| DOC-09 | PROTOCOLO-CIERRE-SESION.md (referenciado en BOOTSTRAP, no existe) | — |

---

## ⚪ Pendientes bajos / requieren input Álvaro

| ID | Descripción | Issue |
|---|---|---|
| LOW-01 | Isla Thea (iPhone) | [#52](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/52) |
| LOW-02 | Isla Acer | [#51](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/51) |
| LOW-03 | Filosofia.md bloque personal | [#57](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/57) |
| LOW-04 | Refactor diarios VIDAPERSONAL | [#61](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/61) |
| LOW-05 | GitHub Action detector nombres | [#66](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/66) |
| LOW-06 | GOB-001 principios filosofia | [#50](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/50) |

---

## 📋 Sesión 2026-07-18 madrugada (01:00–02:00 CEST)

- F24: `orquestador.md` corregida — THDORA separado del orquestador
- F24b: `thdora.md` isla independiente + redirect `agentes-personales.md`
- F25: `MAPA-CONEXIONES.md` creado en DEW
- F27: `BOOTSTRAP.md` v2 actualizado en orquestador
- F28: Auditoría completa 22 islas wiki — `ecosistema.md` actualizado al estado real F28
- F29: Issue [#80](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/80) — protocolo maestro + agentes por dominio planificado

---

_Actualizado: 2026-07-18 02:00 CEST · Cierre sesión F28+F29 · Perplexity-MCP_
