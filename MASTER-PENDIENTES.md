---
tags: [pendiente, master, planificacion, urgente, obsidian]
fecha: 2026-06-24
revision: cada-domingo
owner: alvarofernandezmota-tech
perfil: dev-python · pentest-linux · ia-local · llm · homelab
---

# 📋 MASTER PENDIENTES — Ecosistema completo

> Fuente única de verdad de TODO lo pendiente.
> Siempre en la raíz del repo. Cualquier IA lo encuentra en frío.
> Se revisa cada domingo. Se ejecuta cada día desde aquí.
> Tarea completada → ✅ + fecha → mover a `## ✅ Completado`

> Ver también: [[ESTADO-SISTEMA]] · [[ROADMAP]] · [[inbox/README]] · [[diarios/2026-06-24]]

---

## 🔴 P0 — AHORA MISMO

### Restructura del repo (sesión 24 jun tarde)
- [ ] Clasificar y mover los 93 archivos del inbox a sus carpetas definitivas
- [ ] Crear `diarios/2026-06-23.md` consolidado con todo lo del 23 jun
- [ ] Actualizar `diarios/2026-06-24.md` con el resto de la sesión tarde
- [ ] Crear `codigo/scripts/` y mover todos los scripts del inbox
- [ ] Commit limpio de restructura completa

### Verificar Ollama (modelos descargando desde 05:55)
- [ ] `ssh madre "ollama list"` — verificar qué modelos terminaron
- [ ] Verificar: qwen2.5:14b · qwen2.5:7b · llama3.1:8b · mistral:7b · bge-m3 · nomic-embed-text
- [ ] Si alguno falló: relanzar con `ollama pull <modelo>`

---

## 🟠 P1 — Esta sesión / Hoy

### Stack Docker Madre — pendiente levantar
- [ ] Fase 3: `docker compose -f setup/servidor/batcueva-fase3.yml up -d`
- [ ] Verificar n8n `:5678` + Paperless `:8010` + Vaultwarden `:8888`
- [ ] Fase 4: crear `setup/servidor/batcueva-fase4.yml` (LiteLLM + Nginx + Watchtower)
- [ ] LiteLLM config: `setup/servidor/litellm-config.yaml` — proxy unificado Ollama
- [ ] Verificar Open WebUI `:3001` con modelos ya descargados

