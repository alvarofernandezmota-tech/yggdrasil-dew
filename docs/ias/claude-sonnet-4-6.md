---
modelo: claude-sonnet-4-6
empresa: Anthropic
tipo: cloud
open_source: false
licencia: propietaria
pesos_disponibles: false
huggingface_url: null
llama_cpp_compatible: false
arquitectura: Transformer (detalles no publicados)
parametros_aprox: ~200B estimado (no confirmado)
context_window: 200000
knowledge_cutoff: 2025-04
fecha_ficha: 2026-06-25
status: activo
tags: [ia, claude, anthropic, cloud, sonnet, prompting, mcp, herramientas]
---

# 🤖 Claude Sonnet 4.6 — Anthropic

> Ficha técnica completa para uso en ecosistema yggdrasil-dew.
> Modelo usado activamente en sesiones con MCP tools sobre el repo.

---

## Identidad

| Campo | Valor |
|-------|-------|
| Empresa | Anthropic (San Francisco, 2021) |
| Modelo | Claude Sonnet 4.6 |
| Familia | Claude 4.x (Sonnet = equilibrio potencia/coste) |
| Tipo | Cloud — API únicamente |
| Open-source | ❌ No — pesos no disponibles |
| Context window | 200.000 tokens |
| Knowledge cutoff | Abril 2025 |
| Multimodal | ✅ Texto + imágenes + documentos |
| Herramientas | ✅ MCP, function calling, computer use |

---

## Arquitectura y Entrenamiento

- **Arquitectura**: Transformer (Anthropic no publica detalles exactos)
- **Parámetros**: No confirmados. Estimaciones externas: ~70-200B
- **Técnica de alineación**: Constitutional AI (CAI) + RLHF
  - Constitutional AI = el modelo se autocritica contra una "constitución" de valores
  - Más transparente que RLHF puro — la constitución es pública
- **Dataset**: No publicado. Entrenado con datos web + licencias + datos sintéticos
- **Transparencia**: Media — la metodología CAI es pública, los datos no

---

## Ética y Alineación

| Aspecto | Detalle |
|---------|----------|
| Valores core | Honestidad · Inocuidad · Ayuda (en ese orden) |
| Límites hard | Bioarmas, CSAM, ciberataques destructivos — nunca |
| Límites soft | Negociables con contexto y system prompt |
| Sesgos conocidos | Tendencia a ser cauto en exceso · Verboso en respuestas largas |
| Transparencia | Alta en metodología (CAI pública), baja en datos de entrenamiento |
| Soberanía digital | ❌ Datos van a servidores Anthropic — no apto para datos privados |

---

## Skills

| Skill | Nivel | Notas |
|-------|-------|-------|
| Python | ✅ Excelente | Mejor que GPT-4 en código complejo |
| Bash / Shell | ✅ Excelente | Scripts completos y correctos |
| Análisis de repos | ✅ Excelente | Con MCP lee repos enteros |
| Razonamiento largo | ✅ Excelente | 200K context = documentos enormes |
| Matemáticas | ✅ Bueno | Razonamiento sí, cálculo delegarlo a numpy |
| Estadística | ✅ Bueno | Conceptos y código correcto |
| OSINT | ⚠️ Regular | Conservador, evita técnicas agresivas |
| Seguridad ofensiva | ❌ Malo | Muy restrictivo por diseño |
| Creatividad | ✅ Excelente | El mejor en escritura técnica larga |
| Seguir instrucciones | ✅ Excelente | Respeta system prompts y XML tags |

---

## Parámetros Óptimos por Caso de Uso

| Caso | temperature | top_p | max_tokens | Notas |
|------|-------------|-------|------------|-------|
| RAG / extracción | 0.0 | 1.0 | 2048 | Determinista, sin creatividad |
| Código | 0.1 | 0.95 | 4096 | Mínima variación, máxima precisión |
| OSINT / JSON | 0.0 | 1.0 | 2048 | Output estructurado puro |
| Investigación | 0.3 | 0.95 | 8192 | Algo de exploración |
| Estadística | 0.0 | 1.0 | 4096 | Determinista siempre |
| Chat / brainstorm | 0.7 | 0.95 | 2048 | Más variedad |
| Documentación | 0.2 | 0.95 | 8192 | Coherente y completo |

