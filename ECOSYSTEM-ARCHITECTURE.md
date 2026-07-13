---
tipo: arquitectura
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-13 18:15 CEST
ruta: ECOSYSTEM-ARCHITECTURE.md
tags: [arquitectura, ecosistema, reglas, yggdrasil, mapa]
status: vigente
---

# 🌳 ARQUITECTURA DEL ECOSISTEMA YGGDRASIL

> Documento raíz. Define la estructura completa, las reglas y cómo se relacionan todas las piezas.
> Todo repo del ecosistema hereda estas reglas. Ninguno las puede contradecir.

Última actualización: 2026-07-13

---

## 1. MAPA DEL ECOSISTEMA

```
┌─────────────────────────────────────────────────────────────────────────┐
│  ECOSISTEMA YGGDRASIL — Álvaro Fernández Mota                          │
│                                                                         │
│  🧠 CEREBRO                                                             │
│  ├── yggdrasil-dew        → ley máxima, arquitectura, roadmap          │
│  ├── yggdrasil-wiki       → second brain, conocimiento, agente IA      │
│  └── alvarofernandezmota-tech → perfil público GitHub                  │
│                                                                         │
│  📓 VIDA PERSONAL & TRACKING                                           │
│  └── yggdrasil-tracking   → diarios 2026, metas, reflexiones,         │
│                              filosofía, curiosidad, contenido, inbox   │
│      ⚠️  yggdrasil-formacion- DEPRECADO → migrado a yggdrasil-tracking │
│                                                                         │
│  📚 FORMACIÓN & I+D                                                    │
│  ├── formacion-tech       → apuntes y estado de cada área técnica      │
│  └── investigacion-ia     → PoCs, experimentos, arquitecturas IA       │
│                                                                         │
│  🖥️ INFRAESTRUCTURA — DISPOSITIVOS                                     │
│  ├── madre-config         → servidor HP Ubuntu + Dockers + seguridad   │
│  └── acer-config          → dotfiles Acer, Arch Linux, Hyprland, zsh  │
│                                                                         │
│  🤖 IA LOCAL                                                            │
│  ├── ollama-stack         → modelos LLM corriendo, Open WebUI          │
│  └── local-brain          → RAG, memoria vectorial, Qdrant, pgvector   │
│                                                                         │
│  🦾 THDORA                                                              │
│  └── THDORA-PERSONAL      → bot Telegram personal + FastAPI + IA local │
│                                                                         │
│  🛡️ SEGURIDAD                                                           │
│  ├── yggdrasil-secops     → hallazgos, blue team, seguridad ecosistema │
│  └── osint-stack          → herramientas OSINT, Spiderfoot, pipelines  │
│                                                                         │
│  ⚙️ AUTOMATIZACIÓN                                                      │
│  └── yggdrasil-scripts    → scripts mantenimiento, workflows, actions  │
│                                                                         │
│  🧪 LABS                                                                │
│  └── dev-labs             → sandbox, prototipos, experimentos código   │
│                                                                         │
│  📦 ARCHIVADOS                                                          │
│  ├── yggdrasil-formacion- → ⚠️ DEPRECADO — contenido migrado a        │
│  │                           yggdrasil-tracking (2026-07-13)           │
│  ├── thea-ia              → delegado en THDORA-PERSONAL                │
│  ├── ai-toolkit           → delegado en ollama-stack                   │
│  ├── image-calculator     → proyecto cerrado                           │
│  └── impresion-3d         → proyecto cerrado                           │
│                                                                         │
│  DISPOSITIVOS: 💻 Madre (HP)  💻 Acer (Arch)  📱 iPhone (Blink+MCP)   │
│  RED: Tailscale · IP Madre: 100.91.112.32 · SSH: ssh madre             │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 2. TABLA DE REPOS

| Repo | Capa | Función | Visibilidad |
|---|---|---|---|
| `yggdrasil-dew` | 🧠 Cerebro | Arquitectura, roadmap, ley máxima | 🌐 Público |
| `yggdrasil-wiki` | 🧠 Cerebro | Second brain, conocimiento, agente IA local | 🔒 Privado |
| `alvarofernandezmota-tech` | 🧠 Cerebro | Profile README público | 🌐 Público |
| `yggdrasil-tracking` | 📓 Tracking | Diarios 2026, metas, reflexiones, filosofía | 🔒 Privado |
| `formacion-tech` | 📚 Formación | Apuntes técnicos, estado de aprendizaje | 🔒 Privado |
| `investigacion-ia` | 📚 Formación | PoCs, experimentos, I+D IA | 🔒 Privado |
| `madre-config` | 🖥️ Infra | Servidor HP, Docker, configs, seguridad | 🔒 Privado |
| `acer-config` | 🖥️ Infra | Dotfiles Acer, Arch Linux, Hyprland | 🔒 Privado |
| `ollama-stack` | 🤖 IA Local | Modelos LLM, Open WebUI, LiteLLM | 🔒 Privado |
| `local-brain` | 🤖 IA Local | RAG, Qdrant, pgvector, embeddings | 🔒 Privado |
| `THDORA-PERSONAL` | 🦾 Thdora | Bot Telegram personal, FastAPI, IA | 🌐 Público |
| `yggdrasil-secops` | 🛡️ Seguridad | Hallazgos, blue team, auditorías | 🔒 Privado |
| `osint-stack` | 🛡️ Seguridad | OSINT ofensivo, Spiderfoot, pipelines | 🔒 Privado |
| `yggdrasil-scripts` | ⚙️ Automatización | Scripts mantenimiento, workflows, actions | 🔒 Privado |
| `dev-labs` | 🧪 Labs | Sandbox, prototipos, experimentos | 🔒 Privado |
| `yggdrasil-formacion-` | 📦 **DEPRECADO** | Migrado a yggdrasil-tracking (2026-07-13) | 🔒 Privado |
| `thea-ia` | 📦 Archivado | Delegado en THDORA-PERSONAL | 🌐 Público |
| `ai-toolkit` | 📦 Archivado | Delegado en ollama-stack | 🌐 Público |
| `image-calculator` | 📦 Archivado | Proyecto cerrado | 🌐 Público |
| `impresion-3d` | 📦 Archivado | Proyecto cerrado | 🌐 Público |

---

## 3. DÓNDE VA CADA COSA

```
¿Es arquitectura del ecosistema?      → yggdrasil-dew/ECOSYSTEM-ARCHITECTURE.md
¿Es conocimiento / second brain?      → yggdrasil-wiki/
¿Es una tarea pendiente global?       → yggdrasil-dew/MASTER-PENDIENTES.md
¿Es diario personal / reflexión?      → yggdrasil-tracking/diarios/
¿Son metas, filosofía, yo?            → yggdrasil-tracking/ (metas/, reflexiones/, filosofia/, yo/)
¿Es curiosidad o contenido?           → yggdrasil-tracking/04_curiosidad/ o 05_contenido/
¿Es config del servidor Madre?        → madre-config/
¿Es un hallazgo de seguridad?         → yggdrasil-secops/hallazgos/HAL-XXX
¿Es un apunte técnico?                → formacion-tech/<área>/
¿Es un experimento IA?                → investigacion-ia/
¿Es config del Acer?                  → acer-config/
¿Es un script de mantenimiento?       → yggdrasil-scripts/
¿Es un prototipo sin repo propio?     → dev-labs/
```

---

## 4. SISTEMA DE ETIQUETAS (Labels GitHub)

### Por capa
| Label | Descripción |
|---|---|
| `capa:cerebro` | yggdrasil-dew, yggdrasil-wiki, arquitectura global |
| `capa:tracking` | yggdrasil-tracking, vida personal |
| `capa:formacion` | formacion-tech, investigacion-ia |
| `capa:infra` | madre-config, acer-config |
| `capa:ia-local` | ollama-stack, local-brain |
| `capa:thdora` | THDORA-PERSONAL |
| `capa:seguridad` | yggdrasil-secops, osint-stack |
| `capa:automatizacion` | yggdrasil-scripts |
| `capa:labs` | dev-labs |

### Por tipo
| Label | Descripción |
|---|---|
| `tipo:bug` | Algo roto |
| `tipo:feature` | Nueva funcionalidad |
| `tipo:doc` | Documentación |
| `tipo:deuda` | Deuda técnica |
| `tipo:config` | Configuración |
| `tipo:hallazgo` | Hallazgo de seguridad |

### Por prioridad
| Label | Descripción |
|---|---|
| `prioridad:alta` | Urgente |
| `prioridad:media` | Esta semana |
| `prioridad:baja` | Cuando haya tiempo |

---

## 5. JERARQUÍA DE REGLAS

```
NIVEL 0 — ECOSISTEMA
└── ECOSYSTEM-ARCHITECTURE.md  ← ley máxima (este archivo)
└── CONVENCIONES.md            ← normas de commits y naming

    NIVEL 1 — REPOS
    └── <repo>/README.md       ← qué es este repo y cómo funciona

        NIVEL 2 — MÓDULOS
        └── <carpeta>/README.md ← reglas del módulo

            NIVEL 3 — ARCHIVOS
            └── cabecera frontmatter en cada .md
            └── docstring en cada .py / .sh
