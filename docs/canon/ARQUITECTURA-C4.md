---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/ARQUITECTURA-C4.md
tags: [canon, arquitectura, c4, mermaid, diagrama]
status: vigente
---

# Arquitectura C4 — Ecosistema Yggdrasil

> Diagrama C4 (Context + Container) del ecosistema completo.
> Mermaid renderiza en GitHub. Actualizar al cambiar topología.

Cierra: [DEW #41](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/41)

---

## Nivel 1 — Context (vista de usuario y sistemas externos)

```mermaid
C4Context
  title Ecosistema Yggdrasil — Vista de Contexto

  Person(alvaro, "Alvaro", "Propietario del ecosistema. Accede desde Theodora, Acer o Thea.")

  System(madre, "Madre", "Servidor principal (homelab). Corre todos los servicios Docker.")
  System(wiki, "yggdrasil-wiki", "Base de conocimiento. Fichas de islas, convenciones, historial.")
  System(dew, "yggdrasil-dew", "Cerebro operativo. Plan maestro, ADRs, canon, issues.")
  System(vidapersonal, "VIDAPERSONAL", "Repo de vida personal. Diarios, hábitos, proyectos.")

  System_Ext(telegram, "Telegram", "Canal de comunicación con THDORA bot.")
  System_Ext(github, "GitHub", "Hosting de repos. CI/CD con GitHub Actions.")
  System_Ext(tailscale, "Tailscale", "VPN mesh. Acceso seguro a Madre desde cualquier isla.")
  System_Ext(perplexity, "Perplexity AI", "Agente IA externo con acceso MCP al ecosistema.")
  System_Ext(claude, "Claude / Anthropic", "Agente IA externo para análisis y auditorías.")

  Rel(alvaro, madre, "SSH / Tailscale / web UI")
  Rel(alvaro, telegram, "Comandos al bot THDORA")
  Rel(alvaro, dew, "Gestiona plan y canon")
  Rel(alvaro, wiki, "Consulta y actualiza fichas")
  Rel(alvaro, vidapersonal, "Registra vida y proyectos")

  Rel(madre, telegram, "THDORA bot envia alertas")
  Rel(madre, github, "Push repos, CI checks")

  Rel(perplexity, github, "MCP: lee y escribe repos")
  Rel(perplexity, dew, "Gestiona issues y canon")
  Rel(perplexity, wiki, "Crea y actualiza fichas")

  Rel(tailscale, madre, "Tunel VPN")
  Rel(tailscale, alvaro, "Acceso remoto seguro")
```

---

## Nivel 2 — Container (servicios dentro de Madre)

```mermaid
C4Container
  title Madre — Vista de Contenedores Docker

  Person(alvaro, "Alvaro", "Accede vía SSH / Tailscale / web UI")

  Container_Boundary(ia, "Stack IA") {
    Container(ollama, "Ollama", "Docker", "Motor de modelos LLM locales")
    Container(openwebui, "Open WebUI", "Docker", "UI web para Ollama")
    Container(litellm, "LiteLLM", "Docker", "Proxy unificado LLM (local + cloud)")
    Container(qdrant, "Qdrant", "Docker", "Base de datos vectorial")
  }

  Container_Boundary(dev, "Stack Dev / Orquestador") {
    Container(n8n, "n8n", "Docker", "Motor de automatizaciones y flujos")
    Container(thdora_bot, "thdora-bot", "Docker", "Bot Telegram THDORA (⚠️ caído)")
    Container(thdora_api, "thdora-api", "Docker", "API interna de THDORA (⚠️ caído)")
    Container(codeserver, "code-server", "Docker", "VS Code en el navegador")
    Container(gitea, "Gitea", "Docker", "Mirror privado de repos git")
  }

  Container_Boundary(monitoring, "Stack Monitoring") {
    Container(grafana, "Grafana", "Docker", "Dashboards y alertas")
    Container(prometheus, "Prometheus", "Docker", "Métricas del sistema")
    Container(uptimekuma, "Uptime Kuma", "Docker", "Monitor de disponibilidad")
    Container(portainer, "Portainer", "Docker", "UI gestión Docker")
  }

  Container_Boundary(secops, "Stack SecOps") {
    Container(spiderfoot, "SpiderFoot", "Docker", "OSINT automático")
    Container(kalivnc, "Kali VNC", "Docker", "Entorno pentest")
    Container(networkadar, "network-radar", "Docker", "Monitor de red local")
    Container(guardian, "log_guardian_bot", "Docker", "Alertas de seguridad (⚠️ crash loop)")
    Container(tripwire, "local_tripwire", "Docker", "Detector de cambios (⚠️ crash loop)")
    Container(watchdog, "yggdrasil_watchdog", "Docker", "Watchdog general del ecosistema")
  }

  Rel(alvaro, codeserver, "HTTPS / Tailscale")
  Rel(alvaro, portainer, "HTTPS / Tailscale")
  Rel(alvaro, grafana, "HTTPS / Tailscale")
  Rel(alvaro, n8n, "HTTPS / Tailscale")
  Rel(alvaro, openwebui, "HTTPS / Tailscale")

  Rel(n8n, thdora_api, "HTTP interno")
  Rel(thdora_bot, litellm, "HTTP — consultas LLM")
  Rel(litellm, ollama, "HTTP local")
  Rel(guardian, thdora_bot, "Alertas Telegram")
  Rel(prometheus, grafana, "Métricas")
```

---

## Decisiones de arquitectura relacionadas

- [ADR-001](../adr/) — Separación de repos por dominio
- [ADR-002](../adr/) — Docker como runtime único en Madre
- [Isla Orquestador](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/orquestador.md)
- [Isla Filosofía](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/filosofia.md) — Principio: Transparencia interna

---

_Creado: 2026-07-13 · Cierra #41 · Perplexity-MCP_
