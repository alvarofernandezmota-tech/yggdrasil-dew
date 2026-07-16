---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CONTEXTO-DEW.md
tags: [protocolo, contexto, dew, agente, apertura]
status: vigente
version: 1.0
---

# PROTOCOLO-CONTEXTO-DEW v1.0

> Este protocolo carga el contexto completo de `yggdrasil-dew` al inicio de cualquier sesión
> que implique trabajo en este repo. Lo ejecuta el agente (Perplexity MCP) o el humano.

---

## 1. Propósito del repo

`yggdrasil-dew` es el **cerebro técnico** del ecosistema:
- Ley máxima: `ECOSYSTEM-ARCHITECTURE.md`
- Normas operativas: `NORMAS.md`
- Decisiones de arquitectura: `docs/adr/ADR-*.md`
- Diarios de sesión técnica: `docs/diarios/YYYY-MM-DD.md`
- Estado del sistema: `docs/canon/ESTADO-SISTEMA.md`
- Pendientes globales: `MASTER-PENDIENTES.md`
- Protocolos: `protocolo/`

---

## 2. Checklist de contexto al abrir sesión

```
[ ] Leer MASTER-PENDIENTES.md — estado de fases y pendientes reales
[ ] Leer docs/canon/ESTADO-SISTEMA.md — snapshot del ecosistema
[ ] Verificar si existe docs/diarios/YYYY-MM-DD.md para hoy — crear si no existe
[ ] Leer el último diario disponible — para continuidad de contexto
[ ] Revisar issues abiertos en DEW relevantes a la sesión
[ ] Confirmar rama: main siempre, nunca trabajar en branch sin ADR que lo justifique
```

---

## 3. Archivos canon — leer siempre antes de modificar

| Archivo | Por qué leerlo |
|---|---|
| `ECOSYSTEM-ARCHITECTURE.md` | Ley máxima — cualquier cambio estructural pasa por aquí |
| `NORMAS.md` | Reglas operativas de todos los repos |
| `MASTER-PENDIENTES.md` | Estado real de fases y tareas |
| `docs/canon/ESTADO-SISTEMA.md` | Snapshot actualizado del ecosistema |
| `docs/islas/MAPA-ISLAS-DEPENDENCIAS.md` | Dependencias entre repos |
| `docs/adr/INDEX-ADR.md` | Índice de decisiones de arquitectura |

---

## 4. Reglas críticas de DEW

- **Un diario = un día.** Nombre: `YYYY-MM-DD.md`. Sin sufijos.
- **Ubicación diarios:** `docs/diarios/` — nunca en sesiones/, nunca en otro repo.
- **Diarios técnicos vs personales:** técnicos en DEW, personales en yggdrasil-tracking.
- **Nunca cerrar sesión sin:** diario + MASTER-PENDIENTES actualizado.
- **Frontmatter obligatorio** en todo archivo `.md` (ver NORMAS.md sección DEW).
- **Toda decisión de arquitectura** genera un ADR — ver ADR-008.

---

## 5. Nombres canónicos confirmados (post 2026-07-13)

| Nombre incorrecto | Nombre correcto |
|---|---|
| `yggdrasil-formacion-` (con guión) | `yggdrasil-formacion` |
| `formacion-tech` | `yggdrasil-formacion` |
| `WIKI---PERSONAL` | `yggdrasil-wiki` |
| `VIDAPERSONAL` | `yggdrasil-tracking` + `yggdrasil-formacion` |

---

## 6. Cierre de sesión — checklist mínimo

```
[ ] Diario del día actualizado con: decisiones, acciones, commits, pendientes
[ ] MASTER-PENDIENTES.md sincronizado con estado real
[ ] ESTADO-SISTEMA.md actualizado si hubo cambios estructurales
[ ] Issues cerrados marcados en MASTER-PENDIENTES
[ ] Sin archivos zombi pendientes (0 bytes, solo título)
```

---

_Creado: 2026-07-16 · F13 Protocolo Contexto DEW v1.0 · Perplexity MCP_
