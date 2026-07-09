---
tipo: arquitectura
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/arquitectura/C4-ecosistema.md
tags: [arquitectura, c4, diagrama, ecosistema, mermaid]
status: activo
---

# Arquitectura C4 — Ecosistema Yggdrasil

> Diagramas C4 del ecosistema. Nivel 1 (Context) y Nivel 2 (Container).
> El modelo C4 (Simon Brown) organiza la arquitectura en 4 niveles de abstracción:
> Context → Container → Component → Code.
> Este documento cubre los dos niveles superiores, suficientes para comunicar
> la arquitectura a cualquier ingeniero externo.

---

## Nivel 1 — System Context

> Quién usa el sistema, qué sistemas externos interactúan con él.

```mermaid
C4Context
  title Sistema Yggdrasil — Context Diagram

  Person(alvaro, "Alvaro", "Propietario y operador del ecosistema. Accede desde Acer, iPhone y Madre directamente.")

  System_Boundary(ygg, "Ecosistema Yggdrasil") {
    System(madre, "Madre", "Servidor fisico principal. Arch Linux. GTX 1060 6GB. Ejecuta todos los servicios.")
    System(thdora, "Thdora Bot", "Bot Telegram de automatizacion y notificaciones del ecosistema.")
    System(dew, "yggdrasil-dew", "Repo central de documentacion tecnica, canon y gobernanza.")
  }

  System_Ext(github, "GitHub", "Control de versiones, CI/CD, issues y gobernanza de repos.")
  System_Ext(telegram, "Telegram", "Canal de comunicacion para alertas y comandos via Thdora.")
  System_Ext(tailscale, "Tailscale", "VPN mesh para acceso seguro a Madre desde cualquier dispositivo.")
  System_Ext(ollama_ext, "Ollama / Modelos LLM", "IA local corriendo en Madre: llama3.1, mistral, codellama.")
  System_Ext(perplexity, "Perplexity AI", "Agente IA externo con acceso MCP a los repos de GitHub.")

  Rel(alvaro, madre, "Accede via SSH/Tailscale y Blink (iPhone)")
  Rel(alvaro, thdora, "Envia comandos y recibe alertas via Telegram")
  Rel(alvaro, dew, "Lee y escribe documentacion tecnica")
  Rel(alvaro, perplexity, "Delega tareas de repo a agente IA via MCP")

  Rel(madre, github, "Push/Pull repos, CI/CD via GitHub Actions")
  Rel(madre, telegram, "Thdora bot envia notificaciones")
  Rel(madre, tailscale, "Conectado a la red mesh")
  Rel(madre, ollama_ext, "Sirve modelos LLM en :11434")

  Rel(perplexity, github, "Lee y escribe repos via MCP GitHub")
  Rel(thdora, telegram, "Comandos y respuestas")
```

---

## Nivel 2 — Container Diagram: Madre

> Qué procesos y servicios corren dentro de Madre y cómo se comunican.

```mermaid
C4Container
  title Madre — Container Diagram

  Person(alvaro, "Alvaro", "Operador")
  Person_Ext(internet, "Internet / Atacante", "Trafico externo")

  System_Boundary(madre_boundary, "Madre — Arch Linux Server") {

    Container(ufw, "UFW Firewall", "Linux UFW", "Filtra trafico entrante y saliente. Solo permite puertos explicitamente abiertos.")
    Container(tailscale_agent, "Tailscale Agent", "WireGuard mesh", "VPN mesh. Unico punto de entrada SSH autorizado para Alvaro.")
    Container(ssh, "SSH Server", "OpenSSH", "Acceso remoto. Solo via Tailscale, puerto 22 cerrado a internet publico.")
    Container(docker, "Docker Engine", "Docker + Compose", "Runtime de contenedores. Gestiona el stack de servicios.")

    Container_Boundary(stack, "Stack Docker") {
      Container(wazuh, "Wazuh Manager", "Docker", "SIEM. Recibe logs y alertas de agentes.")
      Container(suricata, "Suricata IDS", "Docker", "IDS pasivo en wlan0. Detecta intrusiones en red local.")
      Container(pihole, "Pihole", "Docker", "DNS bloqueador de ads y trackers.")
      Container(searxng, "SearXNG", "Docker", "Instancia privada de busqueda. Sin tracking.")
    }

    Container(ollama, "Ollama", "Systemd service", "Servidor de modelos LLM locales. API en :11434. Usa GTX 1060.")
    Container(thdora_proc, "Thdora Bot", "Python / systemd", "Bot Telegram. Comandos, notificaciones, automatizacion.")
    Container(cron, "Cron Jobs", "crontab", "Tareas programadas: clean-root, backups, health checks.")
    Container(scripts, "Scripts Ecosistema", "Bash", "session-logger, inbox-commit, orquestador, inbox-clasificador.")
  }

  System_Ext(github_ext, "GitHub", "Repos remotos")
  System_Ext(telegram_ext, "Telegram", "API mensajeria")

  Rel(internet, ufw, "Trafico entrante filtrado")
  Rel(alvaro, tailscale_agent, "Conecta via Tailscale desde Acer/iPhone")
  Rel(tailscale_agent, ssh, "SSH tunelado por Tailscale")
  Rel(ssh, docker, "Alvaro gestiona contenedores")
  Rel(ssh, ollama, "Alvaro consulta modelos")
  Rel(ssh, scripts, "Alvaro ejecuta scripts")

  Rel(docker, wazuh, "Levanta SIEM")
  Rel(docker, suricata, "Levanta IDS")
  Rel(docker, pihole, "Levanta DNS")
  Rel(docker, searxng, "Levanta buscador")

  Rel(suricata, wazuh, "Eventos de red")
  Rel(thdora_proc, telegram_ext, "Mensajes y comandos")
  Rel(scripts, github_ext, "git push/pull")
  Rel(cron, scripts, "Ejecuta scripts programados")
  Rel(ollama, thdora_proc, "Respuestas IA local")
```

---

## Notas de arquitectura

- **Tailscale como perimetro:** el único acceso externo autorizado a Madre es vía Tailscale. SSH directo desde internet no está permitido.
- **Docker como runtime:** todos los servicios de larga duración corren en contenedores excepto Ollama (systemd, necesita GPU directa) y Thdora (systemd, necesita acceso a filesystem).
- **Ollama en bare metal:** GPU passthrough no disponible en Docker sin configuración NVIDIA Container Toolkit — evaluado en ADR-003.
- **Agente IA externo (Perplexity):** accede solo a GitHub vía MCP, nunca a Madre directamente.

---

_Creado: 2026-07-06 · Fase 5 Plan de Alineación · Referencia: [C4 model](https://c4model.com) · [Mermaid C4](https://mermaid.js.org/syntax/c4.html)_
