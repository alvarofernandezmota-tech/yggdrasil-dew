---
tags: [tipo/meta, estado/activo, infra/seguridad, infra/docker]
fecha: 2026-06-27
revision: por-sesion
---

# 🛡️ PLAN: Seguridad, Despliegue y Monitorización — Batcueva

> Checklist maestro paso a paso. Se ejecuta en orden.
> Documentar cada paso completado con fecha y notas.
> Fuente: MASTER-PENDIENTES + Auditoría Engineering Excellence 2026-06-25

---

## 📍 Cómo usar este documento

- Marcar `[x]` cuando esté completado
- Añadir ✅ fecha + nota breve debajo de cada bloque completado
- **Nunca saltarse una fase** — cada fase es prerequisito de la siguiente
- Si algo falla, documentarlo aquí antes de continuar

---

## 🟠 FASE 0 — Repo y documentación al día

> Objetivo: repo limpio y actualizado antes de tocar nada en producción.

- [x] Inbox vaciada — todos los ficheros migrados a `docs/` o `diarios/`
- [x] `ESTADO-SISTEMA.md` actualizado
- [x] `MASTER-PENDIENTES.md` actualizado
- [x] `docs/infra/red-madre-ap.md` creado — referencia permanente red
- [x] `docs/infra/backup-restic.md` creado
- [x] `docs/infra/observabilidad-stack.md` creado
- [x] `docs/adr/ADR-004-seguridad-privilege-explosion.md` creado
- [ ] `git pull --rebase` en Madre — sincronizar repo local
- [ ] Revisar diarios duplicados del 27-jun y limpiar si procede

> ✅ Completado parcialmente: 27 jun 2026 04:02 CEST

---

## 🔴 FASE 1 — Seguridad de red (OBLIGATORIO antes de levantar dockers)

> Objetivo: Madre endurecida antes de exponer cualquier servicio.
> **No levantar ningún docker hasta completar esta fase.**

### 1.1 — SSH Hardening
- [ ] Aplicar config `setup/servidor/fase1b-seguridad.md`
- [ ] Deshabilitar login por contraseña SSH (`PasswordAuthentication no`)
- [ ] Cambiar puerto SSH del 22 (opcional pero recomendado)
- [ ] Verificar: `ssh -p <puerto> madre` sigue funcionando
- [ ] Documentar: añadir resultado a `ESTADO-SISTEMA.md`

### 1.2 — UFW (Firewall)
- [ ] Ejecutar `setup/servidor/ufw-reglas-completas.sh`
- [ ] Verificar reglas activas: `sudo ufw status verbose`
- [ ] Verificar que SSH sigue accesible tras activar UFW
- [ ] Verificar que MadreAP sigue funcionando (DHCP port 67 permitido)
- [ ] Verificar que Tailscale sigue accesible
- [ ] Documentar: captura de `ufw status` en `ESTADO-SISTEMA.md`

### 1.3 — Tailscale autoarranque
- [ ] `sudo systemctl enable tailscaled`
- [ ] Verificar: reiniciar Madre y comprobar que Tailscale está activo
- [ ] Verificar IP Tailscale: `tailscale ip -4` → debe ser `100.91.112.32`
- [ ] Documentar en `ESTADO-SISTEMA.md`

### 1.4 — Deshabilitar suspensión
- [ ] `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`
- [ ] Verificar: `systemctl status sleep.target` → debe decir `masked`
- [ ] Documentar en `ESTADO-SISTEMA.md`

### 1.5 — Verificación final Fase 1
- [ ] Reboot Madre
- [ ] SSH accesible tras reboot ✅
- [ ] Tailscale activo tras reboot ✅
- [ ] MadreAP activo tras reboot ✅ (ya resuelto 2026-06-27)
- [ ] UFW activo tras reboot ✅
- [ ] `ESTADO-SISTEMA.md` actualizado con estado post-reboot

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🔴 FASE 2 — Script de levantamiento seguro

> Objetivo: nunca levantar dockers sin verificar que la base es segura.

- [ ] Crear `scripts/start-batcueva.sh` con las siguientes comprobaciones:

