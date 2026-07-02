---
tags: [ecosistema, repos, docker, arquitectura, mapa]
fecha-actualizacion: 2026-07-02
---

# 🌳 ECOSISTEMA — Mapa completo del sistema

> Fuente de verdad de TODOS los repos, herramientas y stacks.
> Actualizar cada vez que se crea un repo o se añade una herramienta.

---

## ⚠️ REGLA FIJA — Nombres de máquinas (NO confundir)

| Nombre | Hostname real | Hardware | Quién accede a quién |
|---|---|---|---|
| **madre** | `varopc` | PC torre i5-8400 | Servidor principal — al que se hace SSH desde theodora |
| **theodora** | `varo12f` | Acer portátil | Máquina de trabajo — desde donde se lanza `ssh madre` |

> **Regla:** `ssh madre` se ejecuta SIEMPRE desde **theodora**. Madre es el servidor. Theodora es el cliente.
> Los comandos ADB, docker, etc. corren en **madre** (después de hacer SSH).

---

## 📱 Dispositivos Tailscale — Red mesh completa

| Dispositivo | Hostname | IP Tailscale | Estado | Notas |
|---|---|---|---|---|
| PC torre | **madre** (`varopc`) | `100.91.112.32` | ✅ activo | Servidor principal |
| Portátil Acer | **theodora** (`varo12f`) | `100.86.119.102` | ✅ activo | Máquina de trabajo |
| iPhone 11 | iPhone de varo | `100.81.187.99` | ✅ activo | Móvil personal |
| Xiaomi | xiaomi | `100.106.133.70` | ✅ activo | Detectado por Tailscale Monitor |
| Redmi A5 | redmi-a5 | ⏳ pendiente asignar | ⚠️ instalado — falta login | App instalada vía ADB ✅ |

> Cuando el Redmi haga login en Tailscale aparecerá aquí con su IP asignada.

---

## 🖥️ Hardware del ecosistema

### madre — PC torre (servidor principal)
| Parámetro | Valor |
|---|---|
| CPU | i5-8400 |
| RAM | 16GB |
| Disco | HDD 1TB |
| GPU | GTX 1060 6GB |
| OS | Linux |
| IP local | `10.48.234.18` (interfaz `enp0s20f0u3`) |
| IP Tailscale | `100.91.112.32` |
| Rol | Docker · Ollama · AP WiFi · servidor principal |

### theodora — Acer portátil (máquina de trabajo)
| Parámetro | Valor |
|---|---|
| CPU | AMD Ryzen 5 |
| OS | Arch Linux · Hyprland |
| IP Tailscale | `100.86.119.102` |
| Rol | Desarrollo · Obsidian · terminal · SSH a madre |

### Redmi A5 — móvil Android (hotspot + control remoto)
| Parámetro | Valor |
|---|---|
| OS | Android 13 · MIUI |
| IP Tailscale | ⏳ pendiente login |
| Conectado a madre por | USB (ADB) · MadreAP WiFi |
| Rol principal | **Hotspot 4G** → da internet a madre · control remoto Telegram |

#### 🔋 Gestión batería Redmi (hotspot 24/7)
> El Redmi da internet a madre vía USB tethering/hotspot. Para proteger la batería:

```bash
# Ver nivel batería actual:
adb shell dumpsys battery | grep level

# Forzar modo carga lenta (protege batería si está conectado USB):
adb shell dumpsys battery set ac 1

# Ver temperatura batería (evitar >40°C):
adb shell dumpsys battery | grep temperature
```

> **Recomendación:** mantener cargado pero no al 100% constante. Si es posible, limitar carga a 80% desde ajustes MIUI (Ajustes → Batería → Modo de carga).

---

## 🌐 Red — Madre

| Interfaz | IP | Rol |
|---|---|---|
| `wlan0` (RTL8188FTV USB) | `192.168.72.1/24` | AP WiFi MadreAP |
| `tailscale0` | `100.91.112.32` | VPN mesh |
| `enp0s20f0u3` (USB tethering Redmi) | `10.48.234.18` | Internet upstream (4G) |
| `enp4s0` (Ethernet Gigabit) | — | DOWN / sin cable |

### MadreAP WiFi
| Parámetro | Valor |
|---|---|
| SSID | `MadreAP` |
| Seguridad | WPA2-PSK / CCMP |
| Canal | 6 (2.4GHz) |
| Gateway | `192.168.72.1` |
| DHCP pool | `192.168.72.50 – 192.168.72.150` (dnsmasq) |
| Driver | RTL8188FTV ⚠️ inestable — fix pendiente |

