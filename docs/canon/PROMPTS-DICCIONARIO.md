---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-17
ruta: docs/canon/PROMPTS-DICCIONARIO.md
tags: [canon, prompts, ia, agentes]
status: vigente
version: 2
nota: migrado desde docs/ raíz en 2026-07-17 (issue #77)
---

# Diccionario de Prompts — Yggdrasil

> Vocabulario y prompts estándar del ecosistema.
> Usar estos términos exactos al hablar con agentes IA para mantener consistencia.

---

## Términos del ecosistema

| Término | Significado |
|---|---|
| **Isla** | Repo especializado con dominio funcional propio |
| **Madre** | Servidor torre principal (Arch Linux → Debian 12) con Docker stack |
| **Canon** | Conjunto de reglas y protocolos en `docs/canon/` — ley suprema |
| **ADR** | Architecture Decision Record — registro de una decisión arquitectónica |
| **HAL** | Hallazgo de seguridad — issue con prefijo HAL-XXX |
| **Runbook** | Procedimiento operacional paso a paso con comandos reales |
| **ESTADO-ISLA** | Archivo de estado de una isla específica en `docs/islas/` |
| **Bootstrap** | Contexto raw para arrancar un agente IA desde cero |
| **Orquestador** | Repo `yggdrasil-orquestador` — contexto cross-repo para agentes |
| **Tridente** | Triángulo dew + wiki + tracking (gobernanza + conocimiento + vida) |
| **Cerebro** | Isla de IA local — Ollama + Qdrant + RAG |
| **THDORA** | Bot Telegram personal + agente IA |
| **Sesión** | Período de trabajo documentado con diario, commits y cierre |
| **Checkpoint** | Estado verificado al inicio/fin de sesión |

---

## Frases estándar para agentes

### Arranque de sesión
```
Lee BOOTSTRAP.md en yggdrasil-orquestador.
Luego lee ESTADO-SISTEMA.md en yggdrasil-dew.
Luego declara objetivo antes de actuar.
```

### Cuando hay duda sobre qué hacer
```
No ejecutes. Muestra el plan primero.
Espera confirmación antes de cualquier commit.
```

### Al detectar inconsistencia
```
Hay una inconsistencia entre [A] y [B].
¿Cuál es la fuente de verdad?
No asumo — pregunto.
```

### Al terminar sesión
```
Resumen de commits: [lista]
Issues cerrados: [lista]
Pendiente para siguiente sesión: [lista]
¿Actualizo ESTADO-SISTEMA.md y PROXIMA-SESION.md?
```

---

## Prompts prohibidos (anti-patrones)

- ❌ `"Haz lo que creas conveniente"` — siempre declarar objetivo concreto
- ❌ `"Actualiza todo"` — demasiado vago, especificar qué archivos
- ❌ `"Supongo que..."` — el agente no asume, pregunta
- ❌ Ejecutar sin leer ESTADO-SISTEMA primero
- ❌ Crear archivos sin verificar si ya existen

---

_v2 · 2026-07-17 · Expandido con vocabulario real · movido a docs/canon/ · Perplexity MCP_
