---
tipo: sesion
author: Alvaro Fernandez Mota
actualizado: 2026-07-10T00:50 CEST
ruta: docs/sesiones/PROXIMA-SESION.md
tags: [sesion, proxima, plan, domingo]
status: vigente
---

# Próxima sesión — Domingo 2026-07-13

> Archivo SSOT de dónde lo dejamos. Actualizar al inicio de cada sesión.
> Última actualización: **2026-07-10 00:50 CEST** (cierre sesión 2026-07-09/10)

---

## Punto de continuación

Sesión anterior cerrada con todo documentado:
- ✅ 10 islas WIKI creadas
- ✅ 4 issues críticos Madre abiertos (#43, #44, #45, #46)
- ✅ VIDAPERSONAL estructura canónica definida (Issue #14)
- ✅ Diarios migrados y archivados
- ⚡ Telegram token pendiente de revocar ANTES DE DORMIR

---

## Plan domingo — 5 bloques (~2h)

### Bloque 0 — ANTES DE DORMIR (5 min)
- [ ] BotFather → revocar TELEGRAM_BOT_TOKEN
- [ ] Anotar el nuevo token para el domingo

### Bloque 1 — Fix .env Madre (30 min)
Issue [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44)
```bash
ssh varopc@varpc.taileb8343.ts.net
cp /home/varopc/.env /home/varopc/.env.bak-2026-07-10
nano /home/varopc/.env
chmod 600 /home/varopc/.env
docker compose -f /home/varopc/docker-compose.yml config > /dev/null && echo OK
```

### Bloque 2 — Fix crash loop (20 min)
Issue [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46)
```bash
docker logs --tail 200 log_guardian_bot 2>&1
docker restart log_guardian_bot local_tripwire
docker ps | grep -E 'log_guardian|tripwire'
```

### Bloque 3 — IaC madre-config (30 min)
Issue [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43)
```bash
find /home/varopc -name 'docker-compose*.yml' 2>/dev/null
# copiar a madre-config/docker/ con estructura
```

### Bloque 4 — Diarios (20 min)
- Diario 2026-07-10 (viernes)
- Retrospectiva S28 en VIDAPERSONAL

### Bloque 5 — Limpieza VIDAPERSONAL (30 min)
Issue [#14](https://github.com/alvarofernandezmota-tech/VIDAPERSONAL/issues/14)
```bash
cd ~/VIDAPERSONAL
git mv 03_proyectos _archivo/03_proyectos
git mv 03_reflexiones _archivo/03_reflexiones
# ... (comandos completos en el issue)
```

---

## NO tocar el domingo

- Issues #35-#42 (auditorías y gobernanza) — para sesiones de la semana
- Issue #19 (Wazuh + Suricata) — proyecto mayor, no urgente
- Issue #41 (diagrama C4) — backlog

_Actualizado: 2026-07-10 00:50 CEST · Perplexity-MCP_
