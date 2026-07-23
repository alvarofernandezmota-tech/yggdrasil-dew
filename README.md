# yggdrasil-dew

Núcleo maestro del ecosistema Yggdrasil.

## Propósito
Centralizar la estructura, documentación y operación común.

## Contenido
- Orquestación.
- Roles.
- Prompts.
- Scripts.
- Estado.

## Estructura
- `docs/` documentación viva.
- `docs/PROMPTS/` prompts por rol.
- `docs/STATE/` snapshots y cierres.
- `scripts/maintenance/` utilidades operativas.
- `.github/` plantillas y automatización.

## Uso
```bash
bash scripts/maintenance/agent-health.sh
bash scripts/maintenance/repo-snapshot.sh "$PWD"
bash scripts/maintenance/agent-audit.sh
```
