---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/FASE6-MANTENIMIENTO.md
tags: [fase6, mantenimiento, canon, checklist, cron, bot]
status: activo
---

# Fase 6 — Mantenimiento Continuo

> Este documento es la fuente de verdad de todos los rituales de mantenimiento del ecosistema.
> Es ejecutable por humano, por cron, o por un bot futuro.
> No se improvisa. Se sigue este checklist.

---

## Ritual de cierre de sesión (cada vez que terminas)

```bash
# 0. Abrir DASHBOARD.md y actualizar la columna "Fase actual"
#    de cualquier plan en el que hayas avanzado hoy

# 1. Actualizar estado del sistema
# Editar: ESTADO-SISTEMA.md con servicios actuales y fecha

# 2. Actualizar pendientes
# Editar: MASTER-PENDIENTES.md con tareas abiertas y cerradas hoy

# 3. Crear o actualizar diario del día
# Archivo: docs/diarios/YYYY-MM-DD.md
# Plantilla: docs/canon/PLANTILLA-DIARIO.md
# Regla: un diario = un día, sin sufijos

# 4. Commit de cierre
git add -A
git commit -m "chore(sesion): cierre YYYY-MM-DD"
git push
```

**Criterio de hecho:** `git log --oneline -1` muestra el commit de cierre con la fecha de hoy.

---

## Ritual semanal (lunes)

### Automático (ya configurado)
- [ ] Dependabot abre PRs de dependencias (`.github/dependabot.yml` — lunes 09:00)
- [ ] CI `validate-canon.yml` corre en cada push automáticamente
- [ ] CI `gitleaks.yml` corre en cada push automáticamente

### Manual (tú)
- [ ] Revisar PRs de Dependabot abiertos — aprobar o cerrar
- [ ] Revisar issues abiertos en Dew, secops y WIKI — priorizar o cerrar los que ya no aplican
- [ ] Verificar `MASTER-PENDIENTES.md` — ¿sigue siendo la realidad o hay tareas fantasma?
- [ ] Comprobar `ESTADO-SISTEMA.md` — ¿algún servicio ha cambiado de estado?
- [ ] Revisar `DASHBOARD.md` — ¿alguna fase avanzó esta semana? Actualizar columna.

**Tiempo estimado:** 15 minutos.

---

## Ritual mensual (primer lunes del mes)

- [ ] Revisar `inbox/` — archivos con más de 30 días → promocionar a `docs/` o archivar
- [ ] Revisar borradores en `docs/` marcados `status: borrador` con más de 30 días → publicar o eliminar
- [ ] Verificar que todos los repos en `NORMAS.md` siguen existiendo y con la visibilidad correcta
- [ ] Revisar ADRs: ¿alguna decisión ha cambiado? Si es así, crear nuevo ADR (no editar el existente)
- [ ] Verificar que `ownership-matrix.md` refleja la realidad actual de servicios y responsables
- [ ] Revisar HALs abiertos en `INDICE-HALLAZGOS.md` — ¿alguno puede cerrarse?

**Tiempo estimado:** 30 minutos.

---

## Ritual trimestral (primer lunes de enero, abril, julio, octubre)

- [ ] Revisar `STRIDE-risk-register.md` — añadir amenazas nuevas si el ecosistema ha cambiado
- [ ] Rotar tokens GitHub PAT si tienen más de 90 días (Settings → Developer settings → PAT)
- [ ] Rotar token Telegram Bot si tiene más de 90 días (BotFather → /revoke)
- [ ] Verificar que Ollama :11434 NO está expuesto: `nmap -p 11434 <IP-publica>`
- [ ] Verificar que UFW está activo en Madre: `sudo ufw status verbose`
- [ ] Verificar que el puerto 21 sigue cerrado en el router
- [ ] Revisar `TESTING-STRATEGY.md` — ¿hay scripts nuevos que necesiten tests?
- [ ] Revisar `RUNBOOKS.md` — ¿alguna incidencia nueva merece su propio runbook?
- [ ] Actualizar `docs/diarios/YYYY-MM-DD.md` con resumen de la revisión trimestral

**Tiempo estimado:** 60 minutos.

---

## Triggers adicionales (cuando pasa algo)

| Evento | Acción |
|---|---|
| Nuevo servicio en Madre | Actualizar `ownership-matrix.md` + `ESTADO-SISTEMA.md` + `STRIDE` |
| Nuevo repo público | Verificar que CI de secretos está activo antes de hacer público |
| Nuevo agente IA con acceso MCP | Actualizar `ADR-004-agentes-mcp.md` + `STRIDE` |
| Nueva IP asignada a Madre | Actualizar `ECOSYSTEM-ARCHITECTURE.md` + verificar UFW |
| Incidencia de seguridad | Abrir HAL en `yggdrasil-secops` con ID del `INDICE-HALLAZGOS.md` de Dew |
| Secreto expuesto | Ejecutar `RB-006` de `RUNBOOKS.md` inmediatamente |
| Fallo recurrente de un servicio | Crear o actualizar el runbook correspondiente en `RUNBOOKS.md` |

---

## Automatización futura (bot / cron)

Esta sección documenta lo que eventualmente puede ejecutar un bot o un cron en Madre
sin intervención manual. Se implementa con Ansible o con scripts propios.

### Ya automático hoy
- CI GitHub Actions en cada push (secretos, IPs, frontmatter, gitleaks)
- Dependabot los lunes (PRs de dependencias)

### Automatizable en Madre (cron)

```bash
# Lunes 08:00 — verificación de seguridad básica
0 8 * * 1 /home/alvaro/scripts/weekly-health-check.sh
```

Contenido del script `weekly-health-check.sh` (a crear):

```bash
#!/bin/bash
# weekly-health-check.sh

LOG="/home/alvaro/logs/health-$(date +%Y-%m-%d).log"

echo "=== Health Check $(date) ===" >> "$LOG"

ufw status | grep -q 'Status: active' && echo 'UFW: OK' >> "$LOG" || echo 'UFW: ALERTA - inactivo' >> "$LOG"

docker ps --format '{{.Names}}:{{.Status}}' >> "$LOG"

df -h / | tail -1 >> "$LOG"

grep -q 'ALERTA' "$LOG" && curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" \
  -d chat_id="$CHAT_ID" \
  -d text="⚠️ Health check con alertas: $(cat $LOG | grep ALERTA)" > /dev/null

echo 'Health check completado' >> "$LOG"
```

### Automatizable a futuro (Thdora o nuevo bot)
- Ejecutar el ritual de cierre de sesión vía comando Telegram
- Notificar cuando hay PRs de Dependabot sin revisar >3 días
- Recordatorio semanal de los lunes con el checklist
- Verificación mensual automática de expiración de tokens

---

## Regla de oro

> **El ecosistema se mantiene solo si los rituales son hábito.**
> Un ritual no ejecutado durante más de un mes es deuda técnica.
> Este documento es la única fuente de verdad sobre cómo se mantiene el sistema.

---

_Creado: 2026-07-06 · Fase 6 Plan de Alineación · Revisión: trimestral_
