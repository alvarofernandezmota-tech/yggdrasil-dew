---
tipo: pendientes
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-13 14:15 CEST
ruta: MASTER-PENDIENTES.md
tags: [pendientes, backlog]
status: vigente
---

# 📋 MASTER DE PENDIENTES — 2026-07-13

> Fuente única de verdad para todo lo pendiente. Ordenado por prioridad real.

---

## 🔴 INMEDIATO (tú, terminal Madre)

- [ ] Confirmar `local_tripwire` está `healthy` (quedó en `health: starting`)
- [ ] Cerrar puerto 21 FTP en router Digi — issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15)
- [ ] Verificar Ollama `:11434` — confirmar no expuesto a internet
- [ ] Verificar SSH puerto 22 — confirmar no expuesto a internet

---

## 🟠 ALTA — Esta semana (MCP puede hacer)

- [ ] Cerrar issues #44, #45, #46 en GitHub con resumen del fix real
- [ ] Actualizar AUDIT-003 (#36) — prereq #44+#45 ya cumplido, listo para ejecutar
- [ ] Actualizar AUDIT-007 (#49) — thdora-bot healthy, listo para auditar
- [ ] Completar `docs/runbooks/DRP.md` con datos reales (IPs, rutas, contactos)
- [ ] Crear `docs/secrets.md` — ciclo de vida de tokens (rotar, cuándo, cómo)
- [ ] F1: Indexar ADR-005 y ADR-006 en índice canon WIKI
- [ ] F2: Unificar índices de islas WIKI (README + HOME → INDEX)
- [ ] F4: Consolidar ficheros MCP/agentes (6 → 1)

---

## 🟡 MEDIA — Este mes

- [ ] F3: Purga `docs/` WIKI (279 → <80 archivos) — sesión larga
- [ ] F5: CI enforcement — añadir detección IPv4 y emails en `validate-canon`
- [ ] F7: Healthchecks en docker-compose de `log_guardian_bot`, `local_tripwire`, `thdora-bot`
- [ ] F7: Configurar Promtail + Loki para agregación de logs
- [ ] F7: Crear alias `ygg-check` en `.bashrc` Madre
- [ ] `git filter-repo` — limpiar historial de tokens expuestos en repos THDORA y DEW
- [ ] GitHub Secret scanning — revisar histórico en Settings > Security
- [ ] #43 IaC: Versionar los 16 `docker-compose` de Madre en `madre-config`
- [ ] #43 IaC: Versionar los `.env` de cada proyecto (sin secretos, solo template)

---

## 🔵 BAJA — Backlog (requieren tu input)

- [ ] [#51](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/51) Isla Acer — contenido
- [ ] [#52](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/52) Isla Thea — contenido
- [ ] [#53](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/53) Isla Impresión 3D — contenido
- [ ] [#54](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/54) Isla Formación — contenido
- [ ] [#57](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/57) WIKI-001 Filosofía — Bloque 2 requiere input
- [ ] [#58](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/58) ADR-011 thea-ia — decidir opción A/B/C
- [ ] `acer-config` — estructurar repo vacío
- [ ] `ollama-stack` — estructurar repo
- [ ] `local-brain` — estructurar repo
- [ ] `investigacion-ia` — crear estructura

---

## ✅ CERRADO — Esta semana

- [x] **2026-07-13** #44 HAL-007 — `.env` THDORA malformado → corregido
- [x] **2026-07-13** #45 HAL-008 — Token Telegram expuesto → rotado y actualizado en `.env` real
- [x] **2026-07-13** #46 HAL-009 — `thdora-bot` crash loop → recreado con `force-recreate`, healthy
- [x] **2026-07-13** Investigación Gemini → registrada como investigación técnica en diario Dew
- [x] **2026-07-13** Inventario real de contenedores Madre → documentado en `docs/inventario-madre.md`

---

_Actualizado: 2026-07-13 14:15 CEST · cierre sesión tarde · #44 #45 #46 CERRADOS_
