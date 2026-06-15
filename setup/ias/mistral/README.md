# Mistral AI — Ficha Técnica THDORA
*Última actualización: 15 junio 2026 | Estado: PARCIAL — pendiente completar*

> ⚠️ Esta ficha fue generada por Mistral (Le Chat) el 15 jun 2026 y se cortó a mitad.
> Pendiente: completar secciones de API pricing, embeddings, evaluación THDORA y veredicto.

---

## 🏗️ Motor Técnico

| Propiedad | Valor | Notas |
|-----------|-------|-------|
| **Arquitectura** | Sparse MoE (Mixture of Experts) Transformer | Mistral Large 3: ~675B parámetros totales, ~41B activos/token |
| **Modelos principales** | Large 3, Medium 3.1, Small 3.1, Ministral 3B | |
| **Ventana de contexto** | 128K – 200K tokens | Medium 3.1: 200K, Large 2: 128K |
| **Razonamiento extendido** | ✅ Sí | Modos de reasoning disponibles, control de esfuerzo |
| **Fecha corte conocimiento** | Mayo 2025 | Mistral Medium 3.1 |

---

## 🎨 Capacidades Multimodales

| Capacidad | Soporte | Detalles |
|-----------|---------|----------|
| **OCR / Visión** | ✅ Sí | Comprensión nativa de imágenes y documentos técnicos |
| **Audio (transcripción)** | ✅ Sí | Vía herramientas integradas |
| **Audio (generación voz)** | ❌ No | No disponible |
| **Búsqueda web en tiempo real** | ✅ Sí | Vía conectores (web search) |
| **Ejecución código sandbox** | ✅ Sí | Entorno seguro integrado |

---

## 🔗 Integraciones y API

> ⏳ Sección pendiente de completar con el output completo de Mistral.

| Propiedad | Valor | Notas |
|-----------|-------|-------|
| **API pública** | ✅ Sí | [la-plateforme.mistral.ai](https://la-plateforme.mistral.ai) |
| **Compatible LangChain** | ✅ Sí | `langchain-mistralai` |
| **Function calling** | ✅ Sí | Soportado en Large y Medium |
| **Embeddings propios** | ✅ Sí | `mistral-embed` — multilingüe |
| **MCP** | ❓ Por confirmar | |
| **Precio input/output** | ⏳ Pendiente | |

---

## 🔒 Privacidad y Compliance

> ⏳ Sección pendiente de completar.

| Propiedad | Valor |
|-----------|-------|
| **Sede** | 🇫🇷 Francia (Europa) |
| **Datos procesados en** | Europa |
| **GDPR compliant** | ✅ Sí (empresa europea) |
| **Opt-out entrenamiento** | ⏳ Por confirmar |
| **Tier enterprise** | ⏳ Por confirmar |

---

## 💰 Costes

> ⏳ Sección pendiente de completar con precios actuales.

---

## 🤖 Evaluación para THDORA

> ⏳ Sección pendiente de completar.

### Fortalezas ya identificadas
- ✅ Empresa europea → ventaja GDPR directa
- ✅ OCR nativo → pipeline de fotos de notas manuscritas
- ✅ Embeddings multilingües (`mistral-embed`) → memoria vectorial de Toki
- ✅ Arquitectura MoE eficiente → buen ratio calidad/coste
- ✅ Function calling → agente Toki puede llamar herramientas
- ✅ Sin límite alcanzado a 15 jun 2026

---

## 📅 Sesiones documentadas

| Fecha | Tarea | Output | Notas |
|-------|-------|--------|-------|
| 15 jun 2026 | Ficha técnica propia (parcial) | Este archivo | Se cortó a mitad, pendiente completar |
