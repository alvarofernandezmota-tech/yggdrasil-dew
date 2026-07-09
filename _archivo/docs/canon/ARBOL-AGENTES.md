---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-05
actualizado: 2026-07-05 21:13 CEST
ruta: docs/canon/ARBOL-AGENTES.md
tags: [canon, agentes, arbol, arquitectura, orquestador, guardian, clasificador]
status: borrador
---

# 🤖 ÁRBOL DE AGENTES DEL ECOSISTEMA YGGDRASIL

> Vista estructural de todos los agentes, sus responsabilidades y sus relaciones.
> Este documento es referencia para diseño, debugging y expansión del sistema.
>
> ⚠️ **Estado: BORRADOR — los agentes no se implementan hasta que el mapa del ecosistema esté 100% limpio y enlazado.**
> Ver bloque de prioridades en `docs/diarios/2026-07-05-noche-2.md`.

---

## 1. Visión general

El ecosistema se organiza en torno a tres ejes:

- **Coordinación:** Orquestador Maestro
- **Clasificación:** Clasificador Maestro
- **Vigilancia:** Guardian Maestro

Alrededor de ellos viven agentes especializados (observadores, escaladores, investigadores, mejoradores) que operan sobre repos, servicios y documentación.

```
Orquestador Maestro
    ├──► Clasificador Maestro ← Observadores
    ├──► Guardian Maestro     ← Observadores → Investigadores → Mejoradores
    ├──► Investigadores
    └──► Mejoradores
```

---

## 2. Núcleo de coordinación

### Orquestador Maestro

- **Rol:** Coordina la ejecución de workflows y agentes.
- **Responsabilidades:**
  - Disparar auditorías periódicas
  - Lanzar sincronizaciones entre repos
  - Orquestar limpiezas masivas (issues, archivos, rutas)
  - Coordinar agentes de seguridad cuando SecOps lo requiere
- **Repos afectados:** todos
- **Estado:** pendiente de implementación

---

## 3. Núcleo de clasificación

### Clasificador Maestro

- **Rol:** Decide el destino de cada artefacto (archivo, nota, issue, diario, hallazgo).
- **Responsabilidades:**
  - Clasificar archivos de `inbox/`
  - Aplicar la regla Dew vs WIKI
  - Marcar duplicados y proponer limpiezas
- **Entradas:** Archivos de inbox, diarios sin ruta, issues sin repo destino, logs de auditoría
- **Estado:** pendiente de implementación

---

## 4. Núcleo de vigilancia

### Guardian Maestro

- **Rol:** Vigila la coherencia del ecosistema y dispara auditorías.
- **Responsabilidades:**
  - Detectar rutas no canónicas
  - Detectar archivos duplicados entre repos
  - Detectar issues huérfanos o mal ubicados
  - Detectar servicios `unhealthy` en Madre
  - Disparar auditorías de seguridad (SecOps)
- **Estado:** pendiente de implementación

---

## 5. Agentes especializados

### Observadores
- Detectan cambios en repos, carpetas y servicios
- Ejemplos: diarios en Dew, islas en WIKI, contenedores Docker en Madre, logs SecOps

### Escaladores
- Elevan tareas cuando exceden cierto umbral
- Ejemplos: hallazgo crítico SecOps, inconsistencia grave de rutas, deuda técnica masiva

### Investigadores
- Analizan contenido y generan informes
- Ejemplos: logs de auditoría, diarios para extraer decisiones, issues para agrupar deuda

### Mejoradores
- Refactorizan, limpian y optimizan
- Ejemplos: rutas en Dew, frontmatter en WIKI, scripts en Madre, docs en SecOps

---

## 6. Relaciones entre agentes

| Agente | Se alimenta de | Produce hacia |
|---|---|---|
| Orquestador | Todos | Workflows |
| Clasificador | Observadores, Inbox | Destino canónico de artefactos |
| Guardian | Observadores, Investigadores | Auditorías, alertas, acciones correctivas |
| Observadores | Repos, servicios, carpetas | Señales a Clasificador y Guardian |
| Investigadores | Logs, docs, issues | Informes, hallazgos |
| Mejoradores | Órdenes de Guardian/Orquestador | Contenido refactorizado |

---

## 7. Integración con Galatea

Todos los agentes deben definirse usando la plantilla **Galatea**, con:

- Nombre del agente
- Rol principal
- Entradas
- Salidas
- Repos afectados
- Workflows asociados
- Logs generados
- Auditorías que debe pasar

> Este documento es la vista conceptual. Las definiciones concretas vivirán en los archivos de configuración de agentes cuando se implemente.

---

_Creado: 2026-07-05 21:13 CEST · Perplexity-MCP_
