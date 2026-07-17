# yggdrasil-scripts

Scripts de automatización y utilidad del ecosistema Yggdrasil.

## Scripts disponibles

| Script | Descripción | Uso |
|---|---|---|
| `ygg-audit.sh` | Auditoría completa del ecosistema | `bash ygg-audit.sh [--repos\|--servicios\|--full]` |
| `ygg-clone-all.sh` | Clonar todos los repos del ecosistema | `bash ygg-clone-all.sh` |
| `ygg-status.sh` | Estado rápido del sistema (<30 seg) | `bash ygg-status.sh` |

## Flujo recomendado

```bash
# 1. Primera vez — clonar todos los repos
bash ygg-clone-all.sh

# 2. Revisión rápida de estado
bash ygg-status.sh

# 3. Auditoría completa
bash ygg-audit.sh

# 4. Auditoría solo repos
bash ygg-audit.sh --repos

# 5. Auditoría solo servicios Docker
bash ygg-audit.sh --servicios
```

## Requerimientos

- `git` instalado
- `docker` instalado (para auditoría de servicios — solo en Madre)
- `smartmontools` para S.M.A.R.T. (`sudo pacman -S smartmontools`)
- Ejecutar en Madre para auditoría completa de servicios

## Reporte

`ygg-audit.sh` genera un reporte en `~/ygg-audit-report-YYYY-MM-DD-HHMM.txt`

---

_Ecosystem: Yggdrasil · Owner: alvarofernandezmota-tech_
