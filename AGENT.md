# AGENT.md — yggdrasil-dew

> **Lee este archivo al inicio de CADA sesión en este repo.**
> Contiene todo lo que necesitas para trabajar aquí sin preguntar.
> Si algo cambió estructuralmente, está aquí reflejado.

---

## 📦 Este repo

| Campo | Valor |
|---|---|
| **Nombre** | `yggdrasil-dew` |
| **Rol** | Canon técnico del ecosistema · decisiones · ADRs · diarios · issues maestras |
| **Visibilidad** | Privado |
| **Isla wiki** | [`wiki/islas/ecosistema.md`](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/ecosistema.md) |
| **Estado actual** | ✅ Activo · fuente de verdad técnica |
| **Stack principal** | Markdown · GitHub Issues · GitHub Actions |

---

## 👤 Usuario

- **Nombre:** Álvaro Fernández Mota
- **Perfil:** Ingeniero de sistemas autodidacta. Stack: Python, Docker, Linux, IA local, OSINT.
- **Filosofía:** Producción primero, perfección después. El ritmo importa más que el sprint.
- **Referencia completa:** [`yggdrasil-wiki/wiki/islas/filosofia.md`](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/filosofia.md)

---

## 🖥️ Ecosistema de máquinas

| Máquina | OS | IP Tailscale | Rol |
|---|---|---|---|
| Madre | Arch Linux (Omarchy) | `100.91.112.32` | Servidor 24/7 · Docker · Batcueva |
| Acer (Thdora) | Arch Linux + Hyprland | `100.86.119.102` | Terminal de trabajo · Dev · OSINT |
| iPhone 11 | iOS | Tailscale activo | Trabajo remoto · Perplexity MCP |

---

## 🗂️ Repos del ecosistema

| Repo | Rol |
|---|---|
| `yggdrasil-wiki` | Wiki central · mapa conceptual · segundo cerebro |
| `yggdrasil-dew` | **Este repo** — canon técnico · decisiones · ADRs · issues |
| `THDORA-PERSONAL` | Bot TOKI · FastAPI · Docker |
| `madre-config` | Configuración Madre · Docker · servicios |
| `ollama-stack` | Ollama + modelos locales |
| `local-brain` | RAG + Qdrant + memoria |
| `yggdrasil-secops` | Seguridad defensiva |
| `osint-stack` | Seguridad ofensiva · OSINT · pentest |
| `yggdrasil-formacion` | Aprendizaje · cursos · Python |
| `yggdrasil-tracking` | Vida personal · diarios · finanzas |
| `investigacion-ia` | PoCs de IA |
| `acer-config` | Configuración Acer · Arch Linux + Hyprland |
| `dev-labs` | Sandbox antes de crear repo propio |
| `thea-ia` | Core Python IA (decisión arquitectural pendiente) |

---

## 🤖 Agentes del ecosistema

| Agente | Fortaleza | MCP GitHub | Cuándo |
|---|---|---|---|
| **Perplexity** | Búsqueda web + gestión repo + docs | ✅ Activo | Principal — todo lo que se pueda |
| **Grok** | Datos frescos · razonamiento lateral | ❌ | Investigación / noticias |
| **Gemini** | Código largo · arquitectura · contexto grande | ❌ | Ficheros grandes · refactors |
| **Claude** | Razonamiento profundo · código calidad | ⏳ posible Cursor | Arquitectura compleja |
| **OpenCode** | Terminal · local | ✅ local | Cuando esté en Thdora |
| **TOKI** | Control móvil desde Telegram | ⏳ en desarrollo | Bot propio |

---

## 🐛 Issues activas DEW — revisar antes de actuar

