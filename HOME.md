---
tags: [home, indice, navegacion, sistema]
fecha-actualizacion: 2026-06-20
---

# 🌳 Yggdrasil-dew — Segundo Cerebro

> Vault de Álvaro Fernández Mota · Sincronizado con GitHub · Obsidian como interfaz local.
> Todo entra por `inbox/` primero. Nunca sobreescribir directo.

---

## 🔴 Estado ahora mismo

→ Leer siempre: [[CONTEXT]]
→ Reglas del sistema: [[AGENT]]
→ Script para Grok/Claude: [[agentes/AGENT-SCRIPT]]

---

## 📥 Inbox — El baulón

> Primer destino de TODO. Nada va directo a su carpeta.

| Nota | Tags | Destino | Estado |
|---|---|---|---|
| [[inbox/MASTER-PENDIENTES]] | `pendiente` `master` | Permanente — revisión dominical | 🟢 activo |
| [[inbox/PENDIENTE-git-pull-y-obsidian]] | `urgente` `obsidian` | Ejecutar hoy | 🔴 urgente |
| [[inbox/modelos-ollama-hardware-madre]] | `ollama` `hardware` | [[setup/madre]] | 🟡 semana |
| [[inbox/auditoria-ecosistema-2026-06-20]] | `auditoria` | [[diarios/2026-06-20]] | 🟡 semana |
| [[inbox/auditoria-personal-repo]] | `migracion` | Al archivar personal | 🟢 activo |
| [[inbox/thdora-estado-stack]] | `thdora` `docker` | [[proyectos/thdora]] | 🟡 semana |
| [[inbox/madre-servidor-pendientes]] | `madre` `infra` | [[setup/madre]] | 🟡 semana |
| [[inbox/obsidian-configuracion]] | `obsidian` `setup` | [[setup/obsidian]] | 🔴 urgente |
| [[inbox/formacion-python-osint]] | `python` `osint` | [[formacion/python]] | 🟢 activo |
| [[inbox/segundo-cerebro-fix-gordo]] | `migracion` | Cerrar — ya completado | ✅ cerrar |

→ Procedimiento completo: [[inbox/README]]

---

## 🖥️ Setup — Máquinas y herramientas

| Archivo | Tags | Para qué |
|---|---|---|
| [[setup/madre]] | `servidor` `docker` `hardware` | Servidor 24/7 · servicios · upgrades |
| [[setup/varopc]] | `arch` `hyprland` `terminal` | Acer · terminal de trabajo diario |
| [[setup/obsidian]] | `obsidian` `plugins` `ia` | Vault · plugins · IA integrada |
| [[setup/red]] | `red` `tailscale` `ip` | IPs · Tailscale · topología |
| [[setup/hp]] | `hp` `dashboard` `pendiente` | HP TouchSmart · pendiente configurar |

---

## 🤖 Agentes IA

| Archivo | Tags | Para qué |
|---|---|---|
| [[agentes/perplexity]] | `perplexity` `mcp` `principal` | Agente principal · MCP GitHub directo |
| [[agentes/AGENT-SCRIPT]] | `script` `raw` `grok` `claude` | Contexto RAW para Grok/Claude/Gemini |
| [[agentes/grok]] | `grok` `investigacion` | Datos frescos · investigación |
| [[agentes/gemini]] | `gemini` `codigo` | Código largo · arquitectura |
| [[agentes/opencode]] | `opencode` `terminal` | Terminal local |
| [[agentes/toki-bot]] | `toki` `telegram` `bot` | Bot Telegram · control móvil |

---

## 📁 Proyectos

| Archivo | Tags | Estado |
|---|---|---|
| [[proyectos/thdora]] | `thdora` `bot` `produccion` | ✅ v0.22.1 en producción |
| [[proyectos/thdora-docs]] | `thdora` `documentacion` | ⏳ plan milimétrico activo |
| [[proyectos/impresion-3d]] | `impresion-3d` `hardware` | 🔵 investigando |
| [[proyectos/ai-toolkit]] | `ai-toolkit` `ia` | 🔵 bloqueado hasta RTX 3060 |

---

## 📚 Formación

| Archivo | Tags | Estado |
|---|---|---|
| [[formacion/python]] | `python` `curso` `thdora` | ⏳ Módulo 05 SIGUIENTE |
| [[formacion/linux]] | `linux` `arch` `terminal` | ✅ en uso diario |
| [[formacion/sql]] | `sql` `postgresql` `dbeaver` | ⏳ CE02 JOINs |
| [[formacion/osint]] | `osint` `nmap` `seguridad` | 🔴 pendiente arrancar |

---

## 🗓️ Diarios

| Archivo | Tags |
|---|---|
| [[diarios/2026-06-20]] | `diario` `auditoria` `hito` |
| [[diarios/2026-06-12]] | `diario` |
| [[diarios/2026-06-05]] | `diario` |

→ Plantilla: [[templates/diario]]

---

## 👤 Yo

| Archivo | Tags | Para qué |
|---|---|---|
| [[yo/perfil]] | `yo` `stack` `objetivos` | Quién soy · stack · objetivos 2026 |
| [[filosofia]] | `filosofia` `principios` | Los 5 principios del sistema |

---

## 📖 Sistema — Cómo funciona

```
Cualquier cosa nueva
        ↓
    inbox/     ← SIEMPRE aquí primero
        ↓
  se decide dónde va
        ↓
  se mueve al destino (setup/ proyectos/ formacion/ diarios/)
        ↓
  CONTEXT.md se actualiza   ← al final de cada sesión
```

**Regla de oro:** Nada se sobreescribe sin pasar por inbox. Nunca.

---

## 🧭 Flujo diario

```
Mañana   → [[inbox/MASTER-PENDIENTES]] → elegir 3 tareas → [[diarios/YYYY-MM-DD]]
Noche    → Marcar completadas en MASTER-PENDIENTES
Domingo  → Revisar inbox completo → limpiar → reordenar
```

---

_Vault: yggdrasil-dew · GitHub: https://github.com/alvarofernandezmota-tech/yggdrasil-dew_
_Sincronizado con Obsidian · Actualizado: 20 jun 2026 10:12 CEST_
