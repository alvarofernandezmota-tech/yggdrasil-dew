---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/canon/PROTOCOLO-INTER-REPOS.md
tags: [canon, protocolo, repos, estructura, agentes, alineacion]
status: vigente
version: 1
---

# PROTOCOLO INTER-REPOS — Estructura Obligatoria por Repo

> Este protocolo define qué archivos DEBE tener cada repo del ecosistema,
> cómo se sincronizan entre sí, y cómo los agentes IA deben operar con ellos.
> Es ley. Ningún agente puede saltarse este protocolo.

---

## Estructura mínima obligatoria (TODOS los repos)

Cada repo del ecosistema DEBE tener estos 3 archivos. Sin excepción:

```
cada-repo/
├── README.md          ← qué es el repo, acceso rápido, links clave
├── AGENT.md           ← instrucciones para agentes IA al entrar al repo
└── CONTEXT.md         ← contexto técnico detallado del repo
```

### README.md — Requisitos mínimos
- Qué es este repo (1 párrafo)
- A qué ecosistema pertenece (link a ECOSISTEMA-CANON.md)
- Links a archivos clave internos
- Estado actual (badge o tabla simple)
- Herramientas/stack usado

### AGENT.md — Requisitos mínimos
- Rol del repo en el ecosistema
- Qué PUEDE hacer un agente en este repo
- Qué NO PUEDE hacer sin permiso explícito
- Cómo actualizar los archivos de este repo
- Links a plantillas aplicables
- Issues activos relevantes

### CONTEXT.md — Requisitos mínimos
- Stack técnico completo
- Estructura de directorios explicada
- Credenciales/accesos (sin valores — solo nombres de variables)
- Dependencias con otros repos
- Historial de decisiones clave (o link a ADRs)

---

## Estructura por tipo de repo

### Tipo: Canon/Gobernanza (`yggdrasil-dew`)
```
yggdrasil-dew/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── ESTADO-SISTEMA.md          ← estado vivo — actualizar cada sesión
├── BOOTSTRAP.md               ← (vive en yggdrasil-orquestador, enlazado aqui)
├── docs/
│   ├── canon/                 ← reglas, protocolos, plantillas
│   ├── adr/                   ← decisiones arquitectónicas
│   ├── islas/                 ← estado de las islas wiki
│   ├── runbooks/              ← runbooks operativos
│   └── sesiones/              ← diarios de sesión
└── scripts/                   ← scripts de automatización
```

### Tipo: Conocimiento (`WIKI---PERSONAL`)
```
WIKI---PERSONAL/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── INDEX.md                   ← índice de todas las islas
└── islas/
    └── [tema].md              ← una isla por tema
```

### Tipo: Infra/IaC (`madre-config`, `acer-config`)
```
madre-config/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── .env.template              ← variables obligatorias sin valores
├── docker/                    ← un directorio por servicio
│   └── [servicio]/
│       └── docker-compose.yml
└── docs/
    └── SERVICIOS.md           ← tabla de servicios + estado
```

### Tipo: Personal/Tracking (`yggdrasil-tracking`)
```
yggdrasil-tracking/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── diarios/
│   └── YYYY/
│       └── MM-mes/
│           └── YYYY-MM-DD.md
└── plantillas/
    └── PLANTILLA-DIARIO.md
```

### Tipo: Formación (`yggdrasil-formacion`)
```
yggdrasil-formacion/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── INDEX.md
└── apuntes/
    └── [tema]/
        └── [leccion].md
```

### Tipo: IA local (`ollama-stack`, `local-brain`)
```
ollama-stack/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── .env.template
├── docker-compose.yml
└── docs/
    └── MODELOS.md             ← modelos activos + benchmarks
```

### Tipo: Seguridad (`yggdrasil-secops`)
```
yggdrasil-secops/
├── README.md
├── AGENT.md
├── CONTEXT.md
├── HAL/                       ← alertas y hallazgos de seguridad
└── auditorias/                ← auditorías periódicas
```

### Tipo: Scripts/Automatización (`yggdrasil-scripts`)
```
yggdrasil-scripts/
├── README.md
├── AGENT.md
├── CONTEXT.md
└── scripts/
    ├── [script].sh
    └── README-[script].md     ← doc por script
```

### Tipo: Orquestador (`yggdrasil-orquestador`)
```
yggdrasil-orquestador/
├── README.md
├── AGENT.md
├── CONTEXT.md
└── BOOTSTRAP.md               ← contexto de arranque para agentes IA
```

---

## Reglas de sincronización entre repos

### Regla 1 — Fuente de verdad única
```
Tema                  → Repo propietario
----------------------------------------------
Estado del sistema    → yggdrasil-dew/ESTADO-SISTEMA.md
Arquitectura          → yggdrasil-dew/docs/adr/
Protocolos/reglas     → yggdrasil-dew/docs/canon/
Conocimiento/wiki     → WIKI---PERSONAL/islas/
Diario personal       → yggdrasil-tracking/diarios/
Infra Madre           → madre-config/
IA local              → ollama-stack/
Seguridad             → yggdrasil-secops/
Contexto agentes      → yggdrasil-orquestador/BOOTSTRAP.md
```

### Regla 2 — Un agente NO puede escribir en otro repo sin leer su AGENT.md primero

### Regla 3 — ESTADO-SISTEMA.md se actualiza al inicio Y al cierre de cada sesión

### Regla 4 — Ningún dato sensible en texto plano
Contraseñas, tokens, IPs internas → solo en `.env` (nunca en `.md`)
Excepción: IPs Tailscale de uso común pueden estar en CONTEXT.md

### Regla 5 — Todo cambio estructural necesita ADR previo
Si se mueve un archivo, se fusiona un repo o se cambia arquitectura → ADR en `docs/adr/` antes de ejecutar.

---

## Protocolo de actualización inter-repos para agentes IA

```
1. LEER   yggdrasil-orquestador/BOOTSTRAP.md
2. LEER   yggdrasil-dew/ESTADO-SISTEMA.md
3. LEER   [repo-objetivo]/AGENT.md
4. OPERAR según reglas de AGENT.md + este protocolo
5. COMMIT descriptivo con fase y contexto
6. ACTUALIZAR yggdrasil-dew/ESTADO-SISTEMA.md si hay cambio de fase
7. REGISTRAR en docs/sesiones/ si es sesión larga
```

---

## Checklist de alineación por repo

Usar al auditar cualquier repo:

- [ ] `README.md` existe y tiene estructura mínima
- [ ] `AGENT.md` existe y tiene reglas para agentes IA
- [ ] `CONTEXT.md` existe y tiene stack + dependencias
- [ ] No hay archivos en raíz que pertenezcan a otra estructura
- [ ] No hay secrets en texto plano
- [ ] La estructura de directorios coincide con el tipo de repo
- [ ] El repo está referenciado en `ECOSISTEMA-CANON.md`
- [ ] El repo está en la tabla de `ESTADO-SISTEMA.md`

---

_Creado: 2026-07-18 03:07 CEST · F29 · Perplexity-MCP_
