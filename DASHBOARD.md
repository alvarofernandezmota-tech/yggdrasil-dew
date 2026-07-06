---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: DASHBOARD.md
tags: [dashboard, planes, estado, navegacion]
status: vigente
---

# 👁️ Dashboard — Ecosistema Yggdrasil

> Una página. Todo el contexto. Actualizar la columna `Fase actual` al avanzar.

---

## Planes activos

| Plan | Qué resuelve | Fase actual | Próxima acción |
|---|---|---|---|
| [PLAN-ALINEACION-2026-07.md](./PLAN-ALINEACION-2026-07.md) | Estructura Dew + WIKI | ✅ **COMPLETO** | — |
| [PLAN-ALINEACION-SECOPS-2026-07.md](./PLAN-ALINEACION-SECOPS-2026-07.md) | Estructura secops + colisión IDs | 🔴 Fase 0 pendiente | Poner secops en **privado** |
| [PLAN-DEUDA-TECNICA-2026-07.md](./PLAN-DEUDA-TECNICA-2026-07.md) | Token, puertos, logging, tests | 🔴 Tier 1+2 urgentes | Rotar **token Telegram** |
| [docs/canon/FASE6-MANTENIMIENTO.md](./docs/canon/FASE6-MANTENIMIENTO.md) | Mantenimiento permanente | ♾️ Activo siempre | Ritual cierre de sesión |

---

## Hoy sí o sí (antes de cualquier otra cosa)

- [ ] **Rotar token Telegram THDORA** — BotFather → Revoke → nuevo token en `.env` de Madre — [Tier 1](./PLAN-DEUDA-TECNICA-2026-07.md)
- [ ] **`yggdrasil-secops` → privado** — GitHub Settings → Danger Zone — [Fase 0 secops](./PLAN-ALINEACION-SECOPS-2026-07.md)

---

## Esta semana

- [ ] Cerrar SSH puerto 22 público en Madre (Tailscale ya funciona) — [Tier 2](./PLAN-DEUDA-TECNICA-2026-07.md)
- [ ] Cerrar puerto 21 FTP en router Digi `http://192.168.1.1` — [Tier 2](./PLAN-DEUDA-TECNICA-2026-07.md)
- [ ] Verificar Ollama :11434: `nmap -p 11434 <IP-publica>` desde datos móviles — [Tier 2](./PLAN-DEUDA-TECNICA-2026-07.md)
- [ ] Fase 0 secops: ampliar CI a `.env*`/`.yml`/`.sh` + detección IP pública — [Plan secops](./PLAN-ALINEACION-SECOPS-2026-07.md)
- [ ] Fase 1 secops: resolver colisión de IDs HAL — [Plan secops](./PLAN-ALINEACION-SECOPS-2026-07.md)

---

## Sin prisa (próximas sesiones largas)

- Fase 2 secops: purga duplicados internos (6 archivos del mismo día, arquitectura fragmentada…)
- Fase 3 secops: alinear gobernanza con Dew
- Fase 4 secops: automatización cruzada (cross-repo-check)
- Tier 3: logging estructurado Thdora
- Tier 4: BATS testing scripts críticos
- Tier 5: Ansible en Acer para Madre

---

## Herramientas de verificación

| Herramienta | Qué hace | Cómo ejecutar |
|---|---|---|
| `check-ecosistema.py` | Detecta colisiones de IDs HAL/ADR entre repos | `python3 check-ecosistema.py` en Madre |
| CI `validate-canon.yml` | Secretos, IPs, emails, frontmatter | Automático en cada push |
| CI `gitleaks.yml` | Secretos en historial | Automático en cada push |
| `docs/canon/RUNBOOKS.md` | Procedimientos ante incidencias conocidas | Consultar antes de improvisar |
| `docs/seguridad/STRIDE-risk-register.md` | Registro de amenazas activas | Revisar trimestralmente |

---

## Regla de oro

> Si no está en este dashboard o en uno de los 3 planes, no existe como tarea.
> Si surge algo nuevo → añadir aquí primero, luego al plan correspondiente.
> No abrir un cuarto plan sin cerrar los que ya existen.

---

_Actualizado: 2026-07-06 21:56 CEST · Perplexity-MCP_
