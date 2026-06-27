---
tags: [tipo/ficha, estado/activo, infra/docker, infra/grafana]
fecha: 2026-06-25
---

# 📊 Observabilidad — Stack Batcueva

## Estado actual

| Servicio | Estado | Puerto | Pendiente |
|---|---|---|---|
| Grafana | ✅ up | 3000 | Dashboard CPU + latencia Ollama |
| Prometheus | ✅ up | 9090 | — |
| Uptime Kuma | ✅ healthy | 3002 | Integrar con THDORA-bot |

## Integraciones pendientes

### Uptime Kuma → THDORA (Telegram)
- Configurar webhook en Uptime Kuma apuntando a `http://thdora:8000/webhook/uptime`
- Implementar handler `/webhook/uptime` en THDORA-bot
- Mensaje: `⚠️ [servicio] caído desde [hora]`

### Grafana dashboard
- Panel: CPU % Madre en tiempo real
- Panel: RAM usada
- Panel: Latencia Ollama (`/api/generate` p95)
- Panel: Temperatura CPU (requiere `node_exporter`)

## MLOps — Integridad RAG

- **Riesgo:** vectores corruptos o modelo actualizado sin tracking = alucinaciones sin baseline
- Pipeline validación antes de ingest Qdrant (chunking + schema check)
- Versionar Modelfile exacto en ADRs (ej: `qwen2.5:3b-v1.0`)

---
_Ver: [[MASTER-PENDIENTES]] · [[ESTADO-SISTEMA]]_
