---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 2.0
tags: [auditoria, yggdrasil-wiki, second-brain, knowledge]
status: vigente
---

# PROTOCOLO-AUDITORIA-WIKI v2

> Auditoría milimétrica del repo `yggdrasil-wiki`.
> Es el second brain del ecosistema — contiene conocimiento, bases de datos del agente IA.
> Privado. Sensible por naturaleza. Se audita en 4 bloques.

---

## REPO OBJETIVO

```
Repo: yggdrasil-wiki
Capa: 🧠 Cerebro — Second brain
Visibilidad: 🔒 Privado
Propósito: conocimiento estructurado, segundo cerebro, base del agente IA local
Archivos esperados en raíz:
  README.md                 ← qué es este repo
  ESTADO-ISLA-WIKI.md       ← estado actual de la wiki (si existe)
  docs/                     ← documentación por áreas de conocimiento
```

---

## BLOQUE A — Secretos y contenido sensible (🔴 BLOQUEA TODO)

### A1 — Scan de secretos

Buscar patrones de secretos en todos los archivos:
```
ghp_, sk-, AIza, eyJ, password=, token=, APIKEY=
```

```
¿Se encuentra algún patrón?
  SÍ → 🔴 CRÍTICO. Revocar + limpiar historial. PROTOCOLO-SECRETOS.md
  NO → ✅ Continuar.
```

### A2 — Contenido personal sensible

```
¿Hay datos personales de terceros (emails, teléfonos, documentos)?
¿Hay contraseñas, credenciales o claves expuestas?
¿Hay información que no debería estar en un repo (aunque sea privado)?
  SÍ → 🔴 Mover a almacenamiento encriptado local. Eliminar del historial git.
```

---

## BLOQUE B — Estructura del conocimiento

### B1 — Archivos obligatorios

| Archivo | ¿Existe? | Notas |
|---|---|---|
| `README.md` | ✅/❌ | Debe explicar estructura y cómo navegar |
| `ESTADO-ISLA-WIKI.md` | ✅/❌ | Estado actual, áreas activas, deudas |

### B2 — Organización del conocimiento

```
¿Existe una estructura de carpetas clara?
¿Hay un índice de contenidos (INDEX.md o similar)?
¿Las notas tienen frontmatter con tipo, fecha, tags?
¿Hay notas huérfanas (sin links hacia o desde ellas)?
¿Hay áreas de conocimiento sin actualizar en más de 30 días?
```

### B3 — Conexión con el agente IA local

```
¿Hay documentación sobre cómo el local-brain consume esta wiki?
¿Los formatos de las notas son compatibles con el pipeline RAG de local-brain?
¿Hay archivos de embeddings o índices vectoriales que deberían estar en local-brain y no aquí?
```

---

## BLOQUE C — Nomenclatura y metadatos

### C1 — Convenciones de nombres

**Referencia:** `CONVENCIONES.md` en `yggdrasil-dew` (NIVEL 0)

```
¿Los archivos siguen kebab-case o MAYÚSCULAS según su tipo?
¿Los tags de frontmatter son consistentes entre notas?
¿Las fechas en frontmatter siguen formato ISO 8601 (YYYY-MM-DD)?
```

### C2 — Commits recientes

```
¿Los últimos 10 commits siguen Conventional Commits?
  tipos válidos para wiki: docs, feat, fix, refactor, chore
```

---

## BLOQUE D — Conectividad con el ecosistema

### D1 — Aparece en ECOSYSTEM-ARCHITECTURE.md

```
¿yggdrasil-wiki aparece correctamente en ECOSYSTEM-ARCHITECTURE.md?
¿Su estado en ESTADO-SISTEMA.md (yggdrasil-dew) refleja la realidad?
¿Hay tareas de wiki en MASTER-PENDIENTES.md que ya estén resueltas?
```

### D2 — Relación con local-brain

```
¿La wiki está integrada con el pipeline de local-brain (RAG, Qdrant)?
¿Hay un CONTEXT-PACK en docs/ que describa la wiki para el agente?
```

---

## INFORME FINAL

```
[AUDITORÍA WIKI COMPLETADA]
Fecha: YYYY-MM-DD HH:MM CEST

BLOQUE A (Secretos):         ✅/🟡/🔴
BLOQUE B (Estructura):       ✅/🟡/🔴
BLOQUE C (Nomenclatura):     ✅/🟡/🔴
BLOQUE D (Conectividad):     ✅/🟡/🔴

Issues creados: [N]
Notas huérfanas detectadas: [N]
Áreas de conocimiento sin actualizar: [lista]

ESTADO FINAL: ✅ LIMPIO / 🟡 CON DEUDAS / 🔴 CRÍTICO
```

---

_v2.0 · 2026-07-14 · Milimétrico a yggdrasil-wiki real_
