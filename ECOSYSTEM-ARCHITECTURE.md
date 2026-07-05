---
tipo: arquitectura
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-05 12:00 CEST
ruta: ECOSYSTEM-ARCHITECTURE.md
tags: [arquitectura, ecosistema, reglas, yggdrasil]
status: vigente
---

# 🌳 ARQUITECTURA DEL ECOSISTEMA YGGDRASIL

> Documento raíz. Define la estructura completa, las reglas y cómo se comunican todas las piezas.
> Cada pieza del ecosistema hereda estas reglas. Ninguna las puede contradecir.

Última actualización: 2026-07-05

---

## 1. MAPA DEL ECOSISTEMA

```
┌─────────────────────────────────────────────────────────────────┐
│  ECOSISTEMA YGGDRASIL                                           │
│                                                                 │
│  ┌─────────────────┐   ┌──────────────────┐   ┌─────────────┐  │
│  │ yggdrasil-dew   │   │ THDORA-PERSONAL  │   │  secops     │  │
│  │ (cerebro/docs)  │   │  (bot+API)       │   │ (seguridad) │  │
│  └─────────────────┘   └──────────────────┘   └─────────────┘  │
│       │ reglas               │ ejecuta             │ audita     │
│       └─────────────────────► MADRE (servidor local)            │
│                                  IP: 100.91.112.32              │
│                                  SSH: ssh madre                 │
│                                  Docker: thdora en :8000        │
│                                                                 │
│  DISPOSITIVOS: 💻 Madre  📱 iPhone (blink)  ☁️ GitHub Actions   │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. JERARQUÍA DE REGLAS

```
NIVEL 0 — ECOSISTEMA
└─ ECOSYSTEM-ARCHITECTURE.md (este archivo) ← ley máxima
└─ CONVENCIONES.md                          ← normas de escritura/commits

    NIVEL 1 — REPOS
    └─ yggdrasil-dew/README.md
    └─ madre-config/README.md
    └─ yggdrasil-secops/README.md

        NIVEL 2 — MÓDULOS
        └─ scripts/SCRIPTS.md
        └─ .github/workflows/README.md

            NIVEL 3 — ARCHIVOS
            └─ Cada .sh con su cabecera documentada
            └─ Cada .yml con su descripción
```

---

## 3. ESCALADO: SCRIPT → ACTION → BOT

```
NIVEL 1: SCRIPT (.sh)     — ejecuta en Madre, estado local
NIVEL 2: GITHUB ACTION    — corre en nube, sin estado local
NIVEL 3: BOT (thdora)     — memoria/IA, interfaz Telegram
```

---

## 4. MAPA DE REPOS

| Repo | Función | Visibilidad |
|---|---|---|
| `yggdrasil-dew` | Cerebro técnico — arquitectura, roadmap | 🌐 público |
| `madre-config` | Config servidor Madre | 🔒 privado |
| `yggdrasil-secops` | Seguridad y hallazgos | 🔒 privado |
| `THDORA-PERSONAL` | Bot Telegram + FastAPI | 🌐 público |
| `ai-toolkit` | Stack IA open source | 🌐 público |
| `formacion-tech` | Apuntes técnicos | 🔒 privado |
| `dev-labs` | Sandbox desarrollo | 🔒 privado |
| `WIKI---PERSONAL` | Second brain personal | 🔒 privado |

---

_Migrado desde WIKI---PERSONAL: 2026-07-05 · Perplexity-MCP_
