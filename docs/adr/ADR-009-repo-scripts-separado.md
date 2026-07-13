---
id: ADR-009
titulo: yggdrasil-scripts como repo separado del ecosistema
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, scripts, repos, arquitectura]
principio: Automatizar lo repetible
---

# ADR-009 — yggdrasil-scripts como repo separado

## Contexto

El ecosistema tenía scripts dispersos o sin repo propio. Con el crecimiento del plan 2026/27 (health checks, backups, rotación de logs, bootstrap de máquinas), los scripts operativos necesitan su propio espacio con CI (ShellCheck) y estructura clara.

## Decisión

Crear [`yggdrasil-scripts`](https://github.com/alvarofernandezmota-tech/yggdrasil-scripts) como repo privado separado con:

- `health/` — health checks del sistema (docker, .env, disco)
- `backup/` — scripts de backup
- `maintenance/` — mantenimiento periódico
- `setup/` — bootstrap de nuevas máquinas
- `.github/workflows/validate-scripts.yml` — ShellCheck en cada push

**No se mezcla con DEW** (que es plan+documentación) ni con Wiki (que es conocimiento).

## Alternativas descartadas

- Scripts en DEW: contamina el repo de documentación con código ejecutable
- Scripts en madre-config: ese repo es IaC/configuración, no scripts operativos
- Todo en un mono-repo: demasiado acoplamiento, dificulta permisos y CI por tipo de contenido

## Consecuencias

- Cada script tiene su issue de referencia en DEW
- ShellCheck corre en cada push — no se mergea código roto
- La isla `wiki/islas/scripts.md` documenta los scripts disponibles (pendiente: issue #58)

---
_Aceptado: 2026-07-13 · Principio: Automatizar lo repetible_
