---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-APUNTE.md
tags: [protocolo, apunte, formacion, atomo]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-APUNTE v1.0

> Ejecutar cada vez que se crea un apunte en yggdrasil-formacion.
> Un apunte sin estructura no se puede buscar. Un apunte bien hecho
> conecta el aprendizaje con el ecosistema real.
> Tiempo estimado: 5 min (estructura) + tiempo de contenido.

---

## Cuando crear un apunte

```
CREAR APUNTE para:
  - Maquina HTB (una por apunte)
  - Modulo o tema de un curso
  - Investigacion tecnica con notas estructuradas
  - Lab o PoC con pasos reproducibles

NO crear apunte para:
  - Notas sueltas sin estructura (usar borrador primero)
  - Configuracion de infra en produccion (eso va en madre-config o ADR en DEW)
  - Vida personal (eso va en TRACKING)
```

---

## Pasos

```
[ ] 1. Identificar area:
       htb / redes / docker / python / seguridad / otro

[ ] 2. Crear archivo:
       ruta: apuntes/<area>/<tema>.md
       desde: docs/canon/PLANTILLA-APUNTE-FORMACION.md

[ ] 3. Completar frontmatter obligatorio:
       tipo: apunte
       area: <area>
       fuente: HTB / curso / investigacion propia
       fecha: YYYY-MM-DD
       tags: [...]
       status: borrador / completo
       ruta: apuntes/<area>/<tema>.md

[ ] 4. Completar campo 'Salida al ecosistema':
       Si el apunte genera cambio en infra -> issue en DEW o ADR
       Si el apunte genera script reutilizable -> yggdrasil-scripts
       Si no genera salida todavia -> marcar 'pendiente revision'

[ ] 5. Commit:
       'docs(formacion): apunte <area> - <tema>'
```

---

## Relacionado

- docs/canon/PLANTILLA-APUNTE-FORMACION.md
- PROTOCOLO-APERTURA-FORMACION.md
- PROTOCOLO-SINCRONIZACION-FORMACION.md

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
