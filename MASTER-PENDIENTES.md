---
tags: [pendiente, master, planificacion, urgente, python, pentest, llm, ia-local]
fecha: 2026-06-27
revision: cada-domingo
owner: alvarofernandezmota-tech
perfil: dev-python · pentest-linux · ia-local · llm · ml
---

# 📋 MASTER PENDIENTES — Ecosistema completo

> Fuente única de verdad de TODO lo pendiente.
> Última auditoría: 27 jun 2026 04:18 CEST — Perplexity vía MCP
> Se revisa cada domingo. Se ejecuta cada día desde aquí.

---

## 🟢 HOY — 27 jun 2026 (sábado)

### ✅ Completado esta sesión (madrugada 03:00–04:18)
- [x] **MadreAP WiFi resuelto** — hostapd + systemd-networkd + UFW ✅ persistente tras reboot
- [x] **`iwd` desactivado** — conflicto con hostapd resuelto
- [x] **Acer (theodora) conectado** — `192.168.72.26` · ping OK · internet OK
- [x] **UFW reglas wlan0** — DHCP + routing permanentes
- [x] **Inbox vaciada** — 3 ficheros migrados a `docs/` y `diarios/`
- [x] **ESTADO-SISTEMA.md** actualizado 03:56
- [x] **`docs/infra/red-madre-ap.md`** — referencia permanente red creada
- [x] **ADR-004** — seguridad privilege explosion documentado
- [x] **`inbox/2026-06-27-monitoring-pentest-research.md`** — investigación SOC homelab stack completo (7 capas, script levantamiento, dashboards Grafana, THDORA webhook, cheatsheet)
- [x] **Prompt Gemini generado** — contexto completo para continuar con scripts de Fase 1–4 en Madre
- [x] **Plan de acción ordenado** documentado — Fase 0→9 alineado con PLAN-SEGURIDAD-Y-DESPLIEGUE.md

### 🔴 Pendiente crítico — próxima sesión (en casa)
- [ ] `git pull --rebase` en Madre — sincronizar repo
- [ ] **FASE 1 — Seguridad red ANTES de levantar dockers:**
  - [ ] UFW activar completo — `setup/servidor/ufw-reglas-completas.sh`
  - [ ] SSH hardening — `setup/servidor/fase1b-seguridad.md`
  - [ ] Tailscale autoarranque — `sudo systemctl enable tailscaled`
  - [ ] Deshabilitar suspensión — `sudo systemctl mask sleep.target suspend.target`
  - [ ] Reboot verificación final
- [ ] **FASE 2 — Script seguro levantar dockers** — `scripts/start-batcueva.sh`
- [ ] **Gemini → scripts generados** — instalar en Madre (instalar-dependencias.sh, ufw-completo.sh, ssh-hardening.sh)
- [ ] **Script Restic backup** — ver `docs/infra/backup-restic.md`
- [ ] **Uptime Kuma → THDORA** — alertas Telegram cuando caiga servicio
- [ ] **Grafana dashboard** — CPU + RAM + temperatura + latencia Ollama + Docker

---

## 🟡 ESTA SEMANA

### Seguridad Acer (theodora)
- [ ] Instalar Prey (rastreo antirrobo): `sudo apt install prey`
- [ ] Verificar Computrace en BIOS: `sudo dmidecode -t bios | grep -i computrace`
- [ ] Extraer y documentar número de serie: `sudo dmidecode -t system | grep Serial`

### Red avanzada
- [ ] HT40 en hostapd — mayor velocidad MadreAP
- [ ] Mitmproxy / tcpdump en `wlan0` — interceptar tráfico clientes
- [ ] VLANs — separar red pentest de red doméstica (ver ADR-004 + investigación 27-jun)
- [ ] Wazuh prereq: `sudo sysctl -w vm.max_map_count=262144`
- [ ] Suricata IDS pasivo en Madre (ver inbox/2026-06-27-monitoring-pentest-research.md)

### THDORA — handlers pendientes
- [ ] Implementar `/estado`
- [ ] Implementar `/inbox`
- [ ] Implementar `/diario`
- [ ] Implementar `/pull <modelo>`
- [ ] Integrar Uptime Kuma webhooks → THDORA (endpoint `/webhook/uptime`)

### Modelos Ollama pendientes
- [ ] `llama3.1:8b`
- [ ] `bge-m3`
- [ ] `nomic-embed-text`

