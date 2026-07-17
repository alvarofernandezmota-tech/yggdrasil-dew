---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-APERTURA-MADRE.md
tags: [protocolo, apertura, madre, ssh, docker, infra]
status: vigente
version: 1.0
---

# PROTOCOLO-APERTURA-MADRE v1.0

> Ejecutar al iniciar cualquier sesion de trabajo que involucre Madre (infra, agentes, Docker).
> Complementa PROTOCOLO-APERTURA-SESION.md — no lo sustituye.
> Tiempo estimado: 2-3 min.
> Acceso: `ssh varopc@100.91.112.32`

---

## Paso 1: Conectar y verificar que Madre responde

```bash
ssh varopc@100.91.112.32
hostname && uptime
```

> Si no conecta → revisar Tailscale. Si Tailscale cae → acceso fisico o reset de red.

---

## Paso 2: Snapshot rapido de contenedores

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

Verificar que los contenedores criticos esten `Up`:

| Contenedor | Puerto host | Estado esperado |
|---|---|---|
| ollama | 11434 | Up |
| open-webui | 8080 | Up |
| qdrant | 6333 | Up |
| gitea | 3003 / 2222 | Up |
| grafana | 3000 | Up |
| yggdrasil-mcp | 3001 | Up |

> Si alguno esta `Exited` o `unhealthy` → aplicar PROTOCOLO-AUDITORIA-MADRE antes de continuar.

---

## Paso 3: Verificar disco y RAM

```bash
df -h / | tail -1 && free -h | grep Mem
```

> Alarma si disco > 85% o RAM disponible < 2 GB. Registrar issue si es recurrente.

---

## Paso 4: Registrar apertura

```
[ ] Anotar en diario DEW del dia: "Sesion Madre — [motivo]"
[ ] Si hay contenedor caido: crear issue en yggdrasil-dew antes de actuar
[ ] Si cambio de infra previsto: revisar PROTOCOLO-DESPLIEGUE-CONTENEDOR
```

---

_Creado: 2026-07-17 v1.0 · Perplexity MCP_
