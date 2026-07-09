---
title: ADR-004 — Arquitectura de Agentes y MCP
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/ADR-004-agentes-mcp.md
tags: [adr, canon, agentes, mcp, perplexity, claude, copilot, gobernanza]
status: vigente
---

# ADR-004 — Arquitectura de Agentes y MCP

> Índice de ADRs → [`INDICE-ADR.md`](./INDICE-ADR.md)

---

## Contexto

El ecosistema usa múltiples agentes IA (Perplexity, Claude, GitHub Copilot) que necesitan acceso a los repos para leer contexto y escribir cambios. Sin una arquitectura definida, cada agente actúa de forma independiente, generan conflictos git, duplican trabajo y escriben en repos donde no deberían.

Además, el protocolo MCP (Model Context Protocol) permite a los agentes ejecutar acciones directas sobre GitHub — lo que implica que una instrucción mal formulada puede borrar archivos o crear commits incorrectos sin posibilidad de revisión previa.

---

## Decisión

### Modelo de roles por agente

| Agente | Rol | Acceso | Límite |
|--------|-----|--------|--------|
| **Perplexity + MCP** | Planificador + ejecutor en GitHub | Lectura + escritura vía MCP | No toca datos personales (VIDAPERSONAL, etc.) |
| **Claude (Copilot en repo)** | Ejecutor técnico local | Lectura + escritura local | Opera sobre ramas, abre PRs, no push directo a main |
| **GitHub Copilot** | Revisor de código | Solo lectura + sugerencias inline | No hace commits autónomos |
| **Ollama local** | Consultas privadas / RAG | Solo lectura del ecosistema local | Sin acceso a internet |

### Protocolo MCP — reglas de operación

1. **MCP actúa directo en GitHub** → siempre hacer `git pull` al inicio de sesión para sincronizar
2. **Cada sesión de trabajo**: apertura con `git pull`, cierre con `git push` + actualización de diario
3. **Conflictos MCP vs local**: si hay divergencia, local hace `git pull --rebase` — MCP tiene preferencia sobre escrituras en GitHub
4. **Repos fuera de límites para MCP**: VIDAPERSONAL, THDORA-PERSONAL (datos sensibles) — solo Claude/local
5. **Nada a main sin revisión**: workflows que escriben en repos → rama + PR draft, nunca push directo a main

### WIKI como mapa, no como contenedor

- **WIKI---PERSONAL** = mapa del ecosistema + conocimiento personal + contexto para agentes
- **yggdrasil-dew** = canon técnico, ADRs, hallazgos, arquitectura pública
- **Cada isla** = su propio repo con su propio README y docs — la wiki enlaza, no duplica
- Los agentes leen WIKI para entender el ecosistema, leen dew para entender las decisiones técnicas

---

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|-------------|---------------------|
| Un solo agente para todo | Cada agente tiene fortalezas distintas; la especialización da mejor resultado |
| Agentes sin límites de repos | Riesgo real de escritura accidental en repos con datos personales |
| Push directo a main por agentes | Un error de agente en producción es difícil de revertir; PR draft da revisión humana |
| Sin protocolo MCP/local | Sin protocolo → conflictos git frecuentes y pérdida de trabajo |

---

## Consecuencias

- ✅ Cada agente sabe exactamente qué puede y qué no puede hacer
- ✅ El protocolo MCP/local elimina conflictos de sincronización
- ✅ La arquitectura WIKI-mapa / dew-canon es pública y demostrable en portafolio
- ⚠️ El protocolo requiere disciplina en cada sesión (pull al abrir, push al cerrar)
- ⚠️ Branch protection en main pendiente de configurar (Fase 4) para forzar PR review

---

## Referencias

- Árbol de agentes → [`docs/canon/ARBOL-AGENTES.md`](./ARBOL-AGENTES.md)
- Modelo mental del ecosistema → [`wiki/MODELO-MENTAL.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/MODELO-MENTAL.md)
- ADR de seguridad → [ADR-002](./ADR-002-seguridad-ecosistema.md)
- ADR de IA local → [ADR-003](./ADR-003-ia-local-rag.md)
- Plan de alineación → [`PLAN-ALINEACION-2026-07.md`](../../PLAN-ALINEACION-2026-07.md)

---

_Creado: 2026-07-06 · Perplexity-MCP_
