---
tipo: roadmap
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-05 12:00 CEST
ruta: ROADMAP-MASTER.md
tags: [roadmap, fases, estrategia, ecosistema]
status: vigente
---

# 🗺️ ROADMAP MASTER — Ecosistema Yggdrasil

> Fuente de verdad del plan estratégico.
> Actualizado en sesión 2026-07-05.
> Estado: **FASE AGENTES activa**

---

## 💡 Principio de evolución

```
Scripts → Tools de agentes
Bots → Sensores / actuadores
Agentes → Cerebros autónomos
Humano → Árbitro final
```

---

## 🟢 FASE ACTUAL: AGENTES

### A1 — MCP Server de Madre [EN DISEÑO]
- [ ] Implementar `mcp_server.py`
- [ ] Tools MVP: check_docker, get_ecosystem_state, read_roadmap
- [ ] Configurar en Cursor local
- [ ] Desplegar en docker-compose de Madre

### A2 — Health Agent [ESQUELETO LISTO]
- [ ] Desplegar health_agent_core.py en Madre
- [ ] Test en dry_run durante 48h
- [ ] Activar acciones automáticas safe

### A3 — Observabilidad (OTel)
- [ ] OTel Collector en docker-compose
- [ ] Loki para logs unificados
- [ ] Alertmanager con reglas básicas

### A4 — Guardrails en código
- [ ] Dry-run mode en todas las tools
- [ ] Circuit breakers
- [ ] Audit log inmutable

---

## ✅ FASES COMPLETADAS

### FASE INFRA
- [x] Madre operativa (LUKS+Btrfs, GTX 1060, Tailscale)
- [x] Docker stack
- [x] n8n operativo
- [x] Ollama con modelos locales
- [x] Open WebUI
- [x] Qdrant desplegado

### FASE BOTS
- [x] yggdrasilwatchdog — monitor contenedores
- [x] guardianbot — notificaciones Telegram
- [x] networkradar — escaneo LAN
- [x] logguardianbot — auth.log / ufw.log
- [x] localtripwire — detección cambios ficheros

---

## 🔴 PRÓXIMAS FASES

### FASE SOC / SEGURIDAD
- [ ] Wazuh homelab setup
- [ ] Suricata IDS de red
- [ ] UFW rules audit automatizado
- [ ] Pentest interno

### FASE thdora MULTI-USUARIO
- [ ] F10 Multi-usuario (BLOQUEADOR)
- [ ] F11 Scheduler APScheduler
- [ ] F12 IA lenguaje natural

---

_Migrado desde WIKI---PERSONAL: 2026-07-05 · Perplexity-MCP_
