---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-06
actualizado: 2026-07-16 15:32 CEST
ruta: docs/canon/ESTADO-SISTEMA.md
tags: [estado, sistema, ecosistema, canon]
status: vigente
---

# ESTADO-SISTEMA — Ecosistema Yggdrasil

> Fuente de verdad del estado operativo actual del ecosistema.
> Actualizar en cada cierre de sesion que cambie algo estructural.
> Ultima actualizacion: 2026-07-16 15:32 CEST

---

## Repos del ecosistema

| Repo | Funcion | Visibilidad | Estado |
|---|---|---|---|
| yggdrasil-dew | Cerebro tecnico: canon, ADRs, protocolos, plantillas, diarios sesion | Publico | ✅ Activo |
| yggdrasil-wiki | Mapa conceptual: islas tematicas | Publico | ✅ Activo |
| yggdrasil-tracking | Vida personal: diarios, metas, rituales | Privado | ✅ Activo |
| yggdrasil-formacion | Aprendizaje tecnico: apuntes, HTB, labs | Publico | ✅ Activo |
| yggdrasil-scripts | Scripts de automatizacion del ecosistema | Publico | 🔵 En construccion |
| madre-config | Configuracion del servidor Madre | Privado | ✅ Activo |
| ollama-stack | Stack de IA local (Ollama + modelos) | Privado | 🔵 En construccion |
| THDORA | Agente de automatizacion del ecosistema | Privado | ⚪ Futuro |

---

## Estado del canon — 2026-07-16

### Protocolos vigentes (protocolo/)

| Nivel | Cantidad | Estado |
|---|---|---|
| NIVEL 1 — Globales (sesion + cambio) | 10 protocolos | ✅ Completo |
| NIVEL 2 — Por repo x4 (apertura/contexto/sincronizacion/auditoria) | 16 protocolos | ✅ Completo |
| NIVEL 3 — Atomos (9 tipos de contenido) | 9 protocolos | ✅ Completo |
| INDEX.md | v4.0 | ✅ Actualizado |
| **TOTAL** | **36 protocolos + INDEX** | ✅ |

### Plantillas vigentes (docs/canon/)

| Plantilla | Estado |
|---|---|
| PLANTILLA-DIARIO-DEW | ✅ v1.0 |
| PLANTILLA-DIARIO-TRACKING | ✅ v1.0 |
| PLANTILLA-ISLA-WIKI | ✅ v1.0 |
| PLANTILLA-APUNTE-FORMACION | ✅ v1.0 |
| PLANTILLA-ADR | ✅ v1.0 |
| PLANTILLA-PROTOCOLO | ✅ v1.0 |
| PLANTILLA-ESTADO-ISLA | ✅ v1.0 |

### ADRs

| Rango | Estado |
|---|---|
| ADR-001 a ADR-013 | ✅ Completos y en INDEX-ADR.md |

---

## Estado de fases — 2026-07-16

| Fase | Estado |
|---|---|
| F0 Seguridad | ⚪ Parcial (SSH/Puerto21 pendiente terminal) |
| F1 ADRs canon | ✅ CERRADA |
| F2 Indices WIKI | ✅ CERRADA |
| F3 Purga WIKI | ⚪ PENDIENTE (sesion dedicada) |
| F4 MCP | ✅ CERRADA |
| F5 CI enforcement | ✅ CERRADA |
| F6 Ritual semanal | 📌 DEFINIDO (primera ejecucion: 19-Jul) |
| F7 GitOps/Observabilidad | 🔵 PARCIAL |
| F8 VIDAPERSONAL → tracking | ✅ CERRADA |
| F9 Protocolo cierre/inicio/ADR | ✅ CERRADA |
| F10 Naming + borrado | ✅ CERRADA |
| F11 Separacion DEW/tracking diarios | ✅ CERRADA |
| F12 fix #65 nombres repos | ✅ CERRADA |
| F13 Protocolos contexto x4 repos | ✅ CERRADA |
| F14 Protocolos auditoria x4 repos | ✅ CERRADA |
| F15 Sistema completo protocolos | ✅ CERRADA 2026-07-16 |
| F16 Islas contenido personal | ⚪ CONCEPTUAL |

---

## Bloqueantes criticos (requieren terminal)

| Issue | Descripcion | Urgencia |
|---|---|---|
| #31 | HAL-005 HDD Madre 28.000h | 🔴 Alta |
| #45 | HAL-008 Token Telegram | 🔴 Alta |
| #15 | Puerto 21 FTP abierto | 🔴 Alta |

---

## Separacion DEW / Tracking — regla canon

```
yggdrasil-dew/docs/diarios/    -> diario tecnico de sesion
yggdrasil-tracking/diarios/   -> diario personal (vida, estado, rituales)
Un dia puede tener los dos. Son complementarios.
```

---

## Ultima auditoria ecosistema

- Fecha: 2026-07-16
- Resultado: F15 cerrada, sistema de protocolos completo (4 niveles)
- Proxima auditoria programada: primer domingo de agosto 2026

---

_Actualizado: 2026-07-16 15:32 CEST - F15 CERRADA - sistema protocolos completo - Perplexity MCP_
