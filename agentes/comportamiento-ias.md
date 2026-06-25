---
tipo: prompt-maestro
fecha: 2026-06-25
hora: "01:20"
status: listo-para-usar
tags: [prompt, claude, anthropic, comportamiento, ia, mcp, herramientas, atomic]
priority: ALTA
destino: agentes/prompts/
---

# 🧠 PROMPT COMPORTAMIENTO IAs — Claude (Anthropic)

> Cómo hablarle a Claude para máxima eficiencia con MCP y el repo yggdrasil-dew.
> Basado en investigación de atomic notes, Constitutional AI y mejores prácticas 2025-2026.

---

## El Principio Atomic aplicado a Claude

**Una nota = una idea. Un mensaje = una tarea.**

Claude funciona como un procesador de notas atómicas:
- Cada fichero de inbox debe tener UNA idea con frontmatter claro
- Cada mensaje a Claude debe pedir UNA acción concreta
- Claude lee el frontmatter → detecta `tipo` + `destino` → actúa

Flujo correcto:
```
Inbox (raw, una idea) → Claude lee frontmatter → Clasifica → Mueve a destino → Commit
```

---

## Prompt de Arranque de Sesión (copiar siempre)

```xml
<system>
  Eres asistente técnico del ecosistema yggdrasil-dew.
  Tienes acceso MCP completo al repo alvarofernandezmota-tech/yggdrasil-dew.
  Filosofía: 100% open-source · soberanía digital · minimalismo.
  Hardware objetivo: i5-8400 · 16GB RAM · sin GPU · Arch Linux.
  Antes de cada acción: lee el contexto actual del repo.
  Antes de cada commit: muestra el contenido al usuario para confirmar.
  Formato ficheros: frontmatter YAML + Markdown · naming YYYY-MM-DD-kebab.md
</system>

<contexto_inmediato>
  Lee docs/CONTEXT.md del repo yggdrasil-dew para ponerte al día.
  Si no existe CONTEXT.md, lee docs/estructura-madre.md.
</contexto_inmediato>
```

---

## Prompt para Procesar Inbox

```xml
<tarea>procesar-inbox</tarea>

<instrucciones>
  1. Lista todos los ficheros de inbox/ del repo yggdrasil-dew
  2. Para cada fichero, lee su frontmatter YAML
  3. Identifica el campo `tipo` y `destino`
  4. Mueve cada fichero a su destino según esta tabla:
</instrucciones>

<tabla_destinos>
  resumen-sesion      → diarios/
  adr                 → docs/adr/
  setup               → docs/setup/
  ficha-modelo        → docs/ias/ o ollama/
  prompt-maestro      → agentes/prompts/
  tesis-arquitectura  → docs/decisiones/
  problema-detectado  → docs/sistema/
  estado-ecosistema   → docs/sistema/
  script              → setup/servidor/scripts/
  debate-multi-ia     → docs/ias/debates/
  sesion-investigacion→ docs/investigacion/
  plan-sesion         → borrar tras leer
</tabla_destinos>

<restricciones>
  - Muestra qué vas a mover ANTES de hacerlo
  - Un commit por fichero procesado
  - Si el tipo no está claro, déjalo en inbox y avísame
  - No borres nada sin confirmar
</restricciones>
```

---

## Prompt para Investigación con Relevo de IAs

```xml
<contexto>
  Investigación multi-IA en curso.
  Orden: Claude → Gemini (relevo cuando se agoten tokens)
  Fichero de sesión: inbox/2026-06-24-SESION-INVESTIGACION-MODELOS-COMPLETA.md
</contexto>

<tarea>
  1. Lee el fichero de sesión completo
  2. Identifica en qué turno está la investigación (tabla bitácora al final)
  3. Ejecuta el siguiente turno pendiente
  4. Guarda el output como: inbox/2026-06-25-TURNO[N]-CLAUDE-MODELOS.md
  5. Actualiza la tabla bitácora del fichero original
</tarea>

<output_esperado>
  Fichero Markdown con:
  - frontmatter YAML completo (tipo: sesion-investigacion)
  - Contenido del turno ejecutado
  - Al final: resumen de tokens usados y estado para el relevo
</output_esperado>
```

---

## Prompt para Crear Ficha de Modelo

```xml
<tarea>crear-ficha-modelo</tarea>

<modelo>[NOMBRE DEL MODELO]</modelo>

<instrucciones>
  Crea una ficha completa en docs/ias/[nombre-modelo].md
  usando el template en docs/ias/TEMPLATE-FICHA-MODELO.md
  con toda la información que conozcas del modelo.

  Incluye obligatoriamente:
  - open_source: true/false
  - pesos_disponibles: true/false
  - llama_cpp_compatible: true/false
  - tabla parámetros óptimos por caso de uso
  - skills con nivel real
  - alternativa local si es modelo cloud
  - cómo interactuar correctamente con él
</instrucciones>

<restricciones>
  Muéstrame el contenido antes de hacer commit.
  Si hay datos que no conoces con certeza, márcalos con ❓
</restricciones>
```

---

## Reglas de Gestión de Tokens con Claude

1. **<150K tokens**: Claude en plena forma — tareas complejas
2. **150K-180K tokens**: Empieza a perder contexto inicial — simplificar
3. **>180K tokens**: Abrir conversación nueva

**Señales de que Claude está llegando al límite:**
- Respuestas más cortas de lo normal
- Olvida restricciones dadas al inicio
- Repite cosas ya hechas
- Pide confirmaciones que ya diste

**Protocolo de relevo a Gemini:**
```
Claude: "Resume el estado actual de la investigación en máximo 500 palabras
         con los puntos clave para que otra IA pueda continuar desde aquí."
```
Ese resumen → pégalo al inicio del prompt de Gemini.

---

## Notas sobre Constitutional AI (Anthropic)

Claude está entrenado con **Constitutional AI**: en vez de solo RLHF humano,
el modelo se autocritica contra una "constitución" de principios éticos.
Esto hace que:
- Sea más predecible en sus límites
- Pueda explicar por qué rechaza algo
- Sea más fácil de "guiar" con system prompts bien escritos
- Los límites soft sean negociables con contexto correcto

La constitución de Anthropic es pública:
https://www.anthropic.com/research/constitutional-ai-harmlessness-from-ai-feedback

---

## Referencias

- Ficha Claude Sonnet 4.6: [[docs/ias/claude-sonnet-4-6]]
- Sesión investigación modelos: [[inbox/2026-06-24-SESION-INVESTIGACION-MODELOS-COMPLETA]]
- Problema documentación pendientes: [[inbox/2026-06-24-PROBLEMA-DOCUMENTACION-PENDIENTES]]
- Best practices Anthropic: https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices

---
_Creado: 25 jun 2026 01:20 CEST — Perplexity via MCP_
_Basado en: investigación atomic notes + Constitutional AI + mejores prácticas prompting 2025-2026_
