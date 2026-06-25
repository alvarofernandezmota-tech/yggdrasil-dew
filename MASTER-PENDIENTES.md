---
tags: [pendiente, master, planificacion, urgente, python, pentest, llm, ia-local]
fecha: 2026-06-25
revision: cada-domingo
owner: alvarofernandezmota-tech
perfil: dev-python · pentest-linux · ia-local · llm · ml
---

# 📋 MASTER PENDIENTES — Ecosistema completo

> Fuente única de verdad de TODO lo pendiente.
> Última auditoría: 25 jun 2026 13:08 CEST — Perplexity vía MCP
> Se revisa cada domingo. Se ejecuta cada día desde aquí.

---

## 🟢 HOY — 25 jun 2026 (jueves)

### ✅ Completado hoy
- [x] Stack Fase 1+2 levantado y HEALTHY — ollama:11434 + open-webui:3001 + qdrant:6333 — 25 jun
- [x] SSH sin contraseña varopc→Madre — clave instalada con ssh-copy-id — 25 jun
- [x] litellm-config.yaml creado y correcto — setup/servidor/litellm-config.yaml — 25 jun
- [x] Auditoría respuesta Gemini — 10 errores detectados y documentados — 25 jun
- [x] ESTADO-SISTEMA.md actualizado con estado real — 25 jun
- [x] Investigación ADB/Android documentada — setup/servidor/investigacion/ — 25 jun
- [x] Handlers THDORA diseñados y documentados (código listo) — 25 jun
- [x] Orden de ejecución Fases 3+4 documentado y verificado — 25 jun

### 🔴 Pendiente crítico — hacer hoy
- [ ] **Generar .env Madre** — `openssl rand -hex 32` para N8N_ENCRYPTION_KEY y LITELLM_MASTER_KEY
- [ ] **Levantar Fase 3** — `docker compose -f setup/servidor/batcueva-fase3.yml up -d`
- [ ] **Levantar Fase 4** — `docker compose -f setup/servidor/batcueva-fase4.yml up -d`
- [ ] **Modelos Ollama** — tirar pulls en background (chat: qwen2.5:7b + llama3.1:8b + mistral:7b · embed: bge-m3 + nomic-embed-text)
- [ ] **Instalar Tailscale en Redmi A5** — desde Play Store (APK split no funciona por ADB)
- [ ] **Alias SSH `madre`** — añadir entrada en ~/.ssh/config de varopc

---

## 🟡 ESTA SEMANA

### thdora — handlers pendientes
- [ ] Implementar `/estado` en el repo thdora — código ya documentado en investigacion/
- [ ] Implementar `/inbox` en el repo thdora — código ya documentado
- [ ] Implementar `/diario` — append al diario del día + commit automático
- [ ] Implementar `/pull <modelo>` — docker exec ollama ollama pull
- [ ] Alerta proactiva: n8n detecta evento → THDORA avisa por Telegram
- [ ] Crear docs/DEPLOY.md · docs/SERVIDOR_MADRE.md · docs/TROUBLESHOOTING.md en repo thdora

### inbox — llevar 3 días pendiente
- [ ] Ejecutar `bash migrate-inbox.sh` desde varopc (script ya generado)
- [ ] Verificar que quedan solo README.md + MASTER-PENDIENTES.md + .gitkeep
- [ ] Clasificar archivos ADB → setup/movil/ · hotspot → setup/red/

