---
tags: [prompt, gemini, inbox, auditoria, migracion]
fecha: 2026-06-23
estado: ejecutado
tipo: prompt-agente
agente: gemini-2.5-pro
ruta-obsidian: agentes/prompts/2026-06-23-prompt-gemini-auditoria-inbox.md
fuente: inbox/2026-06-23-prompt-gemini-auditoria-inbox.md
---

# Prompt Gemini — Auditoría y vaciado inbox

> Prompt generado para vaciar inbox/ via Gemini con acceso GitHub API.
> Estado: ejecutado por Perplexity MCP directamente.

## Notas de uso

Este prompt es para usar con Gemini cuando Perplexity no tiene capacidad
de ejecutar todas las llamadas API necesarias en una sesión.

Gemini necesita:
1. Token GitHub con permisos `repo` (lectura + escritura)
2. El mapa completo de migración
3. Las reglas de los permanentes

## Ver prompt completo

[[inbox/2026-06-23-VACIADO-MAESTRO-GEMINI]] — prompt raw listo para copiar

## Resultado

Migración ejecutada por Perplexity MCP el 2026-06-23 23:16 CEST.
Ver [[diarios/2026-06-23-sesion-perplexity-auditoria-gemini-inbox]].

## Referencias
- [[agentes/gemini-2.5-pro]]
- [[inbox/README]]
