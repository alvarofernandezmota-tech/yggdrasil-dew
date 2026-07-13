---
id: ADR-007
titulo: MCP tiene isla propia, no se fusiona con cerebro.md
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, mcp, wiki, islas]
principio: Un solo punto de verdad
---

# ADR-007 — MCP tiene isla propia en la Wiki

## Contexto

Despues del AUDIT-005 (#42), se decidió si el contenido MCP debía ir en `cerebro.md` (que describe el triángulo DEW↔Wiki↔VIDAPERSONAL) o tener ficha propia.

## Decisión

**MCP tiene isla propia:** `wiki/islas/mcp.md`

**Razón:** `cerebro.md` describe la filosofía del sistema (qué es el triángulo y por qué existe). MCP es la implementación técnica (cómo funciona la fontanería). Son capas distintas.

## Consecuencias

- `cerebro.md` mantiene su enfoque filosófico/arquitectural
- `mcp.md` documenta servidores activos, operaciones, convenciones de uso
- Si MCP crece (nuevos servidores, protocolos), tiene su propio espacio sin contaminar `cerebro.md`

---
_Aceptado: 2026-07-13 · Principio: Un solo punto de verdad_
