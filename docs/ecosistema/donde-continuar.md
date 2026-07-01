---
tags: [tipo/referencia, continuacion, fases]
fecha: 2026-07-01
---

# ⏩ Dónde continuar — Guía de fases

> Lee esto cuando vuelvas después de un descanso.
> Te dice exactamente en qué fase estamos y qué hacer a continuación.

---

## 📍 Estado actual — 01 jul 2026

**Fase completada:** Fase 1 — Stack base IA + observabilidad + desarrollo (14 contenedores UP)
**Fase activa:** Fase 2 — Stack pentest/OSINT (en despliegue)
**Hallazgo abierto:** SEC-001 — Puerto 21 FTP en router Digi

---

## 🔴 LO PRIMERO cuando vuelvas

### 1. Cerrar SEC-001 (5 min)
```bash
# Ver IP del router:
ip route | grep default
# Entrar al panel: http://192.168.X.X
# Buscar: USB / FTP Server / Administración
# Desactivar servidor FTP
# Verificar:
nmap -Pn --open -p 21 79.116.247.44
# Esperado: filtered (no open)
```

### 2. Verificar Kali UP
```bash
docker ps | grep kali
# Si está UP:
# Abrir: https://100.91.112.32:6901
# Usuario: kasm_user
# Password: batcueva2026 (o la del .env)
```

### 3. Si Kali NO está UP (todavía descargando)
```bash
# Ver progreso:
docker compose -f ~/yggdrasil-dew/osint-stack/docker-compose.kali.yml logs
# O forzar relanzar:
docker compose -f ~/yggdrasil-dew/osint-stack/docker-compose.kali.yml up -d
```

---

## 🟡 FASE 2 — Pentest/OSINT (cuando Kali esté UP)

### Paso A — Recon red local desde Kali
```bash
# Desde terminal dentro de Kali (https://100.91.112.32:6901):
nmap -sn 192.168.72.0/24
# Ver todos los dispositivos: varopc, router, móviles, etc.
```

### Paso B — Auditar varopc desde Kali
```bash
nmap -sS -sV -O 192.168.72.X   # IP local de varopc
# Ver qué puertos/servicios ves desde la red interna
```

### Paso C — Buscar CVEs de versiones encontradas
```bash
# Dentro de Kali:
searchsploit nginx 1.X
searchsploit openssh 8.X
# etc. con las versiones que devuelva el nmap
```

### Paso D — Auditar aislamiento Docker
```bash
# Desde varopc — ver qué redes tiene cada contenedor:
docker network ls
docker inspect <contenedor> | grep -A 20 Networks
# Todos en la misma red bridge = riesgo de movimiento lateral
```

### Paso E — Auditar APIs sin auth
```bash
# Ollama sin auth:
curl http://100.91.112.32:11434/api/tags
# Qdrant sin auth:
curl http://100.91.112.32:6333/collections
# Si responden → accesibles sin credenciales (pendiente securizar)
```

---

## 🟢 FASE 3 — SIEM (después de Fase 2)

```bash
# Prereq obligatorio antes de levantar Wazuh:
sudo sysctl -w vm.max_map_count=262144
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf

# Luego levantar Wazuh:
docker compose -f ~/yggdrasil-dew/siem/docker-compose.wazuh.yml up -d
```

---

## 🟣 FASE 4 — RAG + Integraciones (después de Fase 3)

- Pipeline RAG: bge-m3 → Qdrant → Open WebUI
- yggdrasil-dew como base de conocimiento consultable
- n8n workflows para automatizar alertas
- THDORA handlers avanzados

---

## 📊 Servicios activos ahora mismo

| Servicio | URL | Para qué |
|---|---|---|
| Open WebUI | `http://100.91.112.32:3001` | Chat con modelos locales |
| SpiderFoot | `http://100.91.112.32:5001` | OSINT pasivo |
| Portainer | `http://100.91.112.32:9000` | Gestionar Docker |
| Grafana | `http://100.91.112.32:3000` | Métricas sistema |
| Uptime Kuma | `http://100.91.112.32:3002` | Monitor disponibilidad |
| Gitea | `http://100.91.112.32:3003` | Git privado |
| Code Server | `https://100.91.112.32:8443` | VS Code web |
| n8n | `http://100.91.112.32:5678` | Automatizaciones |
| Kali Desktop | `https://100.91.112.32:6901` | Pentesting (⏳ descargando) |

---
_Actualizado: 01 jul 2026 02:06 CEST — Perplexity vía MCP_
_Ver: [[ESTADO-SISTEMA]] · [[mapa-para-que-sirve-cada-cosa]]_
