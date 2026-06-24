# Mapa del Repositorio — yggdrasil-dew

> **Actualizado:** 2026-06-25  
> **Estado:** VIVO — actualizar cuando cambie la estructura

---

## Estructura de directorios

```
yggdrasil-dew/
│
├── 📋 RAÍZ (documentos maestros)
│   ├── README.md              ← Entrada principal
│   ├── CONTEXT.md             ← Contexto para IAs
│   ├── ECOSISTEMA.md          ← Mapa del ecosistema completo
│   ├── ESTADO-SISTEMA.md      ← Estado actual del sistema
│   ├── MASTER-PENDIENTES.md   ← Lista maestra de pendientes
│   ├── CONVENCIONES.md        ← Convenciones del proyecto
│   ├── ROADMAP.md             ← Hoja de ruta
│   ├── CHANGELOG.md           ← Cambios por versión
│   ├── AGENT.md               ← Instrucciones para agentes IA
│   ├── HOME.md                ← Dashboard principal
│   └── filosofia.md           ← Filosofía del proyecto
│
├── 📁 inbox/                  ← ZONA DE ATERRIZAJE (limpiar regularmente)
│   └── YYYY-MM-DD-*.md        ← Ficheros sin clasificar
│
├── 📁 docs/                   ← Documentación estructurada
│   ├── adr/                   ← Architecture Decision Records
│   │   ├── ADR-001-*.md
│   │   ├── ADR-002-*.md
│   │   ├── ADR-003-ollama-vs-llamacpp.md
│   │   └── ADR-004-estrategia-ramas.md
│   ├── ias/                   ← Fichas de herramientas IA
│   │   ├── claude-anthropic.md
│   │   ├── perplexity.md
│   │   ├── gemini-google.md
│   │   └── INCIDENTE-CLAUDE-MIENTE-2026-06-25.md
│   ├── decisiones/            ← Decisiones de arquitectura y proyecto
│   ├── setup/                 ← Guías de configuración
│   ├── sistema/               ← Documentación del sistema
│   └── *.md                   ← Docs generales
│
├── 📁 diarios/                ← Diarios de sesión
│   └── YYYY-MM-DD-*.md
│
├── 📁 proyectos/              ← Fichas de proyectos
│   ├── local-brain/
│   ├── thdora/
│   ├── chatbot-control/
│   └── terminal-ia/
│
├── 📁 ollama/                 ← Configuración Ollama
│   └── Modelfiles/
│
├── 📁 osint/                  ← Herramientas y docs OSINT
│
├── 📁 setup/                  ← Scripts de configuración del sistema
│
├── 📁 tools/                  ← Scripts y herramientas del repo
│   ├── inbox-processor.sh     ← Migración automática de inbox
│   └── inbox-stats.sh         ← Estadísticas del inbox
│
├── 📁 agentes/                ← Configuración de agentes
│
├── 📁 formacion/              ← Material de formación
│
├── 📁 templates/              ← Plantillas
│
├── 📁 cli-tools/              ← Herramientas CLI
│
└── 📁 yo/                     ← Información personal
```

---

## Ramas activas

| Rama | Propósito | Estado |
|------|-----------|--------|
| `main` | Estado estable y documentación verificada | ✅ Activa |
| `feat/ollama-stack` | Implementación Ollama + Modelfiles | 🔄 Pendiente crear |
| `feat/litellm-proxy` | LiteLLM + SOPS secrets | 🔄 Pendiente crear |
| `feat/inbox-cleanup` | Migración masiva inbox | 🔄 Pendiente crear |
| `feat/local-brain` | Proyecto Local Brain RAG | 🔄 Pendiente crear |
| `feat/thdora-agent` | Agente Thdora | 🔄 Pendiente crear |

---

## Reglas de la inbox

1. **La inbox NO es almacenamiento** — es una zona de tránsito
2. **Máximo 20 ficheros** antes de procesar
3. **Procesamiento:** `bash tools/inbox-processor.sh` en la Madre
4. **Cada fichero** debe ir a su carpeta definitiva con `git mv`
5. **Tras migración:** commit con mensaje `chore(inbox): migración YYYY-MM-DD`

---

*Mantenido por: Perplexity MCP | Última actualización: 2026-06-25*
