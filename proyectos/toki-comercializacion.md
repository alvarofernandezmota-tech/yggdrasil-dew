# toki-comercializacion.md — Exploración de viabilidad

> Documento de reflexión sobre la posible comercialización del ecosistema TOKI + second brain.
> Fecha: 16 junio 2026 · Sesión nocturna.

---

## 1. Qué existe hoy (estado real)

- thdora: Bot de Telegram + FastAPI corriendo en Madre. v0.17.0 multiuser en rama.
- yggdrasil-dew: Second brain Git-first en GitHub (diarios, contexto, ecosistema).
- ai-toolkit: Toolbox IA + OpenCode + LiteLLM para orquestar modelos.
- Arquitectura documentada: ECOSISTEMA.md (yggdrasil-dew) + ARQUITECTURA-PIPELINE.md (ai-toolkit).

Conclusión: Ya existe un "producto" técnico completo a nivel personal: asistente de vida/salud mental (TOKI) + second brain + agentes.

---

## 2. Qué sería comercializable

### 2.1. TOKI como app B2C

Idea: App (Telegram + móvil) de asistente personal / salud mental que:
- Recuerda tu historia y contexto (diario personal).
- Funciona sobre texto plano + Git (no bases de datos propietarias).
- Usa LLMs para reflexión, planificación, regulación emocional.

Requisitos para B2C:
- Multi-tenant real (cada usuario con su vault/espacio separado).
- Aislamiento estricto de datos (nada compartido entre usuarios).
- UX simple: onboarding, comandos claros, explicación de límites.
- Modelo de negocio: freemium + suscripción mensual.

### 2.2. El stack como producto B2B / "AI OS"

Idea: vender el stack entero (Madre + thdora + ai-toolkit + yggdrasil-dew) como:
- "Second brain auto-hospedado" para devs, freelancers, teams pequeños.
- Instalación en su propio servidor (o en una VPS barata).
- Incluye: bot personalizado + vault + agentes de código.

Modelo de negocio:
- Pago por setup/implantación + soporte recurrente.
- Formación / consultoría sobre cómo usar/reconfigurar.

### 2.3. Open source + monetización indirecta

- Todo el código se libera bajo licencia permisiva (MIT / Apache-2.0).
- Se crea comunidad de usuarios/contribuidores.
- Se monetiza vía:
  - Hosting gestionado ("págame para no configurarlo tú").
  - Soporte premium.
  - Integraciones a medida.

---

## 3. Problemas gordos actuales (bloqueos para producto)

1. **Single-user hardcoded:**
   - Mucha lógica está pensada para "Álvaro" como único usuario.
   - No hay separación clara de espacios ni multi-tenant serio.

2. **Infraestructura doméstica:**
   - Madre es una torre en casa, no infra redundante.
   - Para B2C/B2B real se necesitaría despliegue en cloud (o en servidores del cliente) con backups, monitorización, etc.

3. **Sin modelo de negocio definido:**
   - No hay decisión sobre si el objetivo es B2C, B2B o solo open-source.

4. **Riesgos legales/éticos (salud mental):**
   - Si se posiciona TOKI como herramienta de salud mental, hay responsabilidad.
   - Necesita disclaimers claros: no es terapeuta, no sustituye atención profesional.

---

## 4. Posibles direcciones estratégicas

### Estrategia A — Producto personal polish + open source

- Enfocar el proyecto como "OS personal de IA" bien acabado.
- Publicar repos y docs como referencia para otros devs.
- No intentar venderlo todavía; centrarse en hacerlo sólido para ti.

Pros:
- 100% alineado con motivación actual.
- Menos presión de soporte/negocio.

Contras:
- No monetiza directamente.

### Estrategia B — Consultoría / setups a medida

- Ofrecer montar este stack a otros devs/freelancers.
- Cada cliente tiene su "Madre" propia.

Pros:
- Monetiza tu ventaja técnica sin tener que escalar un SaaS.

Contras:
- Trabajo manual por cliente; menos escalable.

### Estrategia C — SaaS mínimo viable (TOKI multi-usuario)

- Deploy en una VPS con thdora multi-tenant.
- Cada usuario tiene un espacio lógico (no necesariamente un repositorio Git separado al principio).

Pros:
- Producto claro para usuarios finales.

Contras:
- Requiere mucha más responsabilidad e infraestructura.

---

## 5. Decisiones que tendría que tomar Álvaro antes de "hacer producto"

1. ¿Quiero que TOKI sea una herramienta pública o solo mi asistente personal?
2. ¿Quiero vender el stack como servicio (consultoría) o como SaaS (producto)?
3. ¿Estoy dispuesto a gestionar datos de otros (responsabilidad, seguridad, RGPD)?
4. ¿Qué nivel de privacidad quiero garantizar (on-premise vs cloud)?

---

## 6. Próximos pasos si se quiere explorar comercialización

Paso 1 — Terminar v0.17.0 multiuser
- Merge de la rama actual.
- Revisión de modelo de datos multiusuario.

Paso 2 — Diseño funcional de "TOKI público"
- Definir comandos, límites, disclaimers.
- Decidir: ¿solo Telegram? ¿web también?

Paso 3 — Probar con 3-5 usuarios de confianza
- No cobrar al principio.
- Recoger feedback sobre uso real.

Paso 4 — Evaluar esfuerzo/beneficio
- Si compensa, invertir en infra más seria.
- Si no, mantenerlo como proyecto personal avanzado.

---

_Última actualización: 16 junio 2026 — 23:00 CEST_
