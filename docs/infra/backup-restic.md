---
tags: [tipo/ficha, estado/pendiente, infra/backup]
fecha: 2026-06-25
---

# 💾 Backup — Restic (regla 3-2-1)

> Origen: Auditoría Engineering Excellence 2026-06-25

## Riesgo actual

Si Madre muere, no hay recuperación documentada ni automatizada.

## Plan

| Elemento | Detalle |
|---|---|
| Herramienta | Restic |
| Destino offsite | Cloudflare R2 o Backblaze B2 |
| Regla | 3 copias · 2 medios · 1 offsite |
| Retención | 7 diarios · 4 semanales · 6 mensuales |
| Automatización | systemd timer `batcueva-backup.timer` |

## Script base — `scripts/backup/run-backup.sh`

```bash
#!/bin/bash
export $(grep -v '^#' $(dirname "$0")/.env | xargs)
BACKUP_PATHS="/home/alvaro/yggdrasil-dew /var/lib/docker/volumes"
restic backup $BACKUP_PATHS --tag homelab-auto
restic forget --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --prune
restic check
```

## Pasos pendientes

- [ ] Configurar bucket R2 o B2
- [ ] Crear `.env` con credenciales (cifrado con SOPS)
- [ ] Escribir `scripts/backup/run-backup.sh`
- [ ] Crear `batcueva-backup.timer` (systemd)
- [ ] **Probar restore completo** ← lo que separa usuario de SysAdmin

---
_Ver: [[MASTER-PENDIENTES]] · [[docs/adr/ADR-004-seguridad-privilege-explosion]]_
