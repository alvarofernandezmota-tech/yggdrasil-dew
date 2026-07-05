---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-05 21:13 CEST
ruta: docs/canon/DICCIONARIO.md
tags: [canon, diccionario, vocabulario, ecosistema]
status: vigente
---

# 📖 DICCIONARIO DEL ECOSISTEMA YGGDRASIL

> Fuente de verdad del vocabulario técnico del ecosistema.
> Si un término no está aquí, no existe a efectos de arquitectura.

---

## Núcleo del sistema

- **Yggdrasil-Dew:** Cerebro técnico del ecosistema. Contiene arquitectura, backlog, diarios, convenciones y estado del sistema.
- **Madre:** Servidor físico donde se ejecutan agentes, workflows, contenedores y servicios del ecosistema. Torre ASUS, Arch Linux, GTX 1060, Tailscale `100.91.112.32`.
- **WIKI---PERSONAL:** Mapa conceptual y cartografía personal. Aquí viven las islas, relaciones conceptuales y contexto personal.
- **Islas:** Unidades conceptuales en WIKI que representan áreas de vida, técnica, meta o infraestructura.
- **VIDAPERSONAL:** Repo destinado a la vida personal (hábitos, proyectos vitales, narrativa).

---

## Repos y su rol

| Repo | Capa | Rol |
|---|---|---|
| `yggdrasil-dew` | 🧠 Cerebro | Arquitectura, agentes, workflows, diarios, backlog, convenciones |
| `WIKI---PERSONAL` | 🗺️ Conocimiento | Islas, relaciones conceptuales, hardware como mapa |
| `madre-config` | 🖥️ Infra | Config, scripts y docs operativos de Madre |
| `yggdrasil-secops` | 🛡️ Seguridad | Hallazgos HAL-XXX, auditorías, planes de remediación |
| `formacion-tech` | 📚 Formación | Apuntes, rutas de aprendizaje, formación técnica |
| `VIDAPERSONAL` | 🌱 Vida | Proyectos personales, hábitos, metas, narrativa vital |
| `ollama-stack` | 🤖 IA Local | Ollama, modelos LLM, Open WebUI |
| `local-brain` | 🤖 IA Local | RAG, Qdrant, embeddings, memoria vectorial |
| `THDORA-PERSONAL` | 🦾 Thdora | Bot Telegram personal, FastAPI, IA |
| `acer-config` | 🖥️ Infra | Dotfiles Acer: Hyprland, zsh, Neovim |
| `investigacion-ia` | 📚 Formación | PoCs, experimentos, I+D IA |
| `osint-stack` | 🛡️ Seguridad | OSINT ofensivo, Spiderfoot, red team |
| `dev-labs` | 🧪 Labs | Sandbox, prototipos, experimentos |

---

## Agentes

- **Orquestador Maestro:** Coordina agentes y workflows. Decide qué se ejecuta, cuándo y en qué orden.
- **Clasificador Maestro:** Decide el destino de archivos, sesiones, issues y eventos (Dew, WIKI, Madre, SecOps, formación).
- **Guardian Maestro:** Vigila la coherencia del ecosistema, dispara auditorías y corrige desviaciones.
- **Observadores:** Detectan cambios en repos, carpetas, servicios y estado del sistema.
- **Escaladores:** Elevan tareas a agentes superiores cuando exceden cierto umbral de complejidad o impacto.
- **Investigadores:** Analizan contenido (logs, docs, código) y generan informes o hallazgos.
- **Mejoradores:** Refactorizan, limpian y optimizan contenido técnico (scripts, docs, estructuras).

---

## Workflows

- **Auditoría:** Revisan estructura, seguridad, estado de servicios y coherencia entre repos.
- **Sincronización:** Mantienen alineados Dew, WIKI, Madre, SecOps, formación y VIDAPERSONAL.
- **Limpieza:** Eliminan duplicados, ruido, basura y artefactos obsoletos.
- **Captura:** Reciben nueva información (inbox) y la convierten en diarios, issues o docs.
- **Documentación:** Transforman sesiones y hallazgos en documentación estable.

---

## Estructura y conceptos clave

- **Inbox:** Entrada bruta del ecosistema. Nunca es fuente de verdad — siempre se procesa y distribuye.
- **Diarios:** Registro técnico de sesiones, decisiones y cambios. Viven en `docs/diarios/` en Dew.
- **Backlog:** Lista priorizada de tareas. Vive en Dew como issues y `MASTER-PENDIENTES.md`.
- **Convenciones:** Reglas de estilo, rutas, nombres y procesos. Viven en `CONVENCIONES.md`.
- **Canon:** Conjunto de documentos que definen la arquitectura, vocabulario y reglas del ecosistema. Viven en `docs/canon/`.
- **Estado del sistema:** Fotografía actual de servicios, agentes, repos y salud. Vive en `ESTADO-SISTEMA.md`.

---

## Infraestructura

- **MCP:** Protocolo y servidor de agentes conectados. Madre como host objetivo.
- **Galatea:** Plantilla universal para definir agentes de forma consistente.
- **Logs:** Registros de auditorías, workflows y servicios. Fuente de verdad para investigación y seguridad.
- **Servicios Madre:** Contenedores y procesos corriendo en Madre (Ollama, Open WebUI, Qdrant, THDORA, Portainer, Grafana, Nextcloud, Pi-hole…).
- **Tailscale:** Red privada que conecta Madre (`100.91.112.32`) y Acer (`100.86.119.102`).

---

## Seguridad

- **SecOps:** Capa de seguridad del ecosistema. Define amenazas, auditorías y planes de remediación.
- **Auditorías de seguridad:** Workflows que revisan puertos, servicios, credenciales y configuración.
- **Hallazgos (HAL-XXX):** Resultados de auditorías que requieren acción. Issues en `yggdrasil-secops`.
- **HAL-001:** Puerto 21 FTP abierto en router Digi — pendiente remediación urgente.

---

## Formación y conocimiento

- **formacion-tech:** Espacio para aprender, tomar apuntes y consolidar conocimiento técnico orientado al ecosistema.
- **Isla conocimiento:** Isla en WIKI que conecta Dew, formacion-tech y VIDAPERSONAL como modelo mental del aprendizaje.

---

## Reglas de oro

**Regla Dew vs WIKI:**
> ¿Me ayuda a pensar? → WIKI.
> ¿Hace funcionar el sistema? → Dew.

**Regla de islas:**
> Las islas son mapas conceptuales. Los procedimientos técnicos viven en los repos (Dew, Madre, SecOps, formación).

**Regla de fuente de verdad:**
> Cada concepto tiene un único lugar canónico. Los demás son redirects o vistas.

**Regla de agentes:**
> Los agentes no se crean hasta que el mapa del ecosistema está limpio y todos los puntos bien enlazados.

---

_Creado: 2026-07-05 21:13 CEST · Perplexity-MCP_
