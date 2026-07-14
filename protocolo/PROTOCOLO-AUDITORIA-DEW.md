---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 2.0
tags: [auditoria, yggdrasil-dew, protocolos, secretos]
status: vigente
---

# PROTOCOLO-AUDITORIA-DEW v2

> Auditoría milimétrica del repo `yggdrasil-dew`.
> Es el repo de ley máxima del ecosistema — su integridad afecta a todos los demás.
> Se ejecuta en 5 bloques ordenados. El Bloque A bloquea el resto si hay 🔴.

---

## REPO OBJETIVO

```
Repo: yggdrasil-dew
Capa: 🧠 Cerebro — Ley máxima
Visibilidad: 🌐 Público
Ruta raíz: /
Archivos críticos:
  ECOSYSTEM-ARCHITECTURE.md  ← ley máxima
  ESTADO-SISTEMA.md          ← estado de todas las islas
  MASTER-PENDIENTES.md       ← tareas globales
  DASHBOARD.md               ← métricas del ecosistema
  PLAN-MAESTRO-2026-07.md    ← roadmap julio 2026
  NORMAS.md                  ← reglas del ecosistema
  CONVENCIONES.md            ← naming y commits
  .env.template              ← template de secretos (PÚBLICO — nunca valores reales)
  .gitignore                 ← exclusiones de git
  protocolo/                 ← todos los protocolos
  docs/                      ← documentación y templates
```

---

## BLOQUE A — Secretos y seguridad (🔴 BLOQUEA TODO)

### A1 — Verificar .gitignore

```
¿Existe .gitignore en la raíz?
  SÍ → Verificar que contiene: .env, *.env, secrets/, .env.local, .env.*.local
  NO → 🔴 CRÍTICO: Crear .gitignore inmediatamente.
```

### A2 — Verificar .env.template

```
¿Existe .env.template en la raíz?
  SÍ → Verificar que SOLO contiene nombres de variables, NUNCA valores reales.
       Ejemplo correcto:   API_KEY=
       Ejemplo incorrecto: API_KEY=sk-abc123...
  NO → 🟡 Crear .env.template con los nombres de variables del ecosistema.
```

### A3 — Scan de patrones de secretos en el repo

Buscar en todos los archivos del repo los patrones:
```
ghp_             → GitHub Personal Access Token
sk-              → OpenAI / Anthropic API Key
AIza             → Google API Key
eyJ              → JWT token
password=        → contraseña hardcodeada
APIKEY=          → API key directa
token=           → token directa
```

```
¿Se encuentra algún patrón?
  SÍ → 🔴 CRÍTICO: Revocar el secreto inmediatamente. Limpiar historial git.
       Seguir PROTOCOLO-SECRETOS.md + PROTOCOLO-ROTACION-SECRETOS.md
  NO → ✅ Continuar.
```

---

## BLOQUE B — Integridad de archivos críticos

### B1 — Archivos obligatorios de la raíz

| Archivo | ¿Existe? | ¿Tiene frontmatter? | ¿Está actualizado? |
|---|---|---|---|
| `ECOSYSTEM-ARCHITECTURE.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `ESTADO-SISTEMA.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `MASTER-PENDIENTES.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `DASHBOARD.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `NORMAS.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `CONVENCIONES.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `README.md` | ✅/❌ | ✅/❌ | ✅/❌ |
| `PLAN-MAESTRO-2026-07.md` | ✅/❌ | ✅/❌ | ✅/❌ |

### B2 — Coherencia del ECOSYSTEM-ARCHITECTURE.md

```
¿El número de repos en la tabla coincide con los repos reales en GitHub?
¿Hay repos activos en GitHub que no aparezcan en ECOSYSTEM-ARCHITECTURE.md?
¿Los repos marcados como DEPRECADOS siguen apareciendo como activos en algún sitio?
```

### B3 — ESTADO-SISTEMA.md al día

