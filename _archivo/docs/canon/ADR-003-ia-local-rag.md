---
title: ADR-003 — Estrategia IA Local y RAG
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/ADR-003-ia-local-rag.md
tags: [adr, canon, ia, ollama, rag, privacidad, llm]
status: vigente
---

# ADR-003 — Estrategia IA Local y RAG

> Índice de ADRs → [`INDICE-ADR.md`](./INDICE-ADR.md)

---

## Contexto

El ecosistema hace uso intensivo de IA: Perplexity para planificación y decisiones de alto nivel, Claude para ejecución técnica en repo, Copilot para revisión de código. A esto se suma que Madre tiene capacidad de correr modelos locales vía Ollama.

La pregunta era: ¿qué modelos corren en cloud, cuáles en local, y cómo se accede al conocimiento privado del ecosistema (repos, diarios, wiki) desde los agentes?

---

## Decisión

### Modelo híbrido: cloud para planificación, local para privacidad

**Cloud (Perplexity, Claude, Copilot):**
- Razonamiento complejo, decisiones de arquitectura, planificación de fases
- Acceso vía MCP a GitHub — nunca se les pasan datos personales en crudo
- Se usan como **orquestadores**, no como almacén de contexto

**Local (Ollama en Madre):**
- Consultas sobre contenido privado: diarios, wiki, VIDAPERSONAL, finanzas
- RAG (Retrieval-Augmented Generation) sobre los repos del ecosistema
- Modelos candidatos: `llama3`, `mistral`, `nomic-embed-text` para embeddings
- Acceso exclusivo vía Tailscale — nunca expuesto a internet

### RAG del ecosistema
- Fuente de verdad: repos git clonados en Madre
- Pipeline: `git pull` periódico → chunking de markdown → embeddings → base vectorial local
- Herramienta candidata: Open WebUI + Ollama (ya en stack de Madre)
- El RAG responde preguntas sobre el estado del ecosistema sin pasar datos a cloud

---

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|-------------|---------------------|
| Todo en cloud (solo Perplexity/Claude) | Datos personales (salud, finanzas, vida) no deben salir del ecosistema |
| Todo en local (solo Ollama) | Calidad de razonamiento actual de modelos locales < cloud para arquitectura |
| ChatGPT + plugins de acceso a repos | Privacidad insuficiente; datos pasan a servidores de OpenAI |
| Pinecone / Weaviate cloud para vectores | Coste recurrente + datos privados en cloud de terceros |

---

## Consecuencias

- ✅ Los datos personales nunca salen de Madre
- ✅ Los agentes cloud solo ven lo que está en repos públicos o lo que se les pasa explícitamente
- ⚠️ El RAG local está en diseño — pendiente implementar pipeline en `ollama-stack`
- ⚠️ Open WebUI requiere configuración de Tailscale para acceso móvil (pendiente)
- ⚠️ Los modelos locales consumen RAM — límite real con 16GB y otros servicios corriendo

---

## Referencias

- Stack Ollama → [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack)
- Isla IA local → [`wiki/islas/ia-local.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/ia-local.md)
- Árbol de agentes → [`docs/canon/ARBOL-AGENTES.md`](./ARBOL-AGENTES.md)
- ADR de plataforma → [ADR-001](./ADR-001-platform-stack.md)

---

_Creado: 2026-07-06 · Perplexity-MCP_
