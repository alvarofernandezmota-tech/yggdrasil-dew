---
tipo: sesion
author: Alvaro Fernandez Mota
actualizado: 2026-07-16 18:53 CEST
ruta: docs/sesiones/PROXIMA-SESION.md
tags: [sesion, proxima, pendientes]
---

# ⏭️ PRÓXIMA SESIÓN

> Leer esto al inicio de cada sesión ANTES de actuar.  
> Después seguir `docs/canon/PROTOCOLO-INICIO-SESION.md`.

**Última actualización:** 2026-07-16 18:53 CEST  
**Estado del ecosistema:** ✅ ESTABLE — alineación completa ejecutada

---

## 🎯 Primera acción al arrancar

> Borrar los 3 archivos deprecados de `WIKI---PERSONAL` que quedaron pendientes por error de SHA:
> - `wiki/islas/VIDAPERSONAL.md`
> - `wiki/islas/cerebro.md`
> - `wiki/islas/labs.md`

**Hacerlo con:** `mcp_tool_github_mcp_direct_delete_file` con SHA fresco de cada archivo.

---

## 📚 Bloque 1 — URGENTE (primera sesión)

### 1.1 Borrar deprecados WIKI (requiere SHA fresco)
- [ ] Borrar `wiki/islas/VIDAPERSONAL.md` — deprecado 2026-07-13
- [ ] Borrar `wiki/islas/cerebro.md` — archivado 2026-07-13
- [ ] Borrar `wiki/islas/labs.md` — archivado 2026-07-13

### 1.2 Instanciar AGENT.md y CONTEXT.md en repos pendientes
- [ ] `yggdrasil-tracking` — AGENT.md + CONTEXT.md en raíz
- [ ] `THDORA-PERSONAL` — AGENT.md + CONTEXT.md en raíz

### 1.3 Actualizar wiki/islas/INDEX.md
- [ ] Eliminar filas de los 3 archivos borrados
- [ ] Actualizar conteo total de islas
- [ ] Verificar que todos los estados son correctos

---

## 📚 Bloque 2 — Siguiente fase

### 2.1 Isla orquestador (issue #58)
- [ ] Crear `wiki/islas/orquestador.md` usando `PLANTILLA-ISLA-WIKI.md`
- [ ] Añadir a `INDEX.md` y `mapa-islas.md`

### 2.2 Verificar `wiki/islas/INDEX.md` completamente
- [ ] Conteo real de archivos vs conteo declarado
- [ ] Todos los estados actualizados

---

## ❌ Lo que NO hacer al arrancar

- No empezar nada nuevo sin completar el Bloque 1 primero
- No crear islas sin seguir la norma de entrada
- No actualizar INDEX.md sin actualizar mapa-islas.md en el mismo commit

---

## 📋 Lo que quedó hecho en la sesión 2026-07-16

| Ítem | Estado |
|---|---|
| `PROTOCOLO-CIERRE-SESION.md` creado | ✅ |
| `PROTOCOLO-AUDITORIA.md` creado | ✅ |
| `PROTOCOLO-ALINEACION.md` creado | ✅ |
| `AGENT-template.md` creado | ✅ |
| `CONTEXT-template.md` creado | ✅ |
| `AGENT.md` instanciado en DEW | ✅ |
| `CONTEXT.md` instanciado en DEW | ✅ |
| `AGENT.md` instanciado en WIKI | ✅ |
| `CONTEXT.md` instanciado en WIKI | ✅ |
| `wiki/00-mapa.md` corregido (nombres canónicos) | ✅ |
| `ESTADO-SISTEMA.md` actualizado | ✅ |
| Deprecados WIKI borrados | ⚠️ pendiente (error SHA) |
| AGENT.md tracking + THDORA | ⚠️ pendiente |

---

_Actualizado: 2026-07-16 18:53 CEST · Perplexity MCP_