### Red y seguridad Madre
- [ ] Tailscale autoarranque — ver setup/servidor/tailscale-autoarranque.md
- [ ] UFW activar — ver setup/servidor/ufw-seguridad.md
- [ ] SSH hardening — ver setup/servidor/fase1b-seguridad.md
- [ ] Deshabilitar suspensión: `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

### Claude — refactor repo nivel ingeniero
- [ ] Abrir Claude con acceso MCP
- [ ] Prompt en inbox/2026-06-23-prompt-claude-refactor-repo
- [ ] Tareas: auditar + .obsidian/ workspace + HOME.md + CONVENCIONES.md

### Repos GitHub a crear
- [ ] alvarofernandezmota-tech/ollama-stack
- [ ] alvarofernandezmota-tech/osint-stack
- [ ] alvarofernandezmota-tech/local-brain
- [ ] alvarofernandezmota-tech/chatbot-control
- [ ] alvarofernandezmota-tech/terminal-ia

### varopc — escritorio
- [ ] Audio sistema — mapear teclas volúmen en Hyprland
- [ ] Tercer monitor → adaptador DVI-D (macho) → HDMI (hembra) ~3-5€
- [ ] Obsidian Git — instalar plugin + auto-commit + Dataview + Templater + Calendar

### Auditorías de carpetas pendientes
- [ ] osint/ · formacion/ · tools/ · docs/ · yo/ · setup/ · diarios/ · ollama/
- [ ] Raíz: HOME.md · ECOSISTEMA.md · CONTEXT.md · AGENT.md — actualizar

### Windows 11 ISO (UUP)
- [ ] Set UUP expiró — generar nuevo en uupdump.net (W11 24H2 · amd64 · es-ES · Pro)
- [ ] Lanzar ~/Downloads/uup/uup_download_linux.sh de nuevo

---

## 🟢 PRÓXIMAS 2 SEMANAS

### BATCUEVA — Fase OSINT
- [ ] Levantar batcueva-osint.yml — SpiderFoot:5001 + IVRE
- [ ] Portainer:9000 · Uptime Kuma:3002
- [ ] UFW + fail2ban · tmux · Pi-hole

### Python — desarrollo
- [ ] Terminar módulo 05 del curso Python
- [ ] Script Python query a Ollama API local
- [ ] Script Python reconocimiento red básico

### OSINT + Pentest
- [ ] Instalar nmap en Madre → primer scan real
- [ ] Documentar en osint/herramientas.md

### IA local — integración
- [ ] Open WebUI → RAG sobre yggdrasil-dew
- [ ] Crear Modelfile Erika en Ollama → primer agente local
- [ ] Local GPT Obsidian → apuntar a Ollama Madre
- [ ] n8n → pipeline: logs nmap → Qdrant (workflow diseñado, pendiente ejecutar)

### SSH Madre → varopc (sentido inverso)
- [ ] ssh-keygen en Madre
- [ ] ssh-copy-id varo@100.86.119.102

---

## 🔵 FUTURO

### BATCUEVA — expansión
- [ ] n8n · Homepage/Homarr · Headscale · Gitea · Code Server
- [ ] Shadowbroker (AIS aviones+barcos) · OSIRIS (satélites+CCTV)
- [ ] Migrar Ollama → llama.cpp puro (mejor rendimiento CPU)

### Hardware
- [ ] RAM 16GB DDR4 SO-DIMM varopc (~40-50€)
- [ ] RTX 3060 12GB Madre (~200-250€ 2ª mano)

---

## ✅ COMPLETADO (histórico)

| Fecha | Tarea |
|---|---|
| 2026-06-25 | **Stack Fase 1+2 HEALTHY** — ollama + open-webui + qdrant |
| 2026-06-25 | **SSH sin contraseña** varopc→Madre |
| 2026-06-25 | **litellm-config.yaml** creado y verificado contra repo |
| 2026-06-25 | **Auditoría Gemini** — 10 errores detectados y corregidos |
| 2026-06-25 | **Handlers THDORA** diseñados — /estado /inbox /diario /pull |
| 2026-06-25 | **ADB/Android** documentado — BFU/AFU + adb-monitor.sh + scrcpy |
| 2026-06-25 | **Orden ejecución Fases 3+4** documentado y verificado |
| 2026-06-24 | Script migración inbox generado |
| 2026-06-24 | Fases 1-4 documentadas — docker-compose completo |
| 2026-06-24 | ADB Android guía completa |
| 2026-06-24 | docker-compose.yml optimizado — CPU vars + healthchecks |
| 2026-06-24 | ollama-cpu-setup.md — Modelfile + vars i5-8400 |
| 2026-06-24 | tailscale-autoarranque.md |
| 2026-06-24 | ufw-seguridad.md |
| 2026-06-23 | filosofia.md v3.0 — 3 leyes repos |
| 2026-06-23 | ADR homelab + docs-as-code + ollama vs agentes |
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
_Actualizado: 25 jun 2026 13:08 CEST — Perplexity vía MCP_
_Ver: [[HOME]] · [[CONTEXT]] · [[ECOSISTEMA]] · [[ESTADO-SISTEMA]] · [[inbox/README]]_
