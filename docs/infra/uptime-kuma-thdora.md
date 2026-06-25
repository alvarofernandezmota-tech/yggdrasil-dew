---
tags: [uptime-kuma, thdora, telegram, alertas, monitoring]
fecha: 2026-06-25
---

# Uptime Kuma → THDORA — Alertas Telegram

## Arquitectura

```
Servicio caído
    ↓
Uptime Kuma detecta (cada 60s)
    ↓
Webhook POST → localhost:8001/webhook
    ↓
uptime-kuma-webhook.py
    ↓
Telegram API → THDORA bot → tu móvil
```

## Instalación

```bash
# En Madre como root:
sudo bash setup/servidor/install-uptime-kuma-webhook.sh
```

## Configurar Uptime Kuma

1. Abrir `http://madre:3002`
2. Settings → Notifications → Add Notification
3. Tipo: **Webhook**
4. URL: `http://localhost:8001/webhook`
5. Method: POST
6. Aplicar a todos los monitores que quieras

## Monitores recomendados

| Servicio | URL a monitorizar | Intervalo |
|---|---|---|
| Ollama | `http://localhost:11434` | 60s |
| Open WebUI | `http://localhost:3001` | 60s |
| Qdrant | `http://localhost:6333/health` | 60s |
| THDORA | `http://localhost:8000` | 60s |
| n8n | `http://localhost:5678` | 60s |
| Grafana | `http://localhost:3000` | 60s |

## Mensaje de alerta ejemplo

```
🔴 Batcueva — CAÍDO
• Servicio: ollama
• URL: http://localhost:11434
• Mensaje: Connection refused
• Hora: 2026-06-25 03:12:44
```

---
_Creado: 25 jun 2026 — Perplexity vía MCP_
