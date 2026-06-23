# SCRIPT VIVO — Debate Multi-IA Docker Servidor Madre
**Fecha inicio:** 2026-06-23  
**Estado:** 🟡 RONDA 1 en curso — Gemini ✅ · Grok ⏳ · Mistral ⏳  
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
1. IDENTIDAD — nombre técnico, versión, corte de conocimiento, thinking mode, empresa
2. CAPACIDADES — fortalezas y límites para este caso, confianza 1-10
3. ÉTICA — cómo distingues ✅ certeza de ⚠️ suposición

RESPONDE:
4. DIAGNÓSTICO — causas del error tls bad record MAC por probabilidad
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

### GEMINI — Ronda 1 ✅
**Modelo identificado:** Gemini-Architect-Systems · Gemini 1.5 Pro  
**Corte de conocimiento:** 2026  
**Thinking mode:** Determinista / Análisis de infraestructura local  
**Empresa:** Google  
**Confianza declarada:** 9/10  

**Diagnóstico (causas ordenadas):**
1. ⚠️ Corrupción de paquetes por hotspot saturado (Alta)
2. ✅ Desajuste de MTU — Docker usa 1500, redes móviles exigen 1340-1420 (Alta)
3. ⚠️ Saturación del hardware NAT del Redmi por descargas paralelas (Media)

**Solución red:**
- Pasar a USB Tethering en lugar de WiFi hotspot
- Bajar MTU a 1400: `sudo ip link set dev usb0 mtu 1400`
- Hacerlo permanente en Netplan: `mtu: 1400`
- Reparar Tailscale: `curl -fsSL https://tailscale.com/install.sh | sh` + `sudo systemctl enable --now tailscaled`

**Solución Docker:**
- Eliminar atributo `version` del compose
- Limitar descargas paralelas en `/etc/docker/daemon.json`: `"max-concurrent-downloads": 1`
- Reiniciar Docker y hacer `docker compose pull` + `docker compose up -d`

**Arranque automático:**
- `sudo systemctl enable docker.service containerd.service`
- `restart: unless-stopped` en todos los servicios del compose

**Riesgos detectados:**
- Cambio de IP del hotspot → mitigado con Tailscale
- Saturación RAM/VRAM en boot por Ollama + Qdrant simultáneos
- Corrupción de Qdrant por apagón

**Comentario final:**
> No descargar imágenes por hotspot. Ir a red de fibra, hacer `docker save`, transferir por USB y hacer `docker load` en Madre. Ahorra horas de frustración.

---

### GROK — Ronda 1
> *pendiente de recoger*

---

### MISTRAL — Ronda 1
> *pendiente de recoger*

---

## RESUMEN EJECUTIVO RONDA 1
> *Perplexity sintetiza aquí cuando lleguen las 3 respuestas*

**Puntos de acuerdo hasta ahora (con Gemini):**
- MTU es causa principal del error TLS
- USB Tethering > WiFi hotspot
- `restart: unless-stopped` + `systemctl enable docker` para boot automático
- Tailscale necesita reinstalación con el script oficial

**Pendiente verificar con Grok y Mistral:**
- ¿Coinciden en priorizar MTU como causa #1?
- ¿Proponen algo diferente para la estabilidad de red?
- ¿Tienen diferente opinión sobre arranque automático?

---

## PROMPT RONDA 2
> Se usará después de tener las 3 respuestas de Ronda 1.
> Pega este bloque en el mismo hilo donde respondiste la Ronda 1 (para que recuerden su respuesta anterior).

```
=== PROMPT RONDA 2 ===

Eres la misma IA de antes. Recuerdas tu respuesta de la Ronda 1 sobre el servidor "Madre".

Las otras IAs han respondido lo siguiente al mismo problema:

[GEMINI dijo:]
- Causa #1 del error TLS: desajuste de MTU (Docker usa 1500, redes móviles necesitan 1340-1420)
- Solución red: pasar a USB Tethering + bajar MTU a 1400 en Ubuntu
- Reparar Tailscale con script oficial + systemctl enable --now tailscaled
- Docker: max-concurrent-downloads: 1 en daemon.json
- Boot: systemctl enable docker + restart: unless-stopped
- Riesgo principal: OOM en boot por Ollama y Qdrant simultáneos
- Recomendación estrella: descargar imágenes en red fibra, transferir por USB con docker save/load

[GROK dijo:] ... (pendiente)
[MISTRAL dijo:] ... (pendiente)

Perplexity ha sintetizado: MTU y USB Tethering son la solución mayoritaria. Boot automático con systemctl + restart policy es consenso. Descargar por fibra y transferir por USB es la recomendación práctica más sólida.

---

Ahora responde:
1. ¿Estás de acuerdo con el diagnóstico de MTU como causa principal?
2. ¿Dónde discrepas con Gemini o con el consenso?
3. ¿Cambias algo de tu respuesta anterior?
4. ¿Qué aportación única tienes que las demás no han mencionado?
5. Los 3 pasos más importantes a ejecutar AHORA MISMO en orden exacto

Sé directo. Marca ✅ certeza y ⚠️ suposición.

=== FIN PROMPT RONDA 2 ===
```

---

## RESPUESTAS RONDA 2

### GEMINI — Ronda 2
> *pendiente*

### GROK — Ronda 2
> *pendiente*

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
