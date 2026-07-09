---
title: Herramientas del Ecosistema
tipo: canon
creado: 2026-07-09
actualizado: 2026-07-09 23:20 CEST
status: vigente
ruta: docs/canon/HERRAMIENTAS-ECOSISTEMA.md
tags: [canon, herramientas, workflows, ci, github-actions]
---

# Herramientas del Ecosistema

> Registro canónico de todas las herramientas, CIs y automatizaciones.
> **Si añades una herramienta nueva → actualiza este archivo primero.**
> Esto evita duplicados y solapamientos como el detectado el 2026-07-09.

---

## Regla de oro

**Antes de crear un workflow nuevo:**
1. Revisar esta tabla
2. ¿Ya lo hace alguno existente? → NO duplicar, extender el existente
3. Si es nuevo scope → añadir aquí + crear el workflow
4. Commit: `ci(scope): descripción`

---

## GitHub Actions — yggdrasil-dew

| Workflow | Archivo | Scope | Trigger | Responsable |
|---|---|---|---|---|
| Gitleaks Secret Scan | `gitleaks.yml` | Scan secretos en todo el repo | push + PR a main | Gitleaks oficial |
| Validate Canon | `validate-canon.yml` | Estructura docs/canon/, frontmatter, ADRs | push a docs/** y **.md | MCP |
| Validate Wiki Alignment | `validate-wiki-alignment.yml` | Diario reciente + islas WIKI cross-repo | schedule 08:00 UTC + manual | MCP |

### ⚠️ Separación de responsabilidades

```
gitleaks.yml          → SECRETOS (tokens, passwords, keys)
validate-canon.yml    → ESTRUCTURA CANON DEW (archivos, frontmatter)
validate-wiki-alignment.yml → CONTINUIDAD (diario) + ALINEACIÓN WIKI
```

**Nunca solapar estos tres scopes.** Si un check encaja en uno existente → va ahí.

---

## GitHub Actions — otros repos

| Repo | Workflow | Scope | Notas |
|---|---|---|---|
| `yggdrasil-secops` | Por definir | SecOps CI | Pendiente auditoría mañana |
| `WIKI---PERSONAL` | Ninguno aún | — | WIKI es solo docs, no necesita CI complejo |
| `thdora-personal` | Por definir | Bot deploy | Pendiente |

---

## Herramientas MCP activas

| Herramienta | Scope | Dónde está configurada |
|---|---|---|
| GitHub MCP Server | Operaciones GitHub via chat | Cursor / cliente MCP |
| Perplexity AI | Investigación + ejecución | Chat |

---

## Dockers en Madre (pendiente auditoría)

> ⚠️ Esta sección se completa mañana tras `docker ps` en Madre.
> Ver issue #38 o similar en yggdrasil-secops.

| Contenedor | Propósito | Estado | Documentado en |
|---|---|---|---|
| watchdog | Monitor servicios | 🟡 Pendiente verificar | Por documentar |
| tailscale_monitor | Monitor Tailscale | 🟡 Pendiente verificar | Por documentar |
| tripwire | IDS ficheros | 🟡 Pendiente verificar | Por documentar |
| radar | Monitor red | 🟡 Pendiente verificar | Por documentar |

---

## Historial de cambios

| Fecha | Cambio | Motivo |
|---|---|---|
| 2026-07-09 | Creado este archivo | Detectado solapamiento entre workflows. validate-wiki-alignment solapaba con gitleaks y validate-canon |
| 2026-07-09 | validate-wiki-alignment limpiado | Quitado scan secretos (→ gitleaks) y check canon (→ validate-canon) |

---

_2026-07-09 23:20 CEST · Perplexity-MCP_
