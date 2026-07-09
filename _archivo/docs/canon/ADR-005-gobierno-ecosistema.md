---
title: ADR-005 — Gobierno del Ecosistema a Escala
tipo: adr
creado: 2026-07-09
actualizado: 2026-07-09 23:25 CEST
status: vigente
ruta: docs/canon/ADR-005-gobierno-ecosistema.md
tags: [adr, gobierno, issues, escala, ecosistema]
---

# ADR-005 — Gobierno del Ecosistema a Escala

## Contexto

El ecosistema Yggdrasil crece. Hoy tiene ~5 repos y ~7 Dockers.
En 6-12 meses habrá más islas, más repos, más agentes.
Cada isla generará sus propias issues. El ecosistema en su conjunto
generará issues transversales. Sin un modelo claro esto se convierte
en caos: issues perdidas, trabajo duplicado, contexto fragmentado.

Decisión tomada el 2026-07-09 tras sesión de consolidación.

---

## Decisión

### 1. Dónde viven las issues

```
yggdrasil-secops   → issues operativas: Madre, Dockers, seguridad, bots
yggdrasil-dew      → issues de documentación, canon, ADRs, workflows CI
WIKI---PERSONAL    → SIN issues (es solo docs — no tiene backlog)
thdora-personal    → issues del bot Thdora
vidapersonal       → issues de vida personal (futuro)
```

**Regla:** una issue vive en el repo del componente que afecta.
Issues transversales (afectan >1 repo) → van en `yggdrasil-dew` con label `transversal`.

### 2. Labels canónicas (todos los repos)

| Label | Significado |
|---|---|
| `isla:madre` | Afecta al servidor Madre |
| `isla:seguridad` | Afecta a SecOps |
| `isla:thdora` | Afecta al bot |
| `isla:agentes` | Afecta a agentes IA |
| `isla:mcp` | Afecta a integraciones MCP |
| `isla:wiki` | Afecta a documentación WIKI |
| `isla:dew` | Afecta al canon Dew |
| `transversal` | Afecta a >1 isla |
| `auditoria` | Issue de auditoría periódica |
| `bloqueo` | Bloqueada por dependencia externa |
| `P0` `P1` `P2` | Prioridad crítica / alta / normal |

### 3. Revisión semanal (cuando el ecosistema crezca)

Una vez por semana (domingo o lunes):
1. Revisar issues abiertas por repo
2. Cerrar las completadas
3. Repriorizar P0/P1
4. Documentar en diario semanal Dew

Hoy (2026-07-09) esto se hace en cada sesión de trabajo.
Cuando haya >20 issues abiertas simultáneas → activar revisión semanal formal.

### 4. WIKI nunca tiene issues

WIKI es un repositorio de **mapas conceptuales**, no de trabajo.
Si algo de WIKI está desactualizado → la issue va en `yggdrasil-dew`
con label `isla:wiki`.

### 5. Workflows CI como red de seguridad

Los tres workflows actuales cubren:
- `gitleaks.yml` → ningún secreto llega a main
- `validate-canon.yml` → el canon Dew siempre está bien formado
- `validate-wiki-alignment.yml` → siempre hay diario reciente + WIKI tiene islas

Cuando una isla nueva crece lo suficiente → puede tener su propio workflow en su repo.

---

## Consecuencias

- El ecosistema puede crecer sin perder el hilo porque cada cosa tiene su sitio
- Una IA nueva que entre al ecosistema puede orientarse leyendo Dew + WIKI sin preguntar
- El modelo de labels permite filtrar `isla:madre` y ver solo lo relevante de Madre
- Revisión semanal evita que las issues se acumulen sin resolver

---

## Lo realizado hoy — 2026-07-09

Esta sesión estableció las bases del gobierno:

| Acción | Resultado |
|---|---|
| WIKI reconstruida con estructura canónica | ✅ INDEX, mapa-islas, 00-mapa, islas madre/vida |
| Workflows CI sin solapamientos | ✅ 3 workflows con scope claro |
| HERRAMIENTAS-ECOSISTEMA.md creado | ✅ Registro canónico de herramientas |
| Issues #38-#42 abiertas en secops | ✅ Backlog operativo actualizado |
| Issues #24, #12 cerradas | ✅ Deuda técnica reducida |
| Plan mañana documentado | ✅ docs/plan/PLAN-MANANA-2026-07-10.md |
| Este ADR creado | ✅ Modelo de gobierno registrado |

---

_2026-07-09 23:25 CEST · Perplexity-MCP_
