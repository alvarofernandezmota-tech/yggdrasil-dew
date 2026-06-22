---
tags: [inbox, auditoria, ai-toolkit, ia-local, llm, python, pendiente]
fecha: 2026-06-22
estado: 🟡 PENDIENTE
tipo: auditoria
prioridad: media
---

# 🔍 Auditoría — ai-toolkit

## Las 4 preguntas

**¿Qué problema concreto existe?**
El repo `ai-toolkit` tiene 30+ archivos y 13 carpetas. No se sabe qué funciona realmente, qué está obsoleto y qué duplica yggdrasil-dew.

**¿Por qué hay que resolverlo?**
Antes de construir nada nuevo sobre él hay que saber qué hay. Puede tener configuraciones útiles (litellm, opencode, scripts) que ya están resueltas y se pueden aprovechar directamente.

**¿Cómo, lo más simple posible?**
Leer los archivos clave uno a uno → decidir para cada uno: ✅ útil / 📦 archivar / 🔀 migrar a yggdrasil-dew / 🗑️ eliminar.

**¿Cómo se verifica que está resuelto?**
ai-toolkit tiene un README que dice exactamente qué es, qué funciona y qué relación tiene con el ecosistema.

---

## Inventario inicial (22 jun 2026)

### Archivos raíz

| Archivo | Tamaño | Estado inicial |
|---|---|---|
| `README.md` | 7KB | ❓ leer |
| `ECOSISTEMA.md` | 12KB | ❓ leer — puede duplicar yggdrasil-dew |
| `INICIO-AQUI.md` | 5.5KB | ❓ leer |
| `AGENTS.md` | 7.4KB | ❓ leer — puede complementar agentes/ |
| `ALVARO.md` | 7.8KB | ❓ leer — puede migrar a yo/ |
| `ARQUITECTURA.md` | 5.7KB | ❓ leer |
| `ARQUITECTURA-SERVIDOR.md` | 4.7KB | ❓ leer — puede migrar a setup/ |
| `CEREBRO.md` | 3.8KB | ❓ leer |
| `CHANGELOG.md` | 6.4KB | ❓ leer |
| `CLAUDE.md` | 5.2KB | ❓ leer |
| `COMO-PROCEDEMOS.md` | 5.7KB | ❓ leer |
| `ESTRATEGIA.md` | 3.1KB | ❓ leer |
| `REPOS-ECOSISTEMA.md` | 5.4KB | ❓ leer |
| `ROADMAP.md` | 4KB | ❓ leer |
| `litellm-config.yaml` | 4.3KB | ⚙️ configuración activa — revisar |
| `opencode.json` | 2.7KB | ⚙️ configuración activa — revisar |
| `setup.sh` | 5KB | ⚙️ script setup — revisar |
| `.env.example` | 3.3KB | ⚙️ variables entorno — revisar |

### Carpetas

| Carpeta | Estado inicial |
|---|---|
| `agentes/` | ❓ puede duplicar yggdrasil-dew/agentes/ |
| `areas/` | ❓ sin explorar |
| `context/` | ❓ sin explorar |
| `diario/` | ❓ puede migrar a yggdrasil-dew/diarios/ |
| `docs/` | ❓ sin explorar |
| `guias/` | ❓ sin explorar |
| `herramientas/` | ❓ sin explorar — potencialmente útil |
| `investigacion/` | ❓ sin explorar |
| `opensource/` | ❓ sin explorar |
| `projects/` | ❓ sin explorar |
| `prompts/` | ❓ sin explorar — potencialmente útil |
| `pruebas/` | ❓ sin explorar |
| `scripts/` | ❓ sin explorar — potencialmente útil |
| `setup/` | ❓ sin explorar |

---

## Relación con yggdrasil-dew

**Posibles solapamientos:**
- `agentes/` ↔ `yggdrasil-dew/agentes/` — ¿duplica las 15 fichas LLM?
- `ECOSISTEMA.md` ↔ `yggdrasil-dew/ECOSISTEMA.md`
- `ALVARO.md` ↔ `yggdrasil-dew/yo/`
- `diario/` ↔ `yggdrasil-dew/diarios/`

**Posible valor único (no está en yggdrasil-dew):**
- `litellm-config.yaml` — configuración LiteLLM activa
- `opencode.json` — configuración OpenCode
- `scripts/` — scripts Python reales
- `herramientas/` — herramientas IA locales
- `prompts/` — biblioteca de prompts

---

## Plan de auditoría — sesión dedicada

```
Paso 1: Leer archivos de configuración activos
         litellm-config.yaml · opencode.json · setup.sh · .env.example
         → ¿Funcionan? ¿Son relevantes ahora?

Paso 2: Leer archivos de documentación clave
         README · INICIO-AQUI · ECOSISTEMA · AGENTS
         → ¿Duplican yggdrasil-dew? ¿Aportan algo nuevo?

Paso 3: Explorar carpetas con potencial
         scripts/ · herramientas/ · prompts/
         → ¿Hay código real y útil?

Paso 4: Decisión por archivo
         ✅ Útil → mantener/actualizar
         🔀 Migrar → mover a yggdrasil-dew
         📦 Archivar → rama archive/
         🗑️ Eliminar → borrar

Paso 5: Actualizar README de ai-toolkit
         → estado real, relación con ecosistema, qué hace
```

---

_Creado: 22 jun 2026 · Origen: sesión tarde Perplexity_
_Ver: [[inbox/MASTER-PENDIENTES]] · [[CONTEXT]] · [[ECOSISTEMA]]_
