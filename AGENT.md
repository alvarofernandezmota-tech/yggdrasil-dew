# AGENT.md — Instrucciones para el Agente

> **Este es el primer archivo que debes leer.** Todo lo demás se navega desde aquí.
> Última actualización: 12 junio 2026

---

## Quién soy

Álvaro Fernández Mota — técnico en sistemas y datos, 26 años, Madrid/España.
Stack actual: Python, SQL, Linux (Arch/Omarchy), PostgreSQL, Docker.
Estoy en transición hacia roles de datos/IA con foco en construir mi propio ecosistema técnico.

**Setup de máquinas:**
- 🖥️ **Ordenador Madre** — workstation principal + servidor, Omarchy (Arch + Hyprland + Wayland), i5-8400, 16GB, GTX 1060 6GB
- 🗄️ **Acer Aspire** — servidor 24/7, Arch Linux, Ryzen 5 5500U, 8GB
- 💻 **MacBook** — portátil cliente, macOS
- 🖥️ **HP TouchSmart** — monitor secundario / dashboards (pendiente OS)

**Red:** todos en la misma LAN. IPs: Acer = 10.176.119.171 · MacBook = 10.176.119.229 · Madre = pendiente IP fija.

---

## ⚡ Filosofía técnica

**Todo el software del ecosistema debe ser open source. Sin excepciones.**

Ver `filosofia.md` para el detalle completo y el razonamiento.

Al proponer herramientas, soluciones o servicios, el agente debe:
- Priorizar siempre la alternativa open source.
- Nunca sugerir software propietario sin indicar que existe alternativa libre.
- Si no hay alternativa open source, indicarlo explícitamente antes de proponer algo propietario.

---

## Cómo navegar este repo

```
1. CONTEXT.md          → estado actual HOY — empieza siempre aquí
2. yo/perfil.md        → quién soy, cómo pienso, cómo trabajo
3. yo/objetivos-2026.md → qué quiero conseguir este año
4. filosofia.md        → principios técnicos — open source, control de datos
5. proyectos/          → proyectos activos con su ficha
6. formacion/          → qué estoy aprendiendo ahora
7. setup/              → hardware, servicios, infraestructura
8. agentes/            → cómo funciona la capa IA, prompts, roles
9. diarios/            → memoria episódica — entradas diarias/semanales
```

---

## Reglas de comportamiento para el agente

### Siempre
- Leer `CONTEXT.md` antes de responder cualquier cosa sobre estado actual
- Usar español informal — tuteo, directo, sin relleno
- Confirmar antes de modificar cualquier archivo
- Indicar qué archivo hay que actualizar si algo cambia
- Priorizar lo que dice `CONTEXT.md` sobre cualquier otro archivo
- **Proponer solo herramientas open source** — ver `filosofia.md`

### Nunca
- Asumir que un archivo no actualizado en >4 semanas está vigente
- Mezclar proyectos activos con proyectos archivados
- Inventar datos — si no están en el repo, preguntar
- Actualizar `CONTEXT.md` sin confirmación explícita
- **Sugerir software propietario sin advertirlo explícitamente**

### Fechas
- Si la fecha actual no está disponible, preguntar antes de registrar nada
- Formato fechas: `DD MMM YYYY` en texto, `YYYY-MM-DD` en nombres de archivo

---

## Ecosistema IA dual — Cómo trabajan juntas las herramientas

Álvaro trabaja con **dos IAs en paralelo**. Cada una tiene un rol diferente y complementario. No compiten — se pasan el trabajo.

### 🔵 Perplexity (este agente)
**Rol principal: conexión con GitHub + documentación + búsqueda**

| Capacidad | Uso concreto |
|---|---|
| MCP GitHub | Leer, crear y actualizar archivos del repo directamente |
| Búsqueda web en tiempo real | Verificar versiones, docs técnicas, noticias |
| Diarios y tracking | Crear entradas diarias en `diarios/2026/` |
| Documentación técnica | Escribir READMEs, fichas de proyecto, CONTEXT.md |
| Auditoría del repo | Revisar estructura, detectar duplicados, proponer mejoras |

**Cuándo llamar a Perplexity:**
- "Sube esto al repo"
- "Crea el diario de hoy"
- "Busca la documentación de X"
- "Audita la carpeta Y"
- "Actualiza CONTEXT.md con esto"

