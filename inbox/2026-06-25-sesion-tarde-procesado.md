# Sesión tarde 25-jun — Procesado
#infra #docker #healthcheck #batcueva #procesado

**Fecha:** 2026-06-25 tarde
**Estado:** ✅ Procesado — ver diarios/2026-06-25-tarde.md

## Acciones pendientes que salen de esta sesión

- [ ] `git pull --rebase` en Madre
- [ ] Script Restic backup → `scripts/backup/run-backup.sh`
- [ ] Uptime Kuma webhook → THDORA bot Telegram
- [ ] Grafana dashboard CPU + latencia Ollama
- [ ] Levantar SpiderFoot: `docker compose -f docker/batcueva-osint.yml up -d spiderfoot`
- [ ] Levantar Kali Desktop: `bc up pentest`

## Patrón fix healthcheck (guardar en docs/)

```bash
bash -c 'cat < /dev/null > /dev/tcp/localhost/PUERTO'
```
Válido para cualquier imagen sin wget/curl.