### Seguridad Madre — documentado pero NO aplicado
- [ ] SSH hardening → ver `inbox/2026-06-24-ssh-hardening.md`
- [ ] UFW activar reglas definitivas → ver `inbox/2026-06-23-auditoria-setup.md`
- [ ] Kernel sysctl hardening → ver `inbox/2026-06-24-kernel-sysctl-hardening.md`
- [ ] Deshabilitar suspensión: `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

---

## 🟡 P2 — Esta semana

### THDORA — Handlers pendientes
- [ ] Handler `/estado` → ejecuta `batcueva-state.sh` y responde por Telegram
- [ ] Handler `/inbox <texto>` → crea nota en `inbox/` con timestamp
- [ ] Handler `/diario <texto>` → append al diario del día actual
- [ ] Alias `cierre` en bashrc → `bash ~/Projects/yggdrasil-dew/setup/servidor/scripts/cierre-sesion.sh`

### IA Local — Configuración
- [ ] Open WebUI RAG: subir docs de yggdrasil-dew como base de conocimiento
- [ ] Crear Modelfile `Erika` en Ollama → ver `inbox/2026-06-24-ollama-modelfile-erika.md`
- [ ] Crear Modelfile agente OSINT en Ollama
- [ ] LiteLLM: proxy unificado Ollama + APIs externas (Perplexity, Gemini)
- [ ] n8n: primer workflow — Telegram ↔ inbox → yggdrasil-dew repo

### Gitea mirrors
- [ ] Abrir `:3003` y crear mirror de `thdora` desde GitHub
- [ ] Crear mirror de `yggdrasil-dew` desde GitHub

### Formación
- [ ] Terminar módulo 05 Python
- [ ] Script Python → query Ollama API local (`/api/generate`)
- [ ] Script Python → reconocimiento red básico con nmap

### SSH
- [ ] SSH sin contraseña Madre → Acer: `ssh-copy-id varo@100.86.119.102`
- [ ] Deshabilitar auth por password en sshd tras configurar clave

---

## 🟢 P3 — Próximas 2 semanas

### OSINT + Pentest
- [ ] SpiderFoot en Madre (`:5001`)
- [ ] Primer scan de red: `nmap -sV 10.134.31.0/24`
- [ ] Documentar en `[[osint/herramientas]]`
- [ ] Perplexica — motor búsqueda local con Ollama, evaluar

### Repos GitHub a crear
- [ ] `ollama-stack` — Docker Ollama+WebUI+Qdrant público
- [ ] `osint-stack` — Docker SpiderFoot+IVRE
- [ ] `dotfiles` — Hyprland + aliases + bashrc

### Hardware
- [ ] Adaptador DVI-D → HDMI para tercer monitor (~3-5€)
- [ ] Audio Hyprland: mapear teclas volumen

---

## 🔵 P4 — Futuro / Sin fecha

- [ ] Headscale self-hosted (reemplaza Tailscale cloud) — ver debate en inbox
- [ ] Pi-hole DNS local
- [ ] Code-server configurado (VSCode en browser `:8443`)
- [ ] Vaultwarden configurado (passwords `:8080`)
- [ ] Paperless-ngx configurado (documentos `:8010`)
- [ ] RAM 16GB para varopc (~40-50€)
- [ ] RTX 3060 12GB para Madre (~200-250€ 2ª mano)
- [ ] Migración inbox→repo automatizada con THDORA + n8n
- [ ] ADB Android — experimentación móvil (ver `inbox/2026-06-25-ADB-*`)

---

## 📂 RESTRUCTURA INBOX — Estado detallado

> Detectado 2026-06-24: inbox llegó a **93 archivos** en 3 días. Inaceptable.
> Regla nueva: máx 10 archivos, vida 24h. Ver [[inbox/README]].

### Mapa de destinos (carpetas ya existentes en el repo)

| Tipo de archivo en inbox | Carpeta destino |
|---|---|
| `sesion-*`, `cierre-*`, `vaciado-*` | `diarios/YYYY-MM-DD.md` (consolidar) |
| `auditoria-ollama-*`, `ollama-*` | `ollama/` |
| `auditoria-osint-*`, `osint-*` | `osint/` |
| `adr-*`, `decision-*` | `docs/arquitectura/` |
| `debate-*`, `bitacora-*`, `tesis-*` | `docs/ias/debates/` |
| `prompt-*` | `docs/ias/prompts/` |
| `script-*`, `macro-*`, `mega-script-*` | `setup/servidor/scripts/` |
| `batcueva-*`, `fase*`, `docker-*` | `setup/servidor/` |
| `proyecto-*`, `local-brain-*` | `proyectos/` |
| `auditoria-formacion-*` | `formacion/` |
| `auditoria-tools-*`, `tools-*` | `tools/` |
| `auditoria-yo-*` | `yo/` |
| `dashboard-*` | `docs/` o `tools/` |
| `contexto-*`, `plan-proxima-*` | `diarios/` o archivar |

### Checklist restructura
- [ ] Consolidar archivos `sesion-*` del 23 jun → `diarios/2026-06-23.md`
- [ ] Mover `ollama-*` del inbox → `ollama/`
- [ ] Mover `osint-*` del inbox → `osint/`
- [ ] Mover `adr-*` y `decision-*` → `docs/arquitectura/`
- [ ] Mover `debate-*`, `bitacora-*`, `tesis-*` → `docs/ias/debates/`
- [ ] Mover `prompt-*` → `docs/ias/prompts/`
- [ ] Mover `script-*`, `macro-*` → `setup/servidor/scripts/`
- [ ] Mover `batcueva-*`, `fase*` → `setup/servidor/`
- [ ] Mover `proyecto-*` → `proyectos/`
- [ ] Mover `auditoria-formacion-*` → `formacion/`
- [ ] Mover `tools-*` → `tools/`
- [ ] Borrar duplicados y archivos vacíos de contexto ya integrados
- [ ] Commit final: `🏗️ restructura: inbox vaciado, 93 archivos clasificados`

---

## ✅ Completado

| Fecha | Tarea |
|---|---|
| 2026-06-24 | `inbox/README.md` — reglas definitivas inbox (máx 10, 24h) |
| 2026-06-24 | `diarios/2026-06-24.md` — diario completo del día creado |
| 2026-06-24 | `ESTADO-SISTEMA.md` en raíz — foto viva del sistema |
| 2026-06-24 | `batcueva-state.sh` — script idempotente todas las fases |
| 2026-06-24 | `cierre-sesion.sh` — commit diario automático |
| 2026-06-24 | Stack Fase 1+2 levantado y healthy en Madre |
| 2026-06-24 | docker-compose.yml optimizado — CPU vars + healthchecks |
| 2026-06-24 | batcueva-fase2.yml + fase3.yml + docs completos |
| 2026-06-24 | scripts/ completo: arranque, descarga, configuración |
| 2026-06-24 | ~30GB imágenes Docker descargadas en Madre |
| 2026-06-24 | Debate Ollama vs llama.cpp — veredicto: Ollama |
| 2026-06-24 | Investigación fases Batcueva 1-4 documentada |
| 2026-06-23 | ADR homelab vs proyectos, docs-as-code, ollama en agentes |
| 2026-06-23 | Auditorías completas de todas las carpetas del repo |
| 2026-06-22 | Netdata multi-nodo Madre + Acer |
| 2026-06-20 | UFW + fail2ban activos |

---

## 📅 Planificación semanal

```
Lunes     → THDORA + Madre (técnico)
Martes    → Formación Python
Miércoles → THDORA handlers + Python bots
Jueves    → OSINT + pentest + seguridad
Viernes   → LLM + IA local + Ollama
Sábado    → Libre / exploración
Domingo   → Revisión semanal + auditoría inbox
```

---
_Actualizado: 2026-06-24 18:48 CEST — Perplexity vía MCP_
_Ver: [[ESTADO-SISTEMA]] · [[ROADMAP]] · [[inbox/README]] · [[diarios/2026-06-24]]_
