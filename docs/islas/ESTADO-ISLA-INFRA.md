---
title: Estado Isla Infra
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-12
ruta: docs/islas/ESTADO-ISLA-INFRA.md
tags: [isla, infra, estado, madre]
status: pendiente-auditoria
---

# 🏗️ Estado Isla Infra

> Pendiente de auditoría. Este documento se rellena cuando se inicia la sesión de la isla.
> Fuente de verdad: issues en [madre-config](https://github.com/alvarofernandezmota-tech/madre-config)

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | ⚪ Pendiente de auditoría |
| **Repo principal** | [madre-config](https://github.com/alvarofernandezmota-tech/madre-config) |
| **Ruta física en Madre** | `~/repos/madre-config` |
| **Issues abiertos** | 3 |
| **Última auditoría** | — |

---

## Servicios conocidos

| Servicio | Estado | Notas |
|---|---|---|
| `uptime-kuma` | ⚪ Sin auditar | — |
| `grafana` | ⚪ Sin auditar | — |
| `prometheus` | ⚪ Sin auditar | — |
| `portainer` | ⚪ Sin auditar | — |

---

## Dependencias con otras islas

| Dependencia | Isla | Criticidad |
|---|---|---|
| Madre es el host físico de todos los servicios del ecosistema | Todas | 🔴🔴 Crítica |
| HDD en riesgo (HAL-005) afecta a radar_backup de Seguridad | Seguridad | 🔴🔴 Crítica |

---

## Checklist de auditoría (rellenar en sesión)

- [ ] Verificar estado de todos los contenedores: `docker ps -a`
- [ ] Ejecutar `smartctl -a /dev/sda` y documentar salud del disco
- [ ] Verificar uso de disco: `df -h`
- [ ] Verificar métricas Grafana/Prometheus activas
- [ ] Revisar issues abiertos en madre-config
- [ ] Documentar rutas y compose files activos

---

_Creado: 2026-07-12 · Pendiente de sesión de auditoría · Perplexity MCP_
