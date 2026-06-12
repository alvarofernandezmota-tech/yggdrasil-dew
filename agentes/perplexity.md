# Perplexity — Agente actual

> Cómo uso Perplexity como agente sobre este repo. Junio 2026.

---

## Setup actual

- **Herramienta:** Perplexity AI con MCP GitHub
- **Space configurado:** `Repo Personal` → apunta a `github.com/alvarofernandezmota-tech`
- **Acceso:** Lee y escribe en repos GitHub en tiempo real
- **Contexto:** Carga `AGENT.md` + `CONTEXT.md` al inicio de cada sesión relevante

---

## Cómo funciona el flujo

```
Yo hablo con Perplexity
  → Perplexity lee AGENT.md (instrucciones)
  → Lee CONTEXT.md (estado actual)
  → Navega el repo según la pregunta
  → Responde con contexto real
  → Puede escribir/actualizar archivos con confirmación
```

---

## Casos de uso activos

- Actualizar `CONTEXT.md` semanalmente
- Crear entradas de diario
- Documentar proyectos y servicios
- Auditar el repo y proponer mejoras
- Consultar estado de proyectos/objetivos

---

## Limitaciones actuales

- No tiene acceso a la DB de THDORA directamente
- No puede ejecutar código en los servidores
- Cada sesión nueva pierde el hilo — depende de lo que esté en el repo
- No es persistente entre sesiones salvo lo que se escribe en el repo

---

## Próximo: Ollama local

El objetivo es reemplazar/complementar Perplexity con un LLM local en el Ordenador Madre que:
- Tenga acceso directo al repo clonado localmente
- Use los diarios como contexto RAG
- No dependa de internet ni de servicios externos

→ Ver roadmap en `agentes/prompts.md` y `formacion/ia-local.md`
