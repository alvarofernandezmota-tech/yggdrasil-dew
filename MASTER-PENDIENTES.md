# Master Pendientes — Yggdrasil

> Actualizado: 2026-07-02 02:30 CEST

---

## 🔴 Crítico — Inmediato

- [ ] **Cerrar puerto 21 FTP en router Digi** (`79.116.247.44`) — hallazgo SEC-001
- [ ] **Configurar rutas en local_tripwire** — actualmente con 0 archivos vigilados (variable `WATCH_PATHS` en docker-compose)
- [ ] **Ajustar healthcheck de log_guardian_bot** — aumentar `start_period` para evitar crash-loop
- [ ] **Ajustar timeout de tailscale_monitor** — el ping ICMP falla durante healthcheck

---

## 🟡 Prioritario — Esta semana

### Docker stack pendiente
- [ ] Levantar Wazuh Manager + Dashboard
- [ ] Levantar Suricata IDS (IDS pasivo wlan0)
- [ ] Verificar Kali KasmWeb cuando termine descarga
- [ ] Levantar Pihole + SearXNG

### Integración de alertas
- [ ] Conectar Suricata → Wazuh → AlertManager → Telegram (thdora-bot)
- [ ] Configurar Grafana con fuente Wazuh/Loki para histórico de alertas
- [ ] Wazuh: configurar agentes en theodora e iPhone
- [ ] Suricata: configurar reglas red local

### yggdrasil-secops (bots)
- [ ] Corregir crash-loop log_guardian_bot (healthcheck)
- [ ] Corregir crash-loop tailscale_monitor (timeout)
- [ ] Configurar WATCH_PATHS en local_tripwire (rutas críticas: `/etc`, configs docker, repos)
- [ ] Documentar arquitectura de bots en `yggdrasil-secops/README.md`
- [ ] Añadir yggdrasil-secops como git submodule en yggdrasil-dew (opcional)

---

## 🟢 Esta semana

- [ ] Pihole: configurar listas de bloqueo
- [ ] SearXNG: configurar instancia privada
- [ ] Wazuh dashboard: primeras alertas y dashboards
- [ ] Documentar arquitectura de red completa en `infra/`
- [ ] Script de backup automático de configs
- [ ] Tailscale: hacer login en Redmi A5 (pendiente)
- [ ] Auditar APIs sin auth: Ollama `:11434`, Qdrant `:6333`

---

## 📋 Backlog

- [ ] Migrate theodora configs to repo
- [ ] CI/CD básico para el repo
- [ ] Renovar certificados si hay servicios HTTPS
- [ ] Añadir AlertManager (9093) al stack
- [ ] Añadir Loki + Promtail al stack
- [ ] Evaluar CrowdSec vs fail2ban
- [ ] DefectDojo para gestión de hallazgos
- [ ] Ntfy como sistema de notificaciones push ligero

---

## ✅ Completado

- [x] SSH Hardening madre (ed25519, passphrase, no root, no password)
- [x] Ollama instalado y modelos descargados (qwen2.5, llama3.1, bge-m3, nomic-embed)
- [x] Pentest inicial red local (nmap, nikto, hydra)
- [x] MadreAP hostapd + dnsmasq operativo
- [x] Suspensión del sistema maskeada
- [x] Docker stack principal levantado (thdora, grafana, prometheus, qdrant, n8n, gitea, spiderfoot…)
- [x] ADB Redmi A5: optimización hotspot
- [x] Bots de monitorización activos (watchdog, tailscale monitor, network radar, log guardian, tripwire, guardian bot)
- [x] ECOSISTEMA.md actualizado con yggdrasil-secops, bots y nodo xiaomi
- [x] Análisis de logs de bots — issues detectados y documentados
