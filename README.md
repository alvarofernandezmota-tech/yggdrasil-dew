# 🌳 yggdrasil-dew

> Cerebro técnico del ecosistema Yggdrasil — arquitectura, roadmap, convenciones, diarios y plan maestro.
> De aquí nacen todos los repos. Ninguno puede contradecirlo.

---

## 🧭 Documentos clave

| Fichero | Qué es |
|---|---|
| [ECOSYSTEM-ARCHITECTURE.md](./ECOSYSTEM-ARCHITECTURE.md) | Ley máxima — mapa completo del ecosistema |
| [ROADMAP-MASTER.md](./ROADMAP-MASTER.md) | Plan estratégico y fases |
| [CONVENCIONES.md](./CONVENCIONES.md) | Normas de commits, naming, Obsidian/GitHub |
| [MASTER-PENDIENTES.md](./MASTER-PENDIENTES.md) | Backlog priorizado — actualizar cada sesión |
| [ESTADO-SISTEMA.md](./ESTADO-SISTEMA.md) | Estado actual de repos, servidores y seguridad |

---

## 📁 Estructura

```
yggdrasil-dew/
├── ECOSYSTEM-ARCHITECTURE.md   ← ley máxima del ecosistema
├── ROADMAP-MASTER.md            ← fases y objetivos estratégicos
├── CONVENCIONES.md             ← naming, commits, Obsidian
├── MASTER-PENDIENTES.md        ← backlog priorizado
├── ESTADO-SISTEMA.md           ← estado actual del ecosistema
└── docs/
    └── diarios/                 ← un fichero por sesión YYYY-MM-DD.md
```

---

## 🌊 Ecosistema de repos

```
🧠 CEREBRO
   yggdrasil-dew           ← este repo
   alvarofernandezmota-tech ← perfil público GitHub

🗺️ CONOCIMIENTO
   WIKI---PERSONAL          ← mapa conceptual, hardware, contexto personal
   VIDAPERSONAL             ← vida personal, finanzas, gym

📚 FORMACIÓN
   formacion-tech           ← apuntes y ejercicios técnicos
   investigacion-ia         ← PoCs e I+D IA

🖥️ INFRA
   madre-config             ← Torre Arch Linux (servidor principal)
   acer-config              ← Portátil Arch Linux + Hyprland

🤖 IA LOCAL
   ollama-stack             ← Ollama + modelos
   local-brain              ← RAG + Qdrant + memoria

🦾 THDORA
   THDORA-PERSONAL          ← bot Telegram personal

🛡️ SEGURIDAD
   yggdrasil-secops         ← hallazgos, blue team (HAL-001 activo)
   osint-stack              ← OSINT ofensivo

🧪 LABS
   dev-labs                 ← sandbox

📦 ARCHIVADOS
   thea-ia, ai-toolkit, image-calculator, impresion-3d
```

---

## 📐 Protocolo de sesión

```
INICIO: git pull && cat ESTADO-SISTEMA.md && cat MASTER-PENDIENTES.md
CIERRE: diario en docs/diarios/YYYY-MM-DD.md + actualizar ESTADO-SISTEMA.md + commit
```

---

**Última actualización:** 2026-07-05 noche  
**Estado:** 🟢 Activo — Fase Agentes
