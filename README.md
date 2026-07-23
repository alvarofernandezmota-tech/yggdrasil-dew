# yggdrasil-dew

Núcleo maestro del ecosistema Yggdrasil. Aquí viven la filosofía, la orquestación, los roles de agentes, la sincronía entre repos, los prompts base y el estado operativo.

<<<<<<< HEAD
## Propósito
Centralizar la estructura, la documentación y la operación común del ecosistema.

## Qué contiene
- Roles y prompts de agentes.
- Orquestación y sincronía.
- Mapa de repos e islas.
- Scripts de mantenimiento.
- Snapshots y estado de sesión.

## Estructura
- `docs/` documentación viva.
- `docs/PROMPTS/` prompts por rol.
- `docs/STATE/` snapshots y cierres.
- `scripts/maintenance/` utilidades operativas.
- `.github/` plantillas y automatización.
=======
## Qué es
- Centro documental y operativo del ecosistema.
- Fuente única de verdad para reglas transversales.
- Lugar donde se define cómo trabajan los agentes.

## Qué no es
- No es el bootstrap.
- No es el piloto de producto.
- No es una carpeta de pruebas temporales.

## Estructura principal
- `docs/` documentación viva del ecosistema.
- `scripts/maintenance/` utilidades operativas.
- `.github/` automatización y plantillas.

## Inicio rápido
```bash
bash scripts/maintenance/agent-health.sh
bash scripts/maintenance/repo-snapshot.sh "$PWD"
```
>>>>>>> 7295bed (docs: add professional ecosystem structure and agent stack)

## Repos relacionados
- `yggdrasil-setup`: bootstrap y pruebas.
- `thdora`: piloto real.
<<<<<<< HEAD
- Islas: repos de dominio con contexto propio.

## Operación rápida
```bash
bash scripts/maintenance/agent-health.sh
bash scripts/maintenance/repo-snapshot.sh "$PWD"
bash scripts/maintenance/agent-audit.sh
```

## Gobernanza
- El núcleo vive aquí.
- Lo transversal se documenta aquí.
- Lo local se mantiene en su repositorio.
- La seguridad se gestiona con `SECURITY.md` y buenas prácticas de GitHub.

## Referencias
- `docs/ORQUESTACION.md`
- `docs/PHILOSOPHY.md`
- `docs/ROLES.md`
- `docs/MAPA-ECOSISTEMA.md`
- `docs/SINCRONIA.md`
- `docs/THDORA-PILOTO.md`
=======
- Islas: dominios específicos con contexto local.
>>>>>>> 7295bed (docs: add professional ecosystem structure and agent stack)
