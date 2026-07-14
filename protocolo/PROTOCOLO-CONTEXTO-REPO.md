---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-14
version: 2.0
tags: [contexto, repo, isla, context-pack]
status: vigente
---

# PROTOCOLO-CONTEXTO-REPO v2

> Antes de operar en cualquier repo del ecosistema Yggdrasil,
> el agente ejecuta este protocolo para conocer el estado real del repo.
> Milimétrico a los repos y archivos que realmente existen.

---

## CUÁNDO EJECUTAR

```
- Siempre que el agente vaya a hacer cambios en un repo
- Siempre que no haya tocado ese repo en los últimos 3 días
- Siempre que el usuario pida trabajar en un repo específico
- Después de un CONTEXTO-MACRO que detecte un repo con 🔴 o 🟡
```

---

## LECTURA POR REPO — TABLA DE ARCHIVOS REALES

| Repo | README | Estado isla | Issues | Últimos commits |
|---|---|---|---|---|
| `yggdrasil-dew` | `README.md` | `ESTADO-SISTEMA.md` | GitHub Issues | últimos 5 |
| `yggdrasil-wiki` | `README.md` | `ESTADO-ISLA-WIKI.md` (si existe) | GitHub Issues | últimos 3 |
| `yggdrasil-tracking` | `README.md` | `ESTADO-ISLA-TRACKING.md` (si existe) | GitHub Issues | últimos 3 |
| `formacion-tech` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `investigacion-ia` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `madre-config` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `acer-config` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `ollama-stack` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `local-brain` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `THDORA-PERSONAL` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `yggdrasil-secops` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `yggdrasil-scripts` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |
| `dev-labs` | `README.md` | `ESTADO-ISLA.md` (si existe) | GitHub Issues | últimos 3 |

---

## PASOS DE EJECUCIÓN

### Paso 1 — Leer README del repo

Extraer:
- Propósito del repo (una frase)
- Estructura de carpetas
- Cómo contribuir / convenciones específicas del repo
- Links a documentación relevante

### Paso 2 — Leer archivo de estado de la isla

```
¿Existe un ESTADO-ISLA-*.md o ESTADO-SISTEMA.md en este repo?
  SÍ → Leer completo. Extraer: estado actual, alertas, deudas técnicas, última actividad.
  NO → El repo no tiene estado documentado. Esto es una deuda técnica.
       Añadir a MASTER-PENDIENTES.md: "Crear ESTADO-ISLA para [repo]"
```

### Paso 3 — Revisar issues abiertos

Buscar en GitHub Issues del repo:
- Issues con `prioridad:alta` → trabajo inmediato
- Issues con `tipo:bug` → pueden bloquear otros trabajos
- Issues con `tipo:deuda` → contexto de lo que está pendiente
- Issues sin label → candidatos a clasificar

### Paso 4 — Leer últimos commits

Leer los últimos 3-5 commits del repo:
- ¿Qué se cambió recientemente?
- ¿Hay work in progress sin terminar?
- ¿El último commit sigue Conventional Commits? (`CONVENCIONES.md`)

### Paso 5 — Verificar CONTEXT-PACK (si existe)

```
¿Existe docs/CONTEXT-PACK.md en este repo?
  SÍ → Leer. Contiene el resumen condensado del repo para el agente.
  NO → Al finalizar la sesión con este repo, CREAR el CONTEXT-PACK.
       Template en: docs/templates/CONTEXT-PACK-TEMPLATE.md
```

---

## SALIDA OBLIGATORIA

```
[CONTEXTO REPO: nombre-del-repo]
Propósito: [una frase]
Estado isla: [✅ documentado / ⚠️ sin ESTADO-ISLA]
Última actividad: [fecha]
Issues abiertos: [N total] ([X alta prioridad])
Deudas conocidas: [lista o "ninguna"]
Bloqueantes: [lista o "ninguna"]
Context-Pack: [✅ existe / ❌ pendiente de crear]

PRIMERA ACCIÓN EN ESTE REPO: [la cosa más concreta a hacer]
```

---

## CREACIÓN DE CONTEXT-PACK AL FINALIZAR

Si el repo no tenía CONTEXT-PACK, crear `docs/CONTEXT-PACK.md` con:

```markdown
---
repo: nombre-del-repo
actualizado: YYYY-MM-DD
version: 1.0
---

# CONTEXT-PACK — nombre-del-repo

## Propósito
[Una frase]

## Estructura clave
[Las 3-5 carpetas/archivos más importantes]

## Estado actual
[Estado resumido]

## Deudas técnicas conocidas
[Lista]

## Convenciones específicas de este repo
[Lo que no está en CONVENCIONES.md global]

## Para el agente: por dónde empezar
[La primera cosa que debe leer al entrar a este repo]
```

---

_v2.0 · 2026-07-14 · Milimétrico a los repos reales del ecosistema_
