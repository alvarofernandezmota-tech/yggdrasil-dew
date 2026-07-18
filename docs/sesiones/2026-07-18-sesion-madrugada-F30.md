# Sesión Madrugada 2026-07-18 — F30

**Hora inicio:** ~04:26 CEST  
**Hora cierre:** ~04:34 CEST  
**Nodo:** Madre (varopc)  
**Uptime al inicio:** 50 min

---

## Contexto de arranque

Sesión arrancada desde Theodora vía SSH a Madre. Se solicitó:
1. Análisis y propuesta de unificación/consolidación de repos del ecosistema
2. Auditoría completa del estado de Madre: CPU, RAM, disco, contenedores, cron, systemd, logs

---

## 1. Propuesta de consolidación de repos

Análisis realizado sobre el ecosistema completo. Resultado: reducción posible de ~21 repos a ~14 sin perder orden ni trazabilidad.

### Fusiones propuestas

| Acción | Motivo |
|---|---|
| `ollama-stack` absorbe `local-brain` | Misma capa IA local/RAG |
| `yggdrasil-wiki` absorbe `WIKI---PERSONAL` | Duplicidad wiki/second brain |
| `yggdrasil-secops` absorbe `osint-stack` | OSINT es subcapacidad de SecOps |
| `ai-toolkit` absorbe `investigacion-ia` | Demasiado cerca para vivir separados |
| Archivar `dev-labs` → `yggdrasil-scripts` | dev-labs vacío, scripts ya cubre automatización |
| Evaluar `yggdrasil-tracking` + `yggdrasil-formacion` | Si diario, hábitos y gestión personal deben unirse |

### No tocar
- `yggdrasil-dew` — canon técnico con 34+ issues activos
- `madre-config`, `acer-config` — infraestructura por nodo

### Estructura mínima objetivo (7 bloques)
1. Canon (`yggdrasil-dew`)
2. Conocimiento (`yggdrasil-wiki`)
3. Personal (`VIDAPERSONAL`)
4. Infra (`madre-config`, `acer-config`)
5. IA (`ollama-stack` unificado)
6. SecOps (`yggdrasil-secops` + OSINT)
7. Automatización/Proyectos (`yggdrasil-scripts`)

---

## 2. Auditoría Madre — Estado Real

### CPU + RAM
```
top - 04:26:11 up 50 min
load average: 1.75, 2.30, 3.21  ← carga descendiendo
CPU: 8% us, 4.6% sy, 58.9% idle, 28% wa  ← I/O WAIT ALTO
RAM: 15.9 GB total | 4.3 GB used | 234 MB free | 11.8 GB buff/cache
Swap: prácticamente sin usar (3.6 MB de 20 GB)
Zombies: 8
```

**Lectura:** El sistema no está saturado en CPU/RAM, pero el 28% de I/O wait indica espera de disco, probablemente por contenedores activos con lectura/escritura intensiva.

### Disco
```
/dev/mapper/root  930G  400G  530G  43%  /
/dev/sda1           2G  774M  1.3G  38%  /boot
```
Sin riesgo de espacio. Disco a mitad.

### Home más pesado
```
20G  Downloads
7.4G isos
258M yay
84M  tailscale.apk
47M  spiderfoot
34M  Obsidian
30M  repos
```
Candidatos a limpieza: `Downloads` (20G) e `isos` (7.4G).

---

## 3. Contenedores — Estado

| Contenedor | Estado | Diagnóstico |
|---|---|---|
| `thdora-bot` | Restarting (1) | Crash loop activo — probable token inválido o .env mal |
| `open-webui` | unhealthy | Healthcheck mal configurado (ya conocido de 2026-07-16) |
| `qdrant` | unhealthy | Healthcheck falla por telemetry.qdrant.io inaccesible |
| `local_tripwire` | health: starting | En arranque, generando I/O |
| `yggdrasil-mcp` | Up 30 sec | Recién levantado |
| Resto | healthy | Operativos |

**Total activos:** 23 contenedores | **Parados:** 0