---

## Cómo Interactuar Correctamente

### Regla 1 — XML tags para estructura
Claude procesa XML mejor que markdown plano para separar secciones.
```xml
<contexto>estado del sistema</contexto>
<tarea>qué hacer exactamente</tarea>
<restricciones>qué no hacer</restricciones>
<output_esperado>formato exacto de salida</output_esperado>
```

### Regla 2 — Una tarea por mensaje
No combines 3 tareas en un mensaje. Claude las mezcla o prioriza mal.
Mejor: un mensaje → una acción → confirmar → siguiente.

### Regla 3 — Contexto al principio, siempre
Claude no recuerda sesiones anteriores. Cada conversación empieza en cero.
Con MCP: pídele que lea el fichero de contexto, no lo copies.
```
Lee docs/CONTEXT.md del repo yggdrasil-dew y actúa en consecuencia.
```

### Regla 4 — Pídele que confirme antes de commitear
```
Antes de hacer cualquier commit, muéstrame el contenido del fichero.
```

### Regla 5 — Gestión de tokens
- A partir de 150K tokens de contexto empieza a degradar
- Señal de alerta: respuestas más cortas, olvida instrucciones anteriores
- Solución: abrir nueva conversación + pasar resumen de estado

### Regla 6 — System prompt para ygg
```xml
<system>
  Eres asistente técnico del ecosistema yggdrasil-dew.
  Tienes acceso MCP completo al repo alvarofernandezmota-tech/yggdrasil-dew.
  Filosofía: 100% open-source · soberanía digital · minimalismo.
  Hardware objetivo: i5-8400 · 16GB RAM · sin GPU · Arch Linux.
  Antes de cada acción: lee el contexto actual del repo.
  Antes de cada commit: muestra el contenido al usuario.
  Formato ficheros: frontmatter YAML + Markdown · naming YYYY-MM-DD-kebab.md
</system>
```

---

## Con MCP Tools — Capacidades Reales

Con las herramientas MCP conectadas al repo, Claude puede:
- ✅ Leer cualquier fichero de yggdrasil-dew en tiempo real
- ✅ Crear y actualizar ficheros directamente
- ✅ Hacer commits con mensaje estandarizado
- ✅ Listar el contenido de inbox y clasificar por frontmatter
- ✅ Buscar código en todos los repos del ecosistema
- ✅ Crear issues, PRs y branches
- ✅ Procesar imágenes y documentos (OCR nativo)
- ❌ No accede a internet en tiempo real
- ❌ No ejecuta código localmente (solo genera)

---

## Alternativa Local

No existe equivalente local real para Claude Sonnet 4.6 en el hardware actual.

| Modelo local | Se parece en... | Pero pierde... |
|---|---|---|
| qwen2.5:7b | Código Python, instrucciones | Context window (32K vs 200K), MCP, calidad general |
| llama3.1:8b | Chat, razonamiento básico | Todo lo anterior |

**Conclusión**: Claude se usa para investigación, documentación y operaciones sobre el repo. Los modelos locales para inferencia en producción con datos privados.

---

## Uso en el Ecosistema yggdrasil-dew

| Tarea | ¿Claude? | Alternativa local |
|-------|----------|-------------------|
| Procesar inbox y commitear | ✅ Sí | Script Python automatizado |
| Escribir ADRs y docs | ✅ Sí | No viable |
| Investigación técnica | ✅ Sí | Gemini / Grok |
| RAG con datos privados | ❌ No | qwen2.5:7b + pgvector |
| Handlers thdora en producción | ❌ No | qwen2.5:7b via LiteLLM |
| Análisis OSINT datos reales | ❌ No | llama3.1:8b local |

---

## Referencias

- Sesión investigación modelos: [[inbox/2026-06-24-SESION-INVESTIGACION-MODELOS-COMPLETA]]
- Template ficha: [[docs/ias/TEMPLATE-FICHA-MODELO]]
- Prompt comportamiento IAs: [[inbox/2026-06-25-PROMPT-COMPORTAMIENTO-IAS]]
- Constitutional AI paper: https://arxiv.org/abs/2212.08073

---
_Creado: 25 jun 2026 01:20 CEST — Perplexity via MCP_
_Revisión pendiente tras sesión Gemini+Grok de investigación modelos_
