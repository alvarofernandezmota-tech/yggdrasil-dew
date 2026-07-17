---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-17
ruta: docs/canon/ECOSISTEMA-CANON.md
tags: [canon, ecosistema, estructura]
status: vigente
version: 2
nota: migrado desde docs/ raíz en 2026-07-17 (issue #77)
---

# Ecosistema Canon — Estructura Yggdrasil

> Descripción de la estructura y filosofía del ecosistema multi-repo Yggdrasil.
> Documento vivo — actualizar cuando cambie la arquitectura.
> Fuente de verdad: `ESTADO-SISTEMA.md` (raíz) + `docs/adr/INDEX.md`

---

## Qué es Yggdrasil

Yggdrasil es un ecosistema personal de software y conocimiento organizado en **islas** (repos especializados) gobernadas desde `yggdrasil-dew` como repo central.

Cada isla tiene un dominio funcional claro. Ninguna isla hace lo que hace otra.

---

## Principios

1. **Una fuente de verdad por tema** — no hay información duplicada entre repos
2. **Git como único registro** — todo cambio pasa por commit y PR
3. **ADR por cada decisión** — las decisiones arquitectónicas se documentan antes de ejecutar
4. **Canon como ley** — `docs/canon/` contiene las reglas que ningún agente puede saltarse
5. **Agente IA como colaborador** — no ejecuta sin leer el protocolo de inicio

---

## Estructura de repos

| Repo | Rol | Visibilidad |
|---|---|---|
| `yggdrasil-dew` | Gobernanza — canon, ADRs, protocolos, estado | 🟢 Público |
| `yggdrasil-orquestador` | Contexto cross-repo para agentes IA | 🟢 Público |
| `WIKI---PERSONAL` | Conocimiento personal — 25 islas | 🔒 Privado |
| `yggdrasil-secops` | Seguridad — HALs, auditorías | 🔒 Privado |
| `THDORA-PERSONAL` | Bot Telegram + agente IA personal | 🔒 Privado |
| `madre-config` | IaC — Docker Compose de Madre | 🔒 Privado |
| `yggdrasil-tracking` | Diario vital y tracking personal | 🔒 Privado |
| `yggdrasil-scripts` | Scripts bash y GitHub Actions | 🔒 Privado |
| `formacion-tech` | Apuntes y formación técnica | 🔒 Privado |
| `ollama-stack` | LLM local — Ollama + Qdrant + RAG | 🔒 Privado |
| `local-brain` | Cerebro local — RAG personal | 🔒 Privado |
| `acer-config` | Dotfiles Arch Linux / Hyprland | 🔒 Privado |
| `dev-labs` | Sandbox de experimentos | 🔒 Privado |

---

## Flujo de gobernanza

```
Decisión arquitectónica
        ↓
    ADR en docs/adr/
        ↓
  Protocolo / norma en docs/canon/
        ↓
   Issue en GitHub + ejecutar
        ↓
  Commit documentado en diario de sesión
        ↓
  ESTADO-SISTEMA.md actualizado
```

---

## Referencias

- `docs/adr/INDEX.md` — 14 ADRs activos
- `docs/islas/INDEX.md` — 14 islas con estado
- `ESTADO-SISTEMA.md` — estado operativo en tiempo real
- `yggdrasil-orquestador/BOOTSTRAP.md` — contexto para agentes IA

---

_v2 · 2026-07-17 · Expandido y movido a docs/canon/ · Perplexity MCP_
