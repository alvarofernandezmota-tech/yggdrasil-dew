---
title: Mapa de Islas y Dependencias
tipo: mapa
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-13
ruta: docs/islas/MAPA-ISLAS-DEPENDENCIAS.md
tags: [islas, dependencias, orquestacion, mapa]
status: vigente
---

# 🗺️ Mapa de Islas y Dependencias — Ecosistema Yggdrasil

> Una fila por isla. Se actualiza al cerrar la auditoría de cada isla.
> Este documento es el punto de entrada para entender el estado global del ecosistema.

---

## Estado por isla

| Isla | Repo principal | Estado | Issues abiertos | Última auditoría |
|---|---|---|---|---|
| 🧠 **Cerebro** | [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | ⚪ Pendiente | 23 | — |
| 📖 **Wiki** | [yggdrasil-wiki](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki) | ⚪ Pendiente | — | — |
| 📓 **Tracking** | [yggdrasil-tracking](https://github.com/alvarofernandezmota-tech/yggdrasil-tracking) | 🟡 Activa — recién migrada | 0 | 2026-07-13 |
| ⚙️ **Scripts** | [yggdrasil-scripts](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts) | 🟡 Activa — recién creada | 0 | 2026-07-13 |
| 🛡️ **Seguridad** | [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | 🟡 En auditoría | 6 | 2026-07-12 |
| 🏗️ **Infra** | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) | ⚪ Pendiente | 3 | — |
| 🤖 **THDORA** | [THDORA-PERSONAL](https://github.com/alvarofernandezmota-tech/THDORA-PERSONAL) | ⚪ Pendiente | 10 | — |
| 🧬 **IA Local** | [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) | ⚪ Pendiente | 0 | — |
| 🔬 **Labs** | [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) | ⚪ Pendiente | 0 | — |
| 🕵️ **OSINT** | [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | ⚪ Pendiente | 0 | — |
| 💻 **Acer** | [acer-config](https://github.com/alvarofernandezmota-tech/acer-config) | ⚪ Pendiente | — | — |
| 📚 **Formación** | [yggdrasil-formacion-](https://github.com/alvarofernandezmota-tech/yggdrasil-formacion-) | ⚪ Pendiente post-migración | — | 2026-07-13 |

---

## Dependencias entre islas

| Origen | Destino | Conexión | Issue/HAL | Criticidad |
|---|---|---|---|---|
| Seguridad | Infra | `radar_backup` usa el HDD de Madre — si el disco falla, el backup falla | HAL-005 / [secops#7](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/7) | 🔴🔴 Crítica |
| Seguridad | THDORA | Fix del token Telegram requiere acción en repo THDORA | HAL-003 / [secops#5](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/5) | 🔴 Alta |
| Seguridad | Todas | Vaultwarden gestiona credenciales de todo el ecosistema | HAL-002 / [secops#4](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues/4) | 🔴 Alta |
| Infra | Todas | Madre es el host físico de todos los servicios | — | 🔴🔴 Crítica |
| Scripts | Todas | yggdrasil-scripts orquesta health checks y automatizaciones de todo el ecosistema | — | 🟠 Alta |
| Tracking | Wiki | Contenido personal puede referenciar conocimiento técnico en Wiki | — | 🟡 Media |

> ℹ️ Esta tabla crece con cada isla auditada. Las filas con `—` en Issue/HAL son dependencias estructurales conocidas sin issue específico todavía.

---

## Leyenda de estados

| Estado | Significado |
|---|---|
| 🟢 Auditada | Isla cerrada, todos los issues críticos resueltos, documentación al día |
| 🟡 En auditoría / Activa | Sesión activa o isla reciente, fixes en progreso |
| 🟠 Bloqueada | Tiene dependencias sin resolver de otra isla |
| ⚪ Pendiente | No auditada todavía |
| 🔴 Crítica | Tiene issues críticos sin resolver, requiere atención urgente |

---

## Orden de auditoría planificado

1. 🛡️ **Seguridad** ← en curso
2. 🏗️ **Infra** ← siguiente (desbloquea HAL-005)
3. 🤖 **THDORA** ← desbloquea HAL-003
4. 🧠 **Cerebro** (yggdrasil-dew)
5. 🧬 **IA Local**
6. 💻 **Acer** + 📚 **Formación**
7. 🔬 **Labs** + 🕵️ **OSINT**
8. ⚙️ **Scripts** + 📓 **Tracking** ← nuevas, auditoría completa pendiente

---

_Actualizado: 2026-07-13 · Sesión migración tracking + creación scripts · Perplexity MCP_