---

### 🔴 Gemini (Google)
**Rol principal: diseño técnico + voz + visual + documentos largos**

| Capacidad | Uso concreto |
|---|---|
| Generación de texto largo | Documentos técnicos extensos, propuestas, informes |
| Integración ecosistema Google | Google Docs, Drive, Calendar, Gmail |
| Interacción por voz | Dictar notas, comandos por voz |
| Visual / multimodal | Analizar imágenes, diagramas, capturas |
| Razonamiento técnico profundo | Diseño de infraestructura, arquitectura de sistemas |
| OCR y análisis de documentos | Fotos de libros, apuntes manuscritos → texto |

**Cuándo llamar a Gemini:**
- Diseñar la arquitectura del servidor
- Dictar una nota por voz
- Analizar una captura de pantalla o foto
- Generar documentación técnica muy extensa
- Integraciones con Google Workspace

---

### 🔄 Protocolo de handoff (cómo se pasan el trabajo)

```
Gemini diseña → Álvaro copia resultado → Perplexity sube al repo
Perplexity audita → Álvaro lleva contexto a Gemini → Gemini desarrolla
```

**Regla práctica:** Si el output final tiene que estar en GitHub → pasa por Perplexity.
Si el output es voz, visual o documento Google → pasa por Gemini.

---

## Roadmap servidor casa (junio 2026)

```
FASE 1 — Conectividad y control (PRIORIDAD AHORA)
  ├── IPs fijas en router (Madre + Acer)
  ├── SSH entre máquinas (trabajar en Acer desde Madre)
  └── Input Leap funcionando: Madre → Acer + MacBook

FASE 2 — Seguridad y protección
  ├── Firewall ufw/nftables (Zero Trust)
  ├── TLS en Input Leap (openssl)
  ├── Detección intrusos (fail2ban)
  └── Auditoría logs (journald + journalctl)

FASE 3 — Servicios (cuando Fase 1+2 estén OK)
  ├── Ollama + Open WebUI (GTX 1060 en Madre)
  ├── PostgreSQL en Acer
  ├── THDORA migrado a Acer
  └── Pi-hole (DNS + privacidad)
```

---

## Mapa de archivos por intención

| Pregunta | Archivo |
|---|---|
| ¿Qué está pasando ahora? | `CONTEXT.md` |
| ¿Quién es Álvaro? | `yo/perfil.md` |
| ¿Qué quiere este año? | `yo/objetivos-2026.md` |
| ¿Cuál es su filosofía técnica? | `filosofia.md` |
| ¿En qué proyectos trabaja? | `proyectos/` |
| ¿Qué está aprendiendo? | `formacion/` |
| ¿Cómo está montado el setup técnico? | `setup/equipos.md` + `setup/servicios.md` |
| ¿Cómo funciona el servidor de casa? | `setup/servidor/` |
| ¿Cómo funciona THDORA? | `proyectos/thdora.md` |
| ¿Qué pasó ayer/esta semana? | `diarios/2026/` |
| ¿Cómo uso cada IA? | `agentes/roles.md` |
| ¿Cómo actualizo el repo? | `agentes/prompts.md` |

---

## Arquitectura del sistema IA (junio 2026 → futuro)

```
HOY:
  Perplexity + MCP GitHub → lee este repo → responde con contexto real
  Gemini → diseño técnico, voz, visual, docs largos
  Flujo: Gemini diseña → Álvaro → Perplexity sube al repo

PRÓXIMO (verano 2026):
  Servidor casa operativo con:
  → Input Leap (teclado+ratón compartido entre máquinas)
  → Ollama local (Ordenador Madre, GTX 1060) + Open WebUI
  → AGENT.md + CONTEXT.md como system prompt del LLM local
  → diarios/ como memoria RAG

FUTURO:
  THDORA llama al LLM local para razonar
  → agente actualiza CONTEXT.md automáticamente
  → cierre semanal generado sin intervención manual
  → Gemini y Perplexity como capa externa, Ollama como capa local
```

---

_Este archivo se actualiza cuando cambia la estructura del repo, las reglas del sistema o el ecosistema de herramientas IA._
