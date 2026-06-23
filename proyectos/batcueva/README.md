---
tags: [proyecto, docker, infraestructura, osint, batcueva, madre, self-hosted]
fecha-inicio: 2026-06-23
estado: fase-1-en-progreso
servidor: Madre (varopc@100.91.112.32)
ruta-obsidian: proyectos/batcueva/README.md
---

# 🦇 Batcueva — Stack self-hosted en Madre

> Panel de control, OSINT, IA local y monitorización — todo en Madre, coste 0€.

## ¿Qué es?

La Batcueva es el stack Docker completo que corre en Madre (servidor local).
Reúne herramientas de IA local, OSINT, monitorización y automatización.
Todo accesible via Tailscale desde cualquier sitio.

---

## Servicios activos en Madre (ya corriendo)

| Servicio | Puerto | Estado | Descripción |
|---|---|---|---|
| thdora | — | ✅ activo | Bot Telegram TOKI |
| Portainer | :9000 | ✅ activo | UI gestión Docker |
| Uptime Kuma | :3002 | ✅ activo | Monitorización servicios |
| Grafana | — | ✅ activo | Dashboards métricas |
| Prometheus | — | ✅ activo | Colector métricas |
| Netdata | — | ✅ activo | Multi-nodo (Madre + Acer) |

---

## Fase 1 — Esta semana 🔴

| Servicio | Puerto | Estado | Descripción |
|---|---|---|---|
| Ollama | :11434 | ⏳ descargando (44%) | Motor LLM local |
| Open WebUI | :3001 | ⏳ esperando Ollama | UI chat para Ollama |
| SpiderFoot | :5001 | ⏠ pendiente | OSINT (estaba a medias en `~/spiderfoot`) |
| UFW + fail2ban | — | ⚠️ parcial | Seguridad base — confirmar estado |

### Pasos Fase 1

```bash
# 1. Esperar descarga (tmux activo)
tmux attach -t ollama

# 2. Levantar stack cuando imágenes listas
cd ~/docker/batcueva-nueva
docker compose up -d

# 3. Verificar Ollama up
curl http://localhost:11434/api/tags

# 4. Descargar modelos
ollama pull qwen2.5:3b
ollama pull bge-m3
ollama pull qwen2.5:7b  # opcional, más pesado

# 5. Acceder a Open WebUI
# http://100.91.112.32:3001 (desde Tailscale)
```

---

## Fase 2 — Esta semana 🟡

| Servicio | Puerto | Descripción |
|---|---|---|
| Shadowbroker | — | Aviones militares/civiles, 25k barcos AIS, GPS jamming |
| OSIRIS | — | Globo 3D: satélites, CCTV, seísmos, nuclear |
| Kismet | — | WiFi/Bluetooth red local |
| Pi-hole | :80/:53 | DNS + bloqueo anuncios |
| tmux | — | Sesiones persistentes en Madre |

---

## Fase 3 — Futuro 🔵

| Servicio | Descripción |
|---|---|
| n8n | Automatización workflows (reemplaza Zapier, OS) |
| Homepage/Homarr | Dashboard central que une todo |
| Headscale | Tailscale self-hosted (más control) |
| Gitea | GitHub propio self-hosted |
| Code Server | VSCode en el browser desde cualquier sitio |

---

## Arquitectura de red

```
Internet
  └── Tailscale VPN
        ├── varopc  (100.86.119.102) — Acer, escritorio principal
        └── Madre   (100.91.112.32)  — servidor, Docker host
              ├── :3001  Open WebUI
              ├── :3002  Uptime Kuma
              ├── :5001  SpiderFoot
              ├── :9000  Portainer
              └── :11434 Ollama API
```

---

## IA Local — Stack RAG

Decisión tomada el 2026-06-23 tras investigación exhaustiva:

| Componente | Herramienta | Motivo |
|---|---|---|
| LLM rápido | qwen2.5:3b | Velocidad en CPU |
| LLM calidad | qwen2.5:7b | Respuestas más ricas |
| Embeddings | bge-m3 | Multilingüe ES/EN |
| RAG engine | Híbrido BM25 + vectorial | RRF fusion, mejor recall |
| Razonamiento | Claude (API) | Para queries complejas |
| UI | Open WebUI | RAG sobre yggdrasil-dew desde browser |

Ver ficha completa: `tools/local-brain-claude.md`

---

## OSINT en Madre

| Herramienta | Ruta | Estado |
|---|---|---|
| SpiderFoot | `~/spiderfoot` + Batcueva :5001 | ⚠️ a medias |
| sfd_tool | `~/sfd_tool` | ❓ pendiente documentar |
| nmap | pendiente instalar | — |
| theHarvester | pendiente instalar | — |

Ver plan completo: `osint/README.md` (pendiente crear)

---

## Notas

- Problema resuelto: descargas Docker cortaban por TLS bad record MAC en hotspot → usar tmux
- Las capas ya descargadas NO se repiten en cada reintento
- Ruta docker-compose: `~/docker/batcueva-nueva/docker-compose.yml`

_Actualizado: 2026-06-23 · Ver: [[MASTER-PENDIENTES]] · [[diarios/2026-06-23]]_
