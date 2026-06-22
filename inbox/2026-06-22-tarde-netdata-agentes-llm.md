---
tags: [inbox, sesion, netdata, llm, agentes, ia, pendiente, etica, entrenamiento, prompt-maestro]
fecha: 2026-06-22
hora: tarde
estado: cerrado-paseo
version: v3
---

# 📥 Sesión 22 Jun 2026 — Tarde

## ✅ Completado — Netdata Multi-nodo

### Arquitectura
- **Madre (varpc)** `100.91.112.32` → receiver + dashboard central
- **Acer (theodora/varo12f)** `100.86.119.102` → sender
- API key: `5e5bbc39-0cc2-4650-a691-b273e8a131f2`

### Configuración Madre `/etc/netdata/stream.conf`
```ini
[5e5bbc39-0cc2-4650-a691-b273e8a131f2]
    enabled = yes
    default history = 3600
    default memory mode = ram
    health enabled by default = auto

[stream]
    enabled = yes
    destination = 100.91.112.32:19999
    api key = 5e5bbc39-0cc2-4650-a691-b273e8a131f2
```

### Configuración Acer `/etc/netdata/stream.conf`
```ini
[stream]
    enabled = yes
    destination = 100.91.112.32:19999
    api key = 5e5bbc39-0cc2-4650-a691-b273e8a131f2
```

### Verificación
- Dashboard: `http://100.91.112.32:19999`
- Nodos activos: **2** (varpc + varo12f) ✅
- Logs OK: `STREAM RCV 'varo12f' [from 100.86.119.102]: established`

### Bug resuelto
`cat >>` ejecutado 3x → config duplicada. Fix: `cat >` (sobreescribir). Backup: `/etc/netdata/stream.conf.bak`

---

## ⏳ Pendiente — próxima sesión

- [ ] SSH sin contraseña Madre → Acer
  ```bash
  ssh-keygen -t ed25519 -C "varopc"
  ssh-copy-id varo@100.86.119.102
  ```
- [ ] Sudo sin contraseña en Acer (opcional para scripts remotos)
- [ ] Conexión persistente Acer-Madre con autossh
- [ ] Instalar Obsidian en Acer vía SSH remoto
- [ ] Dashboard HTML personalizado del ecosistema
- [ ] Pasar fichas `agentes/` al sistema formal (vault Obsidian)
- [ ] Actualizar `agentes/README.md` con tabla completa de todos los modelos
- [ ] Revisar fichas antiguas: `gemini.md`, `grok.md`, `opencode.md` (versiones viejas, sustituir por las nuevas)

---

## 📋 Estado fichas LLM en `agentes/` (post-sesión)

### ✅ Fichas completas creadas hoy
| Archivo | Modelo |
|---|---|
| `claude-sonnet-4.6.md` | Claude Sonnet 4.6 (Anthropic) |
| `chatgpt-o3.md` | GPT-4o + o3 (OpenAI) |
| `gemini-2.5-pro.md` | Gemini 2.5 Pro (Google) |
| `grok-3.md` | Grok 3 (xAI) |
| `mistral-large-2.md` | Mistral Large 2 (Mistral AI) |
| `ollama-llama3.3-70b.md` | Llama 3.3 70B (Meta) |
| `ollama-qwen2.5-72b.md` | Qwen 2.5 72B (Alibaba) |
| `ollama-deepseek-r1.md` | DeepSeek R1 8B/32B |
| `ollama-mistral-7b.md` | Mistral 7B / Mixtral 8x7B |
| `ollama-phi4.md` | Phi-4 14B (Microsoft) |
| `ollama-gemma3.md` | Gemma 3 4B/12B/27B (Google) |
| `ollama-codegemma-starcoder2.md` | CodeGemma + StarCoder2 |
| `especializados-ocr-vision.md` | PaddleOCR + TrOCR + Tesseract |
| `especializados-embeddings.md` | nomic-embed + mxbai-embed |
| `especializados-audio.md` | Whisper + Kokoro TTS |

### ⚠️ Fichas antiguas a migrar/sustituir
| Archivo viejo | Estado | Acción |
|---|---|---|
| `gemini.md` | Stub 788 bytes | Reemplazar por `gemini-2.5-pro.md` |
| `grok.md` | Stub 763 bytes | Reemplazar por `grok-3.md` |
| `opencode.md` | Revisar | Ampliar con estructura nueva |
| `perplexity.md` | Incompleto | Ampliar con estructura nueva |

