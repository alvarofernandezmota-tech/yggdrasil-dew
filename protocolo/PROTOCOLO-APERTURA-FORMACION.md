---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-APERTURA-FORMACION.md
tags: [protocolo, apertura, formacion, sesion]
status: vigente
version: 1.0
---

# PROTOCOLO-APERTURA-FORMACION v1.0

> Zoom a yggdrasil-formacion al inicio de una sesion que lo afecta.
> Llamado desde PROTOCOLO-APERTURA-SESION (Fase 2).
> Tiempo estimado: 2-3 min.

---

## Que es FORMACION

```
yggdrasil-formacion = APRENDIZAJE TECNICO de Alvaro
Contiene: apuntes de cursos, HTB, labs, PoCs, recursos
NO contiene: vida personal / configuracion de infra en produccion / diarios de sesion
Regla: lo que aprendes va aqui. Lo que aplicas va en madre-config o en DEW como ADR.
```

---

## Estructura esperada

```
yggdrasil-formacion/
+-- apuntes/
|   +-- <area>/           -> por area (htb, redes, docker, python...)
|       +-- <tema>.md     -> un apunte por tema desde PLANTILLA-APUNTE-FORMACION.md
+-- recursos/
+-- README.md
```

---

## Checklist de apertura

```
[ ] Identificar area de trabajo (HTB / curso / lab / investigacion)
[ ] Verificar estructura de carpetas (arriba)
[ ] Abrir apunte desde PLANTILLA-APUNTE-FORMACION.md
[ ] Si el apunte conecta con infra real -> anotar para crear issue en DEW
```

---

## Reglas criticas FORMACION

```
- Repo: yggdrasil-formacion (sin guion final, sin 'formacion-tech')
- Todo apunte desde PLANTILLA-APUNTE-FORMACION.md
- Ningun secreto/token/IP real en ningun apunte
- Si el aprendizaje genera un cambio en infra -> ADR o issue en DEW, no aqui
- Campos obligatorios frontmatter: tipo, area, fuente, fecha, tags, status, ruta
```

---

## Al cerrar

> Ejecutar PROTOCOLO-SINCRONIZACION-FORMACION.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
