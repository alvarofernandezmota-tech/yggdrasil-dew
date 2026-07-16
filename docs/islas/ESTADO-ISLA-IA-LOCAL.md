---
title: Estado Isla IA Local
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:15 CEST
ruta: docs/islas/ESTADO-ISLA-IA-LOCAL.md
tags: [isla, ia-local, ollama, qdrant, open-webui, estado]
status: auditada
---

# 🧠 Estado Isla IA Local

> Auditada en sesión 2026-07-16 vía SSH directo a Madre + análisis de logs.
> Stack IA local: Ollama + Open-WebUI + Qdrant + ollama-embeddings.

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 Operativo con advertencias |
| **Repo principal** | [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) |
| **Ruta fisica en Madre** | Pendiente mapear (compose no encontrado en /home/varopc/Projects) |
| **Ultima auditoria** | 2026-07-16 16:15 CEST |

---

## Servicios — estado real verificado 2026-07-16

| Servicio | Estado Docker | Estado Real | Notas |
|---|---|---|---|
| `ollama` | ✅ Up 2d healthy | ✅ Operativo | — |
| `ollama-embeddings` | ✅ Up 2d healthy | ✅ Operativo | — |
| `open-webui` | 🔴 Up 2d unhealthy | ✅ FALSO POSITIVO | Ver analisis logs |
| `qdrant` | 🔴 Up 2d unhealthy | ✅ FALSO POSITIVO | Ver analisis logs |

---

## Analisis de logs — 2026-07-16

### open-webui — FALSO POSITIVO confirmado

- Log arranca limpio (v0.9.6), servidor HTTP activo, scheduler funcionando
- Carga modelo embedding `all-MiniLM-L6-v2` correctamente
- `UNEXPECTED: embeddings.position_ids` — ignorable, arquitectura diferente pero funcional
- **El unhealthy es del healthcheck mal configurado, no del servicio**
- CORS `*` activo — aceptable en red privada Tailscale, no recomendado en produccion publica
- **Servicio operativo. No requiere accion urgente.**

### qdrant — FALSO POSITIVO confirmado

- **100% del log son errores de telemetria** intentando conectar a `telemetry.qdrant.io`
- Madre no tiene salida a internet hacia ese endpoint (Tailscale/firewall)
- El servicio Qdrant en si funciona perfectamente
- **Fix recomendado:** deshabilitar telemetria via variable de entorno

**Fix pendiente — anadir al docker-compose de Qdrant:**
```yaml
environment:
  - QDRANT__TELEMETRY_DISABLED=true
```

> Pendiente localizar ruta del compose: `find /home/varopc -name "docker-compose*" | xargs grep -l qdrant` devolvio vacio en Projects — buscar en otras rutas.

```bash
find /home/varopc -name "docker-compose*" 2>/dev/null | head -20
```

---

## Issues activos

| Descripcion | Prioridad | Issue | Accion |
|---|---|---|---|
| Qdrant telemetria — ruido en logs | 🟡 Baja | [#70](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/70) | Añadir `QDRANT__TELEMETRY_DISABLED=true` al compose |
| Localizar compose de ollama-stack | 🟡 Media | — | `find /home/varopc -name "docker-compose*"` |
| CORS open-webui en `*` | 🟡 Baja | — | Aceptable en Tailscale |

---

## Dependencias con otras islas

| Dependencia | Isla destino | Tipo |
|---|---|---|
| RAG futuro sobre canon Yggdrasil | DEW | Largo plazo |
| THDORA consumira Ollama como LLM local | THDORA | Futuro |

---

_Actualizado: 2026-07-16 16:15 CEST · Auditoria SSH + analisis logs · Perplexity MCP_
