---
tipo: protocolo
version: 1
author: Alvaro Fernandez Mota
creado: 2026-07-18
ruta: docs/canon/protocolos/PROTOCOLO-NUEVO-REPO.md
tags: [protocolo, repo, nuevo, canon]
status: vigente
---

# PROTOCOLO — Añadir un nuevo repo al ecosistema

> Ejecutar cada vez que se crea o adopta un nuevo repo en el ecosistema Yggdrasil.
> Sin este protocolo, el repo queda huérfano y rompe el canon.

---

## Pasos obligatorios

### Paso 1 — Crear estructura mínima en el repo

```bash
# En el repo nuevo
touch README.md
touch AGENT.md
touch CONTEXT.md
touch .gitignore
```

### Paso 2 — Completar AGENT.md

Usar plantilla en `docs/canon/PLANTILLA-AGENT.md`:

```markdown
---
rol: [rol del agente en este repo]
repo: [nombre del repo]
ecosistema: yggdrasil
actualizado: YYYY-MM-DD
---

# AGENT — [nombre repo]

## Identidad
[Qué hace este repo]

## Reglas
- No inventar
- Leer CONTEXT.md antes de actuar
- DEW manda en conflictos

## Repos relacionados
- yggdrasil-dew (canon)
- [otros repos con los que conecta]

## Rutas clave
- [archivos más importantes del repo]
```

### Paso 3 — Completar CONTEXT.md

```markdown
---
actualizado: YYYY-MM-DD
---

# CONTEXT — [nombre repo]

## Estado actual
[Descripción honesta del estado]

## Pendientes
- [ ] [tareas abiertas]

## Última sesión
[fecha] — [qué se hizo]
```

### Paso 4 — Actualizar DEW

- [ ] Añadir repo a tabla de `ESTADO-SISTEMA.md`
- [ ] Añadir repo a `MASTER-PENDIENTES.md` si tiene tareas
- [ ] Añadir repo a `docs/MAPA-CONEXIONES.md`
- [ ] Crear o actualizar isla en `WIKI---PERSONAL` si el repo merece isla propia

### Paso 5 — Añadir a BOOTSTRAP.md del orquestador

- [ ] Añadir a tabla de repos activos en `yggdrasil-orquestador/BOOTSTRAP.md`

### Paso 6 — Verificar .gitignore

```gitignore
# Mínimo obligatorio
.env
.env.*
!.env.template
*.secret
*.key
*.pem
node_modules/
__pycache__/
.DS_Store
*.log
```

---

## Criterio de aceptación

El repo está correctamente integrado cuando:
- [ ] Tiene README + AGENT.md + CONTEXT.md
- [ ] Aparece en ESTADO-SISTEMA.md
- [ ] Aparece en MAPA-CONEXIONES.md
- [ ] Aparece en BOOTSTRAP.md del orquestador
- [ ] .gitignore cubre secretos

---

_Creado: 2026-07-18 · Perplexity-MCP_
