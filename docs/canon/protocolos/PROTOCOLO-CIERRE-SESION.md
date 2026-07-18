---
tipo: protocolo
status: activo
actualizado: 2026-07-18
nivel: 1
version: "1.0"
---

# PROTOCOLO-CIERRE-SESION

> **Versión:** 1.0 · **Creado:** 2026-07-18 · **Autor:** Perplexity-MCP  
> **Nivel:** 1 — Protocolo de sesión  
> **Referenciado desde:** `yggdrasil-orquestador/BOOTSTRAP.md`

---

## Propósito

Este protocolo define los pasos exactos que debe ejecutar cualquier agente IA al finalizar una sesión de trabajo. El objetivo es que el ecosistema quede en estado consistente, documentado y recuperable para la siguiente sesión.

---

## Regla de oro

> **Si no se documenta, no ocurrió.**  
> Toda decisión, cambio o problema detectado en la sesión debe quedar registrado antes de cerrar.

---

## Pasos obligatorios

### PASO 1 — Listar lo hecho en la sesión

El agente genera un resumen de:
- Archivos creados o modificados (con repo y ruta)
- Issues abiertos
- Issues cerrados
- ADRs creadas o actualizadas
- Decisiones tomadas que no tienen ADR todavía

### PASO 2 — Abrir issues por todo lo incompleto

Cualquier tarea iniciada y no completada → issue en `yggdrasil-dew` con:
- Título descriptivo
- Contexto de por qué quedó pendiente
- Próximo paso exacto
- Label adecuada

**No dejar trabajo en el chat. Si no está en GitHub, no existe.**

### PASO 3 — Actualizar ESTADO-SISTEMA.md

```
REPO: yggdrasil-dew
ARCHIVO: ESTADO-SISTEMA.md
```

Actualizar sección `## Última sesión` con:
- Fecha y hora de cierre
- Resumen de lo hecho
- Estado actual de servicios críticos (si se verificó en sesión)
- Issues abiertos en esta sesión

Si el archivo no existe, crearlo con template mínimo.

### PASO 4 — Actualizar BOOTSTRAP.md si cambió algo estructural

Si en la sesión se:
- Añadió o eliminó un repo
- Cambió la arquitectura del ecosistema
- Creó o deprecó un ADR
- Cambió el estado de un servicio crítico

→ Actualizar la sección correspondiente de `yggdrasil-orquestador/BOOTSTRAP.md` y subir la versión (`version: N+1`).

### PASO 5 — Commit de cierre

Si hay archivos modificados sin commitear:

```bash
git add -A
git commit -m "docs(sesion): cierre $(date +%Y-%m-%d) — [resumen breve]"
git push origin main
```

### PASO 6 — Declarar cierre al usuario

```
🔒 CIERRE DE SESIÓN — $(date)

✅ Hecho:
  - [lista]

📋 Issues abiertos:
  - [lista con números]

⏭️ Próxima sesión empieza por:
  - [el issue más crítico]

Ecosistema: CONSISTENTE
```

---

## Lo que NO se permite al cerrar

- ❌ No cerrar sin documentar los pendientes
- ❌ No dejar archivos sin commitear si son canon
- ❌ No asumir que "ya se recordará" — todo a GitHub
- ❌ No cerrar si hay un HAL crítico recién detectado sin su issue

---

## Tiempo estimado

3-5 minutos en sesión normal.  
10 minutos si hubo cambios estructurales que requieren actualizar BOOTSTRAP.

---

## Relacionado

- `PROTOCOLO-INICIO-SESION.md` — apertura simétrica
- `PROTOCOLO-AUDITORIA-COMPLETA.md` — para sesiones de auditoría profunda
- `yggdrasil-orquestador/BOOTSTRAP.md` — actualizar en cada cierre estructural
- ADR-001, ADR-008
