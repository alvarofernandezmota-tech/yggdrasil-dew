---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/PROTOCOLO-INICIO-SESION.md
tags: [canon, inicio, sesion, protocolo, ritual]
status: vigente
adr: ADR-012
---

# 🟢 Protocolo de Inicio de Sesión

> Toda sesión de trabajo empieza con este protocolo.
> Objetivo: contexto completo antes del primer commit. Nunca ejecutar sin leer primero.
> Tiempo estimado: 5–10 minutos.
> Simétrico a: `PROTOCOLO-CIERRE-SESION.md`

---

## Fase 1 — Lectura obligatoria archivo por archivo

Orden estricto. No saltar pasos. No editar todavía — solo leer.

### 1.1 — Estado del ecosistema (yggdrasil-dew)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Estado del sistema | `docs/canon/ESTADO-SISTEMA.md` | Números: repos, ADRs, islas, issues abiertos, servicios caídos |
| Pendientes maestros | `MASTER-PENDIENTES.md` | Estado fases, pendientes, prioridad de esta sesión |
| Último diario | `docs/diarios/YYYY-MM-DD.md` | Dónde quedamos, qué sigue, issues cerrados |
| Ownership matrix | `docs/canon/ownership-matrix.md` | ¿Servicio Docker caído? → Si 🔴 → va antes que todo |
| Normas vigentes | `NORMAS.md` | Reglas activas — leer si +48h sin sesión |
| Normas Tridente | `docs/canon/NORMAS-TRIDENTE.md` | Qué va en cada repo — leer si hay duda |

### 1.2 — Decisiones y arquitectura (yggdrasil-dew)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Índice ADRs | `docs/adr/INDEX.md` | Último ADR, próximo número libre |
| Plan maestro | `docs/canon/PLAN-MAESTRO-FASES.md` | Fases del plan, dónde estamos en el roadmap |
| ADR relevante | `docs/adr/ADR-0XX-nombre.md` | Solo si la sesión toca un área con ADR reciente |

### 1.3 — Estado de islas (yggdrasil-dew) — leer las relevantes para la sesión

| ESTADO-ISLA | Ruta | Leer si la sesión toca... |
|---|---|---|
| Infra | `docs/islas/ESTADO-ISLA-INFRA.md` | Madre, Docker, servicios, IaC |
| Seguridad | `docs/islas/ESTADO-ISLA-SEGURIDAD.md` | SecOps, HAL, vulnerabilidades, tripwires |
| THDORA | `docs/islas/ESTADO-ISLA-THDORA.md` | Bot Telegram, THDORA-PERSONAL, FastAPI |
| IA Local | `docs/islas/ESTADO-ISLA-IA-LOCAL.md` | Ollama, RAG, Qdrant, LiteLLM, Open-WebUI |
| Scripts | `docs/islas/ESTADO-ISLA-SCRIPTS.md` | CI, Actions, scripts bash, yggdrasil-scripts |
| Tracking | `docs/islas/ESTADO-ISLA-TRACKING.md` | Vida personal, diarios, metas, filosofía |
| Formación | `docs/islas/ESTADO-ISLA-FORMACION.md` | Cursos, apuntes técnicos, HTB |
| Acer | `docs/islas/ESTADO-ISLA-ACER.md` | Laptop, dotfiles, Arch, Hyprland |
| Labs | `docs/islas/ESTADO-ISLA-LABS.md` | dev-labs, experimentos, PoCs |
| Cerebro | `docs/islas/ESTADO-ISLA-CEREBRO.md` | local-brain, embeddings, pgvector |
| Mapa deps | `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` | Relaciones entre islas, entrada/salida repos |

### 1.4 — Wiki (yggdrasil-wiki)

| Archivo | Ruta | Qué buscar |
|---|---|---|
| Índice islas | `wiki/islas/INDEX.md` | Estado de todas las islas, números totales |
| Isla específica | `wiki/islas/NOMBRE.md` | Concepto, repo asociado, estado — solo las relevantes |

### 1.5 — Issues (GitHub — yggdrasil-dew)

| Prioridad | Qué revisar antes de arrancar |
|---|---|
| 🔴🔴 | Seguridad o hardware crítico → van siempre primero, bloquean el resto |
| 🔴 | Bloqueantes funcionales → resolver antes de cualquier otra cosa |
| 🟠 | Requieren terminal → agrupar, ejecutar todos juntos |
| 🟡 | MCP puede ejecutar sin terminal → candidatos para esta sesión |

---

## Fase 2 — Declarar el objetivo de la sesión

Antes del primer commit, definir y decir en voz alta (o escribir):

```
Sesión: YYYY-MM-DD HH:MM
Tipo: Larga (+1h) / Corta (30min) / Emergencia / Formación
Terminal disponible: Sí / No

Objetivo 1: [issue #N o fase FX] — [acción concreta medible]
Objetivo 2: [issue #N o fase FX] — [acción concreta medible]
Objetivo 3: [issue #N o fase FX] — [acción concreta medible]

No entrar en: [qué queda fuera de esta sesión]
```

---

## Fase 3 — Verificación de consistencia (solo si +24h sin sesión)

- [ ] `docs/adr/INDEX.md` — número de ADRs cuadra con lo que recuerdas
- [ ] `wiki/islas/INDEX.md` — número de islas cuadra
- [ ] `docs/canon/ESTADO-SISTEMA.md` — fecha de actualización reciente
- [ ] `MASTER-PENDIENTES.md` — refleja la última sesión
- [ ] Raíz dew — sin archivos zombi
- [ ] `docs/canon/ownership-matrix.md` — servicio caído sin issue → crear HAL-XXX ahora

---

## 4 preguntas de inicio — el agente hace estas al arrancar

1. **¿Cuánto tiempo tienes y tienes terminal?** → Define alcance y tipo de issues
2. **¿Algún servicio caído desde la última sesión?** → Sí: HAL-XXX primero
3. **¿Se decidió algo fuera de sesión?** → Sí: documentar antes de ejecutar
4. **¿Hay algo urgente sin issue todavía?** → Sí: crear issue con label ahora

---

## Mapa de repos — cuándo abrir cada uno al inicio

| Repo | Abrir si... |
|---|---|
| `yggdrasil-dew` | Siempre — punto de entrada obligatorio |
| `yggdrasil-wiki` | Hay isla que consultar o actualizar |
| `yggdrasil-tracking` | Hay algo personal o vital que registrar |
| `yggdrasil-formacion-` | La sesión incluye aprendizaje técnico |
| `madre-config` | Cambio en servicios Docker de Madre |
| `yggdrasil-scripts` | Script o Action nuevo o modificado |
| `yggdrasil-secops` | Hallazgo de seguridad o HAL nuevo |
| `THDORA-PERSONAL` | Trabajo en bot Telegram o prompts |
| `ollama-stack` | LLM local, RAG, modelos Ollama |
| `acer-config` | Dotfiles o config Arch/Hyprland |
| `dev-labs` | Experimentos o sandbox |
| `local-brain` | RAG avanzado, embeddings, pgvector |

---

## Regla de oro

> **Nunca ejecutar sin contexto. Nunca asumir que el estado es igual que ayer.**
> Un commit sin lectura previa genera deuda documental y archivos colgados.
> 5–10 minutos de lectura evitan 30 minutos de correcciones.

---

_Creado: 2026-07-13 · v2 — archivo x archivo · 12 ESTADO-ISLA · ADR-012 · Perplexity MCP_
