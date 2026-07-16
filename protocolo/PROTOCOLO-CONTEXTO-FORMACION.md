---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CONTEXTO-FORMACION.md
tags: [protocolo, contexto, formacion, agente, apertura, aprendizaje]
status: vigente
version: 1.0
---

# PROTOCOLO-CONTEXTO-FORMACION v1.0

> Este protocolo carga el contexto de `yggdrasil-formacion` al inicio de cualquier sesión
> que implique trabajo en aprendizaje técnico, cursos, HTB, o desarrollo de skills.

---

## 1. Propósito del repo

`yggdrasil-formacion` es el **espacio de aprendizaje técnico** de Álvaro:
- Apuntes técnicos por área
- Cursos y plataformas (HTB, TryHackMe, Udemy, etc.)
- Recursos y referencias técnicas
- Skills y competencias en desarrollo

> ⚠️ Nota histórica: este repo se llamaba `yggdrasil-formacion-` (con guión final) antes del 2026-07-13
> y `formacion-tech` antes de eso. El nombre canónico vigente es `yggdrasil-formacion` (sin guión).

No contiene: diarios personales (eso es yggdrasil-tracking), diarios de sesión (eso es DEW).

---

## 2. Checklist de contexto al abrir sesión

```
[ ] Verificar qué área o curso involucra la sesión
[ ] Leer README del área correspondiente si existe
[ ] Confirmar que el contenido es técnico (no personal)
[ ] Verificar que no hay contenido personal mezclado (pendiente auditoría post-migración)
```

---

## 3. Estructura esperada del repo

```
yggdrasil-formacion/
├── README.md          ← descripción del repo y estructura
├── cursos/            ← apuntes por curso/plataforma
├── labs/              ← HTB, TryHackMe, labs técnicos
├── apuntes/           ← apuntes por área técnica
├── recursos/          ← referencias, links, herramientas
├── skills/            ← estado de competencias
└── inbox.md           ← captura rápida de aprendizaje
```

> La estructura real puede diferir hasta la próxima auditoría completa (pendiente post-migración).

---

## 4. Flujo de aprendizaje del ecosistema

```
yggdrasil-formacion (aprendo)
    │
    ▼
dev-labs / investigacion-ia (experimento)
    │
    ▼
THDORA / yggdrasil-scripts (produzco)
```

---

## 5. Reglas críticas de Formación

- Todo lo aprendido debe tener salida: script, PoC, mejora a THDORA, o entrada en WIKI.
- No mezclar diarios personales con apuntes técnicos.
- La isla Wiki correspondiente es: [wiki/islas/formacion.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/formacion.md)
- El ESTADO-ISLA está en DEW: [docs/islas/ESTADO-ISLA-FORMACION.md](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/blob/main/docs/islas/ESTADO-ISLA-FORMACION.md)

---

_Creado: 2026-07-16 · F13 Protocolo Contexto Formacion v1.0 · Perplexity MCP_
