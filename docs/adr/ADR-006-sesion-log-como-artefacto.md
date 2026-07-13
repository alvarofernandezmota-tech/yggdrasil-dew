---
id: ADR-006
titulo: Los logs de sesión son artefactos de primer nivel
fecha: 2026-07-13
estado: aceptado
author: Alvaro Fernandez Mota
tags: [adr, sesiones, logs, trazabilidad]
principio: Transparencia interna
---

# ADR-006 — Los logs de sesión son artefactos de primer nivel

## Contexto

Cada sesión de trabajo con un agente IA produce commits, issues cerrados, decisiones tomadas y nueva documentación. Sin un log de sesión, esta información se pierde en el historial de git o en el chat.

## Decisión

Cada sesión de trabajo significativa genera un archivo en `docs/sesiones/YYYY-MM-DD-sesion-[momento].md` con:

- Resumen ejecutivo (3 frases)
- Tabla de commits realizados (repo, archivo, descripción)
- Issues cerrados con link
- Issues creados con link
- Estado del triángulo al final de sesión
- Pendientes para próxima sesión / terminal

Además, cada log de sesión técnica se referencia en el diario del día en VIDAPERSONAL.

## Consecuencias

- Continuidad entre sesiones: cualquier agente puede retomar el trabajo desde el último log
- Trazabilidad completa: cada decisión tiene fecha, contexto y consecuencia documentadas
- El `PLAN-MAESTRO-FASES.md` se actualiza cada sesión con el LOG correspondiente

---
_Aceptado: 2026-07-13 · Principio: Transparencia interna_
