---
tipo: estado
author: Alvaro Fernandez Mota
actualizado: 2026-07-18 00:52 CEST
---

# ESTADO DEL SISTEMA — Yggdrasil

> Última actualización: 2026-07-18 00:52 CEST · Perplexity MCP

## Resumen

| Indicador | Valor |
|---|---|
| Issues abiertos | ~15 |
| Issues críticos (🔴) | 2 (#74 token THDORA, #75 mcp caído) |
| Fases activas | F0 (parcial), F3, F7, F20 |
| Fases cerradas | F1-F19 (excepto F0, F3, F7) |
| Último commit DEW | 527fe59 (ownership-matrix.md eliminado) |
| Repos con AGENT.md | 10/10 ✅ COMPLETO |

## Servicios Madre

| Servicio | Estado |
|---|---|
| Portainer, NPM, Traefik | ✅ |
| Vaultwarden, Jellyfin | ✅ |
| Qdrant | ⚠️ issue #71 |
| yggdrasil-mcp (3001) | 🔴 issue #75 |
| THDORA bot | 🔴 issue #74 token caducado |

## Resuelto esta sesión (2026-07-18)

- ✅ #69 cerrado — F17 NUEVO-DIARIO-TRACKING verificado
- ✅ #73 cerrado — ownership-matrix.md (minúsculas) eliminado
- ✅ AGENT.md creado en yggdrasil-scripts y acer-config — todos los repos completos
- ✅ BOOTSTRAP.md v1.1 actualizado en yggdrasil-orquestador

## Pendiente terminal (no resoluble por MCP)

- #74 token Telegram THDORA — runbook en dew
- #75 puerto 3000/3001 yggdrasil-mcp — runbook en dew
- #71 Qdrant healthcheck — verificar en Madre
- F20 dmidecode CPU/placa Madre
- #15 puerto 21 FTP abierto router
- #31 HDD 28k+ horas smartctl
- #77 auditoría completa (ADR-002 suelto, inventario-madre minúsculas)
- #3 purga WIKI — sesión dedicada con Álvaro

_Actualizar al inicio y cierre de cada sesión._
