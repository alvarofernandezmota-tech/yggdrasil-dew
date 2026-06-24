# ADR-004: Estrategia de ramas GitHub para el ecosistema

> **Estado:** DECIDIDO  
> **Fecha:** 2026-06-25  
> **Decidido por:** Álvaro + Perplexity

---

## Contexto

El repo `yggdrasil-dew` funciona como cerebro técnico del ecosistema.  
Hasta ahora todo iba a `main` directamente (trunk-based simple).  
Con el crecimiento del proyecto y múltiples áreas en desarrollo paralelo,  
necesitamos una estrategia de ramas que permita:

1. Aislar trabajo en progreso del estado estable
2. Trackear qué está implementado vs pendiente
3. Facilitar revisión antes de mergear a `main`
4. Que las IAs (Perplexity, Claude, Gemini) trabajen en ramas separadas

## Decisión

**Estrategia: Feature branches por área de trabajo**

```
main                    ← siempre estable, documentación verificada
  ├── feat/ollama-stack        ← implementación Ollama + Modelfiles
  ├── feat/litellm-proxy       ← LiteLLM + SOPS secrets
  ├── feat/n8n-workflows       ← flujos n8n
  ├── feat/osint-tools         ← herramientas OSINT
  ├── feat/thdora-agent        ← agente Thdora
  ├── feat/local-brain         ← proyecto Local Brain RAG
  ├── feat/inbox-cleanup       ← migración y limpieza inbox
  └── docs/ias-fichas          ← documentación IAs
```

## Convención de commits en ramas

```
feat(ollama): añadir Modelfile para Erika
fix(litellm): corregir configuración SOPS
docs(ias): ficha Gemini 2.5 Pro
chore(inbox): migrar 20 ficheros a docs/
```

## Política de merge a main

- PR con descripción del cambio
- Al menos revisión visual del diff
- Merge squash para mantener historial limpio
- Perplexity puede hacer merges de docs/ sin revisión

## Ramas a crear

Ver: cada rama `feat/*` se crea vacía con un README.md que describe el objetivo.

---

*Registrado: 2026-06-25 | Perplexity MCP*
