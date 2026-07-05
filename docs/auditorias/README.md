---
title: Índice de Auditorías
tipo: indice
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/auditorias/README.md
tags: [auditoria, indice]
status: vigente
---

# 🔍 Índice de Auditorías

| Fecha | Autor | Alcance | Archivo |
|---|---|---|---|
| 2026-07-05 | Claude (Anthropic) | WIKI + Dew — estructura, secretos, deuda | [analisis-claude-2026-07-05.md](./analisis-claude-2026-07-05.md) |
| 2026-07-05 | Perplexity AI | WIKI + Dew — separación, ADRs, gaps profesionales | [analisis-perplexity-2026-07-05.md](./analisis-perplexity-2026-07-05.md) |

---

## Consenso entre ambos análisis

Ambos coinciden en lo mismo, en este orden:

1. **Hacer privado WIKI** — IPs y datos sensibles expuestos
2. **Limpiar bleed** — estados operativos fuera de WIKI
3. **Completar ADRs** — solo existe ADR-001
4. **Unificar índices** — tres índices desincronizados
5. **Ampliar CI** — secret scanning no detecta IPs ni emails

---

_Actualizado: 2026-07-06 00:28 CEST · Perplexity-MCP_