### Docker disk
```
Images:       54 total (22 activas) | 57.55 GB | 17.19 GB reclamables
Containers:   23 | 695 MB
Volúmenes:    26 (17 activos) | 16.8 GB | 1.1 GB reclamable
Build cache:  145 | 3.7 GB | 1.6 GB reclamable
TOTAL REAL RECLAMABLE: ~20 GB sin tocar nada crítico
```

---

## 4. Cron y Systemd

- **Cron:** Sin cron (vacío)
- **Systemd:** Solo scopes Docker + servicios base (containerd, avahi, cups, netdata). Sin servicios externos sospechosos.
- **Conclusión:** No hay timers ni cron agresivos fuera de Docker.

---

## 5. Logs — Journalctl

Patrón dominante en los logs:
```
containerd: cleaning up dead shim — id=4df84d2a...
dockerd: restarting container 4df84d2a... restartCount=106 restartPolicy=unless-stopped
```
**El contenedor `4df84d2a...` ha reiniciado 106 veces.** Ese es el origen del ruido en journalctl y parte del I/O alto. Es casi con seguridad `thdora-bot`.

Tailscale también da rate limiting por exceso de logs (429 bytes transferred per ID).

---

## 6. Procesos Python — Análisis

| PID | Usuario | Proceso | Estado |
|---|---|---|---|
| 950 | root | `fail2ban-server` | Normal |
| 3859 | root | `radar_bot.py` | Normal (Docker) |
| 3957 | varopc | `uvicorn thdora` | Normal (API sana) |
| 4271 | root | `tailscale_monitor.py` | Normal |
| 4740 | root | `open_webui` (uvicorn) | 0.4% CPU — operativo |
| 78438 | root | `tripwire.py` estado **Ds** | **SOSPECHOSO** — Ds = durmiendo con I/O no interrumpible |

**`tripwire.py` PID 78438 en estado `Ds`** → bloqueado esperando I/O. Es el sospechoso principal del `28% wa`. Lleva activo desde las 04:31 y es coherente con `local_tripwire` en `health: starting`.

---

## 7. Diagnóstico Final

**Causa principal del I/O alto y carga:**
1. `thdora-bot` en crash loop (restartCount=106) — genera I/O constante por reinicios
2. `tripwire.py` en estado `Ds` — escaneando baseline de 87.918 archivos, bloqueando disco
3. `open-webui` y `qdrant` unhealthy — healthchecks malos, no fallo real de servicio

**El sistema NO necesita reinstalación ni wipe.** Es una suma de servicios que empujan I/O al arranque simultáneo.

---

## 8. Acciones Pendientes (próxima sesión)

- [ ] Parar `thdora-bot` y diagnosticar crash loop (revisar .env y token Telegram)
- [ ] Esperar a que `local_tripwire` complete baseline y ver si baja el wa%
- [ ] Fix healthcheck `open-webui` y `qdrant` (ya documentado en issue anterior)
- [ ] Limpiar Docker: `docker image prune -a` (17 GB reclamables) + `docker builder prune`
- [ ] Limpiar `~/Downloads` e `~/isos` (27 GB combinados)
- [ ] Iniciar proceso de consolidación repos (7 bloques)
- [ ] Actualizar `PROXIMA-SESION.md` con este estado

---

## 9. Estado del ecosistema al cierre

| Servicio | Estado |
|---|---|
| Madre encendida | ✅ |
| Stack Docker principal | ✅ (con excepciones conocidas) |
| thdora (API) | ✅ healthy :8000 |
| thdora-bot | ❌ crash loop |
| open-webui | ⚠️ unhealthy (falso) |
| qdrant | ⚠️ unhealthy (falso) |
| local_tripwire | ⏳ starting |
| Grafana/Prometheus | ✅ |
| n8n, gitea, code-server | ✅ |
| kali-pentest | ✅ |

---

*Documentado vía MCP desde Theodora — Sesión F30 — 2026-07-18 04:34 CEST*
