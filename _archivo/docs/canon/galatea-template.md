---
title: Galatea — Plantilla de cabecera para scripts y agentes
tipo: canon
creado: 2026-07-05
actualizado: 2026-07-05
status: vigente
ruta: docs/canon/galatea-template.md
tags: [canon, galatea, scripts, agentes, plantilla]
---

# Galatea — Plantilla de cabecera

Todo script o agente del ecosistema debe incluir esta cabecera en las primeras líneas.
Objetivo: trazabilidad instantánea sin leer el código.

---

## Bash / Shell

```bash
#!/usr/bin/env bash
# galatea: name=nombre-del-script
# galatea: version=0.1
# galatea: description=Una línea de qué hace
# galatea: inputs=parametro1, parametro2
# galatea: outputs=archivo.json | exit_code
# galatea: repo=nombre-del-repo
# galatea: isla=nombre-isla-wiki
# galatea: author=Alvaro Fernandez Mota
# galatea: creado=YYYY-MM-DD
# galatea: requires=docker, jq, curl
set -euo pipefail
```

## Python

```python
#!/usr/bin/env python3
"""
galatea: name=nombre-del-script
galatea: version=0.1
galatea: description=Una línea de qué hace
galatea: inputs=arg1, arg2
galatea: outputs=resultado.json
galatea: repo=nombre-del-repo
galatea: isla=nombre-isla-wiki
galatea: author=Alvaro Fernandez Mota
galatea: creado=YYYY-MM-DD
galatea: requires=requests, pyyaml
"""
```

---

## Reglas

- **Obligatorio** en todo script nuevo del ecosistema
- `name` en `kebab-case`
- `version` empieza en `0.1`, sube a `1.0` cuando está en producción estable
- `isla` referencia la isla de WIKI que corresponde al dominio del script
- `repo` es el repo donde vive el script (no donde se documenta)

---

_Última actualización: 2026-07-05 · Perplexity-MCP_
