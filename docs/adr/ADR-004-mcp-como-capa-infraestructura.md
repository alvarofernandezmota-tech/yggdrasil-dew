---
id: ADR-004
titulo: MCP como capa de infraestructura del ecosistema
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, mcp, infraestructura, agentes]
principio: Automatizar lo repetible
---

# ADR-004 — MCP como capa de infraestructura del ecosistema

## Contexto

Los agentes IA (Perplexity, Claude, Grok) interactúan con el ecosistema a través de herramientas. Hasta 2026-07-09, la documentación MCP estaba dispersa en 6 archivos sin relación entre sí en WIKI---PERSONAL.

## Decisión

**MCP es infraestructura, no filosofia.** Es la fontería que conecta los vértices del triángulo DEW↔Wiki↔VIDAPERSONAL.

- MCP tiene isla propia en la Wiki (`wiki/islas/mcp.md`), no se fusiona con `cerebro.md`
- Perplexity-MCP es el agente operativo principal: ejecuta commits, abre/cierra issues, crea documentos directamente en los repos
- Claude es el agente de análisis profundo (sin acceso directo a repos por defecto)
- Grok es el agente de análisis externo y perspectiva crítica

## Consecuencias

- Toda acción que Perplexity puede hacer por MCP, la hace directamente. No se pide confirmación para commits documentales.
- Las herramientas MCP activas se documentan y auditan en `wiki/islas/mcp.md`
- Si una acción requiere terminal (SSH, docker, sistema de ficheros local), se crea un issue con comandos exactos

---
_Aceptado: 2026-07-13 · Principio: Automatizar lo repetible_
