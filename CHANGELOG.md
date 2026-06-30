# CHANGELOG — yggdrasil-dew

> Registro de cambios importantes en el repo. Una línea por evento.
> Formato: `YYYY-MM-DD · [tipo] descripción`
> Tipos: `init` `update` `add` `remove` `fix` `restructure`

---

## 2026

### Junio

- `2026-06-30` · `add` inbox/2026-06-30-ollama-modelos-pull.md — pull llama3.1:8b + nomic-embed-text completado
- `2026-06-30` · `update` ESTADO-SISTEMA.md — 4 modelos Ollama activos, git pull --rebase OK, AP estable
- `2026-06-30` · `add` modelos llama3.1:8b + nomic-embed-text descargados en Ollama
- `2026-06-30` · `fix` git pull --rebase en Madre — repo local sincronizado con GitHub
- `2026-06-30` · `update` ESTADO-SISTEMA.md — estado real 30-jun: stack 13/13 up, THDORA v0.12.1, modelos Ollama confirmados
- `2026-06-30` · `add` diarios/2026/2026-06-30.md — sesión 30-jun documentada: validación completa post-reboot
- `2026-06-30` · `fix` Docker daemon reiniciado limpio — v29.5.1, todos los contenedores recuperados
- `2026-06-30` · `fix` Tailscale confirmado activo — varpc + iphone-11 + varo12f (relay mad)
- `2026-06-30` · `fix` SSH PasswordAuthentication: no — confirmado hardening activo
- `2026-06-28` · `update` MASTER-PENDIENTES.md — sesión 28-jun documentada, tareas completadas marcadas
- `2026-06-28` · `update` ESTADO-SISTEMA.md — estado real 28-jun: dnsmasq, fail2ban jails, UFW actualizado
- `2026-06-28` · `update` ECOSISTEMA.md — IPs Tailscale corregidas, dnsmasq añadido, estado real 28-jun
- `2026-06-28` · `update` CHANGELOG.md — entradas sesión 28-jun añadidas
- `2026-06-28` · `add` issues #5 (AP hostapd) + #6 (DIARY 28-jun) creados vía MCP
- `2026-06-28` · `fix` fail2ban jail sshd activo — Madre + Acer
- `2026-06-28` · `fix` dnsmasq instalado y activo — DHCP 192.168.72.50-150 en wlan0 Madre
- `2026-06-28` · `fix` puerto 53317 cerrado UFW — Madre + Acer
- `2026-06-28` · `fix` Netdata Acer activo — puerto 19999 restringido a Madre
- `2026-06-28` · `add` UFW puerto 53 wlan0 — DNS para clientes AP
- `2026-06-27` · `fix` MadreAP WiFi resuelto — hostapd + systemd-networkd + UFW persistente tras reboot
- `2026-06-27` · `fix` iwd desactivado — conflicto con hostapd resuelto
- `2026-06-27` · `add` docs/infra/red-madre-ap.md — referencia permanente configuración red AP
- `2026-06-27` · `add` ADR-004 — seguridad privilege explosion documentado
- `2026-06-27` · `add` inbox/2026-06-27-monitoring-pentest-research.md — SOC homelab stack 7 capas
- `2026-06-25` · `fix` healthcheck qdrant + open-webui — TCP bash check
- `2026-06-25` · `add` Stack 13 contenedores 100% healthy en Madre
- `2026-06-25` · `add` GitHub Actions CI activo — yamllint
- `2026-06-25` · `add` ADR-001/002/003 creados
- `2026-06-25` · `add` Ansible bootstrap
- `2026-06-25` · `add` Stack ciberseguridad completo — OSINT + Pentest + SIEM + Vuln
- `2026-06-23` · `update` filosofia.md v3.0
- `2026-06-22` · `add` Netdata multi-nodo Madre + Acer — streaming vía stream.conf UUID
- `2026-06-22` · `add` 15 fichas LLM en agentes/
- `2026-06-12` · `init` Repo creado — base de conocimiento agente-first
- `2026-06-12` · `add` Estructura base: AGENT.md, CONTEXT.md, yo/, diarios/, proyectos/, formacion/, setup/, agentes/
- `2026-06-12` · `add` CHANGELOG.md, objetivos-2026.md, servicios.md con arquitectura Home Server
- `2026-06-12` · `add` agentes/prompts.md con prompts de mantenimiento del repo
- `2026-06-12` · `add` setup/servidor/tailscale.md — IPs, comandos, estado
- `2026-06-12` · `add` setup/servidor/rescate.md — protocolo recuperación de acceso
- `2026-06-13` · `add` diarios/2026/2026-06-12.md — sesión completa documentada
- `2026-06-13` · `add` setup/servidor/fail2ban.md
- `2026-06-13` · `add` setup/servidor/uptime-kuma.md
- `2026-06-13` · `add` setup/servidor/scripts/bootstrap-madre.sh — instalación completa 6 fases
- `2026-06-13` · `update` README.md — ecosistema completo, pirámide resiliencia
- `2026-06-13` · `update` CONTEXT.md — estado real del sistema auditado

---

_Este archivo lo actualiza el agente o el usuario cuando hay un cambio relevante._
