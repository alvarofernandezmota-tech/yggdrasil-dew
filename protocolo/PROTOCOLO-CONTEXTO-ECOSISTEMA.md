---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 3.0
tags: [contexto, ecosistema, arquitectura, repos]
status: vigente
---

# PROTOCOLO-CONTEXTO-ECOSISTEMA v3

> Protocolo de lectura de la arquitectura del ecosistema Yggdrasil.
> Milimétrico a los archivos y repos que realmente existen.

---

## FUENTE PRIMARIA

**Archivo:** `ECOSYSTEM-ARCHITECTURE.md` · `yggdrasil-dew` · [Ley máxima del ecosistema]

Este archivo contiene:
- Mapa ASCII de todos los repos y su capa
- Tabla completa de repos (activos + deprecados)
- Sección 3: dónde va cada tipo de contenido
- Sección 4: sistema de etiquetas GitHub
- Sección 5: jerarquía de reglas NIVEL 0 → NIVEL 3
- Sección 6: escalado SCRIPT → ACTION → BOT
- Sección 7: compatibilidad de dispositivos (regla COMPAT-BLINK)
- Sección 8: estado de repos julio 2026

---

## LECTURA ESTRUCTURADA

### Paso 1 — Mapa de repos activos

Leer sección 2 de `ECOSYSTEM-ARCHITECTURE.md` y construir esta tabla en memoria:

| Repo | Capa | Estado (julio 2026) |
|---|---|---|
| `yggdrasil-dew` | 🧠 Cerebro | ✅ Activo |
| `yggdrasil-wiki` | 🧠 Cerebro | ✅ Activo |
| `alvarofernandezmota-tech` | 🧠 Cerebro | ✅ Activo |
| `yggdrasil-tracking` | 📓 Tracking | ✅ Activo (nuevo 2026-07-13) |
| `formacion-tech` | 📚 Formación | ✅ Activo |
| `investigacion-ia` | 📚 Formación | ✅ Activo |
| `madre-config` | 🖥️ Infra | ✅ Activo |
| `acer-config` | 🖥️ Infra | ✅ Activo |
| `ollama-stack` | 🤖 IA Local | ✅ Activo |
| `local-brain` | 🤖 IA Local | ✅ Activo |
| `THDORA-PERSONAL` | 🦾 Thdora | 🟡 Mantenimiento |
| `yggdrasil-secops` | 🛡️ Seguridad | ✅ Activo |
| `osint-stack` | 🛡️ Seguridad | ✅ Activo |
| `yggdrasil-scripts` | ⚙️ Auto | ✅ Activo (nuevo 2026-07-13) |
| `dev-labs` | 🧪 Labs | ✅ Activo |
| `yggdrasil-formacion-` | 📦 **DEPRECADO** | ⛔ Migrado 2026-07-13 |

### Paso 2 — Jerarquía de reglas

Interiorizar la jerarquía (sección 5):

```
NIVEL 0: ECOSYSTEM-ARCHITECTURE.md + CONVENCIONES.md  ← LEY MÁXIMA
NIVEL 1: <repo>/README.md
NIVEL 2: <carpeta>/README.md
NIVEL 3: frontmatter en cada .md / docstring en cada .py/.sh
```

**Regla absoluta:** Un archivo de nivel 3 nunca puede contradecir al nivel 0.

### Paso 3 — Dónde va cada cosa

Antes de crear cualquier archivo, verificar la sección 3 de `ECOSYSTEM-ARCHITECTURE.md`:

```
Arquitectura del ecosistema  → yggdrasil-dew/ECOSYSTEM-ARCHITECTURE.md
Conocimiento / second brain  → yggdrasil-wiki/
Tarea pendiente global       → yggdrasil-dew/MASTER-PENDIENTES.md
Diario personal / reflexión  → yggdrasil-tracking/diarios/
Metas, filosofía, yo         → yggdrasil-tracking/ (metas/, reflexiones/, filosofia/, yo/)
Curiosidad o contenido       → yggdrasil-tracking/04_curiosidad/ o 05_contenido/
Config del servidor Madre    → madre-config/
Hallazgo de seguridad        → yggdrasil-secops/hallazgos/HAL-XXX
Apunte técnico               → formacion-tech/<área>/
Experimento IA               → investigacion-ia/
Config del Acer              → acer-config/
Script de mantenimiento      → yggdrasil-scripts/
Prototipo sin repo propio    → dev-labs/
```

### Paso 4 — Regla COMPAT-BLINK

Si se van a crear scripts, verificar sección 7:

```
Los scripts de sesión deben funcionar en Blink (iPhone).
Prohibido: set -euo pipefail, arrays avanzados bash.
Permitido: git push, MCP, SSH via Tailscale.
```

---

## SALIDA OBLIGATORIA

```
[CONTEXTO-ECOSISTEMA CARGADO]
Repos activos: 15 (incluyendo mantenimiento)
Deprecados: 1 (yggdrasil-formacion-)
Ley máxima: ECOSYSTEM-ARCHITECTURE.md ✅ leído
Jerarquía: NIVEL 0 interiorizado
Dónde va cada cosa: ✅ mapeado
REGLA COMPAT-BLINK: [aplica/no aplica según el trabajo de hoy]
```

---

_v3.0 · 2026-07-14 · Milimétrico a ECOSYSTEM-ARCHITECTURE.md real_