```
¿La fecha de "última actualización" es de hace más de 7 días?
  SÍ → 🟡 Actualizar con el estado real de cada isla.
  NO → ✅ Continuar.

¿Hay repos activos en ECOSYSTEM-ARCHITECTURE.md que no aparezcan en ESTADO-SISTEMA.md?
  SÍ → 🟡 Añadir los repos que faltan.
```

---

## BLOQUE C — Integridad de protocolos

### C1 — INDEX.md de protocolos

```
¿Existe protocolo/INDEX.md?
  SÍ → Verificar que todos los archivos en protocolo/ están en el INDEX.
       Verificar que no hay protocolos en el INDEX que no existan como archivo.
  NO → 🟡 Crear protocolo/INDEX.md
```

### C2 — Huérfanos y duplicados

```
Listar todos los archivos en protocolo/:
  ¿Hay protocolos con funciones duplicadas o solapadas?
  ¿Hay protocolos sin frontmatter?
  ¿Hay protocolos sin versión declarada?
  ¿Hay protocolos con status: deprecado que siguen en la carpeta activa?
```

### C3 — Consistencia de versiones

Verificar que los protocolos críticos están en su versión correcta:

| Protocolo | Versión esperada |
|---|---|
| `PROTOCOLO-APERTURA-SESION.md` | v3.0 |
| `PROTOCOLO-CIERRE-SESION.md` | v3.0 |
| `PROTOCOLO-CONTEXTO-MACRO.md` | v1.0 |
| `PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | v3.0 |
| `PROTOCOLO-CONTEXTO-REPO.md` | v2.0 |
| `PROTOCOLO-SECRETOS.md` | v2.0 |
| `PROTOCOLO-NOMBRES.md` | v2.0 |
| `PROTOCOLO-AUDITORIA-DEW.md` | v2.0 |

---

## BLOQUE D — Nomenclatura y convenciones

**Referencia:** `CONVENCIONES.md` en `yggdrasil-dew`

### D1 — Archivos de documentación

```
Regla: Archivos de documentación en MAYÚSCULAS-CON-GUIONES.md
¿Hay archivos en raíz o protocolo/ que no sigan esta convención?
```

### D2 — Últimos 10 commits

```
Verificar que siguen Conventional Commits:
  tipo(alcance): descripción en minúsculas
  tipos válidos: feat, fix, docs, refactor, chore, test, ci, perf

¿Algún commit incumple?
  SÍ → 🟡 Abrir issue tipo:deuda para revisión retroactiva.
```

### D3 — Branches activos

```
¿Hay branches que no sean main?
  SÍ → ¿Tienen PR abierta? ¿Llevan más de 14 días sin actividad?
       Si están muertos → eliminar o documentar por qué existen.
```

---

## BLOQUE E — Conectividad del ecosistema

### E1 — Referencias cruzadas

```
¿ECOSYSTEM-ARCHITECTURE.md referencia repos que ya no existen?
¿MASTER-PENDIENTES.md tiene tareas que referencian repos deprecados?
¿DASHBOARD.md está desactualizado respecto a ESTADO-SISTEMA.md?
```

### E2 — docs/ y templates

```
¿Existen los templates necesarios en docs/templates/?
  - CONTEXT-PACK-TEMPLATE.md
  - ESTADO-ISLA-TEMPLATE.md
  - TEMPLATE-ISSUE-APERTURA.md
  - ADR-TEMPLATE.md
```

---

## INFORME FINAL

```
[AUDITORÍA DEW COMPLETADA]
Fecha: YYYY-MM-DD HH:MM CEST

BLOQUE A (Secretos):         ✅/🟡/🔴
BLOQUE B (Archivos):         ✅/🟡/🔴
BLOQUE C (Protocolos):       ✅/🟡/🔴
BLOQUE D (Convenciones):     ✅/🟡/🔴
BLOQUE E (Conectividad):     ✅/🟡/🔴

Issues creados: [N]
Deudas técnicas detectadas: [N]
Acciones inmediatas: [lista o "ninguna"]

ESTADO FINAL: ✅ LIMPIO / 🟡 CON DEUDAS / 🔴 CRÍTICO
```

---

_v2.0 · 2026-07-14 · Milimétrico a yggdrasil-dew real_
