# 🖥️ Servidor Madre — Setup & Estado

> Documentación técnica del servidor de producción.
> Parte del ecosistema: [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew)
> Última actualización: **17 junio 2026**

---

## Datos del servidor

| Campo | Valor |
|---|---|
| Nombre | Madre |
| Tipo | Torre fija (producción) |
| OS | Linux |
| IP Tailscale | `100.91.112.32` |
| IP local | `10.134.31.228` |
| Acceso | SSH via Tailscale |

```bash
# Conectar al servidor
ssh usuario@100.91.112.32
```

---

## Estado de servicios

### ✅ Activos

| Servicio | Puerto | Notas |
|---|---|---|
| sshd | 22 | Acceso principal |
| Tailscale | — | Red P2P, siempre activo |
| Docker | — | Motor de contenedores |
| THDORA (bot) | — | v0.17.0, contenedor Docker |
| Ollama | 11434 | llama3.2:3b (CPU) |

### ⏳ Pendientes (por orden de prioridad)

| Servicio | Prioridad | Notas |
|---|---|---|
| **UFW** | 🔴 Alta | Firewall — instalar antes de exponer puertos |
| **fail2ban** | 🔴 Alta | Protección SSH brute force |
| **PostgreSQL** | 🟡 Media | Base de datos producción para thdora |
| **wayvnc autostart** | 🟡 Media | Acceso gráfico remoto |
| **Uptime Kuma** | 🟡 Media | Monitorización servicios |
| **Open WebUI** | 🟢 Planificado | RAG sobre yggdrasil-dew con Ollama |
| **Pi-hole** | 🟢 Planificado | DNS + bloqueo anuncios |
| **n8n** | 🟢 Planificado | Automatizaciones (diario nocturno) |

---

## Pirámide de Resiliencia

```
┌─────────────────────────────────┐
│  3 — AISLAMIENTO                │  Docker ✅
│  contenedores separados         │
├─────────────────────────────────┤
│  2 — AUDITORÍA                  │  ⏳ lynis · journald · btop
│  visibilidad del sistema        │
├─────────────────────────────────┤
│  1 — BLINDAJE                   │  ⏳ UFW · fail2ban
│  protección activa              │
├─────────────────────────────────┤
│  0 — ACCESO                     │  ✅ SSH · Tailscale
│  puerta de entrada              │
└─────────────────────────────────┘
```

---

## THDORA en Docker

> Repo: https://github.com/alvarofernandezmota-tech/thdora

```bash
# Ver estado del contenedor
docker ps | grep thdora

# Ver logs en tiempo real
docker logs -f thdora

# Reiniciar bot
docker restart thdora

# Deploy desde CI/CD (GitHub Actions)
# Ver: thdora/.github/workflows/deploy.yml
```

### Variables de entorno necesarias (secrets GitHub Actions)

| Secret | Descripción |
|---|---|
| `SERVER_HOST` | IP Tailscale del Madre |
| `SERVER_USER` | Usuario SSH |
| `SSH_PRIVATE_KEY` | Clave SSH privada |
| `BOT_TOKEN` | Token bot Telegram |
| `OWNER_CHAT_ID` | Chat ID del owner |

### Pendiente antes de merge v0.17.0
- [ ] Añadir todos los secrets en GitHub Actions
- [ ] `alembic upgrade head` en Madre
- [ ] `pytest tests/unit/bot/ -v` localmente
- [ ] Eliminar `tests.yml` (redundante con `deploy.yml`)

---

## CI/CD — GitHub Actions

Flujo automático al hacer push a `main` en thdora:

```
push main → tests → SSH deploy → health check → Telegram notify
```

Config: `thdora/.github/workflows/deploy.yml`
Acceso: `appleboy/ssh-action` via secrets

---

## Próximos pasos (orden recomendado)

```bash
# 1. Instalar UFW
sudo apt install ufw
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 22/udp    # Tailscale
sudo ufw enable

# 2. Instalar fail2ban
sudo apt install fail2ban
sudo systemctl enable --now fail2ban

# 3. PostgreSQL (cuando thdora esté en v0.17.0 mergeado)
sudo apt install postgresql
# + configurar en docker-compose.yml de thdora

# 4. Uptime Kuma
docker run -d --restart=always -p 3001:3001 \
  -v uptime-kuma:/app/data \
  --name uptime-kuma louislam/uptime-kuma:1

# 5. Open WebUI (RAG sobre yggdrasil-dew)
docker run -d -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://localhost:11434 \
  -v open-webui:/app/backend/data \
  --name open-webui ghcr.io/open-webui/open-webui:main
```

---

## Relación con el ecosistema

```
yggdrasil-dew (cerebro)
    └── setup/servidor/README.md  ← estás aquí
    └── diarios/                  ← thdora escribe aquí via /diario

thdora (bot)
    └── corre en Docker en Madre
    └── lee contexto de yggdrasil-dew (RAG planificado)
    └── escribe diarios via GitHub Contents API
```

---

_Parte de [yggdrasil-dew](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) · el cerebro del ecosistema_
