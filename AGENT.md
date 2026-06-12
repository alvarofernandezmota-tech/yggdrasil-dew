# AGENT.md — Instrucciones para el Agente

> **Este es el primer archivo que debes leer.** Todo lo demás se navega desde aquí.
> Última actualización: 12 junio 2026

---

## Quién soy

Álvaro Fernández Mota — técnico en sistemas y datos, 26 años, Madrid/España.
Stack actual: Python, SQL, Linux (Arch/Omarchy), PostgreSQL, Docker.
Estoy en transición hacia roles de datos/IA con foco en construir mi propio ecosistema técnico.

---

## Cómo navegar este repo

```
1. CONTEXT.md          → estado actual HOY — empieza siempre aquí
2. yo/perfil.md        → quién soy, cómo pienso, cómo trabajo
3. yo/objetivos-2026.md → qué quiero conseguir este año
4. proyectos/          → proyectos activos con su ficha
5. formacion/          → qué estoy aprendiendo ahora
6. setup/              → hardware, servicios, infraestructura
7. agentes/            → cómo funciona la capa IA, prompts
8. diarios/            → memoria episódica — entradas diarias/semanales
```

---

## Reglas de comportamiento para el agente

### Siempre
- Leer `CONTEXT.md` antes de responder cualquier cosa sobre estado actual
- Usar español informal — tuteo, directo, sin relleno
- Confirmar antes de modificar cualquier archivo
- Indicar qué archivo hay que actualizar si algo cambia
- Priorizar lo que dice `CONTEXT.md` sobre cualquier otro archivo

### Nunca
- Asumir que un archivo no actualizado en >4 semanas está vigente
- Mezclar proyectos activos con proyectos archivados
- Inventar datos — si no están en el repo, preguntar
- Actualizar `CONTEXT.md` sin confirmación explícita

### Fechas
- Si la fecha actual no está disponible, preguntar antes de registrar nada
- Formato fechas: `DD MMM YYYY` en texto, `YYYY-MM-DD` en nombres de archivo

---

## Mapa de archivos por intención

| Pregunta | Archivo |
|---|---|
| ¿Qué está pasando ahora? | `CONTEXT.md` |
| ¿Quién es Álvaro? | `yo/perfil.md` |
| ¿Qué quiere este año? | `yo/objetivos-2026.md` |
| ¿En qué proyectos trabaja? | `proyectos/` |
| ¿Qué está aprendiendo? | `formacion/` |
| ¿Cómo está montado el setup técnico? | `setup/equipos.md` + `setup/servicios.md` |
| ¿Cómo funciona THDORA? | `proyectos/thdora.md` |
| ¿Qué pasó ayer/esta semana? | `diarios/2026/` |
| ¿Cómo actualizo el repo? | `agentes/prompts.md` |

---

## Arquitectura del sistema IA (junio 2026 → futuro)

```
HOY:
  Perplexity + MCP GitHub → lee este repo → responde con contexto real

PRÓXIMO (verano 2026):
  Ollama local (Ordenador Madre) + Open WebUI
  → AGENT.md + CONTEXT.md como system prompt
  → diarios/ como memoria RAG

FUTURO:
  THDORA llama al LLM local para razonar
  → agente actualiza CONTEXT.md automáticamente
  → cierre semanal generado sin intervención manual
```

---

_Este archivo se actualiza cuando cambia la estructura del repo o las reglas del sistema._
