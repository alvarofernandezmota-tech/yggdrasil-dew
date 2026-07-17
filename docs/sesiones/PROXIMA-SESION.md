---
tipo: sesion
author: Alvaro Fernandez Mota
actualizado: 2026-07-18 00:34 CEST
ruta: docs/sesiones/PROXIMA-SESION.md
tags: [sesion, proxima, pendientes]
---

# ⏭️ PRÓXIMA SESIÓN

> Leer esto al inicio de cada sesión ANTES de actuar.
> Después seguir `docs/canon/PROTOCOLO-INICIO-SESION.md`.

**Última actualización:** 2026-07-18 00:34 CEST
**Estado del ecosistema:** ✅ ESTABLE — verificado sesión madrugada 2026-07-18

---

## ✅ Verificación de cierre anterior (sesión 2026-07-18 madrugada)

| Ítem | Estado real verificado |
|---|---|
| ESTADO-SISTEMA.md | ✅ Actualizado 2026-07-18 00:29 CEST |
| MASTER-PENDIENTES.md | ✅ F20 añadida — hardware Madre |
| docs/sesiones/2026-07-18-diario.md | ✅ Creado — sesión hardware/i9 |
| docs/inventario-madre.md | ✅ CPU/placa documentada como ❓ + TODO terminal |
| 45 protocolos + INDEX v5.0 | ✅ Canon completo |
| ADRs | ✅ 14 ADRs operativos |
| AGENT.md + CONTEXT.md x4 repos principales | ✅ dew/wiki/tracking/THDORA |

---

## 🔴 CRÍTICOS — ejecutar con terminal en este orden

### 1. Snapshot estado real Docker
```bash
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```
→ Actualizar `docs/inventario-madre.md` con resultado

### 2. F20 — Documentar CPU y placa Madre
```bash
cat /proc/cpuinfo | grep "model name" | head -1
sudo dmidecode -t baseboard | grep -E "Manufacturer|Product|Version"
```
→ Actualizar `docs/inventario-madre.md` — sección CPU/placa
→ Evaluar viabilidad i9-13900K (requiere LGA-1700)
→ Cerrar F20 en MASTER-PENDIENTES si dato obtenido

### 3. Fix qdrant — issue #71
```bash
cd /home/varopc/Projects/<stack-qdrant>
# Añadir en docker-compose.yml o .env:
# QDRANT__TELEMETRY_DISABLED=true
docker compose up -d --force-recreate qdrant
docker logs --tail 20 qdrant
```
→ Verificar estado healthy
→ Cerrar issue #71 con comentario de resolución

### 4. Fix yggdrasil-mcp — issue #75
Ver runbook completo en [#75](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/75)
```bash
# 1. Identificar qué ocupa puerto 3000
sudo ss -tlnp | grep 3000
# 2. Según resultado: liberar puerto o cambiar puerto en compose
# 3. Arrancar contenedor
docker compose up -d yggdrasil-mcp
docker logs --tail 30 yggdrasil-mcp
```
→ Cerrar issue #75

### 5. Renovar token THDORA — issue #74
Ver runbook completo en [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74)
```bash
cd /home/varopc/Projects/thdora
nano .env   # → actualizar TELEGRAM_BOT_TOKEN
docker compose up -d --force-recreate --no-deps bot
docker logs --tail 30 thdora-bot
```
→ Cerrar issue #74
→ ⚠️ `docker restart thdora-bot` NO funciona para cambios de .env

### 6. Salud HDD — issue #31
```bash
sudo smartctl -a /dev/sda | grep -E "SMART overall|Reallocated|Power_On_Hours|Pending|Uncorrectable"
```
→ Actualizar `docs/infra/madre/hdd-salud.md`

### 7. Limpieza canon (issue #77)
```bash
# Borrar redirects zombie en docs/canon/
ls docs/canon/
# Renombrar inventario
mv docs/inventario-madre.md INVENTARIO-MADRE.md
# Mover ADR suelto
mv docs/ADR-002-alineacion-tridente.md docs/adr/ADR-002-alineacion-tridente.md
```

### 8. Seguridad
```bash
# Verificar Ollama no expuesto a internet
sudo ss -tlnp | grep 11434
# Cerrar puerto 21 FTP → acceder a panel router Digi
```

---

## 🟡 PENDIENTES MCP (sin terminal)

| Issue | Descripción | Cuándo |
|---|---|---|
| [#69](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/69) | F17: PROTOCOLO-NUEVO-DIARIO-TRACKING | Próxima sesión MCP |
| [#59](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/59) | F3: Purga WIKI archivos deprecados | Sesión larga dedicada |
| [#79](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/79) | BOOTSTRAP.md v2 con datos terminal | Tras sesión terminal |

---

## ❌ Lo que NO hacer al arrancar

- No crear archivos sin leer SHA primero
- No tocar secretos ni .env desde MCP
- No modificar ESTADO-SISTEMA ni MASTER-PENDIENTES hasta el cierre
- No empezar terminal sin hacer snapshot `docker ps` primero

---

_Actualizado: 2026-07-18 00:34 CEST · Sesión MCP sin terminal · Orden terminal documentado · Perplexity MCP_
