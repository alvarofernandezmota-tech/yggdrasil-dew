---
tipo: protocolo
subtipo: contexto
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: protocolo/PROTOCOLO-CONTEXTO-ECOSISTEMA.md
tags: [protocolo, contexto, ecosistema, agente-ia, sesion]
status: vigente
version: 1.0
audiencia: [humano, agente-ia]
fuentes:
  - https://learn.github.com/well-architected/architecture/recommendations/implementing-polyrepo-engineering
  - https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html
  - https://github.com/topics/repo-navigation
---

# 🧠 PROTOCOLO DE CONTEXTO — ECOSISTEMA YGGDRASIL

> **Propósito:** Dar contexto total sobre el ecosistema en el mínimo número de lecturas posible.  
> **Cuándo ejecutar:** Al inicio de cualquier sesión que toque más de un repo, o cuando el agente/humano no tenga contexto fresco del ecosistema.  
> **Tiempo estimado (agente):** ~2 min de lectura. **Tiempo estimado (humano):** ~5 min.

---

## 👤 PARA EL HUMANO

Este protocolo existe porque el ecosistema Yggdrasil tiene **15+ repos activos** que se relacionan entre sí. Sin contexto, cualquier sesión de trabajo —tuya o del agente— parte desde cero y pierde tiempo reorientándose.

Ejecútalo tú mismo cuando:
- Llevas varios días sin tocar el ecosistema
- Vas a iniciar una sesión larga multi-repo
- Quieres revisar el estado global antes de priorizar

**Lectura en 3 pasos:**
1. `ECOSYSTEM-ARCHITECTURE.md` → el mapa completo (quién es quién)
2. `ESTADO-SISTEMA.md` → qué está roto, activo, en pausa
3. `MASTER-PENDIENTES.md` → qué hay que hacer globalmente

Si hay un **issue de apertura de sesión** abierto → léelo primero. Contiene el contexto de la sesión anterior.

---

## 🤖 PARA EL AGENTE IA

> **INSTRUCCIÓN:** Lee esta sección antes de actuar. No actúes hasta completar los pasos 1-5.

### PASO 1 — Leer el mapa del ecosistema

Archivo: [`ECOSYSTEM-ARCHITECTURE.md`](../ECOSYSTEM-ARCHITECTURE.md)  
Extraer y retener:
- Lista de repos activos y su función
- Tabla "dónde va cada cosa"
- Jerarquía de reglas (Nivel 0 → Nivel 3)
- Dispositivos disponibles y sus capacidades (COMPAT-BLINK)

### PASO 2 — Leer el estado actual

Archivo: [`ESTADO-SISTEMA.md`](../ESTADO-SISTEMA.md)  
Extraer y retener:
- Repos en estado 🔴 CRÍTICO o 🟡 ADVERTENCIA
- Deudas técnicas activas
- Última fecha de actualización (si > 7 días: estado puede estar desactualizado)

### PASO 3 — Leer pendientes globales

Archivo: [`MASTER-PENDIENTES.md`](../MASTER-PENDIENTES.md)  
Extraer y retener:
- Pendientes 🔴 ALTA prioridad
- Pendientes bloqueados y su razón
- Si el objetivo de la sesión actual está ya registrado aquí

### PASO 4 — Leer normas de operación

Archivo: [`NORMAS.md`](../NORMAS.md)  
Extraer y retener:
- Reglas de commits (Conventional Commits)
- Regla COMPAT-BLINK (scripts deben funcionar en iPhone/Blink)
- Qué NO hacer sin confirmación explícita del usuario

### PASO 5 — Declarar contexto cargado

Antes de actuar, el agente declara en una sola frase:  
```
[CONTEXTO CARGADO] Repos activos: N | Estado crítico: X | Pendientes alta prioridad: Y | Objetivo sesión: [objetivo o PENDIENTE DE DEFINIR]
```

Si el objetivo no está claro → preguntar antes de actuar.

---

## 🗺️ GRAFO DE DEPENDENCIAS ENTRE REPOS

