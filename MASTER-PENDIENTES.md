---
tipo: backlog
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-05 20:55 CEST
ruta: MASTER-PENDIENTES.md
tags: [backlog, pendientes, tareas]
status: vigente
---

# 📋 MASTER PENDIENTES

> Backlog priorizado del ecosistema Yggdrasil.
> Actualizar al inicio y cierre de cada sesión.

---

## 🔴 URGENTE

- [ ] **HAL-001** Desactivar FTP puerto 21 en router Digi → `http://192.168.1.1`
- [ ] SSH hardening Madre: `PasswordAuthentication no` + `PermitRootLogin no`
- [ ] Fixear `log_guardian_bot` y `yggdrasil_watchdog` unhealthy en Madre
- [ ] Hacer `WIKI---PERSONAL` privada (GitHub Settings → Danger Zone)
- [ ] Hacer `VIDAPERSONAL` privada (GitHub Settings → Danger Zone)

---

## 🟡 ESTA SEMANA

- [ ] Transferir issues WIKI → repos correctos (terminal Madre, `cd ~/WIKI---PERSONAL`)
  ```bash
  gh issue transfer 32 alvarofernandezmota-tech/yggdrasil-dew
  gh issue transfer 29 alvarofernandezmota-tech/yggdrasil-dew
  ```
- [ ] Cerrar issue #4 dew (diary/ vs diarios/ — ya resuelto)
- [ ] Rellenar fichas de islas en `WIKI---PERSONAL/wiki/islas/`
- [ ] Crear perfil profesional README en `alvarofernandezmota-tech`
- [ ] Instalar Obsidian Git plugin + configurar con parámetros de CONVENCIONES.md §5.5
- [ ] Configurar Obsidian: `Settings → Files & Links → Default location for new attachments: assets/`
- [ ] Archivar repos obsoletos: `thea-ia`, `image-calculator`, `impresion-3d`

---

## 🟢 PRÓXIMAMENTE

- [ ] MCP Server de Madre (`mcp_server.py` + tools MVP)
- [ ] Health Agent despliegue en Madre
- [ ] Observabilidad OTel (Collector + Loki + Alertmanager)
- [ ] Guardrails en código (dry-run, circuit breakers, audit log)
- [ ] Wazuh homelab setup
- [ ] Suricata IDS de red
- [ ] THDORA Fase 10 multi-usuario (bloqueador F10)
- [ ] Cursor + MCP en Acer (Fase 6)
- [ ] Estruturar `acer-config`, `ollama-stack`, `local-brain`, `investigacion-ia`
- [ ] a-Shell + Tailscale iOS en iPhone

---

_Actualizado: 2026-07-05 20:55 CEST · Perplexity-MCP_
