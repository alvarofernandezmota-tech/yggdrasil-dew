---
tipo: protocolo
subtipo: contexto
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-14
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-CONTEXTO-REPO.md
tags: [protocolo, contexto, repo, agente-ia, context-pack]
status: vigente
version: 1.0
audiencia: [humano, agente-ia]
nivel-escalado: 0 — Manual
candidato-a: 1 — Script
fuentes:
  - https://github.com/topics/repo-navigation
  - https://learn.github.com/well-architected/architecture/recommendations/implementing-polyrepo-engineering
---

# 📦 PROTOCOLO DE CONTEXTO DE REPO v1

> **Propósito:** Dar contexto específico sobre un repo concreto antes de operar en él.
> **Cuándo ejecutar:** Siempre que el agente o el humano vaya a trabajar en un repo que no ha tocado recientemente (> 3 días) o que no conoce bien.
> **Diferencia con PROTOCOLO-CONTEXTO-ECOSISTEMA:** El de ecosistema da el mapa global. Éste da el detalle de UN repo.

---

## 👤 PARA EL HUMANO

Antes de entrar a trabajar en un repo, lee en este orden:

1. `README.md` del repo — ¿qué es este repo y para qué sirve?
2. `ESTADO-ISLA-[nombre].md` en `yggdrasil-dew` — ¿cuál es su estado actual?
3. Issues abiertos del repo — ¿qué está pendiente o bloqueado?
4. Últimos 3 commits — ¿dónde lo dejaste la última vez?

**Si el repo tiene un CONTEXT-PACK** (`protocolo/CONTEXT-PACK-[nombre].md` en yggdrasil-dew) → léelo primero. Es la versión condensada de los 4 pasos anteriores.

---

## 🤖 PARA EL AGENTE IA

> **INSTRUCCIÓN:** Ejecutar este protocolo antes de hacer cualquier cambio en un repo. No asumir conocimiento previo.

### PASO 1 — Verificar si existe CONTEXT-PACK

Buscar en `yggdrasil-dew/protocolo/CONTEXT-PACK-[nombre-repo].md`.

- **Si existe:** leerlo. Contiene todo lo necesario de forma condensada. Ir a PASO 5.
- **Si no existe:** ejecutar los pasos 2-4 y luego crear el CONTEXT-PACK (ver PASO 5).

### PASO 2 — Leer README del repo

Extraer y retener:
- Propósito del repo (una frase)
- Qué NO es este repo (para evitar mezclar responsabilidades)
- Tecnologías principales
- Cómo arrancarlo/usarlo (si aplica)

### PASO 3 — Leer estado de la isla

Buscar `ESTADO-ISLA-[nombre].md` en `yggdrasil-dew/`.

Extraer y retener:
- Estado actual (✅ / 🟡 / 🔴)
- Deudas técnicas activas
- Última actividad registrada

Si no existe → crear el archivo usando el template `docs/templates/ESTADO-ISLA-TEMPLATE.md`.

### PASO 4 — Revisar issues abiertos y últimos commits

```
Issues abiertos: [N] | Críticos: [N]
Últimos 3 commits:
  - [sha] [mensaje] [fecha]
  - [sha] [mensaje] [fecha]
  - [sha] [mensaje] [fecha]
```

### PASO 5 — Declarar contexto de repo cargado

```
[CONTEXTO REPO: nombre-repo]
Propósito: [una frase]
Estado: ✅/🟡/🔴
Deudas técnicas: [N o NINGUNA]
Issues abiertos: [N]
Último commit: [fecha] — [mensaje]
CONTEXT-PACK disponible: ✅/🔲
```

### PASO 6 — Si no había CONTEXT-PACK: crearlo

Si el repo no tiene CONTEXT-PACK y esta es la segunda vez o más que el agente trabaja en él → crear `protocolo/CONTEXT-PACK-[nombre].md` en `yggdrasil-dew` usando la plantilla del `PROTOCOLO-CONTEXTO-ROADMAP.md`.

Actualizar la tabla de CONTEXT-PACKs en `PROTOCOLO-CONTEXTO-ROADMAP.md` (🔲 → ✅).

---

## 🗺️ CONTEXT-PACKS EXISTENTES

Ver tabla completa y estado en: [`PROTOCOLO-CONTEXTO-ROADMAP.md`](PROTOCOLO-CONTEXTO-ROADMAP.md)

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script | `scripts/contexto-repo.sh [nombre]` | 🔲 pendiente |
| 3 — Bot THDORA | Comando `/contexto [repo]` | 🔲 pendiente |

---

_Creado: 2026-07-14 · v1.0_