```bash
#!/bin/bash
# start-batcueva.sh — Levantamiento seguro del stack Batcueva
# Verifica: UFW activo · Tailscale activo · luego levanta dockers

set -euo pipefail

echo "🛡️ Verificando seguridad antes de levantar..."

# UFW
if ! sudo ufw status | grep -q "Status: active"; then
  echo "❌ UFW inactivo. Abortando."; exit 1
fi
echo "✅ UFW activo"

# Tailscale
if ! tailscale status | grep -q "100\."; then
  echo "❌ Tailscale no conectado. Abortando."; exit 1
fi
echo "✅ Tailscale activo"

# MadreAP
if ! systemctl is-active hostapd > /dev/null 2>&1; then
  echo "⚠️ hostapd no activo (MadreAP caído)"
fi

echo "🚀 Levantando stack principal..."
docker compose -f ~/docker/docker-compose.yml up -d

echo "✅ Stack levantado. Ver estado en: http://100.91.112.32:9000"
```

- [ ] Dar permisos: `chmod +x scripts/start-batcueva.sh`
- [ ] Probar en seco: `bash -n scripts/start-batcueva.sh`
- [ ] Ejecutar y verificar que levanta correctamente
- [ ] Subir al repo
- [ ] Documentar en `ESTADO-SISTEMA.md`

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🔴 FASE 3 — Backup Restic

> Objetivo: datos protegidos antes de considerar el sistema en producción real.
> Ver: `docs/infra/backup-restic.md`

- [ ] Crear bucket en Cloudflare R2 o Backblaze B2
- [ ] Crear `scripts/backup/.env` con credenciales (AÑADIR A `.gitignore`)
- [ ] Instalar Restic: `sudo pacman -S restic`
- [ ] Inicializar repo Restic: `restic init`
- [ ] Crear `scripts/backup/run-backup.sh` (ver `docs/infra/backup-restic.md`)
- [ ] Dar permisos: `chmod +x scripts/backup/run-backup.sh`
- [ ] Primer backup manual: `bash scripts/backup/run-backup.sh`
- [ ] Verificar backup: `restic snapshots`
- [ ] **Probar restore**: `restic restore latest --target /tmp/restore-test`
- [ ] Crear systemd timer `batcueva-backup.timer` (backup automático diario)
- [ ] Habilitar timer: `sudo systemctl enable --now batcueva-backup.timer`
- [ ] Documentar en `docs/infra/backup-restic.md` y `ESTADO-SISTEMA.md`

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🔴 FASE 4 — Monitorización completa

> Objetivo: ver el estado del sistema en tiempo real y recibir alertas.
> Ver: `docs/infra/observabilidad-stack.md`

### 4.1 — Grafana dashboard
- [ ] Acceder a Grafana: `http://100.91.112.32:3000`
- [ ] Crear panel: CPU % Madre (fuente: Prometheus + node_exporter)
- [ ] Crear panel: RAM usada
- [ ] Crear panel: Latencia Ollama `/api/generate` p95
- [ ] Crear panel: Temperatura CPU (requiere `node_exporter` con `--collector.hwmon`)
- [ ] Exportar dashboard como JSON y subir a `assets/grafana/`

### 4.2 — Uptime Kuma → THDORA alertas Telegram
- [ ] Acceder Uptime Kuma: `http://100.91.112.32:3002`
- [ ] Configurar notificación tipo Webhook apuntando a `http://thdora:8000/webhook/uptime`
- [ ] Implementar handler `/webhook/uptime` en THDORA-bot
- [ ] Test: parar un contenedor y verificar alerta Telegram llega
- [ ] Documentar en `docs/infra/observabilidad-stack.md`

### 4.3 — Wazuh SIEM (prerequisito primero)
- [ ] `sudo sysctl -w vm.max_map_count=262144`
- [ ] Añadir a `/etc/sysctl.d/99-wazuh.conf` para persistir
- [ ] Levantar Wazuh: `docker compose -f docker/batcueva-siem.yml up -d`
- [ ] Instalar agente Wazuh en Acer
- [ ] Verificar logs llegando al manager

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🟡 FASE 5 — Seguridad avanzada contenedores

> Objetivo: cerrar la brecha de privilege explosion (ver ADR-004).

