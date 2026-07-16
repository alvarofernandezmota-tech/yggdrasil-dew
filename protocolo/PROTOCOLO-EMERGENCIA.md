---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-EMERGENCIA.md
tags: [protocolo, emergencia, seguridad, recovery]
status: vigente
version: 1.0
---

# PROTOCOLO-EMERGENCIA v1.0

> Que hacer cuando algo va mal en el ecosistema.
> Lee esto antes de actuar. Parar, respirar, evaluar.
> Tiempo: variable — la calma es parte del protocolo.

---

## CASO 1 — Secreto commiteado a repo publico

```
ACCION INMEDIATA (primeros 5 minutos):
  [ ] Revocar/rotar el secreto en el servicio afectado ANTES de nada
  [ ] NO forzar push todavia — primero invalida el secreto

LIMPIEZA GIT:
  [ ] git filter-branch o BFG Repo Cleaner para eliminar el commit
  [ ] Force push a main
  [ ] Notificar a GitHub si el repo es publico (soporte)

POST-EMERGENCIA:
  [ ] Verificar que el secreto ya no aparece en ningun commit del historial
  [ ] Actualizar PROTOCOLO-SECRETOS si el incidente revela un hueco
  [ ] Crear entrada en diario DEW documentando el incidente
  [ ] Abrir issue en DEW con label 'security' describiendo que paso
```

---

## CASO 2 — Archivo borrado por error (sin terminal)

```
  [ ] Ir a GitHub -> commits del archivo -> ver ultimo commit que lo tenia
  [ ] Recuperar contenido desde la vista raw del commit anterior
  [ ] Recrear el archivo con PROTOCOLO-NUEVO-PROTOCOLO / plantilla correspondiente
  [ ] No entrar en panico: GitHub guarda todo el historial
```

---

## CASO 3 — Maestros desincronizados (MASTER / ESTADO-SISTEMA contradictorios)

```
  [ ] Leer los dos archivos
  [ ] Identificar cual tiene la informacion mas reciente (campo 'actualizado')
  [ ] El mas reciente manda — actualizar el otro para que coincida
  [ ] Si hay duda -> abrir issue en DEW describiendo la contradiccion
  [ ] Ejecutar PROTOCOLO-SINCRONIZACION-ECOSISTEMA completo
```

---

## CASO 4 — Repo en estado inconsistente (CI rojo, archivos corruptos)

```
  [ ] No hacer mas commits hasta entender que paso
  [ ] Revisar el ultimo commit: que cambio?
  [ ] Si el CI falla -> leer el log completo del error
  [ ] Si hay archivos sin frontmatter -> PROTOCOLO-NUEVO-PROTOCOLO para corregir
  [ ] Si el problema es grave -> abrir issue con descripcion exacta
```

---

## CASO 5 — Contexto de sesion perdido (agente sin memoria)

```
  [ ] Ejecutar PROTOCOLO-APERTURA-SESION completo
  [ ] Leer MASTER-PENDIENTES.md
  [ ] Leer ESTADO-SISTEMA.md
  [ ] Leer diario DEW de la ultima sesion
  [ ] NO asumir estado — verificar en GitHub antes de actuar
```

---

## Regla de oro

```
Antes de cualquier accion de emergencia:
  PARAR -> LEER -> ENTENDER -> ACTUAR

Nunca ejecutar comandos destructivos (force push, rm -rf, filter-branch)
sin haber leido y entendido el estado completo.
```

---

## Relacionado

- PROTOCOLO-SECRETOS.md
- PROTOCOLO-BORRADO.md
- PROTOCOLO-APERTURA-SESION.md
- PROTOCOLO-SINCRONIZACION-ECOSISTEMA.md

---

_Creado: 2026-07-16 v1.0 F17 Perplexity MCP_
