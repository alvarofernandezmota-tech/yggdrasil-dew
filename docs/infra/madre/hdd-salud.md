---
tipo: infra
fecha: 2026-07-10
author: Alvaro Fernandez Mota
status: vigente
ruta: docs/infra/madre/hdd-salud.md
tags: [infra, madre, hdd, smartctl, salud]
---

# HDD Madre — Historial de salud

## Evidencia 2026-07-10 00:25 CEST

```
sudo smartctl -a /dev/sda | grep -E "Power_On_Hours|Reallocated|Pending|Uncorrectable|Temperature"

  5 Reallocated_Sector_Ct   0x0033   200   200   140    Pre-fail  Always  -  0
  9 Power_On_Hours          0x0032   061   061   000    Old_age   Always  -  28811
194 Temperature_Celsius     0x0022   098   093   000    Old_age   Always  -  45
196 Reallocated_Event_Count 0x0032   200   200   000    Old_age   Always  -  0
197 Current_Pending_Sector  0x0032   200   200   000    Old_age   Always  -  0
198 Offline_Uncorrectable   0x0030   200   200   000    Old_age   Offline -  0
```

## Interpretación

| Atributo | Valor | Estado |
|----------|-------|--------|
| Power_On_Hours | 28.811 h (~3.3 años) | 🟡 Antigüedad alta |
| Reallocated_Sector_Ct | 0 | ✅ Ninguno |
| Current_Pending_Sector | 0 | ✅ Ninguno |
| Offline_Uncorrectable | 0 | ✅ Ninguno |
| Temperatura | 45°C | ✅ Normal |

## Conclusión

No hay fallo SMART activo. Sin sectores reasignados, pendientes ni irrecuperables.
El riesgo es **estadístico** por antigüedad: HDDs de esta generación tienen MTBF de ~45.000h.
Está al 64% de vida útil estimada.

## Plan de monitorización

- Repetir `smartctl` mensualmente (cada primer domingo del mes)
- Si `Current_Pending_Sector` > 0 → backup inmediato + planificar sustitución urgente
- Si `Reallocated_Sector_Ct` > 0 → sustitución urgente en menos de 30 días
- Sustitución preventiva planificada: **Q4 2026**

_Creado: 2026-07-10 · Perplexity-MCP_
