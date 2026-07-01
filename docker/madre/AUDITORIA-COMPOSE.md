---
tags: [tipo/adr, estado/activo, #infra/docker]
---

# Auditoría Compose — Estado Real Madre

> ✅ ACTIVO — VALIDADO: 2026-07-01

## Mapa completo de composes en madre

| Ruta en madre | Compose en repo | Servicios | Estado |
|---------------|-----------------|-----------|--------|
| `~/docker-compose.yml` | `docker/madre/docker-compose.fase1-real.yml` | ollama, ollama-embeddings, qdrant, open-webui | ✅ ACTIVO |
| `~/Projects/thdora/docker-compose.yml` | `docker/madre/docker-compose.thdora.yml` | thdora, thdora-bot, prometheus, grafana | ✅ ACTIVO |
| `~/spiderfoot/docker-compose.yml` | pendiente subir | spiderfoot | ✅ ACTIVO |
| `~/docker/batcueva-nueva/docker-compose.yml` | `docker/madre/docker-compose.batcueva-nueva.yml` | ollama GPU | 🔜 PENDIENTE (sin GPU) |
| `~/Obsidian/cerebro/.../docker-compose.yml` | — | antiguo | 📦 ARCHIVO |

---

## Servicios sin compose localizado ⚠️

Estos 6 servicios están corriendo pero su compose no ha sido encontrado aún:

| Servicio | Puerto | Estado |
|----------|--------|--------|
| `n8n` | 5678 | ❓ compose no localizado |
| `gitea` | 3003/2222 | ❓ compose no localizado |
| `code-server` | 8443 | ❓ compose no localizado |
| `portainer` | 9000 | ❓ compose no localizado |
| `uptime-kuma` | 3002 | ❓ compose no localizado |
| `spiderfoot` | 5001 | ❓ compose pendiente de subir |

```bash
# Comando para localizar compose de los restantes:
grep -r "n8n\|gitea\|code-server\|portainer\|uptime-kuma" \
  ~ --include="*.yml" -l 2>/dev/null | grep -v yggdrasil-dew
```

---

## Problema de seguridad detectado 🔴

Todos los servicios escuchan en `0.0.0.0` — accesibles desde cualquier dispositivo en LAN.

| Servicio | Riesgo | Acción |
|----------|--------|--------|
| `ollama :11434` | API IA sin auth | Cambiar a `127.0.0.1:11434:11434` |
| `qdrant :6333` | BD vectorial sin auth | Cambiar a `127.0.0.1:6333:6333` |
| `prometheus :9090` | Métricas raw sin auth | Cambiar a `127.0.0.1:9090:9090` |
| `grafana :3000` | Credencial `admin/admin` | ⚠️ Cambiar password YA |

---

## Próximos pasos

- [ ] Localizar compose de: n8n, gitea, code-server, portainer, uptime-kuma
- [ ] Subir `~/spiderfoot/docker-compose.yml` al repo
- [ ] Hardening: cambiar `0.0.0.0` → `127.0.0.1` en todos los compose
- [ ] Cambiar `admin/admin` en Grafana
- [ ] Crear `docker-compose.madre-completo.yml` unificado con los 14 servicios
- [ ] Levantar fail2ban + crowdsec (imágenes ya descargadas)
