---
titulo: DRP — Disaster Recovery Plan
tipo: runbook
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
tags: [runbook, drp, recuperacion, desastres, madre, homelab]
status: esqueleto — rellenar con datos reales
fuente: investigacion-gemini-2026-07-13
---

# 🚨 DRP — Yggdrasil Disaster Recovery Plan

> **ESTADO:** Esqueleto inicial. Completar con rutas reales, IPs y credenciales (estas últimas NUNCA aquí — referencia al vault/gestor).
> Este archivo vive en GitHub privado. No contiene secretos.

---

## 1. Identidad del sistema

| Campo | Valor |
|-------|-------|
| Repositorio maestro | `yggdrasil-dew` |
| Nodo principal | Madre (Torre) |
| Estado persistente Docker | `/var/lib/docker/volumes/` |
| Secretos | Gestor externo — NO en este repo |
| Backup principal | TODO: definir destino y frecuencia |
| Backup RAG/VectorDB | TODO: definir ruta de volumen Chroma/Qdrant |

---

## 2. Escenarios de fallo

### Escenario A — `.env` corrupto o perdido

**Síntoma:** todos los servicios Docker fallan al arrancar.  
**RTO objetivo:** < 15 min

```bash
# 1. Recuperar .env desde backup seguro (NO desde Git)
cp /ruta/backup/.env /home/varopc/.env

# 2. Validar antes de levantar
./scripts/env-checker.sh .env.template .env

# 3. Levantar stack
docker-compose up -d

# 4. Verificar
docker ps
```

### Escenario B — Madre no arranca (fallo hardware/OS)

**RTO objetivo:** < 2h  
**Requiere:** hardware alternativo con Arch Linux

1. **Provisionar OS:** Instalar Arch Linux + `docker` + `docker-compose`
2. **Clonar repos base:**
   ```bash
   git clone git@github.com:alvarofernandezmota-tech/yggdrasil-dew.git
   git clone git@github.com:alvarofernandezmota-tech/madre-config.git  # cuando exista
   ```
3. **Restaurar volúmenes Docker:**
   ```bash
   rsync -avz /backup/volumes/ /var/lib/docker/volumes/
   ```
4. **Restaurar `.env`** desde gestor de secretos externo
5. **Levantar stack:**
   ```bash
   cd ~/yggdrasil-dew
   ./scripts/env-checker.sh .env.template .env
   docker-compose up -d
   ```
6. **Verificar servicios críticos:**
   ```bash
   docker ps
   # Comprobar: Ollama, LiteLLM, n8n, Wazuh, log_guardian
   curl http://localhost:11434/api/tags  # Ollama
   ```

### Escenario C — RAG/VectorDB perdido

**Síntoma:** IA responde sin contexto del ecosistema.  
**RTO objetivo:** < 30 min si hay backup reciente

```bash
# TODO: definir ruta exacta del volumen Chroma/Qdrant
# rsync -avz /backup/rag-volume/ /var/lib/docker/volumes/[nombre-volumen]/
# Reiniciar contenedor de IA con contexto
```

### Escenario D — Token expuesto (como #45)

**Acción inmediata (< 5 min):**

1. Telegram: BotFather → `/mybots` → seleccionar bot → `API Token` → `Revoke`
2. LiteLLM: entrar al dashboard → regenerar API key
3. Actualizar `.env` con nuevos tokens
4. Reiniciar servicios afectados: `docker restart [servicio]`
5. **Verificar historial Git:** `git log --all --full-history -- '*env*'`
   Si hay tokens en historial → ejecutar `git filter-repo` para limpiarlos

---

## 3. Servicios críticos y sus healthchecks

| Servicio | Puerto | Check |
|----------|--------|-------|
| Ollama | 11434 | `curl http://localhost:11434/api/tags` |
| LiteLLM | TODO | `curl http://localhost:[puerto]/health` |
| n8n | TODO | `curl http://localhost:[puerto]/healthz` |
| Open WebUI | TODO | `curl http://localhost:[puerto]/health` |
| log_guardian_bot | TODO | `curl http://localhost:[puerto]/health` |

> **TODO:** completar puertos reales y añadir healthchecks en `docker-compose.yml`

---

## 4. Contactos y recursos críticos

- **Telegram BotFather:** `@BotFather` en Telegram
- **LiteLLM dashboard:** TODO — añadir URL
- **Tailscale (acceso remoto):** TODO — IP de Madre en Tailscale
- **Router (cerrar puerto 21):** issue [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15)

---

## 5. Checklist post-recuperación

```bash
# Verificar repos privados siguen privados
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/WIKI---PERSONAL/main/README.md | head -1
curl -sI https://raw.githubusercontent.com/alvarofernandezmota-tech/yggdrasil-secops/main/README.md | head -1
# Ambos deben dar 404

# Verificar Docker
docker ps --format 'table {{.Names}}\t{{.Status}}'

# Verificar HDD
sudo smartctl -a /dev/[disco-madre]  # issue #31
```

---

## 6. Relación con el Plan Maestro

- Este runbook cubre la operabilidad que faltaba (ver Fase 7 del Plan Maestro)
- Issues directamente relacionados: [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) [#31](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/31)
- Para completar este DRP necesitas acceso a terminal en Madre

---

_Creado: 2026-07-13 · Fuente: investigación Gemini 2026-07-13 · Estado: esqueleto_