---

## 🔐 Seguridad del ecosistema

### Por dispositivo
| Dispositivo | Tailscale | Firewall | SSH hardening | Notas |
|---|---|---|---|---|
| madre | ✅ | UFW + fail2ban | ✅ completado (ed25519, no password, no root) | PasswordAuth desactivado |
| theodora | ✅ | UFW + fail2ban | ⚠️ parcial | PasswordAuth desactivado |
| iPhone 11 | ✅ | iOS nativo | — | Solo acceso Tailscale |
| Redmi A5 | ⚠️ pendiente login | Android nativo | ADB habilitado | Instalar vía USB activo |

### Pendientes seguridad
- [ ] **SEC-001** — Cerrar FTP puerto 21 router Digi (`79.116.247.44`) 🔴 CRÍTICO
- [ ] SSH clave pública theodora
- [ ] Desactivar ADB en Redmi cuando no se use
- [ ] Auditar APIs sin auth: Ollama `:11434`, Qdrant `:6333`

---

## 🤖 Stack de Bots y Monitorización — yggdrasil-secops

> Repo satélite: [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) (privado)
> Contiene: Self-OSINT, Canary Tokens, Tripwires y automatización defensiva.

### Bots activos (Docker)

| Bot | Contenedor | Rol | Estado |
|---|---|---|---|
| **Yggdrasil Watchdog** | `yggdrasilwatchdog` | Vigila 7 contenedores, reinicia los unhealthy | ✅ Activo |
| **Tailscale Monitor** | `tailscalemonitor` | Ping ICMP a los 4 nodos VPN, alerta si caen | ✅ Activo |
| **Network Radar** | `networkradar` + `radarbackup` | Escanea LAN 192.168.1.0/24, detecta nuevos dispositivos | ✅ Activo |
| **Log Guardian** | `logguardianbot` | Vigila `auth.log`, `ufw.log`, `syslog` — detecta bans fail2ban, bloqueos UFW, SSH brute force | ✅ Activo |
| **Local Tripwire** | `localtripwire` | Monitoriza integridad de archivos — alerta ante cambios | ⚠️ Activo sin rutas configuradas |
| **Guardian Bot** | `guardianbot` | Bot Telegram central de notificaciones | ✅ Activo |

### Nodos monitorizados por Tailscale Monitor
```
• varo12f  — 100.86.119.102 (theodora)
• madre    — 100.91.112.32
• iphone   — 100.81.187.99
• xiaomi   — 100.106.133.70
Check interval: 60s | Offline threshold: 3 failed checks
```

### 🐛 Issues detectados en bots (2026-07-02)

