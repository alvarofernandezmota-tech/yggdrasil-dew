---
tags: [sysadmin, estructura, servidor-madre, arch-linux, inventario]
fecha: 2026-06-23
estado: referencia
ruta-obsidian: setup/servidor/estructura-madre.md
---

# Estructura de Madre (varopc)

Documentación completa del sistema principal. Arch Linux con Hyprland, GPU NVIDIA GTX 1060 6GB.

## Datos del sistema

| Campo | Valor |
|---|---|
| Usuario | `varopc` |
| Hostname | `varpc` |
| IP Tailscale | `100.91.112.32` |
| OS | Arch Linux + Hyprland |
| GPU | NVIDIA GTX 1060 6GB |
| Shell | zsh + omarchy |

## Estructura de carpetas clave

```
/home/varopc/
├── Projects/                    ← REPOS ACTIVOS (aquí vive todo)
│   ├── yggdrasil-dew/           ← Segundo cerebro (Obsidian vault + git)
│   ├── thdora/                  ← Bot Telegram proyecto principal
│   └── personal/                ← Repo personal VIEJO (sustituido por yggdrasil-dew)
│
├── dev/                         ← DUPLICADOS / LEGACY (limpiar)
│   ├── personal/                ← Duplicado de Projects/personal (borrar)
│   ├── personal-v2/             ← Versión anterior del cerebro (revisar/borrar)
│   └── thdora/                  ← Duplicado de Projects/thdora (borrar)
│
├── docker/                      ← Todos los docker-compose
│   └── batcueva-nueva/          ← Ollama + Open WebUI (descargando)
│
├── spiderfoot/                  ← SpiderFoot clonado en local (OSINT)
├── sfd_tool/                    ← Proyecto pendiente documentar
├── yay/                         ← AUR helper compilado
├── isos/                        ← ISOs (redmi-a5 flash)
└── Work/                        ← Trabajo
```

## Dockers activos

| Contenedor | Puerto | Estado | Compose |
|---|---|---|---|
| `uptime-kuma` | :3002 | ✅ healthy | `~/docker/` |
| `portainer` | :9000 | ✅ healthy | `~/docker/` |
| `thdora` | :8000 | ✅ healthy | `~/Projects/thdora/docker/` |
| `thdora-bot` | — | ✅ healthy | `~/Projects/thdora/docker/` |
| `grafana` | :3000 | ✅ healthy | `~/docker/` |
| `prometheus` | :9090 | ✅ healthy | `~/docker/` |
| `ollama` | :11434 | ⏳ descargando | `~/docker/batcueva-nueva/` |
| `open-webui` | :3001 | ⏳ descargando | `~/docker/batcueva-nueva/` |

## Repos y su estado

| Repo | Ruta local | Estado | Notas |
|---|---|---|---|
| `yggdrasil-dew` | `~/Projects/yggdrasil-dew` | ✅ activo | Vault Obsidian |
| `thdora` | `~/Projects/thdora` | ✅ activo | Bot Telegram |
| `personal` | `~/Projects/personal` | ⚠️ legacy | Sustituido por yggdrasil-dew |
| `dev/personal` | `~/dev/personal` | 🗑️ duplicado | Borrar |
| `dev/personal-v2` | `~/dev/personal-v2` | ❓ revisar | Posible contenido útil |
| `dev/thdora` | `~/dev/thdora` | 🗑️ duplicado | Borrar |
| `spiderfoot` | `~/spiderfoot` | ✅ activo | OSINT local |
| `sfd_tool` | `~/sfd_tool` | ❓ pendiente documentar | — |

## Configuraciones destacadas

- **Obsidian** abre `~/Projects/yggdrasil-dew` como vault
- **zoxide** configurado (alias `z`)
- **tmux** instalado en `~/.config/tmux`
- **nvim** con lua config en `~/.config/nvim`
- **SSH key**: `~/.ssh/id_ed25519_github` (con passphrase)
- **mise** para gestión de runtimes
- **pipx** para herramientas Python globales

## Pendientes de limpieza

- [ ] Revisar `~/dev/personal-v2` → migrar lo útil a yggdrasil-dew o borrar
- [ ] Borrar `~/dev/personal` (duplicado)
- [ ] Borrar `~/dev/thdora` (duplicado)
- [ ] Documentar `~/sfd_tool`
- [ ] Completar descarga Ollama + Open WebUI
- [ ] Configurar Caddy como proxy inverso
