---
tipo: plantilla
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/CONTEXT-template.md
tags: [plantilla, context, ecosistema, canon]
status: vigente
version: 1
---

# CONTEXT.md — Plantilla canónica

> **Cómo usar esta plantilla:**  
> Copia este archivo a la raíz del repo como `CONTEXT.md`.  
> Sustituye todas las variables `{{VARIABLE}}` con valores reales.  
> Borra esta cabecera de instrucciones antes de hacer commit.

---

# CONTEXT.md — {{REPO_NAME}}

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
| Laptop principal | Theodora | Desarrollo, NixOS/Arch |
| Laptop secundario | Acer | Secundario, Arch/Hyprland |
| Móvil | Thea | iPhone — apps, Tailscale |

---

## Este repo en el ecosistema

**Repo:** `{{REPO_NAME}}`  
**Propósito:** {{REPO_PURPOSE}}  
**Isla wiki:** `wiki/islas/{{ISLA_NAME}}.md`  
**Posición en el Tridente:** {{POSICION_TRIDENTE}} *(DEW / WIKI / TRACKING)*

### Dependencias directas

| Repo | Tipo de dependencia |
|---|---|
| `yggdrasil-dew` | Canon — decisiones y protocolos |
| {{DEP_1}} | {{TIPO_DEP_1}} |
| {{DEP_2}} | {{TIPO_DEP_2}} |

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
| Commits | `tipo(scope): descripción — closes #N` | `feat(wiki): añadir isla orquestador — closes #58` |
| Issues | Prefijo tipo + número | `HAL-009`, `AUDIT-012`, `ADR-013` |
| Ramas | `tipo/descripcion-corta` | `feat/plantillas-canon` |

---

## Cómo funciona el flujo de trabajo

```
Decisión/tarea detectada
    ↓
Issue abierto en yggdrasil-dew
    ↓
Si es decisión arquitectónica → ADR creado
    ↓
Ejecutado (MCP / terminal / manual)
    ↓
Documentado en sesión + isla actualizada
    ↓
Issue cerrado en GitHub
    ↓
ESTADO-SISTEMA.md actualizado
```

---

_Instanciado desde: `docs/canon/CONTEXT-template.md` · yggdrasil-dew_  
_Última actualización: {{FECHA}}_
