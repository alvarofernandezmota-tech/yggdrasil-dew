---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-NUEVO-SCRIPT.md
tags: [protocolo, script, automatizacion, atomo]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-SCRIPT v1.0

> Ejecutar cuando se crea un script de automatizacion para el ecosistema.
> Un script sin documentacion es una caja negra.
> Un script sin trazabilidad puede romper el ecosistema sin dejar rastro.
> Tiempo estimado: 10 min.

---

## Donde van los scripts

```
yggdrasil-scripts/   -> scripts de automatizacion del ecosistema
madre-config/        -> scripts especificos de configuracion del servidor Madre

NO van en:
  - yggdrasil-dew      (DEW es documentacion, no ejecutables)
  - yggdrasil-formacion (a menos que sea un PoC educativo)
```

---

## Pasos

```
[ ] 1. Identificar tipo de script:
       - Automatizacion ecosistema -> yggdrasil-scripts
       - Configuracion Madre       -> madre-config
       - PoC de formacion          -> yggdrasil-formacion/apuntes/<area>/

[ ] 2. Nombre del script:
       - minusculas, guiones, extension correcta
       - descripcion en el nombre: check-nombres.sh, backup-repos.sh

[ ] 3. Cabecera obligatoria en el script:
       # Nombre: <nombre>
       # Descripcion: <que hace en una linea>
       # Ecosistema: que repos afecta
       # Autor: Alvaro Fernandez Mota
       # Creado: YYYY-MM-DD
       # Uso: ./<nombre>.sh [argumentos]

[ ] 4. Crear entrada en README del repo de scripts

[ ] 5. Si el script automatiza un protocolo -> enlazarlo desde el protocolo

[ ] 6. Si el script toca infra de produccion -> crear issue de seguimiento en DEW

[ ] 7. Commit:
       'feat(scripts): <nombre-script> - <descripcion breve>'
```

---

## Secretos en scripts

```
[ ] Ningun token/password/IP hardcodeado en el script
[ ] Variables de entorno con nombres descriptivos: $TELEGRAM_TOKEN, $SERVIDOR_IP
[ ] Archivo .env.example con las variables necesarias (sin valores reales)
[ ] .env en .gitignore siempre
```

---

## Relacionado

- PROTOCOLO-SECRETOS.md
- yggdrasil-scripts (repo)
- PROTOCOLO-NUEVO-ADR.md (si el script implementa una decision arquitectural)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