```
yggdrasil-dew (LEY MÁXIMA)
│
├── yggdrasil-wiki          ← second brain, referencia cruzada con dew
│
├── yggdrasil-tracking      ← vida personal, diarios, metas
│   └── NO tiene dependencias hacia otros repos. Solo recibe.
│
├── madre-config            ← infra física
│   └── requiere: ollama-stack, local-brain estén configurados
│
├── THDORA-PERSONAL         ← orquestador Telegram
│   ├── depende de: madre-config (infra), local-brain (RAG)
│   └── consume: yggdrasil-wiki (conocimiento)
│
├── yggdrasil-secops        ← seguridad
│   └── documenta hallazgos que pueden afectar a madre-config
│
└── formacion-tech          ← aprendizaje
    └── puede generar experimentos en → investigacion-ia → dev-labs
```

**Regla de propagación:** Si cambias algo en `yggdrasil-dew`, revisa si afecta a los repos que lo heredan. Si cambias `madre-config`, verifica `THDORA-PERSONAL` y `ollama-stack`.

---

## 📋 CONTEXTO POR DOMINIO

Cada dominio del ecosistema tiene o tendrá su propio CONTEXT-PACK. El agente debe leer el CONTEXT-PACK del repo antes de operar en él:

| Repo | CONTEXT-PACK | Estado |
|------|-------------|--------|
| `yggdrasil-dew` | Este archivo es el maestro | ✅ vigente |
| `yggdrasil-wiki` | `protocolo/CONTEXT-PACK-WIKI.md` | 🔲 pendiente |
| `yggdrasil-tracking` | `protocolo/CONTEXT-PACK-TRACKING.md` | 🔲 pendiente |
| `madre-config` | `protocolo/CONTEXT-PACK-INFRA.md` | 🔲 pendiente |
| `THDORA-PERSONAL` | `protocolo/CONTEXT-PACK-THDORA.md` | 🔲 pendiente |
| `yggdrasil-secops` | `protocolo/CONTEXT-PACK-SECOPS.md` | 🔲 pendiente |
| `formacion-tech` | `protocolo/CONTEXT-PACK-FORMACION.md` | 🔲 pendiente |

---

## ⚡ ESCALADO: PROTOCOLO → SCRIPT → ACTION → BOT

Todo protocolo puede evolucionar. La escala es:

```
NIVEL 0 — PROTOCOLO MANUAL (.md)
  → El humano o el agente lo ejecuta leyendo el archivo
  → Ubicación: protocolo/

NIVEL 1 — SCRIPT (.sh)
  → El protocolo se automatiza como script ejecutable
  → Ubicación: scripts/ (yggdrasil-dew) o yggdrasil-scripts/
  → Requiere: funcionar en Blink (COMPAT-BLINK)

NIVEL 2 — GITHUB ACTION (.yml)
  → El script se programa como workflow automático
  → Ubicación: .github/workflows/
  → Se dispara por evento (push, schedule, issue)

NIVEL 3 — BOT / ORQUESTADOR (THDORA)
  → La action se convierte en comportamiento del bot
  → THDORA ejecuta el protocolo bajo demanda vía Telegram
  → Tiene memoria, contexto persistente y puede encadenar protocolos
```

**Este protocolo está en NIVEL 0.** Candidato a NIVEL 1 cuando se estabilice.

---

## 🔄 MANTENIMIENTO DE ESTE PROTOCOLO

| Cuándo actualizar | Quién | Qué hacer |
|---|---|---|
| Se añade un repo activo | Humano o agente | Añadir al grafo de dependencias y a la tabla de CONTEXT-PACKs |
| Cambia la jerarquía de repos | Humano | Actualizar grafo + `ECOSYSTEM-ARCHITECTURE.md` |
| Se depreca un repo | Humano o agente | Moverlo a sección archivados en el grafo |
| Se crea un CONTEXT-PACK nuevo | Agente | Actualizar tabla de CONTEXT-PACKs (🔲 → ✅) |

**Frecuencia mínima de revisión:** una vez por mes, en el cierre mensual.

---

## 📚 REFERENCIAS Y FUENTES

Este protocolo se basa en patrones reales de la industria:

- **Integration Layer / Meta-repo pattern** — GitHub Well-Architected, polyrepo engineering  
  → https://learn.github.com/well-architected/architecture/recommendations/implementing-polyrepo-engineering

- **ADR (Architecture Decision Records)** — AWS Prescriptive Guidance  
  → https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html

- **Navigation contract para agentes IA** — GitHub Topics: repo-navigation  
  → https://github.com/topics/repo-navigation

- **Cross-repo context awareness** — GitHub Community Discussion #189213  
  → https://github.com/orgs/community/discussions/189213

---

_Creado: 2026-07-13 · Perplexity-MCP · v1.0_
