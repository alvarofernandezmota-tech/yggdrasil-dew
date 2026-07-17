---
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/runbooks/RUNBOOK-CRITICOS-TERMINAL.md
tags: [runbook, terminal, criticos, seguridad, hardware]
status: vigente
---

# Runbook: Críticos de terminal — Sesión próxima

> Lista completa de acciones críticas que requieren terminal. En orden de prioridad.
> Ejecutar en esta secuencia para máxima eficiencia.

---

## Orden de ejecución recomendado

### 1️⃣ #74 — Token THDORA (5 min)

Ver `RUNBOOK-THDORA-TOKEN.md`

### 2️⃣ #75 — yggdrasil-mcp (5-10 min)

Ver `RUNBOOK-MCP-ARRANQUE.md`

### 3️⃣ #71 — Qdrant healthcheck (2 min)

```bash
ssh varopc@100.91.112.32
docker ps | grep qdrant
docker logs qdrant --tail 20
curl http://localhost:6333/health
# Si responde OK → es falso positivo → cerrar #71
```

### 4️⃣ #15 — Cerrar FTP puerto 21 router (3 min)

```
1. Abrir navegador → http://192.168.1.1
2. Buscar sección: NAT / Port Forwarding / Avanzado
3. Desactivar regla FTP puerto 21
4. Guardar + reiniciar router si pide
5. Verificar: nmap -p 21 <IP_pública>
```

### 5️⃣ F20 — Documentar hardware Madre (3 min)

```bash
ssh varopc@100.91.112.32

# CPU y placa base
sudo dmidecode -t processor | grep -E 'Version|Speed|Core'
sudo dmidecode -t baseboard | grep -E 'Manufacturer|Product|Version'

# RAM
sudo dmidecode -t memory | grep -E 'Size|Speed|Type|Manufacturer'

# Copiar output y actualizar wiki/islas/infra.md sección Madre
```

### 6️⃣ #31 — S.M.A.R.T. HDD (5 min)

```bash
ssh varopc@100.91.112.32

# Identificar discos
lsblk

# S.M.A.R.T. completo
sudo smartctl -a /dev/sda   # ajustar dispositivo

# Buscar:
# - Reallocated_Sector_Ct > 0 → disco degradado
# - Power_On_Hours → confirmar 28k+
# - Pending_Sector_Count > 0 → urgente

# Si valores críticos → planificar sustitución inmediata
# Actualizar issue #31 con datos reales
```

---

## Post-sesión

```bash
# Una vez terminado:
# 1. Actualizar ESTADO-SISTEMA.md con nuevo estado real
# 2. Cerrar issues resueltos en DEW
# 3. Crear diario sesion en docs/sesiones/
```

---

_Creado: 2026-07-18 · Perplexity-MCP · F22_
