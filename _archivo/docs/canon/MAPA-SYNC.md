---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-05 21:13 CEST
ruta: docs/canon/MAPA-SYNC.md
tags: [canon, sync, sincronizacion, fuente-de-verdad, ecosistema]
status: vigente
---

# 🔄 MAPA DE SINCRONIZACIÓN DEL ECOSISTEMA YGGDRASIL

> Describe cómo se sincronizan, reflejan y enlazan los repos y capas del ecosistema.
> Es la guía para evitar cerebro partido y duplicados.

---

## 1. Principio base

La sincronización no es simétrica. Cada repo tiene **fuente de verdad** para ciertos tipos de información. Los demás son enlaces, resúmenes o redirects — nunca cópias.

---

## 2. Tabla de sincronización por tipo de contenido

| Tipo de contenido | Fuente de verdad | Reflejado en | Tipo de sincronía |
|---|---|---|---|
| Arquitectura técnica | `yggdrasil-dew` | WIKI (isla cerebro) | Unidireccional Dew → WIKI |
| Roadmap técnico | `yggdrasil-dew` | WIKI (resumen en islas) | Unidireccional Dew → WIKI |
| Backlog técnico | `yggdrasil-dew` issues | WIKI (enlaces) | Unidireccional Dew → WIKI |
| Diarios técnicos | `yggdrasil-dew/docs/diarios/` | WIKI (enlaces desde islas) | Unidireccional Dew → WIKI |
| Canon del ecosistema | `yggdrasil-dew/docs/canon/` | WIKI (referencias) | Unidireccional Dew → WIKI |
| Islas conceptuales | `WIKI---PERSONAL/wiki/islas/` | Dew (referencias) | Unidireccional WIKI → Dew |
| Relaciones entre islas | `WIKI---PERSONAL/wiki/relaciones/` | — | Solo en WIKI |
| Config operativa Madre | `madre-config` | WIKI (isla infra) | Unidireccional Madre → WIKI |
| Seguridad (hallazgos) | `yggdrasil-secops` | Dew (estado), WIKI (isla seguridad) | Unidireccional SecOps → Dew/WIKI |
| Formación técnica | `formacion-tech` | WIKI (isla formación) | Unidireccional formación → WIKI |
| Vida personal | `VIDAPERSONAL` | WIKI (isla conocimiento) | Unidireccional VIDA → WIKI |

---

## 3. Reglas de sincronización

### Dew ↔ WIKI
- Dew **no** replica contenido de WIKI — lo referencia.
- WIKI **no** replica contenido técnico de Dew — lo enlaza.
- Las islas pueden apuntar a: diarios en Dew, docs de arquitectura, issues relevantes.

### Dew ↔ Madre
- Madre expone: estado de servicios, config de contenedores, logs operativos.
- Dew documenta: arquitectura de servicios, decisiones sobre infra, diarios de cambios.

### Dew ↔ SecOps
- SecOps genera: hallazgos HAL-XXX, planes de remediación, auditorías.
- Dew refleja: estado de seguridad en `ESTADO-SISTEMA.md`, tareas derivadas en backlog.

### Dew ↔ formacion-tech
- formacion-tech: apuntes, rutas, ejercicios.
- Dew refleja: qué formación impacta en arquitectura, qué aprendizajes se han aplicado.

### WIKI ↔ VIDAPERSONAL
- VIDAPERSONAL: proyectos vitales, hábitos, narrativa personal.
- WIKI refleja: isla conocimiento + isla vida (conceptual).

---

## 4. Workflows de sincronización

| Workflow | Fuente | Destino | Agente |
|---|---|---|---|
| Sync diarios | `docs/diarios/` en Dew | WIKI (islas) | Observador + Clasificador |
| Sync issues | Issues en repos técnicos | WIKI (vista conceptual) | Orquestador + Clasificador |
| Sync seguridad | Auditorías SecOps | Dew + WIKI | Guardian + Investigadores |
| Sync infra | `madre-config` + estado Madre | WIKI (isla infra) + Dew | Observadores + Investigadores |

---

## 5. Regla de no-duplicación

> Cada pieza de información tiene **un único repo canónico**.
> Las demás vistas son: enlaces, resúmenes o redirects.
> Si algo parece duplicado → Guardian Maestro lo marca, propone limpieza y actualiza este mapa.

---

## 6. Cuándo actualizar este mapa

Actualizar cuando:
- Se crea un nuevo repo
- Cambia el rol de un repo
- Se añade un nuevo tipo de contenido
- Se modifica la regla Dew vs WIKI
- Se integra un nuevo nodo (servidor, servicio crítico)

Registrar siempre el cambio en `docs/diarios/`.

---

_Creado: 2026-07-05 21:13 CEST · Perplexity-MCP_