### Pentest — primer uso real
- [ ] Acceder Kali Desktop `http://100.91.112.32:6901`
- [ ] Primer scan Nmap desde Kali
- [ ] SpiderFoot: primer scan OSINT
- [ ] Bettercap: `network_mode: host`

### varopc — escritorio
- [ ] Audio sistema — mapear teclas volúmen Hyprland
- [ ] Tercer monitor → adaptador DVI-D → HDMI ~3-5€
- [ ] Obsidian Git — plugin + auto-commit + Dataview + Templater
- [ ] Instalar Tailscale en Redmi A5 (Play Store)

### Repositorios GitHub a crear
- [ ] alvarofernandezmota-tech/chatbot-control
- [ ] alvarofernandezmota-tech/terminal-ia

---

## 🟢 PRÓXIMAS 2 SEMANAS

### IA local — integración
- [ ] Open WebUI → RAG sobre yggdrasil-dew
- [ ] Crear Modelfile Erika en Ollama → primer agente local
- [ ] Local GPT Obsidian → apuntar a Ollama Madre
- [ ] n8n → pipeline: logs nmap → Qdrant

### Python — desarrollo
- [ ] Terminar módulo 05 del curso Python
- [ ] Script Python query a Ollama API local
- [ ] Script Python reconocimiento red básico

### SIEM — despliegue
- [ ] Levantar Wazuh (prereq sysctl primero)
- [ ] Instalar agente Wazuh en Acer
- [ ] DefectDojo: primer finding importado

---

## 🔵 FUTURO

### BATCUEVA — expansión Engineering Excellence
- [ ] **Restic backup offsite** → Cloudflare R2 o Backblaze B2
- [ ] **Rootless Docker** — seguridad contenedores
- [ ] **Mozilla SOPS** — secrets cifrados en repo
- [ ] **Ansible Playbooks** — IaC completo (0% config manual)
- [ ] Dockge (UI docker-compose visual) — puerto 5010
- [ ] Migrar Ollama → llama.cpp puro

### Hardware
- [ ] RAM 16GB DDR4 SO-DIMM varopc (~40-50€)
- [ ] RTX 3060 12GB Madre (~200-250€ 2ª mano)

---

## ✅ COMPLETADO (histórico)

| Fecha | Tarea |
|---|---|
| 2026-06-27 | Investigación SOC homelab stack — inbox/2026-06-27-monitoring-pentest-research.md |
| 2026-06-27 | Prompt Gemini completo con contexto técnico total del ecosistema |
| 2026-06-27 | MadreAP WiFi resuelto — hostapd + networkd + UFW persistente |
| 2026-06-27 | Acer (theodora) conectado a MadreAP 192.168.72.26 |
| 2026-06-27 | Inbox vaciada — 3 ficheros migrados a docs/ |
| 2026-06-27 | docs/infra/red-madre-ap.md creado |
| 2026-06-27 | ADR-004 seguridad privilege explosion documentado |
| 2026-06-25 | Fix healthcheck qdrant + open-webui — TCP bash check |
| 2026-06-25 | Stack 13 contenedores 100% healthy |
| 2026-06-25 | Ficheros infra subidos al repo |
| 2026-06-25 | Auditoría Engineering Excellence documentada |
| 2026-06-25 | GitHub Actions CI activo — yamllint |
| 2026-06-25 | ADR-001/002/003 creados |
| 2026-06-25 | Ansible bootstrap |
| 2026-06-25 | Stack ciberseguridad completo — OSINT + Pentest + SIEM + Vuln |
| 2026-06-25 | Comando `bc` instalado |
| 2026-06-25 | SSH sin contraseña varopc→Madre |
| 2026-06-25 | SSH GitHub sin passphrase |
| 2026-06-24 | docker-compose.yml optimizado |
| 2026-06-23 | filosofia.md v3.0 |
| 2026-06-22 | Netdata multi-nodo Madre + Acer |
| 2026-06-22 | 15 fichas LLM en agentes/ |

---

## 🗓️ Planificación semanal

```
Lunes     → thdora + Madre (día técnico)
Martes    → formación Python
Miércoles → thdora handlers + Python bots
Jueves    → OSINT + pentest + seguridad
Viernes   → LLM + IA local + Ollama
Sábado    → libre / exploración     ← HOY
Domingo   → revisión semanal + auditoría inbox
```

---
_Actualizado: 27 jun 2026 04:18 CEST — Perplexity vía MCP_
_Ver: [[HOME]] · [[ECOSISTEMA]] · [[ESTADO-SISTEMA]] · [[inbox/README]]_
