---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-16T14:35:00+02:00
ruta: docs/canon/ESTADO-SISTEMA.md
tags: [canon, estado, sistema, auditoria]
status: vigente
---

# Estado del Sistema — Yggdrasil

> Snapshot del estado real del ecosistema. Se actualiza cada sesión.
> Para el plan completo: `MASTER-PENDIENTES.md`

---

## 🇪🇸 Mapa completo de repos activos

### Núcleo del Tridente

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | Plan, ADRs, issues, trazabilidad | ✅ Activo · 12 ADRs | 33 abiertos |
| [yggdrasil-wiki](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki) | Conocimiento, ~26 islas | ✅ Activo | 0 |
| [yggdrasil-tracking](https://github.com/alvarofernandezmota-tech/yggdrasil-tracking) | Vida personal, diarios, metas, filosofía | ✅ Activo · reemplaza VIDAPERSONAL | 0 |

### Infraestructura y Operaciones

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [yggdrasil-scripts](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts) | Scripts operativos + CI | ✅ Activo | 0 |
| [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | IaC — configuración servicios | 🟡 IaC pendiente #43 | 3 |
| [acer-config](https://github.com/alvarofernandezmota-tech/acer-config) | Dotfiles Arch/Hyprland | ⚪ Sin auditar | 0 |

### Seguridad

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | Blue team, tripwires, canary | 🟡 local_tripwire — verificar | 6 |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | Spiderfoot, pipelines OSINT | ⚪ Sin auditar | 0 |

### IA y Automatización

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) | Bot Telegram + FastAPI + Ollama | 🟡 Caído — pendiente #45 #46 | 10 |
| [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | LLM local, LiteLLM, Qdrant | ⚪ Sin auditar | 0 |
| [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) | RAG, embeddings, pgvector | ⚪ Sin auditar | 0 |
| [investigacion-ia](https://github.com/alvarofernandezmota-tech/investigacion-ia) | PoCs IA, agentes, arquitecturas | ⚪ Sin auditar | 0 |

### Formación

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [yggdrasil-formacion](https://github.com/alvarofernandezmota-tech/yggdrasil-formacion) | Aprendizaje técnico, cursos, HTB | ✅ Activo · pendiente auditoría | 0 |

### Desarrollo y Labs

| Repo | Propósito | Estado | Issues |
|------|-----------|--------|--------|
| [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | Sandbox dev, experimentos | ⚪ Sin auditar | 0 |
| [ai-toolkit](https://github.com/alvarofernandezmota-tech/ai-toolkit) | Stack IA open source (público) | ⚪ Standalone | 0 |

### Proyectos Públicos / Independientes

| Repo | Propósito | Estado |
|------|-----------|--------|
| [impresion-3d](https://github.com/alvarofernandezmota-tech/impresion-3d) | Anycubic Photon V1, workflow | ✅ Documentado |
| [thea-ia](https://github.com/alvarofernandezmota-tech/thea-ia) | Proyecto anterior IA (Python) | ⚪ Decidir: archivar o integrar (#58) |
| [image-calculator](https://github.com/alvarofernandezmota-tech/image-calculator) | OCR + calculadora (público) | ✅ Standalone |
| [alvarofernandezmota-tech](https://github.com/alvarofernandezmota-tech/alvarofernandezmota-tech) | Profile README | ✅ OK |

### Deprecados

| Repo | Motivo | Sustituido por |
|------|--------|----------------|
| VIDAPERSONAL | Separado en tracking + formacion (ADR-011) | yggdrasil-tracking + yggdrasil-formacion |
| formacion-tech | Renombrado y unificado (2026-07-13) | yggdrasil-formacion |
| yggdrasil-formacion- | Renombrado a yggdrasil-formacion (2026-07-13) | yggdrasil-formacion |

---

## ✅ Issues cerrados — sesión 2026-07-16

| Tarea | Issue | Cuándo |
|-------|-------|--------|
| fix #65 — auditoría consistencia nombres (parcial) | [#65](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/65) | 2026-07-16 |
| NORMAS.md: yggdrasil-formacion sin guión | fix #65 | 2026-07-16 |
| ESTADO-ISLA-FORMACION corregido | fix #65 | 2026-07-16 |
| ESTADO-ISLA-TRACKING corregido | fix #65 | 2026-07-16 |
| MAPA-ISLAS-DEPENDENCIAS corregido | fix #65 | 2026-07-16 |
| ADR-002, ADR-005, ADR-011 corregidos | fix #65 | 2026-07-16 |
| ECOSYSTEM-ARCHITECTURE.md corregido y actualizado | fix #65 | 2026-07-16 |

---

## 🔴 Pendiente — terminal (Álvaro)

| Issue | Descripción | Tiempo est. |
|-------|-------------|-------------|
| [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31) | smartctl HDD 28.000h — HAL-005 crítico | 5 min |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | Rotar token Telegram — HAL-008 | 10 min |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Cerrar puerto 21 FTP router | 10 min |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | IaC: versionar 16 servicios docker-compose | 1h |
| [#61](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/61) | Unificar diarios VIDAPERSONAL (git mv en local) | 15 min |

---

## 🟡 Pendiente MCP (sin terminal)

| Issue | Descripción |
|-------|-------------|
| [#68](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/68) | Recrear protocolos alta prioridad |
| [#65](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/65) | fix consistencia nombres — en progreso |
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3 — purga WIKI |
| [#60](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/60) | F7 — healthchecks + Loki |
| [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35) | AUDIT-002 DEW profunda |

---

## Ecosistema en números — 2026-07-16

| Métrica | Valor |
|---------|-------|
| Repos activos núcleo | 8 |
| Repos sin auditar | 6 |
| ADRs vigentes | 12 (ADR-001 → ADR-012) |
| Issues abiertos DEW | 33 |
| CI activo | gitleaks + validate-canon + markdownlint + ShellCheck |
| Servicios Docker Madre | 16 |
| Bloqueantes terminales | 5 (#31 #45 #15 #43 #61) |
| Protocolos recreados | 5 (apertura, cierre, nombres, auditoría-ecosistema, borrado) |
| Protocolos pendientes recrear | ~17 (ver protocolo/INDEX.md) |

---

_Actualizado: 2026-07-16 14:35 CEST · fix #65 · Perplexity MCP_
