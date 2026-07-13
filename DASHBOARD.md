---
tipo: dashboard
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-13 14:15 CEST
ruta: DASHBOARD.md
tags: [dashboard, operativo]
status: vigente
---

# 🧭 DASHBOARD YGGDRASIL-DEW — 2026-07-13

---

## 🚦 Estado general

| Dimensión | Estado |
|---|---|
| Infraestructura | 🟢 OPERATIVA |
| Seguridad | 🟡 TIER-1 RESUELTO · Tier-2 pendiente |
| Documentación | 🟡 EN PROGRESO |
| GitOps | 🟡 PARCIAL — sin IaC en madre-config |
| Bot THDORA | 🟢 HEALTHY |
| SecOps stack | 🟢 HEALTHY |

---

## 🔥 Issues críticos

| # | Título | Prioridad | Estado |
|---|---|---|---|
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007 `.env` malformado THDORA | CRÍTICA | ✅ RESUELTO |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 Token Telegram expuesto | CRÍTICA | ✅ RESUELTO |
| [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | HAL-009 thdora-bot crash loop | CRÍTICA | ✅ RESUELTO |
| [#43](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/43) | IaC docker-compose madre-config | ALTA | 🔴 Pendiente |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | Puerto 21 FTP router abierto | ALTA | 🔴 Pendiente |

---

## 🐳 Contenedores Madre — inventario real

| Contenedor | Proyecto Compose | Ruta `.env` | Estado |
|---|---|---|---|
| `thdora` | `thdora` | `/home/varopc/Projects/thdora/.env` | ✅ healthy |
| `thdora-bot` | `thdora` | `/home/varopc/Projects/thdora/.env` | ✅ healthy |
| `guardian_bot` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | ✅ healthy |
| `log_guardian_bot` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | ✅ healthy |
| `local_tripwire` | `yggdrasil-secops` | `/home/varopc/Projects/yggdrasil-secops/.env` | 🟡 verificar |
| `n8n` | — | — | ✅ Up |

> ⚠️ **Regla crítica:** Para rotar secretos en cualquier proyecto, editar el `.env` de **ese proyecto** (no un `.env` global) y ejecutar `docker compose up -d --force-recreate --no-deps <servicio>`. `docker restart` NO refresca variables de entorno.

---

## 📅 Últimas sesiones

| Fecha | Sesión | Resultado |
|---|---|---|
| 2026-07-13 mañana | Auditoría Gemini + issues WIKI | Issues #51-#58 creados |
| 2026-07-13 tarde | Fix #44 #45 #46 + THDORA recovery | ✅ Stack operativo · inventario real documentado |

---

## 🗺️ Tridente — estado

| Pilar | Repo | Estado |
|---|---|---|
| 🧠 DEW (infra/docs/ops) | `yggdrasil-dew` | ✅ Gobernanza completa |
| 📚 WIKI (conocimiento) | `WIKI---PERSONAL` | ✅ 25 islas · pendiente auditorías |
| 🌱 VIDA | `VIDAPERSONAL` | ✅ Canon migrado · diario activo |

---

_Actualizado: 2026-07-13 14:15 CEST · cierre sesión tarde_
