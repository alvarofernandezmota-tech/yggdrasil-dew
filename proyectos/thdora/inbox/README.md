---
tags: [inbox, thdora, proyecto, sistema]
fecha-actualizacion: 2026-06-20
---

# 📥 Inbox thdora

> Inbox específico del proyecto thdora.
> Solo entra aquí lo que ya sabemos que es de thdora.
> Lo que no sabemos dónde va → al inbox global `inbox/` primero.

---

## 📐 Flujo de este inbox

```
Algo nuevo sobre thdora
        ↓
¿Sabemos que es de thdora? → Sí → proyectos/thdora/inbox/
¿No está claro?            → No  → inbox/ global primero
        ↓
Se procesa:
  Bug / fix     → proyectos/thdora.md (sección fixes)
  Handler nuevo → proyectos/thdora-docs.md (tabla handlers)
  Doc nueva     → proyectos/thdora/docs/
  Código        → repo thdora (no en yggdrasil-dew)
        ↓
CONTEXT.md se actualiza
```

---

## 🗏 ¿Qué va en este inbox?

| Tipo | Ejemplo | Destino |
|---|---|---|
| Bug confirmado | Bot en restart loop | [[proyectos/thdora]] sección fixes |
| Idea de handler | `/clima` o `/resumen` | [[proyectos/thdora-docs]] tabla handlers |
| Código borrador | Handler `/inbox` de Grok | Repo thdora cuando se implemente |
| Log de error | Output de `docker logs` | [[proyectos/thdora]] + TROUBLESHOOTING |
| Doc técnica | DEPLOY.md, SERVIDOR.md | `proyectos/thdora/docs/` |
| Resultado de `/start` | TOKI responde o no | [[CONTEXT]] · cerrar ticket |

---

## 📂 Notas actuales

| Nota | Tags | Destino | Estado |
|---|---|---|---|
| [[proyectos/thdora/inbox/fix-restart-loop]] | `bug` `docker` `urgente` | [[proyectos/thdora]] | 🔴 urgente |

---

_Ver también: [[proyectos/thdora]] · [[proyectos/thdora-docs]] · [[inbox/README]] · [[HOME]]_
