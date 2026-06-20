---
tags: [agente, ia, opencode, terminal, editor]
fecha-actualizacion: 2026-06-20
---

# 🟢 OpenCode — Terminal y editor

## Qué es
Agente de código que corre directamente en el terminal. Sin salir del editor. Accede a archivos locales y ejecuta comandos.

## Para qué se usa
- Código que necesita leer archivos locales en tiempo real
- Refactorizaciones sin salir del terminal
- Automatizaciones en varopc o Madre vía SSH

## Para qué NO se usa
- Escribir en GitHub directamente → [[agentes/perplexity]]
- Datos frescos → [[agentes/grok]]
- Arquitectura compleja → [[agentes/gemini]]

## Cómo activar
```bash
# En varopc o Madre
opencode
# o desde el proyecto
cd ~/Projects/thdora && opencode
```

## Protocolo
```
OpenCode (ejecuta local) → git push → Perplexity (documenta en ygg)
```

---
_Ver también: [[agentes/perplexity]] · [[setup/varopc]] · [[HOME]]_