| Bot | Problema | Causa probable | Fix |
|---|---|---|---|
| `log_guardian_bot` | Crash-loop cada ~8 min (intento #2) | Healthcheck demasiado estricto o arranque lento | Aumentar `start_period` en docker-compose |
| `tailscale_monitor` | Reinicia cada ~10 min | Ping ICMP falla durante healthcheck (timeout corto) | Aumentar timeout del healthcheck |
| `local_tripwire` | **0 archivos bajo vigilancia** | Sin rutas configuradas → healthcheck siempre falla | Configurar `WATCH_PATHS` en el compose |

---

## 🐳 Docker Stack completo — Madre

### ✅ Levantado y healthy
| Contenedor | Puerto | Rol |
|---|---|---|
| ollama | 11434 | Motor LLM local |
| ollama-embeddings | 11435 | Embeddings |
| open-webui | 3001 | UI chat IA |
| qdrant | 6333 | Base vectorial RAG |
| uptime-kuma | 3002 | Monitor servicios |
| thdora | 8000 | FastAPI backend |
| thdora-bot | — | Bot Telegram |
| grafana | 3000 | Dashboards |
| prometheus | 9090 | Métricas |
| portainer | 9000 | Panel Docker |
| code-server | 8443 | VSCode web |
| n8n | 5678 | Automatización workflows |
| gitea | 3003 | Git self-hosted |
| spiderfoot | 5001 | OSINT automatizado |

### 🤖 Bots de seguridad (yggdrasil-secops)
| Contenedor | Rol | Estado |
|---|---|---|
| yggdrasilwatchdog | Watchdog de contenedores | ✅ |
| tailscalemonitor | Monitor VPN mesh | ✅ |
| networkradar + radarbackup | Radar LAN | ✅ |
| logguardianbot | Guardian de logs | ✅ |
| localtripwire | Tripwire de archivos | ⚠️ sin rutas |
| guardianbot | Bot Telegram central | ✅ |

### ⏳ Pendiente levantar
| Contenedor | Puerto | Estado | Notas |
|---|---|---|---|
| kali-pentest | 6901 | ⏳ Descargando | `kasmweb/kali-rolling-desktop:1.16.0` 3.7GB |
| wazuh | 1514/55000 | 🔜 pendiente | prereq `vm.max_map_count=262144` |
| suricata | — | 🔜 pendiente | IDS pasivo wlan0 |
| defectdojo | 8080 | 🔜 pendiente | depende de wazuh |

### 🔜 Propuestos (próximas fases)
| Contenedor | Puerto | Por qué añadir |
|---|---|---|
| AlertManager | 9093 | Gestiona alertas de Prometheus → enruta a Telegram/thdora-bot |
| Loki + Promtail | 3100 | Agregador de logs de todos los contenedores → visible en Grafana |
| CrowdSec | 8080 | Análisis colaborativo IPs maliciosas, complementa fail2ban |
| Ntfy | 80/443 | Notificaciones push ligeras desde cualquier servicio |

---

## 🤖 Modelos Ollama — Madre

| Modelo | Tamaño | Estado | Uso |
|---|---|---|---|
| qwen2.5-coder:7b | 4.7GB | ✅ descargado | Código · thdora |
| qwen2.5:3b | 1.9GB | ✅ descargado | Chat rápido |
| llama3.1:8b | 4.7GB | ✅ descargado | Chat general |
| bge-m3 | 1.2GB | ✅ descargado | Embeddings RAG |
| nomic-embed-text | 0.3GB | ✅ descargado | Embeddings rápidos |

---

## 📡 Monitorización

| Servicio | URL | Estado |
|---|---|---|
| Netdata madre | `http://100.91.112.32:19999` | ✅ activo |
| Netdata theodora | `http://100.86.119.102:19999` | ✅ activo |
| Grafana | `http://100.91.112.32:3000` | ✅ up |
| Uptime Kuma | `http://100.91.112.32:3002` | ✅ up |
| Portainer | `http://100.91.112.32:9000` | ✅ up |

### 🔔 Cadena de alertas (objetivo)
```
Suricata → Wazuh → AlertManager → Telegram (thdora-bot)
                              ↕
                         Grafana (histórico)
```

---

## 📦 Repos GitHub

| Repo | Descripción | Privado | Estado |
|---|---|---|---|
| [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | Second brain — conocimiento + diarios + orquestación | ❌ público | ✅ activo |
| [yggdrasil-secops](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | Satélite de seguridad — bots watchdog, tripwire, canary tokens, OSINT defensivo | ✅ privado | ✅ activo |
| [personal](https://github.com/alvarofernandezmota-tech/personal) | Vida personal — finanzas, gym, salud | ❌ público | ✅ activo |
| [thdora](https://github.com/alvarofernandezmota-tech/thdora) | Bot Telegram + FastAPI + Ollama local | ❌ público | 🔧 handlers pendientes |
| [local-brain](https://github.com/alvarofernandezmota-tech/local-brain) | Ollama, RAG, embeddings | ✅ privado | 🔧 en desarrollo |
| [osint-stack](https://github.com/alvarofernandezmota-tech/osint-stack) | SpiderFoot, investigación OSINT | ✅ privado | 🔧 en desarrollo |
| [ai-toolkit](https://github.com/alvarofernandezmota-tech/ai-toolkit) | Open source AI dev stack | ❌ público | ✅ activo |

### Relación entre repos
```
          yggdrasil-dew (cerebro central)
          ├── thdora          (bot Telegram + FastAPI)
          ├── local-brain     (RAG + embeddings)
          ├── osint-stack     (OSINT)
          ├── yggdrasil-secops ← SATÉLITE (bots watchdog, tripwire, defensa)
          └── ai-toolkit      (herramientas IA)
```

---

## 🔗 Referencias clave

- [[HOME]] — punto de entrada diario
- [[CONTEXT]] — contexto para agentes IA
- [[ESTADO-SISTEMA]] — estado operativo ahora mismo
- [[MASTER-PENDIENTES]] — tareas pendientes
- [[filosofia]] — principios del sistema

---
_Actualizado: 02 jul 2026 02:30 CEST — Perplexity vía MCP_
