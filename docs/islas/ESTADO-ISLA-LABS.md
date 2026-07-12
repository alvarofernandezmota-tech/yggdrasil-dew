---
title: Estado Isla Labs
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-12
ruta: docs/islas/ESTADO-ISLA-LABS.md
tags: [isla, labs, estado, dev-labs, osint]
status: pendiente-auditoria
---

# 🔬 Estado Isla Labs

> Pendiente de auditoría. Agrupa dev-labs y osint-stack.
> Sin issues abiertos conocidos en ninguno de los dos repos.

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | ⚪ Pendiente de auditoría |
| **Repos** | [dev-labs](https://github.com/alvarofernandezmota-tech/dev-labs) + [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) |
| **Ruta física en Madre** | `~/repos/dev-labs` (docker-compose en `/home/varopc/docker-compose.yml`) |
| **Issues abiertos** | 0 |
| **Última auditoría** | — |

---

## Servicios conocidos

| Servicio | Repo | Estado | Notas |
|---|---|---|---|
| `kali-pentest` | dev-labs | ⚪ Sin auditar | Compose en `/home/varopc/` ⚠️ |
| `spiderfoot` | dev-labs | ⚪ Sin auditar | Compose en `/home/varopc/` ⚠️ |

> ⚠️ El compose de Labs vive en `/home/varopc/docker-compose.yml` suelto, no en el repo. Pendiente de mover a `~/repos/dev-labs/`.

---

## Checklist de auditoría (rellenar en sesión)

- [ ] Mover `docker-compose.yml` de `/home/varopc/` a `~/repos/dev-labs/`
- [ ] Verificar estado de kali-pentest y spiderfoot
- [ ] Auditar osint-stack: qué herramientas hay, si están activas
- [ ] Decidir si Labs y OSINT son una isla o dos

---

_Creado: 2026-07-12 · Pendiente de sesión de auditoría · Perplexity MCP_
