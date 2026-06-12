# CONTEXT.md — Estado Actual

> Snapshot vivo del sistema. **Actualizar cada domingo** (o cuando cambie algo importante).
> Última actualización: 12 junio 2026 — viernes tarde

---

## 📍 Ahora mismo

- `personal-v2` creado, estructurado y funcionando como base de datos personal en Markdown
- Arquitectura del home server diseñada y documentada por completo
- Flujo Gemini ↔ Perplexity operativo
- Filosofía técnica escrita y fijada como ley del sistema
- Roadmap del servidor definido en 3 fases
- **Pendiente ejecutar:** instalar Tailscale en Madre y Acer (Fase 1)

---

## 🎯 Objetivos activos — junio 2026

- [ ] **Fase 1 servidor:** Tailscale instalado + SSH entre máquinas + Input Leap con systemd
- [ ] **Fase 2 servidor:** TLS + fail2ban + Headscale self-hosted
- [ ] **Fase 3 servicios:** Ollama + PostgreSQL + THDORA migrado + Pi-hole
- [ ] `personal-v2` poblado con todo el contexto base (en progreso ✅)
- [ ] `yo/perfil.md` y `yo/objetivos-2026.md` revisados y completos

---

## 🛠️ Proyectos activos

| Proyecto | Estado | Próximo paso | Archivo |
|---|---|---|---|
| **Home Server** | 🔄 Construyendo | Instalar Tailscale en Madre + Acer | `setup/servidor/tailscale.md` |
| **THDORA** | ⏳ Pendiente migrar | Esperar a que servidor esté en Fase 3 | `proyectos/thdora.md` |
| **personal-v2** | 🔄 Activo | Poblar `yo/` y actualizar diarios | — |
| **Impresión 3D** | ⏸️ Pausado | — | `proyectos/impresion-3d.md` |
| **Portfolio web** | ⏸️ Pausado | — | `proyectos/portfolio-web.md` |

---

## 📚 Formación activa

| Área | Estado | Notas |
|---|---|---|
| **Linux / Arch / Omarchy** | 🔄 Activo | systemd, Wayland, Hyprland |
| **Infraestructura** | 🔄 Activo | Docker, UFW, Zero Trust, Tailscale |
| **SQL / PostgreSQL** | 🔄 Activo | Migración DB, optimización |
| **Python** | 🔄 Activo | Scripts, bots, automatización |
| **IA local / Ollama** | ⏳ Próximo | Cuando servidor esté en Fase 3 |

---

## 💻 Setup actual

| Máquina | Rol | Estado |
|---|---|---|
| **Madre** (i5-8400, 16GB, GTX 1060) | Workstation principal | ✅ Omarchy activo |
| **Acer** (Ryzen 5 5500U, 8GB) | Servidor 24/7 | ✅ Arch activo · IP: 10.176.119.171 |
| **MacBook** | Portátil cliente | ✅ IP: 10.176.119.229 |
| **HP TouchSmart** | Monitor secundario | ⏳ Pendiente OS |

→ Detalle completo: `setup/README.md` + `setup/servidor/README.md`

---

## 🤖 Ecosistema IA

| Agente | Rol | Estado |
|---|---|---|
| **Perplexity** | MCP GitHub — documenta, sube, audita | ✅ Activo |
| **Gemini** | Diseño técnico, voz, visual | ✅ Activo |
| **Ollama** (local) | LLM privado en Madre (GTX 1060) | ⏳ Fase 3 |

→ Ver roles completos: `agentes/`

---

## 📅 Semana 24 — 9–15 junio 2026

- **Hoy (viernes 12):** diseño completo del servidor + estructura personal-v2 + filosofía fijada
- **Fin de semana:** instalar Tailscale + probar SSH entre máquinas
- **Objetivo semana que viene:** Input Leap con systemd funcionando

→ Ver historial completo: `diarios/2026/2026-06-12.md`

---

_Frecuencia de actualización: semanal (domingo) · o cuando cambie el estado de un proyecto importante_
