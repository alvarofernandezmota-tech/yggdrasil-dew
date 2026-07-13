---
title: Política de Secretos — Ecosistema Yggdrasil
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/secrets.md
tags: [secretos, seguridad, tokens, rotacion]
status: vigente
---

# 🔐 Política de Secretos — Yggdrasil

> Este archivo define el ciclo de vida de los secretos del ecosistema.
> **NUNCA contiene valores reales.** Los valores viven SOLO en `.env` local (fuera del repo)
> o en Vaultwarden.

---

## Regla de oro

```
NUNCA usar cat / nl / less sobre .env en un chat o sesión compartida.
NUNCA commitear un .env con valores reales.
SIEMPRE usar .env.template como referencia pública.
```

---

## Inventario de secretos activos

| Variable | Servicio | Dónde rotar | Frecuencia | Última rotación |
|---|---|---|---|---|
| `TELEGRAM_BOT_TOKEN` | thdora-bot | BotFather → /mybots → Revoke | Tras exposición / 90 días | 2026-07-10 (expuesto en chat — HAL-008) |
| `LITELLM_MASTER_KEY` | LiteLLM proxy | Dashboard LiteLLM | Tras exposición / 90 días | 2026-07-10 (expuesto en chat — HAL-008) |
| `N8N_ENCRYPTION_KEY` | n8n | `docker exec n8n` + regenerar | Solo si se compromete | 2026-07-10 (expuesto en chat — HAL-008) |
| `CODE_SERVER_PASSWORD` | code-server | nano .env + restart | Cada 6 meses | 2026-07-10 (expuesto en chat — HAL-008) |
| `CODE_SERVER_SUDO` | code-server | nano .env + restart | Cada 6 meses | 2026-07-10 (expuesto en chat — HAL-008) |
| SSH keys (Madre/Acer) | SSH | `ssh-keygen` + `authorized_keys` | Anual | Pendiente auditar |
| Tailscale auth key | Tailscale | dashboard.tailscale.com | Según expiración | Pendiente auditar |

---

## Procedimiento de rotación segura

### Telegram Bot Token

```bash
# 1. Ir a BotFather en Telegram
# /mybots → seleccionar bot → API Token → Revoke
# 2. Copiar nuevo token
nano /home/varopc/.env
# Editar línea: TELEGRAM_BOT_TOKEN=<nuevo_token>
# 3. Reiniciar bot
docker restart thdora_bot
# 4. Verificar
docker logs --tail 20 thdora_bot
```

### LiteLLM Master Key

```bash
# 1. Acceder al dashboard de LiteLLM → Keys → Revoke master key
# 2. Generar nueva key
nano /home/varopc/.env
# Editar línea: LITELLM_MASTER_KEY=<nueva_key>
# 3. Reiniciar
docker restart litellm
```

---

## Qué hacer si un secreto se expone

1. **PARAR** — no ejecutar más comandos hasta revocar
2. Revocar el token en el proveedor (BotFather, dashboard, etc.) **antes** de actualizar .env
3. Actualizar `.env` con nuevo valor
4. Reiniciar contenedor afectado
5. Verificar en logs que el servicio arranca con el nuevo token
6. Abrir issue HAL con el incidente documentado
7. Revisar historial Git — si el `.env` llegó a estar en un commit, ejecutar `git filter-repo`

---

## Verificación del historial Git (HAL-001/003 pendiente)

Si sospechas que un token llegó a estar en un commit:

```bash
# Verificar si el token aparece en el historial
git log --all -p | grep -i "TELEGRAM_BOT_TOKEN"

# Si aparece → limpiar historial (destructivo, hacer backup primero)
git filter-repo --path .env --invert-paths
# o usar BFG Repo-Cleaner:
bfg --delete-files .env
git push origin --force --all
```

También revisar: GitHub Settings → Security → Secret scanning → ver alertas históricas.

---

## Evolución futura (F7 — no implementado)

- [ ] `.env.template` con todas las variables (sin valores) → commitear en repo
- [ ] `scripts/env-checker.sh` — validar `.env` contra template antes de `docker compose up`
- [ ] Evaluar `sops` + `age` key para cifrado de secretos en reposo
- [ ] Vaultwarden como fuente única de secretos (ya instalado en Madre)

---

_Creado: 2026-07-13 · Perplexity-MCP · Relacionado: HAL-008 #45, HAL-001/003_
