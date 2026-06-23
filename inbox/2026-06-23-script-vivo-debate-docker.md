# SCRIPT VIVO — Debate Multi-IA Docker Servidor Madre
**Fecha inicio:** 2026-06-23  
**Estado:** 🟡 RONDA 1 en curso  
**IAs participantes:** Gemini · Grok · Mistral · Perplexity (síntesis)  
**Metodología:** script crece cada ronda → se resume al final de cada vuelta

---

## CÓMO FUNCIONA ESTE SCRIPT

1. Cada ronda **añade contexto** al script, no lo reemplaza
2. Al final de cada ronda Perplexity hace un **resumen ejecutivo**
3. El resumen se convierte en el contexto de la siguiente ronda
4. Al final de las 2 rondas queda el **documento de decisión final**

```
RONDA 1: cada IA responde sola
    ↓
PERPLEXITY: sintetiza + extrae acuerdos y discrepancias
    ↓
RONDA 2: cada IA ve el resumen de las demás y debate
    ↓
PERPLEXITY: cierre final + decisión técnica adoptada
    ↓
REPO: commit con todo documentado
```

---

## PROMPT BASE — RONDA 1

> Pega este bloque en Gemini, Grok y Mistral sin modificar.

```
=== PROMPT RONDA 1 ===

SISTEMA: Eres un ingeniero de infraestructura senior con experiencia en Docker, Linux, redes y arquitectura de servidores locales.

CONTEXTO:
Tengo un servidor Ubuntu llamado "Madre" montando un stack de IA privada con Docker Compose:
- Ollama (motor IA local)
- Open WebUI (interfaz web tipo ChatGPT)
- Qdrant (base de datos vectorial para RAG)

PROBLEMA:
Descargas Docker fallan con "tls: bad record MAC". Servidor conectado vía hotspot Redmi. Ollama y Qdrant descargados tras reintentos. Open WebUI en progreso. Stack aún no levantado.
Tailscale instalado pero "Unit tailscale.service not found".
Suspensión deshabilitada. docker-compose.yml con atributo version obsoleto.

OBJETIVO: servidor que arranque solo, contenedores automáticos, red estable, sistema documentado.

---

ANTES DE RESPONDER, PRESÉNTATE:

1. IDENTIDAD
   - Nombre comercial + nombre técnico exacto
   - Versión / variante
   - Fecha de corte de conocimiento
   - ¿Usas thinking/reasoning mode ahora?
   - Empresa desarrolladora

2. CAPACIDADES
   - Fortalezas para Docker, Linux, redes
   - Limitaciones para este caso
   - Confianza 1-10

3. ÉTICA
   - ¿Puedes garantizar que es correcto?
   - Cómo distingues certeza (✅) de suposición (⚠️)
   - Qué haces si no sabes algo

---

RESPONDE AL PROBLEMA:

4. DIAGNÓSTICO — causas del error tls bad record MAC, ordenadas por probabilidad
5. SOLUCIÓN RED — estabilizar hotspot Redmi + Ubuntu
6. SOLUCIÓN DOCKER — terminar descarga + levantar stack
7. ARRANQUE AUTOMÁTICO — Docker + contenedores al boot
8. RIESGOS — qué puede fallar, qué mejorarías
9. COMENTARIO FINAL — una cosa que harías diferente

USA ✅ para certeza y ⚠️ para suposición. Sé directo y técnico.

=== FIN PROMPT RONDA 1 ===
```

---

## RESPUESTAS RONDA 1

### GEMINI — Ronda 1
> *pendiente de recoger*

---

### GROK — Ronda 1
> *pendiente de recoger*

---

### MISTRAL — Ronda 1
> *pendiente de recoger*

---

## RESUMEN EJECUTIVO RONDA 1
> *Perplexity sintetiza aquí cuando lleguen las 3 respuestas*

- **Puntos de acuerdo:**
- **Puntos de discrepancia:**
- **Lo más interesante:**
- **Pregunta para Ronda 2:**

---

## PROMPT RONDA 2
> *Se genera automáticamente después del resumen de Ronda 1*
> *Incluirá el resumen de las otras IAs para provocar debate real*

```
=== PROMPT RONDA 2 === (se completará después de Ronda 1)

Eres la misma IA de antes. Recuerdas tu respuesta de la Ronda 1.

Las otras IAs han respondido lo siguiente al mismo problema:

[GEMINI dijo:] ...
[GROK dijo:] ...
[MISTRAL dijo:] ...

Perplexity ha hecho esta síntesis: ...

Ahora:
1. ¿Estás de acuerdo con el diagnóstico mayoritario?
2. ¿Dónde discrepas y por qué?
3. ¿Cambia algo de tu respuesta anterior?
4. ¿Qué aportación única tienes que las demás no han mencionado?
5. Propuesta final consolidada: los 3 pasos más importantes a hacer ahora mismo

=== FIN PROMPT RONDA 2 ===
```

---

## RESPUESTAS RONDA 2

### GEMINI — Ronda 2
> *pendiente*

---

### GROK — Ronda 2
> *pendiente*

---

### MISTRAL — Ronda 2
> *pendiente*

---

## CIERRE FINAL — Perplexity
> *Se completa al final de Ronda 2*

- **Decisión técnica adoptada:**
- **Modelo más preciso en diagnóstico:**
- **Modelo más honesto:**
- **Modelo más útil en práctica:**
- **Acciones inmediatas:**
- **Documento de acción generado:**
