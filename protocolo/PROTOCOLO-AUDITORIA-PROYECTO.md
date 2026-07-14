---
tipo: protocolo
subtipo: auditoria
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-14
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-AUDITORIA-PROYECTO.md
tags: [protocolo, auditoria, proyecto, repo, calidad, agente-ia]
status: vigente
version: 1.0
audiencia: [humano, agente-ia]
frecuencia: mensual o antes de releases importantes
nivel-escalado: 0 — Manual
candidato-a: 2 — GitHub Action
---

# 🔍 PROTOCOLO DE AUDITORÍA DE PROYECTO v1

> **Propósito:** Auditar un repo/proyecto concreto para detectar deuda técnica, inconsistencias, secretos expuestos, problemas de nomenclatura y documentación desactualizada.
> **Cuándo ejecutar:** Mensualmente por cada repo activo, o antes de un release, o cuando un repo lleva > 30 días sin auditar.
> **Diferencia con PROTOCOLO-AUDITORIA-ECOSISTEMA:** El de ecosistema audita las relaciones entre repos. Éste audita el interior de uno.

---

## 👤 PARA EL HUMANO

Esta auditoría te lleva ~20 minutos por repo. Ejecuta una vez al mes por repo activo. El resultado es una lista de issues a abrir.

**Criterio de prioridad al abrir issues:**
- 🔴 Seguridad (secretos, permisos, vulnerabilidades) → abrir inmediatamente
- 🟡 Deuda técnica bloqueante → abrir en la misma sesión
- 🔵 Documentación desactualizada → agrupar en un issue único

---

## 🤖 PARA EL AGENTE IA

> **INSTRUCCIÓN:** Ejecutar en orden. Cada check produce un resultado: ✅ OK, ⚠️ ADVERTENCIA, o ❌ CRÍTICO. Al final, crear los issues necesarios.

### BLOQUE A — SECRETOS Y SEGURIDAD

_(Ver también `PROTOCOLO-SECRETOS.md` para detalle completo)_

- [ ] **A1** Buscar patrones de secretos en el código: `grep -r "password\|secret\|token\|api_key\|apikey\|private_key" --include="*.py,*.js,*.ts,*.env,*.yml,*.json" .`
- [ ] **A2** Verificar que `.gitignore` incluye: `.env`, `.env.*`, `*.pem`, `*.key`, `secrets/`, `credentials.json`
- [ ] **A3** Revisar el historial de los últimos 20 commits buscando adición/eliminación de archivos `.env` o `secrets`
- [ ] **A4** Verificar que todos los secretos operativos están en variables de entorno o en el vault del ecosistema, no hardcodeados

**Criterio:** Cualquier ❌ en este bloque es 🔴 CRÍTICO y bloquea el resto de la auditoría hasta resolverse.

### BLOQUE B — NOMENCLATURA Y CONVENCIONES

_(Ver también `PROTOCOLO-NOMBRES.md` para las reglas completas)_

- [ ] **B1** Archivos y directorios siguen kebab-case (minúsculas, guiones): `mi-archivo.md`, no `MiArchivo.md` ni `mi_archivo.md`
- [ ] **B2** Variables y funciones siguen la convención del lenguaje del repo (snake_case Python, camelCase JS/TS)
- [ ] **B3** Commits siguen Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`
- [ ] **B4** Branches siguen el patrón: `feat/descripcion`, `fix/descripcion`, `chore/descripcion`
- [ ] **B5** Issues tienen title descriptivo y al menos 1 label

### BLOQUE C — DOCUMENTACIÓN

- [ ] **C1** `README.md` existe, tiene propósito claro y está actualizado (< 90 días)
- [ ] **C2** `ESTADO-ISLA-[nombre].md` existe en `yggdrasil-dew` y está actualizado (< 30 días)
- [ ] **C3** Si hay decisiones arquitectónicas tomadas sin ADR → crear ADRs pendientes
- [ ] **C4** Si hay `TODO` o `FIXME` en el código → registrar como issues con prioridad
- [ ] **C5** Si hay dependencias externas → verificar que están documentadas en README o en un `DEPENDENCIES.md`

### BLOQUE D — INTEGRIDAD TÉCNICA

- [ ] **D1** No hay branches obsoletas (> 30 días sin actividad y sin PR abierta) → eliminar o documentar por qué existen
- [ ] **D2** No hay PRs abiertas con > 14 días sin revisión → revisar o cerrar
- [ ] **D3** Si hay GitHub Actions → todas pasan en el último commit de `main`
- [ ] **D4** Si hay `package.json`, `requirements.txt`, `go.mod` u otro lockfile → verificar que está commiteado y actualizado
- [ ] **D5** El repo tiene al menos 1 issue con label `good-first-issue` o similar si está pensado para colaboración externa

### BLOQUE E — CONTEXTO Y CONECTIVIDAD

- [ ] **E1** El repo aparece en `ECOSYSTEM-ARCHITECTURE.md` con el rol correcto
- [ ] **E2** Existe CONTEXT-PACK para este repo en `yggdrasil-dew/protocolo/` (o está planificado en el roadmap)
- [ ] **E3** Las dependencias con otros repos están documentadas en el grafo de `PROTOCOLO-CONTEXTO-ECOSISTEMA.md`

---

## 📊 INFORME DE AUDITORÍA

Al terminar todos los bloques, el agente genera:

```
[AUDITORÍA PROYECTO: nombre-repo — YYYY-MM-DD]

BLOQUE A (Secretos):        [✅/⚠️/❌] — [N hallazgos]
BLOQUE B (Nomenclatura):    [✅/⚠️/❌] — [N hallazgos]
BLOQUE C (Documentación):   [✅/⚠️/❌] — [N hallazgos]
BLOQUE D (Integridad):      [✅/⚠️/❌] — [N hallazgos]
BLOQUE E (Contexto):        [✅/⚠️/❌] — [N hallazgos]

Issues 🔴 creados: [N]
Issues 🟡 creados: [N]
Issues 🔵 creados: [N]
Estado final del repo: ✅ SANO / 🟡 DEUDA MEDIA / 🔴 CRÍTICO
```

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script | `scripts/auditoria-proyecto.sh [repo]` | 🔲 pendiente |
| 2 — GitHub Action | Workflow semanal por repo | 🔲 pendiente |
| 3 — Bot THDORA | Comando `/auditar [repo]` | 🔲 pendiente |

---

_Creado: 2026-07-14 · v1.0_
