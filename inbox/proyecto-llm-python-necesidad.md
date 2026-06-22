---
tags: [inbox, proyecto, python, llm, ia-local, ollama, machine-learning, pentest]
fecha: 2026-06-22
estado: 🟡 PENDIENTE
tipo: proyecto
prioridad: media
---

# 💡 Proyecto LLM + Python — Necesidad real a definir

## Las 4 preguntas

**¿Qué problema concreto existe?**
Hay capacidad técnica instalada (Ollama en Madre, Python, infraestructura) sin ningún proyecto concreto que la use. El potencial está ahí pero sin aplicación real.

**¿Por qué hay que resolverlo?**
Aprender Python con problemas reales propios > ejercicios inventados. Cada proyecto construido tiene doble valor: aprendizaje + mejora del ecosistema.

**¿Cómo, lo más simple posible?**
Elegir UNA necesidad real que duela ahora mismo → construir la solución más simple posible en ≤100 líneas de Python.

**¿Cómo se verifica que está resuelto?**
El script resuelve el problema concreto. Se usa de verdad, no es un juguete.

---

## Candidatos — ordenados por valor real ahora

| # | Proyecto | Stack | Líneas est. | Valor |
|---|---|---|---|---|
| 1 | **Scanner red + reporte LLM** | Python + nmap + Ollama | ~80 | 🔥🔥🔥 pentest |
| 2 | **Clasificador inbox automático** | Python + Ollama + GitHub API | ~60 | 🔥🔥🔥 ecosistema |
| 3 | **Generador diario desde commits** | Python + GitHub API + Ollama | ~50 | 🔥🔥 ecosistema |
| 4 | **Generador wordlists OSINT** | Python + lógica + LLM | ~70 | 🔥🔥🔥 pentest |
| 5 | **Chatbot CLI sobre notas** | Python + Ollama + embeddings | ~120 | 🔥🔥🔥 ecosistema |
| 6 | **Clasificador spam/phishing** | Python + sklearn | ~100 | 🔥🔥 ML |

---

## Criterio de selección — antes de empezar

```
1. ¿Lo hago a mano ahora y duele?
   Sí → tiene sentido automatizar
   No → no hace falta

2. ¿El resultado mejora algo concreto del ecosistema?
   Sí → adelante
   No → es un juguete

3. ¿Cabe en ≤100 líneas de Python?
   Sí → esa es la v1.0
   No → estás complicando algo simple
```

---

## Principio de IA local aplicado

- Todo corre en Madre — sin APIs externas, sin coste, sin privacidad comprometida
- Ollama ya está instalado y funcionando (`100.91.112.32:11434`)
- Modelo recomendado para empezar: `qwen2.5:7b` — rápido y capaz
- La infraestructura ya está. Solo hay que escribir el script.

---

## Próximo paso

- [ ] Elegir UNO de los 6 candidatos aplicando el criterio de selección
- [ ] Crear ficha específica del proyecto elegido en `proyectos/`
- [ ] Escribir la v1.0 en `tools/`

---

_Creado: 22 jun 2026 · Origen: sesión tarde Perplexity_
_Ver: [[inbox/MASTER-PENDIENTES]] · [[filosofia]] · [[inbox/proyecto-tools-ecosistema]]_
