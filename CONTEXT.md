---
tipo: context
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: CONTEXT.md
tags: [context, ecosistema, canon, dew]
status: vigente
version: 1
---

# CONTEXT.md — yggdrasil-dew

> Contexto del ecosistema Yggdrasil para agentes IA.  
> Leer junto con `AGENT.md` al inicio de cada sesión.

---

## El ecosistema Yggdrasil

Yggdrasil es el sistema operativo personal de Álvaro Fernández Mota.  
No es solo código — es la infraestructura completa de vida técnica y personal.

### Repos canónicos (nombres exactos — no usar aliases)

| Repo | Propósito | Tipo |
|---|---|---|
| `yggdrasil-dew` | Canon técnico, ADRs, decisiones, issues, protocolos | Canon |
| `WIKI---PERSONAL` | Conocimiento estático, mapas, islas del ecosistema | Wiki |
| `yggdrasil-tracking` | Vida personal, diarios, metas, hábitos | Personal |
| `yggdrasil-formacion` | Formación técnica, apuntes, recursos | Formación |
| `madre-config` | IaC de Madre, docker-compose, scripts | Config |
| `THDORA-PERSONAL` | Bot Telegram + agente IA personal | Operativo |
| `yggdrasil-secops` | Seguridad, SecOps, blue team | Operativo |
| `local-brain` | RAG local, Qdrant, embeddings | IA |
| `acer-config` | Dotfiles Arch/Hyprland del laptop secundario | Config |
| `dev-labs` | Sandbox, experimentos, prototipos | Labs |
| `yggdrasil-scripts` | Scripts bash, GitHub Actions, CI | Scripts |

### Hardware del ecosistema

| Nodo | Nombre | Rol |
|---|---|---|
| Servidor principal | Madre | Docker, servicios, RAG, n8n |
| Laptop principal | Theodora | Desarrollo, NixOS |
| Laptop secundario | Acer | Secundario, Arch/Hyprland |
| Móvil | Thea | iPhone — apps, Tailscale |

---

## Este repo en el ecosistema

**Repo:** `yggdrasil-dew`  
**Propósito:** Canon técnico — es el punto de entrada obligatorio de toda sesión  
**Isla wiki:** `WIKI---PERSONAL/wiki/islas/dew.md`  
**Posición en el Tridente:** DEW (vértice de decisión y estado)

### Dependencias directas

| Repo | Tipo de dependencia |
|---|---|
| `WIKI---PERSONAL` | Isla `dew.md` y mapas globales |
| Todos los repos | DEW contiene los protocolos que todos siguen |

---

## Principios del ecosistema

1. **Soberanía digital** — todo en repos propios, nada en SaaS sin alternativa
2. **Transparencia interna** — toda decisión tiene ADR, toda tarea tiene issue
3. **Un solo punto de verdad** — DEW es el canon, wiki es el mapa
4. **Sistemas que perduran** — si no está documentado, no existe
5. **Automatizar lo repetible** — lo manual se ejecuta una vez y se automatiza
6. **Deuda visible** — toda deuda técnica tiene issue abierto en DEW

---

## Convenciones de nombres

| Tipo | Formato | Ejemplo |
|---|---|---|
| Archivos markdown | `kebab-case.md` o `MAYUSCULAS.md` | `protocolo-inicio.md` / `AGENT.md` |
| Commits | `tipo(scope): descripción — closes #N` | `feat(wiki): isla orquestador — closes #58` |
| Issues prefijo | Tipo + número | `HAL-009`, `AUDIT-012`, `ADR-013` |
| Ramas | `tipo/descripcion-corta` | `feat/plantillas-canon` |

---

## Flujo de trabajo canónico

```
Decisión/tarea detectada
    ↓
Issue abierto en yggdrasil-dew
    ↓
Si es decisión arquitectónica → ADR creado (docs/adr/)
    ↓
Ejecutado (MCP / terminal / manual)
    ↓
Documentado en docs/sesiones/YYYY-MM-DD-*-sesion.md
    ↓
Isla wiki actualizada si aplica
    ↓
Issue cerrado en GitHub
    ↓
docs/canon/ESTADO-SISTEMA.md actualizado
```

---

_Instanciado desde: `docs/canon/CONTEXT-template.md`_  
_Última actualización: 2026-07-16_
