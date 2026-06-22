---
tags: [inbox, proyecto, thdora, python, bot, telegram, mvp, auditoria]
fecha: 2026-06-22
estado: 🟡 PENDIENTE
tipo: proyecto
prioridad: alta
---

# 🔧 Thdora — Auditoría + MVP real

## Las 4 preguntas

**¿Qué problema concreto existe?**
Thdora tiene código vivo con deuda técnica acumulada. No está documentado al milímetro, hay partes rotas o a medias, y no hay un MVP claramente definido. Se construyó añadiendo cosas sin una base sólida.

**¿Por qué hay que resolverlo?**
Es el único bot activo del ecosistema. Es la interfaz móvil con Madre. Sin una base sólida, cualquier cosa que se añada encima hereda el caos.

**¿Cómo, lo más simple posible?**
Auditoría archivo a archivo → definir qué 3 comandos deben funcionar perfectamente → reconstruir solo eso.

**¿Cómo se verifica que está resuelto?**
Thdora tiene un README que dice exactamente qué hace. Los 3 comandos MVP funcionan sin errores. Hay documentación de deploy reproducible.

---

## Qué tiene de bueno (conservar)

- Conexión con el ecosistema (Madre, Docker, GitHub API)
- Stack Docker funcional (6/6 servicios)
- API FastAPI healthy
- Integración Telegram operativa
- Base PostgreSQL

## Qué tiene de malo (resolver)

- Código sin documentar al milímetro
- Funcionalidades a medias o rotas
- Sin MVP claramente definido
- Sin tests
- Deploy no reproducible documentado

---

## Plan de trabajo

### FASE 1 — Auditoría (~2h, sesión dedicada)

```
1. Leer src/ archivo a archivo
2. Por cada archivo documentar:
   - ¿Qué hace realmente?
   - ¿Funciona?
   - ¿Es necesario para el MVP?
3. Resultado: mapa real del código
```

### FASE 2 — Definir MVP (~30 min)

```
Pregunta: ¿Qué es lo MÍNIMO útil de verdad?
Regla: 3 comandos que funcionen perfectamente
        > 20 comandos a medias

Candidatos MVP:
  /start   → confirmación que el bot responde
  /inbox   → capturar nota desde Telegram a yggdrasil-dew
  /estado  → ver estado Docker de Madre
```

### FASE 3 — Reconstruir sobre base sólida

```
- Documentación al milímetro desde el principio
- Cada función tiene docstring
- README con arquitectura real
- docs/DEPLOY.md reproducible
- docs/TROUBLESHOOTING.md
- Tests básicos para los 3 comandos MVP
```

---

## Criterio de éxito

- [ ] `src/` documentado archivo a archivo
- [ ] MVP de 3 comandos definido y funcionando
- [ ] `docs/DEPLOY.md` — cualquiera puede desplegarlo desde cero
- [ ] `/start` responde en Telegram sin errores
- [ ] Sin deuda técnica nueva al añadir cada feature

---

_Creado: 22 jun 2026 · Origen: sesión tarde Perplexity_
_Ver: [[inbox/MASTER-PENDIENTES]] · [[CONTEXT]] · [[proyectos/thdora-docs]]_
