# Grok (xAI) — Ficha Técnica THDORA
*Generado por Grok | 15 junio 2026*

## 🏗️ Motor LLM y Arquitectura

| Propiedad | Valor |
|-----------|-------|
| **Modelos principales** | Grok-4.3 (flagship), Grok-4.1 Fast |
| **Arquitectura** | Transformer optimizado por xAI para razonamiento, tool-use y bajo hallucination |
| **Contexto máximo** | Hasta 1M–2M tokens (Grok-4.1 Fast: 2M) |
| **Razonamiento extendido** | ✅ Sí — multi-step agentic |
| **Búsqueda web en tiempo real** | ✅ Sí |
| **Visión/imágenes** | ✅ Sí (análisis y generación) |
| **Audio/voz** | ✅ Parcial (transcripción y síntesis en algunos endpoints) |
| **OCR** | ✅ Sí |
| **Function calling** | ✅ Nativo, paralelo, alto rendimiento |

## 💰 API y Precios (junio 2026)

| Modelo | Input ($/M tokens) | Output ($/M tokens) |
|--------|--------------------|---------------------|
| Grok-4.3 | ~$1.25 | ~$2.50 |
| Grok-4.1 Fast | ~$0.20 | ~$0.50 |

- Compatible con **OpenAI SDK** — migración fácil desde GPT
- Tool calls: costos adicionales por invocación exitosa

## 🔗 Function Calling

✅ **Nativo y de alto rendimiento.** Optimizado para workflows agénticos con RL. Soporta:
- Parallel tool calling
- Structured outputs
- Multi-step razonamiento con tools

Crítico para THDORA: Toki puede llamar `create_appointment`, `log_habit`, `get_context` directamente.

## 🔒 Privacidad y Compliance

| Propiedad | Valor |
|-----------|-------|
| **Sede** | 🇺🇸 EE.UU. (xAI) |
| **Datos procesados en** | Infraestructura xAI (no EU) |
| **SOC 2 Type II** | ✅ Sí |
| **GDPR** | ⚠️ No EU-based — evaluar caso por caso |
| **Zero data retention** | ✅ Disponible para empresas |

> ⚠️ **Para THDORA:** Grok no es EU-based. Usar con anonimización de datos sensibles o consentimiento explícito. No retener historiales largos de usuarios en Grok. Para datos más sensibles usar Mistral (europea) u Ollama (local).

## 🇪🇸 Calidad en Español

**8.5/10** — Excelente comprensión y generación natural. Menos anglicismos forzados que competidores. Puede mejorar en matices culturales hispanos y slang regional (LatAm vs España), pero muy usable en producción.

## 🤖 Tendencia a la Complacencia

**Baja-media.** Grok está diseñado para ser truth-seeking y útil, con menos censura que GPT/Claude. Puede ser directo o sarcastíco (estilo Hitchhiker’s Guide). No tiende a complacer ciegamente si va contra hechos o ética. **Compatible con el carácter anti-complacente de Toki.**

## ✅ Veredicto para THDORA

**Ideal como motor principal o secundario para Toki.**

| Área | Uso en THDORA |
|------|---------------|
| Contexto largo | Memoria de usuario (citas, hábitos, historial) |
| Function calling | Integrar con FastAPI (crear citas, logs, consultas) |
| Búsqueda real-time | Contexto actualizado cuando sea relevante |
| Bajo coste | Grok-4.1 Fast para respuestas simples |
| Razonamiento | Grok-4.3 para análisis de patrones emocionales |

**Estrategia híbrida recomendada:**
- Groq/Llama → latencia ultra-baja en respuestas simples
- Grok-4.1 Fast → NLP + intent + tools (coste bajo)
- Grok-4.3 → análisis de patrones complejos

## 📅 Sesiones documentadas

| Fecha | Tarea | Output | Notas |
|-------|-------|--------|-------|
| 15 jun 2026 | Ficha técnica propia + competidores + frameworks | 3 archivos en repo | Grok leyó repo THDORA completo |
