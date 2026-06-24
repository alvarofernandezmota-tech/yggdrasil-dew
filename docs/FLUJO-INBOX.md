# Flujo del Inbox — Ecosistema Yggdrasil

> Cómo fluye la información por el ecosistema.

---

## El principio

El inbox es la **puerta de entrada** a cada repo. No es almacén permanente, es una sala de clasificación.

---

## Flujo visual

```
┌───────────────────────────────────────────────┐
│              TU TIENES UNA IDEA                │
└───────────────────────────────────────────────┘
                      ↓
         ¿Sabes a qué repo pertenece?
        /                            \
       SÍ                             NO
        ↓                              ↓
  inbox/ de esa repo          ygg/inbox/ (por defecto)
        ↓                              ↓
        └────── AUDITORÍA SEMANAL ──────┘
                      ↓
           Clasificar cada archivo:

  ┌───────────────────────────────────────┐
  │  Es documentación   →  docs/           │
  │  Es una decisión    →  docs/adr/       │
  │  Es código          →  carpeta propia  │
  │  Es de otra repo    →  migra su inbox  │
  │  No sirve           →  se elimina      │
  └───────────────────────────────────────┘
```

---

## Regla de oro del inbox

> **ygg/inbox/ es el inbox global.** Si no sabes dónde va algo, va aquí primero.
> En la auditoría decides si se queda o migra.

---

## Migración entre repos

Cuando un archivo del inbox de una repo pertenece a otra:

1. Se crea en el inbox de la repo destino con el mismo nombre
2. Se elimina del inbox de origen
3. Commit en origen: `migrate: mover X a <repo-destino>/inbox/`
4. Commit en destino: `inbox: recibir X desde <repo-origen>`

---

## Lo que NUNCA va al inbox

- Código en producción (va directamente a su carpeta con commit `feat:`)
- Fixes urgentes (van directamente con commit `fix:`)
- Secrets o credenciales (nunca en el repo)
