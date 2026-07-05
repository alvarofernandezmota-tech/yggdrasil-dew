---
title: Análisis profesional ecosistema Yggdrasil — Perplexity
tipo: auditoria
author: Perplexity AI — solicitado por Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/auditorias/analisis-perplexity-2026-07-05.md
tags: [auditoria, wiki, dew, analisis, deuda-tecnica, seguridad, arquitectura]
status: vigente
---

# 🔍 Análisis profesional ecosistema Yggdrasil — Perplexity (2026-07-05)

> Segundo análisis independiente. Complementario al de Claude.
> Para trabajar en sesión del 2026-07-06.

---

## 1. Separación estructural

**Conceptualmente clara, no limpia en práctica.**

- `NORMAS.md` y `CONVENCIONES.md` son explícitos y coherentes ✅
- **Sangrados graves:**
  - `wiki/islas/infra.md` y `seguridad.md` contienen estados operativos, IPs Tailscale, HAL issues — viola la regla
  - Duplicación de tablas entre WIKI/infra, Dew/ARBOL-SERVICIOS y madre-config
  - Frontmatter inconsistente entre repos
- Sin enforcement: sin CI que valide "no estados operativos en WIKI", el bleed es inevitable

---

## 2. Calidad de documentación

- Frontmatter bueno en intención, irregular en ejecución
- Naming conventions cumplidas en general (kebab-case, singular)
- Ruido residual: `infra.md` + `infraestructura.md` coexisten
- Islas principales cubiertas: infra, seguridad, cerebro, thdora, ia-local, labs, formacion, conocimiento, vida
- **Todo creado el 2026-07-05** — falta profundidad histórica y evolución

---

## 3. Documentación ausente

**WIKI:**
- `relaciones/` posiblemente vacía o incompleta
- Mapa general de dependencias (graphviz o mermaid)

**Dew:**
- Solo ADR-001 — faltan ADR-002 (seguridad), ADR-003 (IA local/RAG), ADR-004 (agentes/MCP)
- Service ownership matrix completa (dueño, SLA, criticidad, backup strategy)
- Risk register / threat model formal

**Global:**
- Sin diagrama C4
- Sin inventory de secretos / Vaultwarden
- Sin disaster recovery plan
- Sin testing strategy para servicios Docker

---

## 4. Conexiones cruzadas

- Enlace bidireccional WIKI ↔ Dew correcto ✅
- Referencias a madre-config, yggdrasil-secops, thdora consistentes ✅
- **Problemas:**
  - THDORA-PERSONAL vs thdora — ambigüedad de nombre/repo
  - IPs y estados en WIKI rompen single source of truth
  - Sin backlinks automáticos ni grafo de conocimiento

---

## 5. Gaps vs equipo real

- **Enforcement:** GitHub Actions + pre-commit + Vale/markdownlint + secret scanning
- **Arquitectura:** ADR completo + C4 models + threat modeling (STRIDE)
- **Operaciones:** IaC (Terraform/Ansible), GitOps, observabilidad central (Loki+Tempo), SLOs
- **Gobernanza:** CHANGELOG semántico, CODEOWNERS, Dependabot/Renovate
- **Testing:** Tests para scripts críticos, contract testing entre servicios
- **Onboarding:** Runbooks estandarizados

> "Tu ecosistema es un second brain muy avanzado para self-taught, pero todavía es sistema de un hombre con deuda de madurez operativa."

---

## 6. Fortalezas reales

- Separación de concerns mejor que muchos equipos junior ✅
- Islas como boundary objects + canon + diarios — modelo mental excelente ✅
- Consciencia de single source of truth y redirects ✅
- Enfoque HAL + auditoría continua — maduro para homelab ✅
- Documentación viva y actualizada ✅

> "Has construido un sistema de documentación que escala mentalmente mejor que la mayoría de proyectos personales."

---

## 7. Top 5 prioridades

1. 🔴🔴 **Limpiar bleed inmediatamente** — estados operativos, IPs, HAL summaries fuera de WIKI
2. 🔴 **Implementar enforcement** — gitleaks + markdownlint + custom rules en CI
3. 🔴 **Completar el Canon** — ADR-002/003/004 + service ownership matrix completa
4. 🟡 **Diagrama de arquitectura** — C4 Context + Container en mermaid en Dew
5. 🟡 **Seguridad crítica** — HAL-001/003/006 + Vaultwarden + rotar todo lo commiteado

---

## Conclusión

> "Tienes una base excelente y un sistema de pensamiento disciplinado. El principal riesgo actual no es técnico sino degradación por inconsistencia (bleed + duplicación). Corrige la separación canónica primero y el resto fluirá. Esto ya está en el percentil alto de documentación personal; con estos fixes entraría en territorio profesional serio."

---

_Guardado: 2026-07-06 00:28 CEST · Perplexity-MCP_