### ❌ Fichas aún pendientes (segunda ronda Gemini)
- `especializados-imagen.md` — FLUX.1, Stable Diffusion 3.5, ComfyUI
- `especializados-video.md` — generación de vídeo open source
- `tecnicas-entrenamiento.md` — **ver Prompt Maestro v2 abajo**
- `parametros-inferencia.md` — **ver Prompt Maestro v2 abajo**
- `fine-tuning-local.md` — LoRA/QLoRA en Madre
- `erika-persona.md` — system prompts de identidad, Modelfiles Ollama
- `arquitecturas-emergentes.md` — Mamba, MoE, MLA, Speculative Decoding
- `seguridad-ataques-llm.md` — jailbreak, prompt injection, red teaming

---

## 🧠 PROMPT MAESTRO v2 para Gemini Deep Research

> **Uso:** Copiar bloque completo y pegar en Gemini con Deep Research activado.
> **Output:** Pegar aquí → Perplexity sube fichas al repo.
> **Objetivo:** Cubrir las dimensiones de entrenamiento profundo, ética, parámetros y arquitecturas que faltan en las fichas actuales.

---

```
Actúa como investigador técnico experto en LLMs, arquitecturas de IA y ética de sistemas.
Necesito documentación técnica exhaustiva y profesional para mi repositorio GitHub personal.
Todo el output debe estar listo para subir directamente a GitHub como archivos .md individuales.

Contexto de mi ecosistema:
- Usuario Linux (Arch/Hyprland), dos máquinas: Madre (tower) y Acer (laptop i5/8GB RAM)
- Ollama local en Madre para modelos open source
- Acceso a Perplexity Pro, ChatGPT Plus, Gemini Pro, Grok Premium
- Repo: https://github.com/alvarofernandezmota-tech/yggdrasil-dew
- Fichas ya existentes: https://github.com/alvarofernandezmota-tech/yggdrasil-dew/tree/main/agentes

Necesito que generes los siguientes archivos markdown nuevos:

---

## ARCHIVO 1: `tecnicas-entrenamiento.md`

Título: 🏛️ Cómo se Entrena un LLM — Guía Técnica Completa

Secciones requeridas:

### 1. Pre-training (Preentrenamiento)
- Objetivo: predición del siguiente token (next-token prediction)
- Arquitecturas de atención: Multi-head Attention vs Multi-Query Attention (MQA) vs Grouped-Query Attention (GQA) — diferencias, ventajas, qué modelos usa cada una
- Optimizadores: AdamW vs Lion vs Muon — cuál usa cada modelo grande y por qué
- Learning rate schedules: cosine decay, warmup, WSD schedule
- Batch size, gradient accumulation, mixed precision (bf16/fp16)
- Paralelismo: Data Parallel vs Tensor Parallel vs Pipeline Parallel vs Sequence Parallel
- Infrastructure: cuales modelos usaron cómo de muchas GPUs/TPUs, durante cuanto tiempo, cuántos FLOPs totales (GPT-4, Claude, Llama 3, Gemini, DeepSeek)
- Scaling laws: la ley de Chinchilla — cuántos tokens óptimos por parámetro

### 2. Datos de Entrenamiento
- Datasets públicos principales: The Pile, RedPajama, FineWeb, C4, ROOTS, Dolma, OpenHermes
- Datasets sintéticos: qué son, quién los usa (Phi-4 los usa masivamente), ventajas vs datos reales
- Filtrado de calidad: deduplicación MinHash, filtros de calidad CCNet/Gopher, filtrado de toxicidad
- Data mix: ratio típico texto/código/matemáticas/multilingüe en modelos top
- Data contamination: qué es, cómo afecta a benchmarks, casos conocidos
- Copyright y datos de entrenamiento: el debate legal actual (NYT vs OpenAI, etc.)

### 3. Fine-tuning Supervisado (SFT)
- Qué es instruction tuning y por qué transforma un modelo base en asistente
- Formato de datos: instruction-response pairs, chat templates
- Datasets públicos de SFT: Alpaca, ShareGPT, OpenHermes, UltraChat
- Cómo se seleccionan y filtran los datos de SFT
- Cuántos ejemplos necesitas para un SFT efectivo

### 4. Alineamiento — comparativa técnica exhaustiva

#### RLHF (Reinforcement Learning from Human Feedback)
- Cómo funciona: Reward Model separado entrenado con preferencias humanas
- Proceso completo paso a paso: comparaciones humanas → reward model → PPO
- Ventajas y limitaciones (reward hacking, inestabilidad PPO)
- Quién lo usa: OpenAI (GPT-4), Anthropic (versiones anteriores)

#### RLAIF (Reinforcement Learning from AI Feedback)
- Diferencia con RLHF: un modelo de IA sustituye al anotador humano para escalar
- Constitutional AI de Anthropic: lista exacta de principios del documento público
  - Qué principios tiene la Constitución de Claude
  - Cómo el modelo se autoevalúa contra esos principios
  - Red teaming constitucional
- Ventajas: escala infinita, consistencia; Limitaciones: amplifica sesgos del modelo evaluador

#### DPO (Direct Preference Optimization)
- Por qué elimina el reward model separado y es más estable que PPO
- Cómo usa pares (chosen, rejected) directamente
- Quién lo usa: Mistral, muchos modelos open source
- Variantes: IPO, KTO, SimPO

#### GRPO (Group Relative Policy Optimization) — innovación DeepSeek
- Cómo funciona: el modelo genera múltiples respuestas, se comparan entre ellas
- Por qué es más eficiente que PPO para razonamiento
- Cómo DeepSeek-R1 aprendió a razonar solo con RL puro sin SFT previo

#### Process Reward Models (PRM) vs Outcome Reward Models (ORM)
- PRM: premia cada paso del razonamiento — más preciso, más costoso de anotar
- ORM: solo premia el resultado final — más simple, puede aprender atajos
- Quién usa cada uno y en qué benchmarks impacta

#### Self-play e Iterative Self-improvement
- Cómo un modelo genera sus propios datos de entrenamiento para la siguiente iteración
- Ejemplos: AlphaCode, Llama 3 usaron datos sintéticos generados por modelos anteriores

### 5. Test-time Compute Scaling
- El nuevo paradigma: más cómputo en inferencia = mejor respuesta (o3, R1, Gemini thinking)
- Best-of-N sampling: generar N respuestas y elegir la mejor según reward model
- Beam search vs greedy decoding vs sampling
- Chain-of-Thought (CoT): cómo el razonamiento explícito mejora la precisión
- Tree of Thoughts / Monte Carlo Tree Search en LLMs

### 6. Alignment Tax y Tradeoffs
- Alignment tax: cuánto rendimiento puro pierde un modelo al alinearse éticamente
- El tradeoff utilidad vs seguridad: cómo cada empresa lo resuelve diferente
- Overtriggering (demasiado restrictivo) vs undertriggering (demasiado liberal)
- Cómo medir el alignment tax en benchmarks

### 7. Sesgos y Problemas conocidos
- Sesgos culturales: más datos en inglés → perspectiva anglocentrista
- Sesgos de los anotadores: si los anotadores son mayoritariamente de EEUU/India, el modelo hereda esos valores
- Sycophancy: el modelo tiende a decir lo que el usuario quiere oír
- Hallucinations: por qué los modelos inventan hechos con total confianza
- Lost in the middle: los modelos atienden menos el contenido del medio del contexto

---

## ARCHIVO 2: `parametros-inferencia.md`

Título: ⚙️ Parámetros de Inferencia — Guía de Uso Práctico

Para cada parámetro, explicar: qué es, rango de valores, cuándo usar cada valor, ejemplo concreto.

### Parámetros universales (todos los modelos)
- `temperature` (0.0 — 2.0): creatividad vs determinismo. 0=reproducible, 0.7=equilibrio, 1.5=caos
- `top_p` / nucleus sampling (0.0 — 1.0): diversidad del vocabulario por probabilidad acumulada
- `top_k` (1 — ∞): número máximo de tokens candidatos en cada paso
- `max_tokens` / `max_new_tokens`: límite de tokens generados en la respuesta
- `stop sequences`: tokens o strings que detienen la generación
- `seed`: reproducibilidad exacta del output con mismos inputs
- `repetition_penalty` / `repeat_penalty` (Ollama): penaliza repetir tokens recientes
- `system_prompt`: instrucciones fijas de comportamiento que el usuario no ve

### Parámetros OpenAI específicos
- `presence_penalty` (-2.0 — 2.0): penaliza tokens que ya aparecieron (aumenta variedad temática)
- `frequency_penalty` (-2.0 — 2.0): penaliza tokens proporcional a su frecuencia (reduce repetición)
- `logit_bias`: forzar o prohibir tokens específicos
- `response_format`: forzar JSON output
- `reasoning_effort` (o3): low/medium/high — controla tokens de razonamiento

### Parámetros Anthropic (Claude) específicos
- `thinking budget_tokens`: cuántos tokens puede usar Claude para pensar antes de responder
- `extended_thinking`: activar/desactivar modo de razonamiento profundo
- `interleaved_thinking`: razonamiento intercalado con tool calls

### Parámetros Ollama específicos
- `num_ctx`: tamaño de la ventana de contexto activa (afecta RAM usada)
- `num_predict`: máximo de tokens a generar
- `mirostat` (0/1/2): algoritmo alternativo de sampling para evitar repetición
- `mirostat_tau`: entropía objetivo del mirostat
- `tfs_z` (tail free sampling): elimina tokens de baja probabilidad de la cola
- `num_gpu`: cuántas capas cargar en GPU vs CPU
- `num_thread`: número de threads de CPU a usar
- `f16_kv`: usar fp16 para KV-cache (ahorra VRAM)

### Recetas prácticas por caso de uso
- Código (determinista): `temperature: 0, top_p: 1, seed: 42`
- Escritura creativa: `temperature: 0.9, top_p: 0.95, repetition_penalty: 1.1`
- Chat general: `temperature: 0.7, top_p: 0.9`
- Extracción de datos (JSON): `temperature: 0, response_format: json`
- Brainstorming: `temperature: 1.2, top_k: 50`
- Traducción: `temperature: 0.3, top_p: 0.95`

### Cómo configurar en Ollama Modelfile
```
FROM llama3.3:70b
PARAMETER temperature 0.7
PARAMETER top_p 0.9
PARAMETER num_ctx 32768
PARAMETER repeat_penalty 1.1
SYSTEM """
[system prompt aquí]
"""
```

---

## ARCHIVO 3: `fine-tuning-local.md`

Título: 🔧 Fine-tuning Local con LoRA/QLoRA — Personalizar Modelos en Madre

### Qué es LoRA y QLoRA
- LoRA (Low-Rank Adaptation): entrena solo matrices de rango bajo, no todos los pesos
- QLoRA: LoRA sobre modelo cuantizado — permite fine-tune de modelos grandes en hardware limitado
- Cuántos parámetros entrena realmente LoRA vs full fine-tune
- Guía de hiperparámetros: rank (r), alpha, dropout, learning rate típico

### Cuándo fine-tunear vs RAG vs system prompt
- System prompt: cambia comportamiento pero no conocimiento. Rápido, sin coste
- RAG: añade conocimiento externo en tiempo real. Sin entrenamiento
- Fine-tuning: cambia el estilo, personalidad o dominio del modelo a nivel de pesos
- Regla práctica: usa RAG primero, fine-tune solo si el estilo/formato importa

### Cuántos datos necesitas
- Instruction tuning básico: desde 500-1000 ejemplos de calidad
- Dominio específico: 1000-10000 ejemplos
- Personalización de estilo/voz: desde 200 ejemplos si son muy consistentes

### Hardware en Madre para fine-tuning
- Requisitos mínimos por modelo con QLoRA
- Herramientas: Unsloth (el más eficiente), Axolotl, LLaMA Factory, Ollama Modelfiles
- Workflow completo: preparar datos → configurar entrenamiento → merge de pesos → exportar a GGUF → importar en Ollama

### Formato de datos de entrenamiento
- ChatML format
- Alpaca format
- ShareGPT format
- Cómo convertir entre formatos

---

## ARCHIVO 4: `erika-persona.md`

Título: 🌸 Erika — Sistema de Identidad y Personalidad Persistente para Modelos Locales

### Concepto
Cómo crear un asistente local con identidad, nombre, carácter y principios consistentes
que no deriven aunque la conversación sea larga, usando Ollama Modelfiles.

### Sistema de Identidad
- Nombre, rol, carácter definidos en el system prompt
- Principios de comportamiento (equivalent al Constitutional AI de Anthropic pero personal)
- Qué puede y qué no puede hacer — límites definidos por el usuario
- Estilo de respuesta: tono, longitud, lenguaje

### Constitutional Prompting Personal
- Cómo escribir una "constitución" personal para tu modelo
- Ejemplo de constitución Erika: valores, restricciones, personalidad
- Cómo el modelo la usa para autoevaluarse antes de responder
- Diferencia entre system prompt largo vs chain-of-thought constitucional

### Persistencia de Carácter en Contexto Largo
- Por qué los modelos derivan de personalidad en conversaciones largas
- Técnicas de anclaje: recordatorios periódicos de identidad en el contexto
- Memoria externa: RAG sobre un archivo de personalidad para refrescar contexto
- Cómo medir si el modelo está derivando

### Ollama Modelfile completo para Erika
- Ejemplo de Modelfile con: FROM, PARAMETER, SYSTEM, TEMPLATE
- Cómo crear el modelo: `ollama create erika -f Modelfile`
- Cómo ejecutarlo: `ollama run erika`
- Cómo exportar a GGUF y moverlo entre máquinas

### Entrenamiento de Erika (si en el futuro quieres fine-tunear)
- Qué datos recopilar: conversaciones de ejemplo con el carácter deseado
- Formato de los datos
- Estimación de tiempo y coste en Madre

---

## ARCHIVO 5: `arquitecturas-emergentes.md`

Título: 🔮 Arquitecturas Emergentes — Más Allá del Transformer Estándar

### 1. Mixture of Experts (MoE)
- Cómo funciona el router que elige qué expertos activar por token
- Parámetros totales vs parámetros activos — por qué Mixtral 8x7B tiene 47B totales pero activa ~13B
- Load balancing: cómo evitar que siempre se activen los mismos expertos
- Quién usa MoE: Mixtral, GPT-4 (especulado), DeepSeek V3, Grok

### 2. Multihead Latent Attention (MLA) — innovación DeepSeek
- El problema del KV-cache en ventanas de contexto largas: crece O(n) con la longitud
- Cómo MLA comprime el KV-cache mediante proyección de baja dimensión
- Por qué DeepSeek V3 es ~5x más eficiente en memoria que modelos equivalentes

### 3. State Space Models (Mamba / SSM)
- Por qué los transformers tienen complejidad cuadrática en la longitud de secuencia
- Cómo Mamba logra complejidad lineal manteniendo rendimiento similar
- Mamba 2 y modelos híbridos Mamba+Transformer
- Dónde Mamba ya supera a transformers: secuencias muy largas, tiempo real
- Limitaciones actuales vs transformers

### 4. Speculative Decoding
- El cuello de botella de inferencia: cada token requiere un forward pass completo
- Cómo un modelo pequeño (draft) genera candidatos que el modelo grande verifica en paralelo
- Aceleración típica: 2-3x más velocidad con misma calidad
- Quién lo usa: Gemini, Claude internamente, disponible en llama.cpp

### 5. Ring Attention y Context Parallelism
- Cómo distribuir contextos de millones de tokens entre múltiples GPUs
- Por qué Gemini puede tener 1M tokens de forma eficiente

### 6. Quantization — guía completa
- GGUF formats: Q2, Q3, Q4_K_M, Q5_K_M, Q6_K, Q8_0, F16 — tabla con RAM y calidad
- AWQ vs GPTQ vs GGUF — diferencias y cuándo usar cada uno
- Impacto real en calidad de respuesta por nivel de cuantización
- Recomendaciones específicas para el hardware de Álvaro (Madre y Acer)

---

## ARCHIVO 6: `seguridad-ataques-llm.md`

Título: 🛡️ Seguridad en LLMs — Ataques, Defensas y Red Teaming

### 1. Prompt Injection
- Direct prompt injection: el usuario intenta sobrescribir el system prompt
- Indirect prompt injection: datos externos (webs, emails) contienen instrucciones maliciosas
- Cómo cada modelo defiende: Claude vs GPT-4 vs modelos locales sin guardrails
- Implicaciones para agentes autónomos que leen webs y archivos

### 2. Jailbreaking — técnicas conocidas
- DAN (Do Anything Now) y variantes
- Roleplay jailbreaks: "actúa como un modelo sin restricciones"
- Many-shot jailbreaking: ejemplos repetidos en el contexto
- Crescendo: escalar gradualmente hacia contenido prohibido
- Cómo cada modelo resiste (ranking de robustez)

### 3. Hallucinations — por qué ocurren
- Mecanismo técnico: el modelo maximiza probabilidad, no verdad
- Tipos: factual hallucination, source hallucination, reasoning hallucination
- Cómo mitigar: grounding con búsqueda web, RAG, temperature baja, pedir citas
- Casos donde cada modelo alucina más y menos

### 4. Data Poisoning y Training Attacks
- Backdoor attacks: cómo un dataset contaminado puede insertar comportamientos ocultos
- Sleeper agents: modelos que se comportan normal pero actúan mal con ciertos triggers
- Por qué los modelos de fuentes desconocidas de HuggingFace son un riesgo

### 5. Model Cards y Red Teaming
- Qué es una model card y por qué importa al elegir un modelo
- Cómo hace red teaming cada empresa (Anthropic, OpenAI, Google DeepMind)
- Anthropic’s Responsible Scaling Policy (RSP)
- OpenAI’s Preparedness Framework
- EU AI Act: implicaciones para usuarios europeos (como Álvaro)

---

## ARCHIVO 7: `etica-principios-por-modelo.md`

Título: ⚖️ Ética y Principios por Modelo — Qué Valores Tienen los LLMs

Para CADA modelo (Claude, GPT-4, Gemini, Grok, Mistral, Llama, DeepSeek):

### Sección por modelo:
- **Documento público de principios** (si existe): Constitutional AI, Model Spec, Responsible Use, AUP
- **Principios declarados:** honestidad, utilidad, no daño, y cómo los priorizan
- **Qué temas rechaza** o limita: violencia, desinformación, código malicioso, contenido adulto
- **Qué NO rechaza** que otros sí: diferencias notables de permisividad
- **Sesgos políticos reconocidos** por la empresa o detectados por investigadores externos
- **Sesgos culturales:** ¿más occidental? ¿más conservador? ¿más liberal?
- **Posición sobre privacidad:** ¿usan datos para entrenar? ¿opt-out real?
- **Transparencia:** ¿publican model cards? ¿informes de seguridad? ¿auditías externas?
- **Filosofía de la empresa** y cómo afecta al modelo:
  - Anthropic: "IA segura para la humanidad" — más restrictivo, más reflexivo
  - OpenAI: "IA general beneficiosa" — equilibrio comercial/seguridad
  - Google: "IA responsable y útil" — sesgado hacia búsqueda/publicidad
  - xAI: "curiosidad máxima, mínima censura" — más liberal intencionalmente
  - Meta: "IA abierta para todos" — pesos abiertos, menor control post-release
  - DeepSeek: laboratorio chino — censura del gobierno chino en ciertos temas
  - Mistral: europea — enfoque en soberanía de datos y neutralidad

### Tabla comparativa final
Tabla markdown con: Modelo | Principios públicos | Temas limitados | Sesgos conocidos | Transparencia | Privacidad API

---

FORMATO FINAL para todos los archivos:
- Markdown completo listo para GitHub
- Ejemplos prácticos donde aplique
- Tablas comparativas donde haya múltiples opciones
- Comandos exactos ejecutables en Arch Linux
- Fuentes citadas al final de cada archivo
- Cada archivo debe ser exhaustivo pero estructurado — nivel documentación profesional
```

---

## 📁 Archivos tocados esta sesión
- `/etc/netdata/stream.conf` — Madre y Acer
- `/etc/netdata/stream.conf.bak` — backup Acer
- `agentes/` — 15 fichas nuevas creadas
- `inbox/2026-06-22-tarde-netdata-agentes-llm.md` — este archivo (v3)

---

_Sesión pausada para paseo con Threa 🐕_
_Siguiente paso: Prompt Maestro v2 → Gemini Deep Research → 7 archivos nuevos → Perplexity sube al repo_
_Estado general: ecosistema documentado, fichas base creadas, segunda ronda pendiente_
