# Servicios — Arquitectura Home Server

> Todos los servicios corriendo o planificados en el ecosistema.
> Última actualización: 12 junio 2026

---

## Arquitectura objetivo

```
Acer (Home Server — Omarchy/Arch)
├── THDORA          bot Telegram 24/7
├── PostgreSQL      DB de producción
├── Nextcloud       datos personales, docs, fotos
├── WireGuard       VPN — acceso seguro desde fuera
├── Input Leap      teclado/ratón compartido con MacBook
└── Drive Sync      GitHub Actions → rclone → Google Drive

Ordenador Madre
├── Ollama          LLMs locales (próximo)
├── VSCode          desarrollo
├── DBeaver         gestión DB
└── Docker          servicios varios
```

---

## Estado de servicios

| Servicio | Host | Estado | Notas |
|---|---|---|---|
| THDORA | Acer | 🔄 Migrando | Viene de Ordenador Madre |
| PostgreSQL | Acer | 🔄 Migrando | Migración desde SQLite |
| Nextcloud | Acer | ⏳ Pendiente | Instalar en Acer |
| WireGuard VPN | Acer | ⏳ Pendiente | Acceso remoto seguro |
| Input Leap | Acer↔Mac | ⏳ Completar | Servidor Acer, cliente MacBook |
| Ollama | Ordenador Madre | ⏳ Próximo | LLM local para agente |
| Drive Sync | GitHub Actions | ⏳ Pendiente | Ver sección abajo |

---

## Input Leap — Setup

```bash
# MacBook = cliente  (IP: 10.176.119.229)
# Acer    = servidor (IP: 10.176.119.171)

# En el Acer (servidor):
input-leaps --config ~/.config/input-leap/input-leap.conf

# En el MacBook (cliente):
input-leapc --name macbook 10.176.119.171
```

Estado: ⏳ Pendiente completar — problemas de conexión por resolver

---

## Drive Sync — GitHub Actions + rclone

**Objetivo:** Sync automático nocturno de `personal-v2` → Google Drive

**Arquitectura:**
```
GitHub repo personal-v2
  └── GitHub Action (cron: 23:00 diario)
        └── rclone sync → Google Drive/personal-v2/
```

**Pasos para configurar:**
1. Instalar rclone localmente y configurar remote `gdrive`
2. Exportar config rclone como secret en GitHub (`RCLONE_CONF`)
3. Crear `.github/workflows/sync-drive.yml`
4. Verificar primer sync manual

**Workflow a crear:**
```yaml
# .github/workflows/sync-drive.yml
name: Sync to Google Drive
on:
  schedule:
    - cron: '0 22 * * *'  # 23:00 CEST (21:00 UTC)
  workflow_dispatch:
jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup rclone
        uses: AnimMouse/setup-rclone@v1
        with:
          rclone_config: ${{ secrets.RCLONE_CONF }}
      - name: Sync to Drive
        run: rclone sync . gdrive:personal-v2 --exclude ".git/**"
```

Estado: ⏳ Pendiente — configurar rclone y añadir secret a GitHub
