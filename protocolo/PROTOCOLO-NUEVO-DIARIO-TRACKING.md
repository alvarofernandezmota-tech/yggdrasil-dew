---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16 16:24 CEST
ruta: protocolo/PROTOCOLO-NUEVO-DIARIO-TRACKING.md
tags: [protocolo, atomo, tracking, diario]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-DIARIO-TRACKING v1.0

> Ejecutar cada vez que se crea una nueva entrada en el diario personal (yggdrasil-tracking).
> Separacion canon: diarios TRACKING = vida personal. Diarios DEW = trabajo tecnico.

---

## Cuando usar

- Cualquier entrada personal: reflexiones, metas, estado de animo, vida diaria
- Notas que NO son tecnicas ni de trabajo en el ecosistema
- Seguimiento de habitos, rutinas, proyectos personales

> Si el contenido es tecnico o de trabajo en el ecosistema -> usar PROTOCOLO-NUEVO-DIARIO-DEW.md

---

## Paso 1: Crear el archivo

```
Ruta: diarios/YYYY/YYYY-MM-DD.md
Nombre: YYYY-MM-DD.md
Repo: yggdrasil-tracking
```

**Frontmatter obligatorio:**

```yaml
---
tipo: diario-tracking
author: Alvaro Fernandez Mota
fecha: YYYY-MM-DD
actualizado: YYYY-MM-DD HH:MM CEST
ruta: diarios/YYYY/YYYY-MM-DD.md
tags: [diario, tracking, personal]
status: borrador | cerrado
---
```

---

## Paso 2: Estructura minima

```markdown
# Diario YYYY-MM-DD

## Como estoy

[Estado emocional / fisico / mental]

## Que paso

[Hechos del dia relevantes]

## Reflexion

[Pensamiento libre, aprendizajes, dudas]

## Manana

[Intencion para el dia siguiente - opcional]
```

> La estructura es flexible. Escribir lo que salga, no lo que "toca".

---

## Paso 3: Verificaciones antes de commit

```
[ ] Frontmatter completo con todos los campos
[ ] tipo: diario-tracking (no diario-dew)
[ ] Ningun secreto ni token en el archivo
[ ] Ruta correcta: diarios/YYYY/YYYY-MM-DD.md
```

---

## Paso 4: Commit

```bash
git commit -m "docs(diario): YYYY-MM-DD entrada personal"
```

---

## Paso 5: Sincronizacion (solo si hay cambios estructurales)

```
[ ] Si es el primer diario del mes -> crear carpeta diarios/YYYY-MM/ si no existe
[ ] Si se mencionan metas nuevas -> verificar que estan en metas/
[ ] Si se toman decisiones de vida -> considerar si merece ADR personal
```

> En general, un diario personal NO requiere sincronizacion adicional. Commit y listo.

---

_Creado: 2026-07-16 v1.0 F17 cierre · Perplexity MCP_