### 5.1 — Mozilla SOPS (secrets)
- [ ] Instalar SOPS: `sudo pacman -S sops`
- [ ] Generar clave GPG o usar age: `age-keygen -o ~/.config/sops/key.txt`
- [ ] Crear `.sops.yaml` en raíz del repo
- [ ] Migrar todos los `.env` a ficheros cifrados con SOPS
- [ ] Verificar que `.env` en texto plano NO está en el repo
- [ ] Documentar en `docs/adr/ADR-004-seguridad-privilege-explosion.md`

### 5.2 — Rootless Docker
- [ ] Leer documentación: `https://docs.docker.com/engine/security/rootless/`
- [ ] Evaluar impacto en stack actual
- [ ] Implementar en entorno de prueba primero
- [ ] Migrar stack principal si prueba exitosa

### 5.3 — VLANs (red pentest aislada)
- [ ] Definir segmentación: red doméstica / red servicios / red pentest
- [ ] Configurar en router o via `macvlan` Docker
- [ ] Verificar que Kali/Bettercap no tiene acceso a red principal
- [ ] Documentar en `docs/infra/red-madre-ap.md`

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🟢 FASE 6 — Handlers THDORA

> Objetivo: THDORA como panel de control real del sistema.

- [ ] `/estado` — devuelve estado actual de contenedores
- [ ] `/inbox` — lista ficheros pendientes en inbox
- [ ] `/diario` — crea entrada de diario desde Telegram
- [ ] `/pull <modelo>` — lanza `ollama pull` en Madre
- [ ] Webhook Uptime Kuma integrado (ver Fase 4.2)
- [ ] Test completo de todos los handlers

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🟢 FASE 7 — Modelos Ollama y RAG

> Objetivo: stack IA completo y operativo.

- [ ] Pull `llama3.1:8b`
- [ ] Pull `bge-m3`
- [ ] Pull `nomic-embed-text`
- [ ] Crear Modelfile Erika — agente local personalizado
- [ ] Open WebUI → RAG sobre yggdrasil-dew
- [ ] Versionar Modelfile en ADR (ver `docs/infra/observabilidad-stack.md`)

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🟢 FASE 8 — Seguridad Acer (theodora)

> Objetivo: proteger el hardware físico.

- [ ] Extraer número de serie: `sudo dmidecode -t system | grep Serial` → documentar
- [ ] Verificar Computrace: `sudo dmidecode -t bios | grep -i computrace`
- [ ] Instalar Prey: `sudo apt install prey` + cuenta en preyproject.com
- [ ] Configurar Prey: habilitar localización + foto webcam
- [ ] Test: simular "dispositivo perdido" y verificar reporte
- [ ] Documentar en `docs/hardware/acer-theodora.md` (crear si no existe)

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 🔵 FASE 9 — Pentest y OSINT real

> Objetivo: primer uso real del stack ofensivo.
> **Solo iniciar esta fase cuando Fase 1 (seguridad red) esté completa.**

- [ ] Acceder Kali Desktop: `http://100.91.112.32:6901`
- [ ] Primer scan Nmap desde Kali contra objetivo autorizado
- [ ] SpiderFoot: primer scan OSINT
- [ ] Bettercap: configurar `network_mode: host`
- [ ] DefectDojo: importar primer finding

> ✅ Completado: ___ / ___ CEST — notas: ___

---

## 📊 Progreso general

| Fase | Nombre | Estado |
|---|---|---|
| 0 | Repo y documentación | 🟡 Casi completa |
| 1 | Seguridad de red | ⏳ Pendiente |
| 2 | Script levantamiento seguro | ⏳ Pendiente |
| 3 | Backup Restic | ⏳ Pendiente |
| 4 | Monitorización completa | ⏳ Pendiente |
| 5 | Seguridad avanzada contenedores | ⏳ Pendiente |
| 6 | Handlers THDORA | ⏳ Pendiente |
| 7 | Modelos Ollama y RAG | ⏳ Pendiente |
| 8 | Seguridad Acer | ⏳ Pendiente |
| 9 | Pentest y OSINT real | ⏳ Pendiente |

---
_Creado: 27 jun 2026 04:04 CEST — Perplexity vía MCP_
_Ver: [[MASTER-PENDIENTES]] · [[ROADMAP]] · [[ESTADO-SISTEMA]] · [[docs/adr/ADR-004-seguridad-privilege-explosion]]_
