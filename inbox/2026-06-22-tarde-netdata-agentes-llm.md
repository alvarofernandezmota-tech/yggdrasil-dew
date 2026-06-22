---
tags: [inbox, sesion, netdata, llm, agentes, ia, pendiente, etica, entrenamiento]
fecha: 2026-06-22
hora: tarde
estado: cerrado-paseo
---

# 📥 Sesión 22 Jun 2026 — Tarde

## ✅ Completado — Netdata Multi-nodo

Configurado streaming de métricas Acer → Madre via Netdata.

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
- Dashboard activo: `http://100.91.112.32:19999`
- Nodos activos: **2** (varpc + varo12f) ✅
- Logs confirmación: `STREAM RCV 'varo12f' [from 100.86.119.102]: established`
- Acceso remoto desde Acer: `http://100.91.112.32:19999`

### Bug resuelto
`cat >>` ejecutado 3x → config duplicada 3 veces.
Fix: `cat >` (sobreescribir) en vez de `cat >>` (append).
Backup guardado: `/etc/netdata/stream.conf.bak`

---

## ⏳ Pendiente — próxima sesión

- [ ] SSH sin contraseña Madre → Acer
  ```bash
  ssh-keygen -t ed25519 -C "varopc"
  ssh-copy-id varo@100.86.119.102
  ```
- [ ] Sudo sin contraseña en Acer (opcional para scripts remotos)
  ```bash
  # En el Acer: sudo visudo → añadir:
  varo ALL=(ALL) NOPASSWD: ALL
  ```
- [ ] Conexión persistente Acer-Madre con autossh
- [ ] Instalar Obsidian en Acer vía SSH remoto
  ```bash
  ssh varo@100.86.119.102
  yay -S obsidian
  ```
- [ ] Dashboard HTML personalizado del ecosistema
- [ ] Actualizar `agentes/README.md` con tabla completa de modelos
- [ ] Crear fichas LLM faltantes en `agentes/` (ver sección abajo)

---

## 📋 Plan fichas LLM — `agentes/`

### Decisión tomada
Actualizar y completar todas las fichas de `agentes/` a nivel profesional.
Workflow: **Gemini Deep Research investiga → output aquí → Perplexity sube al repo formateado**.

### Estado actual fichas
| Ficha | Estado |
|---|---|
| `perplexity.md` | ✅ Completo (20 Jun) |
| `grok.md` | ⚠️ Existe, revisar y ampliar |
| `gemini.md` | ⚠️ Existe, revisar y ampliar |
| `opencode.md` | ⚠️ Existe, revisar y ampliar |
| `chatgpt.md` | ❌ No existe — crear |
| `ollama-local.md` | ❌ No existe — crear |
| `mistral.md` | ❌ No existe — crear |
| `modelos-especializados.md` | ❌ No existe — crear |

### Modelos a documentar

**Cloud / comerciales:**
- Claude Sonnet 4.6 (Anthropic) — via Perplexity
- GPT-4o + o3 (OpenAI) — ChatGPT
- Gemini 2.5 Pro (Google)
- Grok 3 (xAI)
- Mistral Large 2 (Mistral AI)

**Open source / local Ollama:**
- Llama 3.3 70B (Meta)
- Qwen 2.5 72B (Alibaba)
- Deepseek R2 / Coder (Deepseek)
- Mistral 7B / Mixtral
- Phi-4 (Microsoft)
- Gemma 3 (Google open)
- CodeGemma / StarCoder2

**Especializados:**
- OCR: PaddleOCR, TrOCR, Tesseract 5
- Embeddings: nomic-embed, mxbai-embed
- Audio/voz: Whisper (OpenAI), Kokoro TTS
- Imagen: Stable Diffusion, FLUX, ComfyUI
- Video: generación open source

---

## 🧠 Prompt Maestro para Gemini Deep Research

> Copiar y pegar en Gemini con Deep Research activado.
> Output → pegar aquí → Perplexity sube al repo.

