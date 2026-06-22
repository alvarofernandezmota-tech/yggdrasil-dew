---
tags: [setup, dashboard, monitorizacion, ecosistema]
fecha-actualizacion: 2026-06-22
---

# 🖥️ Dashboard Ecosistema — Visión General

> Una terminal donde ver TODO el ecosistema de un vistazo.
> Objetivo: saber en 5 segundos si algo falla.

---

## 🎯 Qué queremos ver en el dashboard

```
┌────────────────────────────────────────────────────────────────┐
│  🖥️  MADRE          💻  ACER           📱  HOTSPOT        │
│  CPU  RAM  DISK    CPU  RAM  DISK    ↗️ Subida        │
│  THDORA ✅/❌        WiFi ✅/❌         ↘️ Bajada        │
│  Ollama ✅/❌        Tailscale ✅/❌    Dispositivos  │
│  Grafana ✅/❌       SSH ✅/❌          Batería %      │
│  Docker N contend. fail2ban ✅/❌                   │
└────────────────────────────────────────────────────────────────┘
```

---

## 📦 Dispositivos del ecosistema

| Dispositivo | Rol | IP Tailscale | IP Local |
|---|---|---|---|
| **Madre** | Servidor principal 24/7 | `100.91.112.32` | `10.134.31.228` |
| **varopc** | PC principal (Arch+Hyprland) | — | — |
| **Acer** | Backup + servidor ligero | `100.86.119.102` | `10.176.119.171` |
| **Hotspot (Samsung)** | Punto de entrada red | — | `192.168.43.1` |
| **iPhone 11** | Móvil personal | — | DHCP |

---

## 🛠️ Tecnología del dashboard

| Capa | Herramienta | Dónde |
|---|---|---|
| Métricas servidor | **Grafana** (ya instalado en Madre) | `100.91.112.32:3000` |
| Métricas sistema | **Prometheus** (ya instalado) | `100.91.112.32:9090` |
| Terminal visual | **btop** (reemplaza htop) | Local en cada máquina |
| Dashboard terminal | **Script bash** propio | Cualquier máquina |
| Waybar widget | **Script bash** | varopc (barra Hyprland) |
| Uptime servicios | **Uptime Kuma** (pendiente) | Madre Docker |

---

## ⏳ Pendiente implementar

- [ ] Script `ecocheck.sh` — revisa todo el ecosistema en 1 comando
- [ ] Instalar btop en Madre + Acer
- [ ] Configurar Grafana con dashboards THDORA + sistema
- [ ] Uptime Kuma en Docker (Madre)
- [ ] Widget Waybar con estado Madre (CPU/RAM/THDORA)

---

_Ver también: [[setup/madre]] · [[setup/acer]] · [[setup/hotspot]] · [[setup/iphone]] · [[HOME]]_
