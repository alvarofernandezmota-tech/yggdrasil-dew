---
title: ADR-001 — Platform Stack de Madre
tipo: adr
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-05
ruta: docs/canon/ADR-001-platform-stack.md
tags: [adr, canon, docker, platform, madre, arquitectura]
status: vigente
---

# ADR-001 — Platform Stack de Madre

> **ADR = Architecture Decision Record** — explica por qué se decidió cada cosa.
> Mapa de contenedores (qué hace cada uno) → [`wiki/islas/infra.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/infra.md)

---

## Contexto

Madre es una torre ASUS con Intel i5-8400, 16GB RAM, HDD 1TB, Arch Linux.
Es el servidor principal del ecosistema: corre todos los servicios en Docker.
El acceso externo es exclusivamente vía Tailscale (VPN privada).

---

## Decisiones y justificaciones por isla

### 🛡️ Isla Seguridad

#### `yggdrasil_watchdog`
- **Por qué:** Los contenedores pueden caer por falta de memoria, bugs o reinicios. Sin watchdog hay que descubrirlo manualmente.
- **Decisión:** Watchdog propio (Python + Docker SDK) en vez de soluciones externas para tener control total y alertas en Telegram en español.
- **Alternativas descartadas:** `autoheal` (menos control), `Portainer webhooks` (complejidad innecesaria).

#### `tailscale_monitor`
- **Por qué:** Si Tailscale cae, Madre queda inaccesible desde fuera. Sin monitor no hay alerta temprana.
- **Decisión:** Contenedor ligero que comprueba estado de la VPN cada 30s y alerta por Telegram.

#### `log_guardian_bot`
- **Por qué:** Los logs del sistema contienen señales de intrusiones, errores críticos y comportamientos anómalos.
- **Decisión:** Análisis automático de logs con alertas. Reduce ruido manual de revisar journalctl.
- **Estado actual:** unhealthy — fix pendiente (mismo patrón HAL-004, falta `procps`).

#### `network_radar`
- **Por qué:** La red local puede tener dispositivos no autorizados. Detección pasiva sin herramientas externas.
- **Decisión:** Escaner de red periódico que alerta si aparece un dispositivo nuevo.

#### `local_tripwire`
- **Por qué:** Un atacante que gana acceso modifica archivos del sistema. Tripwire detecta esos cambios.
- **Decisión:** Monitorizar archivos críticos (`/etc/passwd`, `/etc/ssh/`, binarios del sistema).

#### `guardian_bot`
- **Por qué:** Centralizar todas las alertas de seguridad en un único canal Telegram.
- **Decisión:** Bot dedicado a seguridad separado de THDORA (que es uso general).

---

### 🏗️ Isla Infraestructura

#### `uptime-kuma`
- **Por qué:** Necesidad de saber de un vistazo qué servicios están caídos sin revisar Docker manualmente.
- **Decisión:** Dashboard visual con historial de uptime. Self-hosted, sin dependencias externas.
- **Alternativas descartadas:** Statuspage.io (cloud, coste), Grafana (más complejo para este caso).

#### `grafana` + `prometheus`
- **Por qué:** Métricas de CPU, RAM, disco y red para detectar problemas de rendimiento antes de que fallen servicios.
- **Decisión:** Stack estándar de observabilidad. Prometheus recoge, Grafana visualiza.

#### `portainer`
- **Por qué:** Gestionar Docker desde CLI en móvil es lento. Portainer permite gestionar contenedores desde navegador.
- **Decisión:** UI de gestión Docker. Útivo para operaciones rápidas desde iPhone.

#### `radar_backup`
- **Por qué:** El HDD tiene 28.715h. Sin backups automáticos un fallo de disco = pérdida total.
- **Decisión:** Backups periódicos automáticos. Pendiente verificar destino y frecuencia (HAL-005).

---

### 🧠 Isla Cerebro

#### `n8n`
- **Por qué:** Automatizar flujos entre servicios sin escribir código para cada integración.
- **Decisión:** n8n self-hosted. Permite conectar Telegram, GitHub, Ollama, APIs externas visualmente.
- **Alternativas descartadas:** Zapier/Make (cloud, coste, privacidad).

#### `gitea`
- **Por qué:** Espejo local de repos GitHub. Si GitHub cae o hay problema de red, el código sigue accesible.
- **Decisión:** Gitea self-hosted como mirror. No reemplaza GitHub — lo complementa.

#### `code-server`
- **Por qué:** Poder programar desde iPhone o cualquier dispositivo sin instalar nada.
- **Decisión:** VS Code en navegador accesible via Tailscale. Elimina dependencia del Acer para desarrollo.

---

### 🤖 Isla THDORA

#### `thdora` + `thdora-bot`
- **Por qué:** Interfaz personal de Telegram para interactuar con el ecosistema (consultas, comandos, automatizaciones personales).
- **Decisión:** Dos contenedores separados: backend (`thdora`) y bot (`thdora-bot`) para poder actualizar cada parte independientemente.
- **Riesgo activo:** Token en historial git (HAL-001/003) — rotar urgente.

---

### 🧪 Isla Labs

#### `kali-pentest`
- **Por qué:** Entorno de pentesting y auditoría de seguridad propio sin contaminar el sistema base.
- **Decisión:** Kali Linux en Docker con acceso por navegador (KasmWeb). Uso puntual, no servicio permanente crítico.

#### `spiderfoot`
- **Por qué:** OSINT automatizado para auditar la huella digital propia y de los servicios expuestos.
- **Decisión:** Self-hosted para privacidad total de las consultas.

---

## Principios de diseño del stack

1. **Self-hosted por defecto** — privacidad, control, sin coste recurrente
2. **Acceso solo por Tailscale** — superficie de ataque mínima
3. **Alertas por Telegram** — canal único de notificaciones
4. **Cada servicio en su isla** — falla independientemente, se repara independientemente
5. **Watchdog automático** — el sistema se autorepara sin intervención manual

---

## Referencias

- Mapa de contenedores → [`wiki/islas/infra.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/infra.md)
- Capas de seguridad → [`wiki/islas/seguridad.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/islas/seguridad.md)
- Hallazgos activos → [`yggdrasil-secops/issues`](https://github.com/alvarofernandezmota-tech/yggdrasil-secops/issues)
- Procedimientos → [`madre-config`](https://github.com/alvarofernandezmota-tech/madre-config)

---

_Última actualización: 2026-07-05 23:46 CEST · Perplexity-MCP_
