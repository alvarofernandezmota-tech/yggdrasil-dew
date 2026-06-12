# Servidor Casa — Arquitectura y Estado

> Infraestructura doméstica de Álvaro Fernández Mota.
> 100% open source · Zero Trust · Auditado con Git
> Última actualización: 12 junio 2026

---

## Decisión de arquitectura (fijada 12 jun 2026)

**Madre es el cerebro. Acer es el soporte.**

| Principio | Detalle |
|---|---|
| **Todo corre en Madre** | Trabajo, código, IAs, escritorio, GPU |
| **Acer quita peso a Madre** | Absorbe los servicios que no necesitan GPU ni intervención manual |
| **Acer = siempre encendido** | Servicios que no pueden parar: THDORA, PostgreSQL, Pi-hole |
| **Madre = siempre ágil** | Sin servicios pesados en segundo plano que roben RAM/CPU |

### Qué corre dónde

| Servicio | Máquina | Por qué |
|---|---|---|
| Trabajo diario, código, IDE | **Madre** | Es la workstation |
| Ollama + Open WebUI (LLM) | **Madre** | Necesita GTX 1060 |
| Input Leap (servidor) | **Madre** | Emite teclado+ratón |
| Input Leap (cliente) | **Acer + MacBook** | Reciben entrada |
| THDORA (bot Telegram) | **Acer** | 24/7, no necesita GPU |
| PostgreSQL | **Acer** | 24/7, sin intervención |
| Pi-hole (DNS) | **Acer** | 24/7, crecítico |
| Tailscale | **Madre + Acer + Mac** | IPs fijas en toda la red |
| fail2ban + logs | **Acer** | Seguridad siempre activa |

---

## Arquitectura visual

```mermaid
graph TD
    subgraph "LAN + Tailscale"
        Madre["\ud83d\udda5\ufe0f MADRE\n[CEREBRO]\ni5-8400 · 16GB · GTX1060\nOmarchy · trabajo + GPU"]
        Acer["\ud83d\uddc4\ufe0f ACER\n[SOPORTE 24/7]\nRyzen 5500U · 8GB\nServicios permanentes"]
        Mac["\ud83d\udcbb MacBook\ncliente"]

        Madre -- "Ollama LLM (GPU)" --> OW["Open WebUI"]
        Madre -- "Input Leap server" --> Acer
        Madre -- "Input Leap server" --> Mac
        Madre -- "SSH" --> Acer

        Acer --> THDORA["THDORA\nTelegram bot"]
        Acer --> PG["PostgreSQL"]
        Acer --> PH["Pi-hole DNS"]
    end
```

---

## Estado de servicios

| Servicio | Máquina | Estado | Archivo |
|---|---|---|---|
| **Tailscale** | Madre + Acer + Mac | ⏳ Instalar (Fase 1) | `tailscale.md` |
| **SSH Madre → Acer** | Acer | ⏳ Instalar (Fase 1) | — |
| **Input Leap** | Madre → Acer + Mac | ⏳ Instalar (Fase 1) | `barrier.md` |
| **Ollama + Open WebUI** | Madre (GTX 1060) | ⏳ Fase 3 | `ollama.md` |
| **PostgreSQL** | Acer | 🔄 Migrando | — |
| **THDORA** | Acer | 🔄 Migrando | `../../proyectos/thdora.md` |
| **Pi-hole** | Acer | ⏳ Fase 3 | — |

---

## Roadmap

```
FASE 1 — Conectividad (AHORA)
  ├── Tailscale en Madre + Acer + Mac → IPs fijas 100.x.x.x
  ├── SSH Madre → Acer funcionando
  └── Input Leap: server en Madre, client en Acer+Mac, UFW Zero Trust

FASE 2 — Seguridad
  ├── TLS en Input Leap
  ├── fail2ban en Acer
  └── Headscale self-hosted (sustituye Tailscale cloud)

FASE 3 — Servicios
  ├── Ollama + Open WebUI en Madre
  ├── PostgreSQL consolidado en Acer
  ├── THDORA migrado a Acer
  └── Pi-hole en Acer
```

---

## Red LAN

| Máquina | IP LAN | IP Tailscale | Rol |
|---|---|---|---|
| Ordenador Madre | pendiente fijar | pendiente | Cerebro |
| Acer Aspire | 10.176.119.171 | pendiente | Soporte 24/7 |
| MacBook | 10.176.119.229 | pendiente | Cliente |

**Primer paso crítico:** instalar Tailscale en Madre y Acer para tener IPs 100.x.x.x estables.

---

## Logs y auditoría

```bash
# Ver servicios activos
systemctl list-units --type=service --state=running

# Input Leap en tiempo real
journalctl -u input-leap -f

# Intentos bloqueados por UFW
sudo journalctl -k | grep UFW
```

---

_Frecuencia de actualización: al cambiar configuración o estado de cualquier servicio._