| Issue | Título | Prioridad |
|---|---|---|
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007: THDORA `.env` malformado | 🔴 Crítico |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008: Token Telegram revocado | 🔴 Crítico |
| [#49](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/49) | Decisión arquitectural `thea-ia` | 🟡 Pendiente |

Ver todas: [yggdrasil-dew issues](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues)

---

## 📐 Estructura del repo

```
yggdrasil-dew/
├── AGENT.md                    ← Este fichero
├── CONTEXT.md                  ← Estado actual (si existe)
├── DASHBOARD.md                ← Panel de control del ecosistema
├── ECOSYSTEM-ARCHITECTURE.md   ← Arquitectura completa
├── ESTADO-SISTEMA.md           ← Estado operativo en tiempo real
├── MASTER-PENDIENTES.md        ← Lista maestra de tareas
├── PLAN-MAESTRO-2026-07.md     ← Plan mensual activo
├── NORMAS.md                   ← Normas del ecosistema
├── CONVENCIONES.md             ← Convenciones de nombrado
├── docs/
│   ├── adr/                    ← Architecture Decision Records
│   ├── sesiones/               ← Diarios de sesión
│   └── hallazgos/              ← Incidentes HAL-XXX
├── protocolo/                  ← Protocolos de sesión
├── inbox/                      ← Entrada de items sin procesar
└── scripts/                    ← Scripts de utilidad
```

---

## 📋 Reglas del sistema — OBLIGATORIAS

1. **Leer antes de actuar** — `AGENT.md` → `ESTADO-SISTEMA.md` → `NORMAS.md`
2. **Todo entra por `inbox/`** — nunca sobrescribir ficheros existentes directamente
3. **Verificar SHA** antes de actualizar cualquier fichero existente
4. **ESTADO-SISTEMA.md** = estado actual — actualizar al inicio Y al cierre de cada sesión
5. **Diario de sesión** = obligatorio al cierre en `docs/sesiones/YYYY-MM-DD.md`
6. **No crear stubs vacíos** — si no hay contenido real, no crear el fichero
7. **ADRs** = cualquier decisión arquitectural importante va en `docs/adr/ADR-XXX.md`
8. **HAL-XXX** = cualquier incidente va en `docs/hallazgos/HAL-XXX.md` + issue
9. **Issues DEW primero** — si existe issue que afecte lo que vas a hacer, menciónala
10. **Isla wiki sincronizada** — si cambia estado operativo, actualizar `wiki/islas/ecosistema.md`

---

## 📐 Protocolo de sesión

```
┌─────────────────────────────────────────────────┐
│             INICIO DE SESIÓN                    │
│  1. Leer AGENT.md (este fichero)                │
│  2. Leer ESTADO-SISTEMA.md                      │
│  3. Revisar issues abiertas en DEW              │
│  4. Leer MASTER-PENDIENTES.md si hay sprint     │
└───────────────────┬─────────────────────────────┘
                    ↓
             Trabajar (inbox/ primero)
                    ↓
┌───────────────────┴─────────────────────────────┐
│             CIERRE DE SESIÓN                    │
│  1. Escribir sesión en docs/sesiones/           │
│  2. Actualizar ESTADO-SISTEMA.md               │
│  3. Actualizar MASTER-PENDIENTES.md             │
│  4. Abrir issue DEW si hay deuda nueva          │
│  5. Actualizar isla wiki si cambió estado       │
│  6. Commit de cierre con mensaje canónico       │
└─────────────────────────────────────────────────┘
```

---

## 🚦 Estado de fases del ecosistema

| Fase | Nombre | Estado |
|---|---|---|
| **0** | Repo limpio + wiki estructurada | ✅ Completado 2026-07-16 |
| **1** | Tailscale + acceso remoto | ✅ Activo |
| **2** | SSH hardening completo | 🔴 Pendiente |
| **3** | Wazuh SIEM | 🟡 En progreso |
| **4** | Suricata IDS | 🟡 En progreso |
| **5** | GitHub Actions automatización | 🔴 No iniciado |
| **6** | Cursor + MCP en Thdora/Acer | 🔴 Pendiente |
| **7** | Ollama agentes + workflows IA | 🔴 No iniciado |

---

_Actualizado: 2026-07-16 · Perplexity-MCP_
