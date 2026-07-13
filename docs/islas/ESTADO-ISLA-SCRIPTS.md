---
title: Estado Isla Scripts
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/islas/ESTADO-ISLA-SCRIPTS.md
tags: [isla, scripts, orquestacion, automatizacion, estado]
status: activa
---

# ⚙️ Estado Isla Scripts

> Isla de orquestación central del ecosistema. Scripts de salud, mantenimiento y GitHub Actions.
> Fuente de verdad: [yggdrasil-scripts](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts)

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 Activa — recién creada, estructura base lista, pendiente poblar |
| **Repo principal** | [yggdrasil-scripts](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts) |
| **Repos secundarios** | — |
| **Issues abiertos** | 0 |
| **Última auditoría** | 2026-07-13 (sesión creación) |

---

## Estructura del repo

```
yggdrasil-scripts/
├── .github/          ← GitHub Actions workflows
├── health/           ← scripts de healthcheck del ecosistema
├── maintenance/      ← scripts de mantenimiento y limpieza
└── README.md
```

---

## Propósito

Este repo es el **hub de orquestación** del ecosistema Yggdrasil:

- Scripts que verifican el estado de todos los repos (health checks)
- Scripts de mantenimiento automatizado (purgas, sincronizaciones)
- GitHub Actions que coordinan workflows entre islas
- Automatizaciones que no pertenecen a una isla específica

---

## Dependencias

| Isla | Conexión |
|---|---|
| Todas | Scripts de health actúan sobre todos los repos |
| Infra (madre-config) | Mantenimiento de servicios en Madre |
| Cerebro (dew) | Puede disparar workflows de auditoría |

---

## Checklist pendiente

- [ ] Poblar `health/` con script de verificación de repos (visibilidad, issues críticos)
- [ ] Poblar `maintenance/` con script de limpieza de archivos zombi
- [ ] Crear primer GitHub Action de health check semanal
- [ ] Definir qué automatizaciones se mueven desde otros repos aquí

---

_Creado: 2026-07-13 · Sesión creación yggdrasil-scripts · Perplexity MCP_
