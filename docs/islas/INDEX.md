---
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17
ruta: docs/islas/INDEX.md
tags: [islas, indice, canon]
status: vigente
version: 1
---

# 🌍 Índice de Islas — Ecosistema Yggdrasil

> Mapa completo de todas las islas del ecosistema.
> Cada isla = un dominio funcional con su propio repo y estado.
> Actualizar este índice cuando cambie el estado de una isla.

---

## Islas activas

| Isla | Repo | Estado | ESTADO-ISLA |
|---|---|---|---|
| **Gobernanza** | `yggdrasil-dew` | ✅ Activa | — (este repo) |
| **Infra / Madre** | `madre-config` | 🔴 16 composes sin versionar | [ESTADO-ISLA-INFRA.md](ESTADO-ISLA-INFRA.md) |
| **Seguridad** | `yggdrasil-secops` | 🟡 Auditoria fase 1 pendiente | [ESTADO-ISLA-SEGURIDAD.md](ESTADO-ISLA-SEGURIDAD.md) |
| **THDORA** | `THDORA-PERSONAL` | ⚠️ Token Telegram pendiente (#74) | [ESTADO-ISLA-THDORA.md](ESTADO-ISLA-THDORA.md) |
| **IA Local** | `ollama-stack` + `local-brain` | 🟡 Qdrant unhealthy (#71) | [ESTADO-ISLA-IA-LOCAL.md](ESTADO-ISLA-IA-LOCAL.md) |
| **Tracking** | `yggdrasil-tracking` | ✅ Activa | [ESTADO-ISLA-TRACKING.md](ESTADO-ISLA-TRACKING.md) |
| **Scripts / CI** | `yggdrasil-scripts` | 🟡 Creado · pendiente poblar | [ESTADO-ISLA-SCRIPTS.md](ESTADO-ISLA-SCRIPTS.md) |
| **Acer** | `acer-config` | 🔴 Vacío | [ESTADO-ISLA-ACER.md](ESTADO-ISLA-ACER.md) |
| **Cerebro / MCP** | `yggdrasil-orquestador` | 🟡 BOOTSTRAP.md v1 | [ESTADO-ISLA-CEREBRO.md](ESTADO-ISLA-CEREBRO.md) |
| **Formación** | `formacion-tech` | 🟡 Estructura · contenido pendiente | [ESTADO-ISLA-FORMACION.md](ESTADO-ISLA-FORMACION.md) |
| **Labs** | `dev-labs` | 🔴 Vacío sandbox | [ESTADO-ISLA-LABS.md](ESTADO-ISLA-LABS.md) |
| **Wiki** | `WIKI---PERSONAL` | ✅ 25 islas · branch protection | [ESTADO-ISLA-WIKI.md](ESTADO-ISLA-WIKI.md) |
| **Madre Config** | `madre-config` | 🔴 IaC pendiente versionar (#43) | [ESTADO-ISLA-MADRE-CONFIG.md](ESTADO-ISLA-MADRE-CONFIG.md) |
| **Orquestador** | `yggdrasil-orquestador` | 🟡 Recién creado | [ESTADO-ISLA-ORQUESTADOR.md](ESTADO-ISLA-ORQUESTADOR.md) |

---

## Leyenda

| Símbolo | Significado |
|---|---|
| ✅ | Operativa y al día |
| 🟡 | Activa pero con deuda técnica |
| ⚠️ | Requiere acción pronto |
| 🔴 | Bloqueada o vacía |

---

## Mapa de dependencias

Ver [`MAPA-ISLAS-DEPENDENCIAS.md`](MAPA-ISLAS-DEPENDENCIAS.md)

---

_v1 · 2026-07-17 · Creado · Perplexity MCP_
