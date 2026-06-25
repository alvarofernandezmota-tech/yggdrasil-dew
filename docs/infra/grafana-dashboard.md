---
tags: [grafana, prometheus, dashboard, monitoring, infra]
fecha: 2026-06-25
---

# Grafana Dashboard — Batcueva Sistema Madre

## Requisitos

- Grafana corriendo en puerto 3000
- Prometheus en puerto 9090
- **node_exporter** instalado en Madre (expone métricas CPU/RAM/disco)

## Instalar node_exporter en Madre

```bash
# Instalar
sudo apt-get install -y prometheus-node-exporter
sudo systemctl enable prometheus-node-exporter
sudo systemctl start prometheus-node-exporter
# Verificar: http://localhost:9100/metrics
```

## Configurar Prometheus para scrapear Madre

Añadir al `prometheus.yml`:

```yaml
scrape_configs:
  - job_name: 'madre'
    static_configs:
      - targets: ['localhost:9100']
```

## Cargar el dashboard

El dashboard está en `docker/grafana/provisioning/dashboards/batcueva.json`.

Se carga automáticamente si Grafana tiene el volumen de provisioning montado.
O importar manualmente: Grafana → Dashboards → Import → pegar el JSON.

## Paneles incluidos

| Panel | Métrica |
|---|---|
| CPU % | `node_cpu_seconds_total` |
| RAM usada/libre | `node_memory_MemAvailable_bytes` |
| Disco / | `node_filesystem_free_bytes` |
| Contenedores activos | `container_last_seen` |

## Próximos paneles a añadir

- [ ] Temperatura CPU (`node_hwmon_temp_celsius`)
- [ ] Latencia Ollama (custom metric desde n8n)
- [ ] Requests/min a THDORA
- [ ] Estado backups Restic

---
_Creado: 25 jun 2026 — Perplexity vía MCP_
