# THDORA — Índice del Proyecto
*Última actualización: 15 junio 2026*

THDORA es el proyecto principal activo. Este directorio es el punto de entrada para entender el estado del proyecto sin tener que abrir el repo de código.

## ¿Qué es THDORA?

Diario de vida inteligente en WhatsApp y Telegram, gestionado por **Toki**, un agente de IA con personalidad propia que procesa audios, textos y notas manuscritas para revelar los patrones ocultos del estado de ánimo, energía y rendimiento del usuario. Sin app. Sin formularios. Sin fricción.

**Repositorio de código:** [github.com/alvarofernandezmota-tech/thdora](https://github.com/alvarofernandezmota-tech/thdora)

## Estado actual (15 jun 2026)

| Área | Estado | Notas |
|------|--------|-------|
| Visión y posicionamiento | ✅ Documentado | Ver `thdora/docs/VISION.md` |
| Estudio de mercado (Gemini) | ✅ Documentado | Ver `thdora/docs/MARKET_STUDY.md` |
| Estudio de mercado (Claude) | ✅ Documentado | Ver `thdora/docs/MARKET_STUDY_2.md` |
| Stack técnico de IA | ✅ Documentado | Ver `thdora/docs/AI_STACK.md` |
| MVP bot Toki | 🔄 En progreso | Rama `feature/agent-platform-v2` |
| Docker / servidor | ❌ Pendiente | Prioridad antes del MVP |
| Modo voz (Toki Ambient) | 💡 Visión documentada | Ver MARKET_STUDY_2.md sección 11 |

## Documentos clave (en el repo thdora)

| Documento | Descripción |
|-----------|-------------|
| `docs/VISION.md` | Visión completa del producto |
| `docs/MARKET_STUDY.md` | Estudio mercado #1 — Gemini (TAM/SAM/SOM, personas, roadmap) |
| `docs/MARKET_STUDY_2.md` | Estudio mercado #2 — Claude (España/Europa, DAFO, modelo de negocio, modo voz) |
| `docs/AI_STACK.md` | Stack de IAs: qué modelo hace qué en el backend de Toki |
| `docs/CEIP_DIARIO_BOLSILLO.md` | Concepto expandido del diario de bolsillo |

## Decisiones de producto tomadas

1. **Canal:** WhatsApp (primario) + Telegram (secundario)
2. **Agente:** Toki — personalidad propia, anti-complacente, honesto
3. **Precio:** Free + Pro $7,99/mes + Terapia $14,99/mes
4. **Mercado inicial:** Hispanohablante (España + LATAM)
5. **Arquitectura:** LangChain + FastAPI + PostgreSQL + Redis
6. **Modo voz:** Hoja de ruta 4 fases (2026-2028)

## Próximos pasos

- [ ] Lanzar MVP bot Toki (mensaje diario + respuesta con contexto)
- [ ] Dockerizar el bot
- [ ] Montar servidor Hetzner
- [ ] 100 usuarios beta en Q3 2026

## Conexión con personal-v2

Este repo (`personal-v2`) es el diario y sistema operativo personal del fundador. THDORA y personal-v2 están conectados: las decisiones del proyecto se documentan aquí, el código vive en el repo de THDORA.
