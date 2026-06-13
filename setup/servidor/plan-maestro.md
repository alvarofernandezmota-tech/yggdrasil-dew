# Plan Maestro — Torre Madre + Portátil Acer

> Última actualización: 13 junio 2026, 02:28 CEST

---

## Entorno base

| Dato | Valor |
|---|---|
| OS / WM | Arch Linux / Hyprland (Wayland) — ambos equipos |
| VPN | Tailscale ✅ (`100.91.112.32` Madre, `100.86.119.102` Acer) |
| Escritorio remoto | wayvnc + tigervnc — instalado, sin autostart |
| Repo documentación | [personal-v2](https://github.com/alvarofernandezmota-tech/personal-v2) ✅ |
| Bootstrap | [scripts/bootstrap-madre.sh](scripts/bootstrap-madre.sh) — listo para ejecutar |

---

## Tareas — Por estado

### 🔴 P1 — Mañana (requiere físico en Madre)

| Tarea | Notas |
|---|---|
| Activar `sshd` en Madre | `sudo systemctl enable --now sshd` — Ver [rescate.md](rescate.md) |
| Copiar clave SSH Ed25519 Acer → Madre | `ssh-copy-id varo@100.91.112.32` |
| Ejecutar bootstrap completo | Ver [scripts/bootstrap-madre.sh](scripts/bootstrap-madre.sh) |

### 🟡 P2 — Tras bootstrap (desde Acer por SSH)

| Tarea | Notas |
|---|---|
| Verificar todos los servicios activos | Checklist en [incidencia-acceso-madre.md](incidencia-acceso-madre.md) |
| Configurar Uptime Kuma | Monitorizar servicios + alertas THDORA |
| Conectar VSCode a Madre por Remote SSH | Ver [vscode.md](vscode.md) |
| Instalar DBeaver en Acer | Ver [dbeaver.md](dbeaver.md) |
| Configurar clave SSH Madre → GitHub | Ver [github-setup.md](github-setup.md) |
| Deshabilitar auth por password en sshd | Después de tener clave Ed25519 |
| Auditoría lynis inicial | `sudo lynis audit system` |
| Descargar modelos Ollama | Ver [ollama.md](ollama.md) — llama3.2:3b + codellama:7b |
| Migrar THDORA a Madre | Contenedor Docker |

### 🔵 P3 — Futuro

| Tarea | Notas |
|---|---|
| Headscale self-hosted | Sustituir Tailscale cloud |
| MacBook como tercer nodo | Tailscale + SSH |
| Nextcloud en Madre | Alternativa Google Drive |
| Open WebUI conectado a THDORA | Interfaz Ollama |
| Sincronizar dotfiles / omarchy | |
| Google Colab — experimentos | Ver [colab-aistudio.md](colab-aistudio.md) |

### ✅ Finalizadas

| Tarea | Fecha |
|---|---|
| Tailscale operativo en Madre y Acer | 12 jun 2026 |
| wayvnc + tigervnc instalados | 12 jun 2026 |
| Input Leap descartado definitivamente | 12 jun 2026 |
| `whisrs` STT instalado en Acer | 12 jun 2026 |
| Repo `personal-v2` estructurado | 12 jun 2026 |
| rescate.md, ssh.md, vnc.md, tailscale.md | 12 jun 2026 |
| ufw.md — Acer activo | 12 jun 2026 |
| fail2ban.md, uptime-kuma.md documentados | 13 jun 2026 |
| vscode.md, dbeaver.md, github-setup.md | 13 jun 2026 |
| colab-aistudio.md, herramientas.md | 13 jun 2026 |
| scripts/bootstrap-madre.sh — 6 fases | 13 jun 2026 |
| arquitectura.md — mapa vivo | 13 jun 2026 |
| incidencia-acceso-madre.md — post-mortem | 13 jun 2026 |
| filosofia.md — Principio 7 Pirámide Resiliencia | 13 jun 2026 |
| README.md, CONTEXT.md, CHANGELOG.md auditados | 13 jun 2026 |

---

## Sesiones

### Sesión 13 junio 2026 (noche)
- Arquitectura documentada: Madre=servidor, Acer=cliente
- 10 archivos nuevos en `setup/servidor/`
- Bootstrap completo creado (6 fases, 1 comando)
- Post-mortem de incidencia SSH documentado profesionalmente
- Repo auditado al 100% — todos los archivos sincronizados
- **Pendiente mañana:** acceso físico a Madre para activar sshd

### Sesión 12 junio 2026
- Tailscale operativo en ambos equipos
- SSH refused, VNC timeout — causa raíz: sshd no activo
- whisrs instalado en Acer
- Repo `personal-v2` creado y estructurado

---

## Regla de Oro

> **Nunca dejar un equipo remoto sin `sshd` activo y persistente.**
> `systemctl enable --now` — no solo `start`.

---

_Ver: [rescate.md](rescate.md) · [arquitectura.md](arquitectura.md) · [scripts/bootstrap-madre.sh](scripts/bootstrap-madre.sh)_
