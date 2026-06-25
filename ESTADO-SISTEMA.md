---
tags: [estado, sistema, operativo, servicios, ahora]
fecha-actualizacion: 2026-06-25
hora: 18:30
---

# 📊 ESTADO DEL SISTEMA — 25 jun 2026 (18:30)

> Este archivo refleja el estado REAL operativo ahora mismo.
> Actualizar cada vez que cambie algo importante.

---

## 🖥️ Máquinas

| Máquina | Estado | Observaciones |
|---|---|---|
| **Madre** | ✅ encendida y accesible | SSH funciona · alias `madre` en ~/.ssh/config ✅ |
| **varopc (Acer)** | ⚠️ lento | Usando ahora mismo — rendimiento degradado |
| **Redmi A5** | ✅ activo | Tailscale pendiente instalar desde Play Store |

---

## 🐳 Docker — Estado Madre (25 jun 18:30)

### Stack completo — 13 CONTENEDORES HEALTHY ✅

| Contenedor | Puerto | Estado | Fix aplicado |
|---|---|---|---|
| `ollama` | 11434 | ✅ healthy | — |
| `ollama-embeddings` | 11435 | ✅ healthy | — |
| `open-webui` | 3001 | ✅ healthy | TCP bash check |
| `qdrant` | 6333 | ✅ healthy | TCP bash check |
| `uptime-kuma` | 3002 | ✅ healthy | — |
| `thdora` | 8000 | ✅ healthy | — |
| `thdora-bot` | — | ✅ healthy | — |
| `grafana` | 3000 | ✅ up | — |
| `prometheus` | 9090 | ✅ up | — |
| `portainer` | 9000 | ✅ up | — |
| `code-server` | 8443 | ✅ up | — |
| `n8n` | 5678 | ✅ up | — |
| `gitea` | 3003 | ✅ up | — |

### Modelos Ollama

| Modelo | Estado |
|---|---|
| `qwen2.5-coder:7b` | ✅ descargado (4.7GB) |
| `qwen2.5:3b` | ✅ descargado (1.9GB) |
| `llama3.1:8b` | ❌ pendiente pull |
| `bge-m3` | ❌ pendiente pull |
| `nomic-embed-text` | ❌ pendiente pull |

---

## 🔐 SSH — Estado RESUELTO ✅

| Conexión | Estado |
|---|---|
| varopc → Madre | ✅ sin contraseña |
| Madre → GitHub | ✅ sin passphrase (id_ed25519_github) |

---

## 🗂️ Git — Estado repos

| Repo | Estado |
|---|---|
| yggdrasil-dew (GitHub) | ✅ sincronizado |
| yggdrasil-dew (Madre) | ⚠️ pendiente `git pull --rebase` |
| thdora | 🔧 pendiente handlers |

---

## 📥 Inbox — Estado

| Estado | Detalle |
|---|---|
| Nota auditoría Engineering Excellence | ✅ procesada |
| Nota sesión tarde | ✅ procesada |
| Pendientes siguientes fases | ✅ en MASTER-PENDIENTES |

---

## 🔐 Red y acceso

| Servicio | Estado |
|---|---|
| Tailscale varopc | ✅ activo |
| Tailscale Madre | ⚠️ pendiente autoarranque |
| UFW Madre | ⚠️ pendiente activar |
| SSH hardening | ⚠️ documentado, no aplicado |

---

## 📋 Próximas acciones (orden prioridad)

1. `git pull --rebase` en Madre
2. **Script Restic backup** — proteger datos
3. **Uptime Kuma → THDORA** — alertas Telegram
4. **Grafana dashboard** — CPU + latencia Ollama
5. Levantar SpiderFoot + Kali Desktop
6. Pulls modelos: `llama3.1:8b` + `bge-m3` + `nomic-embed-text`

---
_Actualizado: 25 jun 2026 18:30 CEST — Perplexity vía MCP_
_Ver: [[MASTER-PENDIENTES]] · [[diarios/2026-06-25-tarde]] · [[inbox/README]]_