```

**Regla:** Si un archivo de nivel 3 contradice al nivel 0 → el archivo está mal.

---

## 6. ESCALADO: SCRIPT → ACTION → BOT

```
NIVEL 1 — SCRIPT (.sh)       → yggdrasil-scripts/, ejecuta en Madre, estado local
NIVEL 2 — GITHUB ACTION      → yggdrasil-scripts/.github/workflows/, corre en nube
NIVEL 3 — BOT (THDORA)       → THDORA-PERSONAL, memoria + IA + interfaz Telegram
```

---

## 7. COMPATIBILIDAD DE DISPOSITIVOS

| Capacidad | Madre (HP) | Acer (Arch) | iPhone (Blink) |
|---|---|---|---|
| Docker | ✅ | ✅ | ❌ |
| `set -euo pipefail` | ✅ | ✅ | ❌ |
| SSH a Madre | N/A | ✅ | ✅ Tailscale |
| git push | ✅ | ✅ | ✅ |
| MCP Perplexity | ✅ | ✅ | ✅ |
| Ollama local | ✅ | ✅ | ❌ |

**Regla COMPAT-BLINK:** Los scripts de sesión deben funcionar en Blink. Sin `set -euo pipefail`. Sin arrays avanzados.

---

## 8. ESTADO DE REPOS — JULIO 2026

| Repo | Estado | Última actividad |
|---|---|---|
| `yggdrasil-dew` | ✅ Activo | 2026-07-13 |
| `yggdrasil-wiki` | ✅ Activo | 2026-07-13 |
| `yggdrasil-tracking` | ✅ Activo (nuevo) | 2026-07-13 |
| `yggdrasil-scripts` | ✅ Activo (nuevo) | 2026-07-13 |
| `yggdrasil-secops` | ✅ Activo | 2026-07-12 |
| `madre-config` | ✅ Activo | 2026-07-05 |
| `local-brain` | ✅ Activo | 2026-06-24 |
| `ollama-stack` | ✅ Activo | 2026-06-24 |
| `THDORA-PERSONAL` | 🟡 Mantenimiento | 2026-07-03 |
| `yggdrasil-formacion-` | ⛔ DEPRECADO | 2026-07-13 → migrado |

---

_Actualizado: 2026-07-13 18:15 CEST · Perplexity-MCP_
