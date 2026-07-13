---
tipo: sesion
author: Alvaro Fernandez Mota
actualizado: 2026-07-13T15:45 CEST
ruta: docs/sesiones/PROXIMA-SESION.md
tags: [sesion, proxima, plan, martes]
status: vigente
---

# Próxima sesión — Martes 2026-07-14

> Archivo SSOT de dónde lo dejamos. Leer esto al inicio de cada sesión antes de cualquier otra cosa.
> Última actualización: **2026-07-13 15:45 CEST** (cierre sesión completa 12-13 julio)

---

## Estado al cierre

- ✅ Tridente DEW ↔ Wiki ↔ VIDAPERSONAL alineado al 100%
- ✅ 7 issues cerrados hoy: #38 #39 #41 #42 #44 #45 #46
- ✅ ADR 001–010 creados y consolidados
- ✅ 25 islas Wiki verificadas
- ✅ DRP, secrets.md, inventario-madre.md como nuevas fuentes de verdad
- ✅ 4 zombis raíz eliminados
- ⚠️ Posibles duplicados a revisar: `ECOSYSTEM-ARCHITECTURE.md` vs `ARQUITECTURA-C4.md` · `NORMAS.md` vs `CONVENCIONES.md`

---

## Plan martes 14 julio — por bloques

### Bloque 0 — Contexto (5 min)
```
1. Leer este archivo
2. git log --oneline -5 en DEW
3. Leer DASHBOARD.md
```

### Bloque 1 — Terminal Madre (30 min) 🔴 PRIMERO
Issue [#36](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/36) · [#49](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/49) · [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31)
```bash
ssh varopc@varpc.taileb8343.ts.net
# 1. local_tripwire healthy?
docker ps | grep -E 'tripwire|guardian'
# 2. Cerrar puerto 21
sudo ufw deny 21 && sudo ufw status
# 3. HDD check
sudo smartctl -a /dev/sda | grep -E 'Power_On|Reallocated|Pending|Uncorrectable|Temp'
# 4. Puerto 21 desde red externa (no Tailscale)
nmap -p 21 <IP-PUBLICA-MADRE>
```

### Bloque 2 — Duplicados DEW (15 min)
- Leer `ECOSYSTEM-ARCHITECTURE.md` vs `docs/canon/ARQUITECTURA-C4.md` — decidir cuál es SSOT
- Leer `NORMAS.md` vs `CONVENCIONES.md` + `CONVENCIONES-SEGURIDAD.md` — fusionar o eliminar

### Bloque 3 — AUDIT-002 DEW (20 min)
Issue [#35](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/35)
- Auditoría completa de DEW: estructura, archivos huérfanos, canon vs operativo

### Bloque 4 — Gobernanza (20 min)
Issue [#18](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/18)
- Labels estándar + issue templates GitHub en DEW

### Bloque 5 — VIDAPERSONAL (15 min)
- Actualizar `00_yo/` con hitos de julio
- Actualizar `00_sistema/CONTEXT-PERPLEXITY.md`
- Pendiente git mv local: Issue [#14](https://github.com/alvarofernandezmota-tech/VIDAPERSONAL/issues/14)

---

## NO tocar el martes

- Issue #43 (IaC docker-compose) — requiere sesión dedicada con terminal
- Issues #19 (Wazuh + Suricata) — proyecto mayor
- Issue #56 (islas formacion + impresion3d) — requiere input Álvaro
- Issue #50 (GOB-001 filosofía) — requiere input Álvaro

---

## Prompt de arranque

```
Contexto: Estoy en sesión con yggdrasil-dew. Ayer cerramos 7 issues (#38 #39 #41 #42 #44 #45 #46),
creamos ADR 001-010, alineamos el tridente al 100% y eliminamos 4 zombis de raíz.
Lee PROXIMA-SESION.md y DASHBOARD.md antes de cualquier acción. Empezamos por Bloque 1 (terminal).
```

_Actualizado: 2026-07-13 15:45 CEST · Perplexity-MCP_