```
Actúa como investigador técnico experto en LLMs y ética de IA.
Necesito una ficha técnica profesional y exhaustiva de cada modelo listado
para documentar en mi repositorio GitHub personal qué modelo usar para cada tarea.

Contexto de mi ecosistema:
- Usuario Linux (Arch/Hyprland), dos máquinas: Madre (tower) y Acer (laptop)
- Uso Ollama local en Madre para modelos open source
- Acceso a Perplexity Pro, ChatGPT Plus, Gemini Pro, Grok Premium
- Repositorio: https://github.com/alvarofernandezmota-tech/yggdrasil-dew
- Ficha de referencia: https://raw.githubusercontent.com/alvarofernandezmota-tech/yggdrasil-dew/main/agentes/perplexity.md

Para CADA modelo, estructura markdown exacta:

---
tags: [agente, ia, llm, {nombre}]
fecha-actualizacion: 2026-06-22
---

# {emoji} {Nombre} — {Rol en el ecosistema}

## 1. Modelo y versión actual (junio 2026)
## 2. Empresa, origen y fecha de lanzamiento
## 3. Arquitectura técnica
   - Tipo de arquitectura (transformer, MoE, etc.)
   - Número de parámetros (si conocido)
   - Tamaño de vocabulario
## 4. Datos de entrenamiento
   - Tipo de datos: texto, código, imágenes, audio, etc.
   - Fuentes conocidas: web, libros, GitHub, papers, etc.
   - Fecha de corte del conocimiento
   - Idiomas soportados
## 5. Proceso de entrenamiento y alineamiento
   - Pre-training
   - Fine-tuning supervisado (SFT)
   - RLHF / RLAIF / DPO / Constitutional AI u otro
   - Técnicas especiales (thinking, chain-of-thought, etc.)
## 6. Ética y principios del modelo
   - Principios de diseño (Constitution AI, AUP, etc.)
   - Qué temas rechaza o limita
   - Sesgos conocidos o reconocidos por la empresa
   - Posición sobre privacidad y datos del usuario
   - Transparencia: ¿publica informes de seguridad/model cards?
## 7. Ventana de contexto
   - Tokens de entrada / salida
   - Memoria persistente entre sesiones (si tiene)
## 8. Modalidades soportadas
   - Texto, código, imagen (input/output), audio, video, documentos
## 9. Herramientas y capacidades nativas
   - Web search, code interpreter, OCR/visión
   - MCP, plugins, conectores externos
   - Voz en tiempo real, memoria, canvas/artefactos
   - Ejecución de código en sandbox
   - Acceso a APIs externas
## 10. Modos especiales
    - Thinking / reasoning extendido
    - Deep research / investigación profunda
    - Canvas / editor de documentos
    - Agente autónomo / computer use
    - Custom GPTs / Projects / Gems
## 11. Benchmarks clave (junio 2026)
    - MMLU, GPQA, HumanEval, SWE-bench, MATH
    - Comparativa vs competidores en tabla
## 12. Mejor para (casos de uso donde es el top)
## 13. Peor para (usar otra IA en estos casos)
## 14. Coste
    - Free tier: límites exactos
    - Plan de pago: precio y qué incluye
    - API: precio por millón de tokens input/output
## 15. Privacidad y datos
    - Dónde se procesan los datos
    - ¿Se usan conversaciones para entrenar?
    - Opciones de opt-out
    - Cumplimiento GDPR / regulación EU
## 16. Integración en el ecosistema de Álvaro
    - Cómo se usa actualmente
    - Rol en el protocolo de handoff
## 17. Cómo arrancar sesión
    - Prompt de contexto exacto para empezar

MODELOS CLOUD:
- Claude Sonnet 4.6 (Anthropic)
- GPT-4o + o3 (OpenAI)
- Gemini 2.5 Pro (Google)
- Grok 3 (xAI)
- Mistral Large 2 (Mistral AI)
- Le Chat (Mistral — interfaz web)

MODELOS OPEN SOURCE / LOCAL (Ollama):
- Llama 3.3 70B (Meta)
- Qwen 2.5 72B (Alibaba)
- Deepseek R2 / Deepseek Coder V2
- Mistral 7B / Mixtral 8x7B
- Phi-4 (Microsoft)
- Gemma 3 27B (Google open)
- CodeGemma / StarCoder2

MODELOS ESPECIALIZADOS:
- OCR: PaddleOCR, TrOCR, Tesseract 5
- Embeddings: nomic-embed-text, mxbai-embed-large
- Audio: Whisper large-v3, Kokoro TTS
- Imagen: FLUX.1, Stable Diffusion 3.5

PARA MODELOS OLLAMA, añadir también:
- RAM/VRAM mínima recomendada
- Velocidad estimada tokens/seg en i7 con 16GB RAM sin GPU dedicada
- Comando exacto: ollama pull {modelo}
- Formato recomendado: Q4_K_M, Q5_K_M, etc.

FORMATO FINAL:
- Un bloque markdown completo por modelo
- Benchmarks en tabla comparativa
- Todo listo para subir directamente a GitHub como archivo .md individual
- Fuentes citadas al final de cada ficha
```

---

## 📁 Archivos tocados hoy
- `/etc/netdata/stream.conf` — Madre y Acer
- `/etc/netdata/stream.conf.bak` — backup Acer
- `agentes/README.md` — revisado (pendiente actualizar)
- `agentes/perplexity.md` — revisado
- `inbox/2026-06-22-tarde-netdata-agentes-llm.md` — este archivo

---

_Sesión pausada para paseo con Threa 🐕 — continuar aquí_
_Próximo paso: pasar prompt a Gemini Deep Research → traer output → Perplexity sube fichas al repo_
