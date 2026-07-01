---
tags: [tipo/referencia, ecosistema, para-que-sirve]
fecha: 2026-07-01
---

# 🗺️ Para qué sirve cada cosa — Ecosistema Batcueva

> Guía rápida: "tengo X necesidad → uso Y herramienta"

---

## 🤖 Bloque IA

| Herramienta | Para qué sirve | URL |
|---|---|---|
| **Ollama** | Motor de modelos LLM locales. Corre qwen, llama, etc. sin internet | `http://100.91.112.32:11434` |
| **Ollama Embeddings** | Segunda instancia de Ollama dedicada a embeddings (bge-m3, nomic) | `http://100.91.112.32:11435` |
| **Open WebUI** | Interfaz web para chatear con los modelos Ollama. Como ChatGPT pero local | `http://100.91.112.32:3001` |
| **Qdrant** | Base de datos vectorial. Guarda embeddings para RAG y búsqueda semántica | `http://100.91.112.32:6333` |

**Flujo IA completo:** Open WebUI → Ollama (LLM) + Ollama Embeddings → Qdrant (memoria vectorial)

---

## 🛠️ Bloque Desarrollo

| Herramienta | Para qué sirve | URL |
|---|---|---|
| **Gitea** | Git server propio. Repositorios privados sin depender de GitHub | `http://100.91.112.32:3003` |
| **Code Server** | VS Code en el navegador. Programar desde cualquier dispositivo | `https://100.91.112.32:8443` |
| **n8n** | Automatizaciones visuales. Conectar servicios, webhooks, workflows | `http://100.91.112.32:5678` |

---

## 📡 Bloque Observabilidad

| Herramienta | Para qué sirve | URL |
|---|---|---|
| **Portainer** | Ver y gestionar todos los contenedores Docker con interfaz web | `http://100.91.112.32:9000` |
| **Grafana** | Dashboards de métricas: CPU, RAM, red, disco en gráficas | `http://100.91.112.32:3000` |
| **Prometheus** | Recoge métricas del sistema. Fuente de datos para Grafana | `http://100.91.112.32:9090` |
| **Uptime Kuma** | Monitor de disponibilidad. Avisa por Telegram si un servicio cae | `http://100.91.112.32:3002` |

---

## 🤖 Bloque Bot (THDORA)

| Herramienta | Para qué sirve | URL |
|---|---|---|
| **thdora** | API FastAPI del bot. Recibe comandos y los procesa | `http://100.91.112.32:8000` |
| **thdora-bot** | Bot Telegram. Interfaz de usuario del ecosistema vía móvil | — |

**Flujo bot:** Tú → Telegram → thdora-bot → thdora API → Ollama/servicios

---

## 🔍 Bloque Pentest / OSINT — 🆕 RECIÉN LEVANTADO

| Herramienta | Para qué sirve | URL | Estado |
|---|---|---|---|
| **SpiderFoot** | OSINT pasivo. Consulta +200 fuentes públicas sobre un objetivo (IP, dominio, email) sin tocarlo | `http://100.91.112.32:5001` | ✅ UP |
| **Kali Linux Desktop** | Entorno completo de pentesting con todas las herramientas: Nmap, Metasploit, Burp, Wireshark... | `https://100.91.112.32:6901` | ⏳ Descargando |

**Flujo pentest defensivo:**
```
1. SpiderFoot  → qué sabe internet de ti (pasivo, sin huella)
2. Nmap        → qué puertos/servicios tienes abiertos
3. searchsploit→ buscar CVEs de las versiones encontradas
4. Metasploit  → verificar explotabilidad (solo entorno propio)
5. Remediación → cerrar/parchear lo encontrado
```

---

## 🛡️ Bloque SIEM — 🔜 PLANIFICADO

| Herramienta | Para qué sirve | Estado |
|---|---|---|
| **Wazuh** | SIEM completo. Detecta intrusiones, cambios en ficheros, alertas de seguridad | Pendiente levantar |
| **Suricata** | IDS/IPS de red. Analiza tráfico en tiempo real buscando ataques | Pendiente levantar |
| **DefectDojo** | Gestiona los hallazgos de pentesting. Tracker de vulnerabilidades | Pendiente (depende de Wazuh) |

---

## 🌐 Infraestructura de red

| Componente | Para qué sirve |
|---|---|
| **Tailscale** | VPN mesh privada. Acceso seguro a todos los servicios desde cualquier lugar |
| **MadreAP** | Access Point WiFi propio gestionado por varopc (hostapd + dnsmasq) |
| **UFW** | Firewall en varopc y Acer. Bloquea todo excepto lo permitido explicitamente |
| **fail2ban** | Banea IPs que intenten fuerza bruta en SSH |

---

## 📚 Documentación (yggdrasil-dew)

| Fichero/Carpeta | Para qué sirve |
|---|---|
| `ESTADO-SISTEMA.md` | Estado real del ecosistema ahora mismo. SSOT operativo |
| `MASTER-PENDIENTES.md` | Lista priorizada de todo lo pendiente |
| `CONVENCIONES.md` | Reglas del repo. Cómo nombrar, documentar, estructurar |
| `inbox/` | Notas rápidas de sesiones. Procesar periódicamente |
| `diarios/` | Registro diario de qué se hizo |
| `docs/` | Documentación técnica permanente |
| `docker/` | Composes definitivos organizados por fase |
| `osint-stack/` | Composes del stack pentest/OSINT |

---
_Creado: 01 jul 2026 — Perplexity vía MCP_
