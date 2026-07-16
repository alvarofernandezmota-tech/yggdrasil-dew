---
fecha-actualizacion: 2026-07-16
sesion-origen: 2026-07-16-cierre-sesion
---

# PRÓXIMA SESIÓN — briefing de arranque

> Este archivo es el **primer archivo a leer** al inicio de cada sesión.
> Se actualiza en cada cierre. No contiene historial — solo el estado actual y los próximos pasos.

---

## 📍 Contexto al momento de este cierre

**Fecha:** 2026-07-16 ~18:45 CEST  
**Última sesión:** tarde del 2026-07-16  
**Foco de la sesión:** diagnóstico estructural — plantillas, orquestador, backlog

---

## 🎯 BLOQUE 0 — Ejecutar PRIMERO (aprobado, listo para MCP)

> La purga de wiki fue **aprobada explícitamente** el 2026-07-16. Ejecutar sin confirmar de nuevo.

### Borrar (3 archivos deprecados)
- [ ] `wiki/islas/VIDAPERSONAL.md` — deprecado, solo tiene redirect
- [ ] `wiki/islas/cerebro.md` — archivado, absorbido por `ia-local.md`
- [ ] `wiki/islas/labs.md` — archivado, absorbido por `dev-labs.md`

### Actualizar (3 mapas desalineados)
- [ ] `wiki/00-mapa.md` — corregir nombres de repos (yggdrasil-wiki→WIKI---PERSONAL, etc.) + fecha
- [ ] `wiki/mapa-islas.md` — eliminar fila `agentes.md` (no existe), añadir islas reales, corregir repo thdora
- [ ] `wiki/islas/INDEX.md` — eliminar filas de los 3 borrados, actualizar conteo 26→23

---

## 🎯 BLOQUE 1 — Plantillas canónicas (decisión tomada el 2026-07-16)

> `AGENT.md` y `CONTEXT.md` son **plantillas instanciables**. Cada repo deriva su versión de estas.

- [ ] Crear `wiki/plantillas/AGENT-template.md` — variables: `{{REPO_NAME}}`, `{{REPO_PURPOSE}}`, `{{PROTOCOLO_INICIO}}`, `{{PROTOCOLO_CIERRE}}`
- [ ] Crear `wiki/plantillas/CONTEXT-template.md` — variables: `{{ECOSISTEMA}}`, `{{ISLA_PRINCIPAL}}`, `{{REPOS_RELACIONADOS}}`
- [ ] Crear `wiki/plantillas/README.md` — explica el sistema de plantillas
- [ ] Verificar que `yggdrasil-dew/AGENT.md` y `yggdrasil-wiki/AGENT.md` existen y están alineados con la plantilla

---

## 🎯 BLOQUE 2 — Isla Orquestador (nueva — decisión tomada el 2026-07-16)

> El orquestador define el **protocolo de inicio y cierre de sesión** para cualquier agente en el ecosistema.

- [ ] Crear `wiki/islas/orquestador.md` con:
  - Protocolo de inicio de sesión (pasos 1-N que todo agente debe ejecutar)
  - Protocolo de cierre de sesión (pasos 1-N)
  - Mapa de archivos clave por repo
  - Referencias a plantillas del Bloque 1

---

## 🎯 BLOQUE 3 — Issues críticos de infra (requieren SSH Madre)

> Ejecutar en orden — hay dependencias.

1. **#45 PRIMERO** — Rotar secretos: Telegram BotFather + n8n + LiteLLM + code-server
2. **#70** — Identificar qué ocupa puerto 3000: `sudo ss -tlnp | grep :3000` → cambiar puerto yggdrasil-mcp
3. **#71** — Fix Qdrant: añadir `QDRANT__TELEMETRY_DISABLED=true` en compose → recrear contenedor
4. **#46** — Tras cerrar #45: restart log_guardian_bot + local_tripwire

---

## 🎯 BLOQUE 4 — Ejecutables MCP puros (sin SSH, cuando haya energía)

- [ ] ADR-012: `local-brain` como orquestador RAG — issue #67
- [ ] GitHub Action detector nombres inconsistentes — issue #66
- [ ] `filosofia.md` Bloques 1 y 3 (el 2 requiere input tuyo) — issue #57

---

## ⚠️ Lo que NO hacer al arrancar

- ❌ No empezar con auditorías de baja prioridad (#51-#56) sin cerrar los bloques 0-2
- ❌ No tocar #46 sin haber cerrado #45 antes
- ❌ No crear más archivos sueltos sin plantilla de origen

---

## 📊 Backlog actual

| Estado | Cantidad |
|---|---|
| Issues abiertos DEW | 25 |
| Críticos bloqueantes | 4 (#45, #70, #71, #46) |
| Ejecutables MCP | 6 |
| Requieren SSH | 6 |
| Baja prioridad / input tuyo | 9 |

---

_Actualizado: 2026-07-16 18:45 CEST · Perplexity-MCP_
