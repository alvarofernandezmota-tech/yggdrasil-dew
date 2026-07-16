---
tipo: plantilla
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/AGENT-template.md
tags: [plantilla, agent, protocolo, canon]
status: vigente
version: 1
---

# AGENT.md — Plantilla canónica

> **Cómo usar esta plantilla:**  
> Copia este archivo a la raíz del repo como `AGENT.md`.  
> Sustituye todas las variables `{{VARIABLE}}` con valores reales del repo.
> Borra esta cabecera de instrucciones antes de hacer commit.

---

# AGENT.md — {{REPO_NAME}}

> Instrucciones para agentes IA que trabajen en este repo.  
> Leer este archivo **antes de ejecutar cualquier acción**.

---

## Identidad del repo

| Campo | Valor |
|---|---|
| **Nombre** | `{{REPO_NAME}}` |
| **Propósito** | {{REPO_PURPOSE}} |
| **Tipo** | {{REPO_TYPE}} *(canon / operativo / config / wiki / personal)* |
| **Isla wiki** | `wiki/islas/{{ISLA_NAME}}.md` |
| **ADR principal** | {{ADR_PRINCIPAL}} *(ej: ADR-002)* |

---

## Protocolo de inicio (obligatorio)

Antes de cualquier acción, leer en este orden:

1. `docs/sesiones/PROXIMA-SESION.md` — estado y bloques pendientes
2. `CONTEXT.md` — contexto del ecosistema completo
3. `{{ARCHIVO_ESTADO_PRINCIPAL}}` — estado actual de este repo
4. Issues abiertos con label `bloqueado` o `HAL` — bloqueos activos

---

## Reglas de este repo

### ✅ Hacer siempre
- {{REGLA_1}}
- {{REGLA_2}}
- Crear issue en DEW antes de cualquier cambio estructural
- Commit message en formato: `tipo(scope): descripción — closes #N`
- Push antes de declarar tarea completada

### ❌ Nunca hacer
- {{PROHIBICION_1}}
- Hardcodear secretos o tokens en ningún archivo
- Borrar archivos sin issue de respaldo aprobado
- Cambiar nombres de repos/archivos sin actualizar todos los mapas

---

## Estructura del repo

```
{{REPO_NAME}}/
├── {{CARPETA_1}}/     ← {{DESCRIPCION_1}}
├── {{CARPETA_2}}/     ← {{DESCRIPCION_2}}
├── README.md          ← entrada pública
├── AGENT.md           ← este archivo
└── CONTEXT.md         ← contexto ecosistema
```

---

## Conexiones con el ecosistema

| Repo relacionado | Relación |
|---|---|
| `yggdrasil-dew` | Canon, decisiones, issues — siempre |
| `WIKI---PERSONAL` | Isla `{{ISLA_NAME}}.md` — estado y contexto |
| {{REPO_RELACIONADO_1}} | {{RELACION_1}} |

---

## Protocolo de cierre (obligatorio)

Antes de terminar cualquier sesión en este repo:

1. `git status` limpio — nada sin commit
2. `git push` hecho
3. Issues resueltos cerrados en GitHub
4. `PROXIMA-SESION.md` actualizado si hay pendientes
5. Seguir `docs/canon/PROTOCOLO-CIERRE-SESION.md` completo

---

## Contacto y decisiones

- **Dueño:** Álvaro Fernández Mota
- **Dudas:** abrir issue en `yggdrasil-dew` con label `pregunta`
- **Decisiones:** crear ADR en `yggdrasil-dew/docs/adr/`

---

_Instanciado desde: `docs/canon/AGENT-template.md` · yggdrasil-dew_  
_Última actualización: {{FECHA}}_
