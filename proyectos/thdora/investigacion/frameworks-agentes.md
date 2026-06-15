# Comparativa Frameworks para Agente Toki
*Generado por Grok | 15 junio 2026*

**Contexto THDORA:** Ya usamos LangChain. Necesitamos agente conversacional con memoria, tools (API FastAPI), state management y flujos multi-turno.

---

## Comparativa

### LangChain (+ LangGraph)
- **Qué hace:** Cadenas, agents, RAG, tools. LangGraph añade graphs/DAG para workflows complejos.
- **Madurez/Comunidad:** Muy alta (estándar de facto)
- **Agentes conversacionales + memoria:** Excelente (con Memory, checkpoints en LangGraph)
- **Integración FastAPI:** Nativa (Runnable, endpoints)
- **Veredicto:** ✅ **Mantener y complementar con LangGraph.** Ya invertimos; es maduro para Toki.

### LlamaIndex
- **Qué hace:** Enfoque en indexación/RAG y workflows de datos
- **Madurez:** Alta
- **Agentes + memoria:** Bueno, pero más data-centric
- **FastAPI:** Buena
- **Veredicto:** ⚠️ Complemento para RAG (contexto usuario), no reemplazo

### CrewAI
- **Qué hace:** Multi-agent crews con roles
- **Madurez:** Buena, creciente
- **Agentes conversacionales:** Muy bueno para colaboración
- **FastAPI:** Aceptable
- **Veredicto:** ⏳ Útil para agentes especializados futuros (gastos, estudio), overkill para Toki base

### AutoGen (Microsoft)
- **Qué hace:** Multi-agent conversations, human-in-loop
- **Madurez:** Media-alta
- **Agentes conversacionales:** Excelente para chat multi-agente
- **FastAPI:** Posible
- **Veredicto:** ⏳ Bueno para features avanzadas, más complejo de implementar

### LangGraph (⭐ recomendado)
- **Qué hace:** Extensión de LangChain para stateful graphs
- **Madurez:** Alta y creciendo rápido
- **Agentes + memoria:** Ideal (persistente, checkpoints, state management)
- **FastAPI:** Perfecta
- **Veredicto:** ✅ **Recomendado como evolución principal de Toki**

### Haystack
- **Qué hace:** Pipeline para search/RAG (más enterprise search)
- **Madurez:** Alta (Deepset)
- **Agentes:** Menos fuerte
- **Veredicto:** ⏳ Complemento para retrieval, no para agente conversacional

---

## 🎯 Recomendación Final

**No cambiar LangChain — evolucionar a LangGraph.**

| Acción | Herramienta | Por qué |
|--------|-------------|--------|
| Orquestación principal | LangGraph | Stateful, checkpoints, ya compatible con LangChain |
| RAG / contexto usuario | LlamaIndex | Complemento para memoria vectorial |
| Multi-agent futuro | CrewAI | Cuando Toki tenga sub-agentes especializados |

**Próximos pasos:**
- Implementar function calling en Grok/Groq + LangGraph para flujos robustos
- Bloque 1 del ROADMAP: stateful conversation + tools básicas (citas, hábitos)
- Híbrido futuro: LangGraph (orquestación) + CrewAI (multi-agent)
