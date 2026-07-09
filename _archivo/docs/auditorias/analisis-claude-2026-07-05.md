---
title: Análisis profesional WIKI + Dew — Claude
tipo: auditoria
author: Claude (Anthropic) — solicitado por Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/auditorias/analisis-claude-2026-07-05.md
tags: [auditoria, wiki, dew, analisis, deuda-tecnica, seguridad]
status: vigente
---

# 🔍 Análisis profesional WIKI + Dew — Claude (2026-07-05)

> Análisis solicitado a Claude (Anthropic) tras hacer público WIKI---PERSONAL.
> Sin filtros. Con evidencia concreta. Para trabajar en la sesión del 2026-07-06.

---

## 1. Separación estructural WIKI/Dew

**No es limpia. Sangra en varios sitios, aunque hay intención clara.**

- `NORMAS.md` define la regla perfectamente. Bien pensado.
- WIKI todavía contiene una carpeta `docs/` con más de 200 archivos (`docs/adr/`, `docs/diarios/`, `docs/seguridad/hallazgos/`...) que según sus propias normas debería vivir en Dew. **Reliquia de reorganización a medio hacer.**
- `inbox/` completa nunca vaciada (cientos de archivos: `audit-2026-07-03-1.md` hasta `-84.md`).
- `_archivo/` con decenas de diarios de junio duplicados.
- `ESTADO-SISTEMA.md` en Dew **filtra IPs reales de Tailscale y email personal** en repo público. Viola `NORMAS.md`.

---

## 2. Calidad de documentación

**Fuerte en archivos nuevos (post 5-jul-2026), débil en consistencia global.**

- Frontmatter de `ADR-001`, `DICCIONARIO.md`, `ARBOL-SERVICIOS.md`, `HAL-004` — ejemplares.
- `wiki/islas/*.md` diverge del esquema: campos inconsistentes entre islas.
- **Tres índices desincronizados** de las mismas 7-8 islas: `README.md`, `HOME.md`, `wiki/islas/INDEX.md`.
- `HOME.md` apunta a `wiki/islas/infraestructura.md` (stub deprecado) en vez de `infra.md`.
- Para 2026-07-05 hay **11 archivos de diario distintos** (`noche.md` a `noche-10-cierre.md`). Registro por turno de conversación, no por sesión. Mucho ruido.

---

## 3. Documentación ausente o incompleta

- **Dos ADR-003 y dos ADR-004** en WIKI. Numeración rota.
- HAL fragmentados entre repos: Dew solo tiene HAL-004. Sin registro central.
- `wiki/islas/labs.md` en estado `borrador`.
- No hay ADR que documente la decisión de fragmentar el ecosistema en ~13 repos.

---

## 4. Auditoría de conexiones cruzadas

- README de Dew lista 5 repos; HOME de WIKI lista 11. Ninguno coincide con la realidad (13 repos reales).
- Inconsistencia de nombre: Dew llama al bot `thdora`; WIKI lo llama `THDORA-PERSONAL`. ¿Rename en curso o dos repos?
- Enlace roto en `HOME.md`: apunta a `MAPA-ISLAS.md` (raíz) pero el archivo está en `wiki/mapa-islas.md`.

---

## 5. Lo que le falta frente a un equipo real

- Secret scanning no detecta IPs ni emails — justo lo que se filtró.
- Sin control de versiones semántico de ADRs (branch protection + PR review pendiente).
- `CODEOWNERS` existe en WIKI pero sin evidencia de uso para forzar revisión.
- Sin métricas de documentation debt ni proceso de poda de `_archivo/`.
- Repo con IPs internas sigue público 4 días después de identificarse como problema.

---

## 6. Fortalezas reales

- `NORMAS.md` es genuinamente bueno: regla de repo canónico único + protocolo de redirect.
- CI que valida frontmatter y escanea secretos en cada PR.
- `HAL-004` es un hallazgo de nivel profesional: evidencia, impacto, causas, comandos, plan.
- Cabecera con `status: vigente|borrador|deprecado` — ciclo de vida documental real.
- Todo el canon de Dew creado en una sola sesión (5-jul-2026) — ejecución real, no planificación.

---

## 7. Top 5 prioridades (por impacto)

1. 🔴🔴 **Hacer privado WIKI---PERSONAL ahora** — IPs, topología de red, email expuestos
2. 🔴 **Purgar `docs/`, `inbox/` y `_archivo/` de WIKI** — o migrar a Dew/secops
3. 🔴 **Resolver doble numeración ADR-003/004** + registro central de ADRs
4. 🟡 **Unificar los tres índices de islas** en uno solo + arreglar enlace `infra.md`
5. 🟡 **Ampliar secret-scanning** para detectar IPv4 y emails en CI

---

## Oferta de Claude

> ¿Quieres que te prepare un script de auditoría (bash/python) que detecte automáticamente ADRs duplicados, enlaces rotos y IPs/emails en frontmatter, para correrlo como parte del CI?

→ **Sí — solicitarlo en la próxima sesión con Claude.**

---

_Guardado: 2026-07-06 00:26 CEST · Perplexity-MCP_
