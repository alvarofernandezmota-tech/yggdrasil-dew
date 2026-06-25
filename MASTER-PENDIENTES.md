---
tags: [pendiente, master, planificacion, urgente, python, pentest, llm, ia-local]
fecha: 2026-06-25
revision: cada-domingo
owner: alvarofernandezmota-tech
perfil: dev-python · pentest-linux · ia-local · llm · ml
---

# 📋 MASTER PENDIENTES — Ecosistema completo

> Fuente única de verdad de TODO lo pendiente.
> Última auditoría: 25 jun 2026 18:30 CEST — Perplexity vía MCP
> Se revisa cada domingo. Se ejecuta cada día desde aquí.

---

## 🟢 HOY — 25 jun 2026 (jueves)

### ✅ Completado hoy
- [x] Stack Fase 1+2 HEALTHY — ollama + open-webui + qdrant
- [x] SSH sin contraseña varopc→Madre
- [x] SSH GitHub sin passphrase
- [x] git pull/push funcionando desde Madre
- [x] Alias `bc` instalado en .zshrc
- [x] Stack OSINT/Pentest/SIEM/Vuln YMLs creados
- [x] Orquestador maestro batcueva-master.yml
- [x] GitHub Actions CI — yamllint en cada push
- [x] Ansible bootstrap — infra/ansible/bootstrap-nodo.yml
- [x] Imágenes Docker corregidas
- [x] **Fix healthcheck qdrant** — TCP bash check
- [x] **Fix healthcheck open-webui** — TCP bash check
- [x] **Stack 13 contenedores 100% operativo**
- [x] **Ficheros infra subidos** — docker-compose, headscale, thdora-handlers, ufw
- [x] **Auditoría Engineering Excellence** — documentada
- [x] **Diario sesión tarde** — diarios/2026-06-25-tarde.md
- [x] **ESTADO-SISTEMA.md** — actualizado 18:30

### 🔴 Pendiente crítico — próxima sesión
- [ ] `git pull --rebase` en Madre — sincronizar fixes del repo
- [ ] **Script Restic backup** — copias cifradas automáticas (regla 3-2-1)
- [ ] **Uptime Kuma → THDORA** — alertas Telegram cuando caiga servicio
- [ ] **Grafana dashboard** — CPU + RAM + latencia Ollama
- [ ] Levantar SpiderFoot — `docker compose -f docker/batcueva-osint.yml up -d spiderfoot`
- [ ] Levantar Kali Desktop — `bc up pentest`

---

## 🟡 ESTA SEMANA

### Red y seguridad Madre
- [ ] UFW activar — ver `setup/servidor/ufw-reglas-completas.sh`
- [ ] SSH hardening — ver `setup/servidor/fase1b-seguridad.md`
- [ ] Tailscale autoarranque
- [ ] Wazuh prereq: `sudo sysctl -w vm.max_map_count=262144`
- [ ] Deshabilitar suspensión en Madre

### THDORA — handlers pendientes
- [ ] Implementar `/estado`
- [ ] Implementar `/inbox`
- [ ] Implementar `/diario`
- [ ] Implementar `/pull <modelo>`
- [ ] Integrar Uptime Kuma webhooks → THDORA

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
- [ ] alvarofernandezmota-tech/ollama-stack
- [ ] alvarofernandezmota-tech/osint-stack
- [ ] alvarofernandezmota-tech/local-brain
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
- [ ] **VLANs** — segmentar red pentest de red doméstica
- [ ] **Ansible Playbooks** — IaC completo
- [ ] Dockge (UI docker-compose visual) — puerto 5010
- [ ] Migrar Ollama → llama.cpp puro

### Hardware
- [ ] RAM 16GB DDR4 SO-DIMM varopc (~40-50€)
- [ ] RTX 3060 12GB Madre (~200-250€ 2ª mano)

---

## ✅ COMPLETADO (histórico)

| Fecha | Tarea |
|---|---|
| 2026-06-25 | Fix healthcheck qdrant + open-webui — TCP bash check |
| 2026-06-25 | Stack 13 contenedores 100% healthy — sesión tarde |
| 2026-06-25 | Ficheros infra subidos al repo |
| 2026-06-25 | Auditoría Engineering Excellence documentada |
| 2026-06-25 | GitHub Actions CI activo — yamllint |
| 2026-06-25 | ADR-001/002/003 creados |
| 2026-06-25 | Ansible bootstrap |
| 2026-06-25 | Stack ciberseguridad completo — OSINT + Pentest + SIEM + Vuln |
| 2026-06-25 | Comando `bc` instalado |
| 2026-06-25 | Stack Fase 1+2 HEALTHY |
| 2026-06-25 | SSH sin contraseña varopc→Madre |
| 2026-06-25 | SSH GitHub sin passphrase |
| 2026-06-24 | docker-compose.yml optimizado |
| 2026-06-24 | Fases 1-4 documentadas |
| 2026-06-23 | filosofia.md v3.0 |
| 2026-06-23 | ADR homelab + docs-as-code |
| 2026-06-23 | Auditorías completas todas las carpetas |
| 2026-06-22 | Netdata multi-nodo Madre + Acer |
| 2026-06-22 | 15 fichas LLM en agentes/ |

---

## 🗓️ Planificación semanal

```
Lunes     → thdora + Madre (día técnico)
Martes    → formación Python
Miércoles → thdora handlers + Python bots
Jueves    → OSINT + pentest + seguridad     ← HOY
Viernes   → LLM + IA local + Ollama
Sábado    → libre / exploración
Domingo   → revisión semanal + auditoría inbox
```

---
_Actualizado: 25 jun 2026 18:30 CEST — Perplexity vía MCP_
_Ver: [[HOME]] · [[CONTEXT]] · [[ECOSISTEMA]] · [[ESTADO-SISTEMA]] · [[inbox/README]]_
