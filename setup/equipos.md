# Equipos — Hardware del sistema

> Inventario actualizado. Última revisión: 12 junio 2026

---

## Arquitectura actual

```
┌─────────────────────────────────────────┐
│  EN CASA                                │
│                                         │
│  ORDENADOR MADRE        HP TOUCHSMART   │
│  i5-8400 · 16GB         23" táctil      │
│  GTX 1060               Pendiente OS    │
│  Omarchy / Arch         Monitor logs    │
│  WORKSTATION PRINCIPAL                  │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│  PORTÁTILES                             │
│                                         │
│  ACER Aspire            MacBook         │
│  Ryzen 5 5500U · 8GB    macOS           │
│  Omarchy / Arch         Portátil temp.  │
│  HOME SERVER 24/7       Input Leap CLI  │
└─────────────────────────────────────────┘
        ↕ Input Leap (LAN)
  MacBook usa teclado/ratón del Acer
```

---

## Inventario detallado

### Ordenador Madre — Workstation principal
| Campo | Valor |
|---|---|
| CPU | Intel Core i5-8400 @ 2.80GHz (6 núcleos) |
| RAM | 16 GB DDR4 |
| GPU | NVIDIA GeForce GTX 1060 |
| OS | Omarchy / Arch Linux + Hyprland |
| Rol | Workstation — VSCode, Ollama, DBeaver, Docker |

### Acer Aspire — Home Server
| Campo | Valor |
|---|---|
| CPU | AMD Ryzen 5 5500U @ 2.10GHz |
| RAM | 8 GB DDR4 |
| SSD | 477 GB (127 GB usado) |
| OS | Omarchy / Arch Linux + Hyprland |
| IP local | 10.176.119.171 |
| Rol | Home Server 24/7 — THDORA, PostgreSQL, Nextcloud, VPN |

### MacBook
| Campo | Valor |
|---|---|
| OS | macOS |
| IP local | 10.176.119.229 |
| Rol | Portátil temporal — Input Leap cliente |

### HP TouchSmart 600
| Campo | Valor |
|---|---|
| Pantalla | 23" Full HD 1080p táctil |
| CPU | Intel Core 2 Duo |
| OS | ⏳ Pendiente — Linux Mint recomendado |
| Origen | Regalo Salvi — 1 mayo 2026 |
| Rol | Monitor secundario — logs, dashboards |

---

## Upgrades pendientes

| Equipo | Upgrade | Coste aprox | Prioridad |
|---|---|---|---|
| Ordenador Madre | RTX 3060 12GB | ~200-250€ | 🔴 Alta |
| Ordenador Madre | RAM 32GB DDR4 | ~40-50€ | 🟡 Media |
| Acer | RAM 16GB SO-DIMM | ~40-50€ | 🟡 Media |
