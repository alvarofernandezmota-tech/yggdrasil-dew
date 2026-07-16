---
title: Estado Isla IA Local
tipo: estado-isla
author: Alvaro Fernandez Mota
creado: 2026-07-12
actualizado: 2026-07-16 16:06 CEST
ruta: docs/islas/ESTADO-ISLA-IA-LOCAL.md
tags: [isla, ia-local, ollama, qdrant, open-webui, estado]
status: auditada
---

# 🧠 Estado Isla IA Local

> Auditada en sesión 2026-07-16 vía SSH directo a Madre.
> Stack IA local: Ollama + Open-WebUI + Qdrant + ollama-embeddings.

---

## Estado general

| Campo | Valor |
|---|---|
| **Estado** | 🟡 Parcialmente operativa |
| **Repo principal** | [ollama-stack](https://github.com/alvarofernandezmota-tech/ollama-stack) |
| **Ruta física en Madre** | `/home/varopc/Projects/ollama-stack` (verificar) |
| **Última auditoría** | 2026-07-16 16:06 CEST |

---

## Servicios — estado real verificado 2026-07-16

| Servicio | Estado real | Imagen | Notas |
|---|---|---|---|
| `ollama` | ✅ Up 2d healthy | ollama/ollama:latest | Operativo |
| `ollama-embeddings` | ✅ Up 2d healthy | ollama/ollama:latest | Operativo |
| `open-webui` | 🔴 Up 2d unhealthy | open-webui:main | ⚠️ Requiere diagnóstico |
| `qdrant` | 🔴 Up 2d unhealthy | qdrant/qdrant:latest | ⚠️ Requiere diagnóstico |

---

## Issues activos

| Descripción | Prioridad | Acción |
|---|---|---|
| `open-webui` unhealthy 2d+ | 🟡 Media | `docker logs open-webui` — diagnosticar |
| `qdrant` unhealthy 2d+ | 🟡 Media | `docker logs qdrant` — diagnosticar |

> Ambos llevan 2 días unhealthy. Pueden seguir funcionando (healthcheck mal configurado) o tener un problema real. Verificar logs.

---

## Comandos de diagnóstico

```bash
docker logs --tail 50 open-webui
docker logs --tail 50 qdrant
docker inspect open-webui | grep -A5 Health
docker inspect qdrant | grep -A5 Health
```

---

## Dependencias con otras islas

| Dependencia | Isla destino | Tipo |
|---|---|---|
| RAG futuro sobre canon Yggdrasil | DEW | Largo plazo |
| THDORA consumirá Ollama como LLM local | THDORA | Futuro |

---

_Actualizado: 2026-07-16 16:06 CEST · Auditoría SSH directa · Perplexity MCP_
