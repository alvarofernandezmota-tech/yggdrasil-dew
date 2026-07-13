---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, incidente, hal, seguridad]
status: vigente
---

# Protocolo de Respuesta a Incidentes (HAL)

> Usar cuando un servicio cae, hay un crash loop, o se detecta un problema de seguridad.

## Clasificación

| Nivel | Criterio | Ejemplo |
|---|---|---|
| 🔴 CRÍTICO | Servicio de seguridad caído, secretos expuestos | HAL-008, HAL-009 |
| 🟡 MEDIO | Servicio no crítico caído, degradación | HAL-007 |
| ⚪ BAJO | Aviso, anomalía sin impacto inmediato | log raro |

## Pasos

1. **Detectar** — watchdog, logs, alerta manual
2. **Abrir issue HAL en DEW** inmediatamente con:
   - Timestamp de detección
   - Evidencia (logs, output)
   - Impacto estimado
   - Hipótesis inicial
3. **Aislar** — si hay secretos expuestos → `PROTOCOLO-SECRETOS.md` ahora
4. **Diagnosticar**:
   ```bash
   docker logs --tail 200 <servicio>
   docker inspect <servicio> | grep -A 20 'Env'
   docker ps --format 'table {{.Names}}\t{{.Status}}'
   ```
5. **Resolver** — documentar cada paso en el issue
6. **Verificar** — servicio `healthy` durante 30 min sin reinicio
7. **Cerrar issue** con causa raíz + lección aprendida

## Regla de oro

> Nunca imprimir `.env` en el chat. Ver `PROTOCOLO-SECRETOS.md`.

## Refs
- HAL-007 (#44), HAL-008 (#45), HAL-009 (#46)

---
_Creado: 2026-07-13 · Perplexity MCP_
