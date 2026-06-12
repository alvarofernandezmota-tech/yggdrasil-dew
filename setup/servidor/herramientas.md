# Herramientas del servidor — Comparativa open source

> Última actualización: 13 junio 2026

---

## Protección

| Herramienta | Función | Alternativa descartada | Motivo elección |
|---|---|---|---|
| **ufw** | Firewall sencillo sobre nftables | iptables directo | Más legible, misma potencia |
| **fail2ban** | Banea IPs con intentos fallidos SSH | crowdsec | Más simple, battle-tested |
| **rkhunter** | Detecta rootkits | chkrootkit | Más mantenido |

## Auditoría

| Herramienta | Función | Alternativa descartada | Motivo elección |
|---|---|---|---|
| **lynis** | Auditoría de seguridad completa | OpenSCAP | Más fácil de leer |
| **journalctl** | Logs de systemd | syslog | Nativo en Arch |
| **ss** | Puertos abiertos en tiempo real | netstat | Más moderno |

## Monitorización

| Herramienta | Función | Alternativa descartada | Motivo elección |
|---|---|---|---|
| **btop** | Recursos en tiempo real (TUI) | htop, glances | Más visual, todo en uno |
| **Uptime Kuma** | Monitor servicios + alertas | Nagios, Zabbix | Simple, Docker, UI web bonita |
| **Netdata** | Métricas en tiempo real (web) | Grafana+Prometheus | Más fácil de instalar |
| **systemd-analyze** | Tiempo de arranque | — | Nativo en systemd |

## Servicios

| Herramienta | Función | Alternativa descartada | Motivo elección |
|---|---|---|---|
| **Ollama** | LLMs locales | LocalAI | Más rápido, mejor soporte modelos |
| **Open WebUI** | Interfaz Ollama | AnythingLLM | Más activo, más features |
| **Pi-hole** | DNS + bloqueo ads | AdGuard Home | Más maduro, mejor documentado |
| **Uptime Kuma** | Monitor + alertas Telegram | Statping | Más mantenido |
| **PostgreSQL** | Base de datos | MariaDB, SQLite | Estándar, THDORA ya lo usa |

---

## Instalación automatizada

Todo lo anterior está incluido en el script de bootstrap:

```bash
bash setup/servidor/bootstrap-madre.sh
```

Ver: [bootstrap-madre.sh](bootstrap-madre.sh)

---

_Ver también: [plan-maestro.md](plan-maestro.md) · [rescate.md](rescate.md)_
