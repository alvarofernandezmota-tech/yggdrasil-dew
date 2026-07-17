---
tipo: docs
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-17
ruta: docs/SECRETS.md
tags: [seguridad, secrets, tokens, credenciales]
status: vigente
version: 2
nota: renombrado de secrets.md en 2026-07-17 (issue #77)
---

# Gestión de Secrets — Yggdrasil

> Cómo gestionar credenciales, tokens y secrets en el ecosistema.
> Ningún secret va en git. Ningún secret en texto plano en issues.

---

## Regla absoluta

```
NINGÚN SECRET EN GIT — NUNCA
Ningún token, contraseña, API key, IP interna en ningún archivo commiteado.
Si se commitea por error → revocar inmediatamente + git filter-repo.
```

---

## Dónde viven los secrets

| Tipo | Dónde |
|---|---|
| Tokens de servicios (Telegram, APIs) | `.env` local en cada proyecto — en `.gitignore` |
| Credenciales Docker | `.env` junto al `docker-compose.yml` — en `.gitignore` |
| SSH keys | `~/.ssh/` — nunca en repo |
| Contraseñas | Vaultwarden (selfhosted en Madre) |
| Secrets de GitHub Actions | GitHub Secrets (UI) — no en archivos |

---

## Ciclo de vida de un token

```
1. Crear en servicio externo (BotFather, API dashboard, etc.)
2. Guardar en .env LOCAL del proyecto
3. Guardar copia en Vaultwarden
4. Usar en docker-compose como ${VARIABLE}
5. Rotar cada 90 días o ante sospecha de compromiso
6. Al rotar: revocar el viejo ANTES de generar el nuevo
7. Al rotar en Docker: usar --force-recreate (no restart)
```

---

## Secrets activos — estado

| Secret | Servicio | Estado | Issue |
|---|---|---|---|
| `TELEGRAM_BOT_TOKEN` (THDORA) | BotFather | ⚠️ Caducado | [#74](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/74) |
| GitHub PAT (MCP) | GitHub | ✅ Activo | — |
| Vaultwarden master | Vaultwarden | ✅ Activo | — |

---

## Lección aprendida — 2026-07-13

> El `.env` que lee Docker es el del directorio del `docker-compose.yml`.
> No existe `.env` global de Madre.
> `docker restart` NO refresca variables — usar `docker compose up -d --force-recreate --no-deps <servicio>`.

---

## Si se detecta un secret en git

```bash
# 1. Revocar el secret en el servicio externo INMEDIATAMENTE
# 2. Limpiar historial git
git filter-repo --path archivo-con-secret --invert-paths
git push --force-with-lease
# 3. Abrir HAL issue en yggdrasil-secops
# 4. Documentar en ADR si cambia arquitectura
```

---

_v2 · 2026-07-17 · Renombrado a SECRETS.md + expandido · Perplexity MCP_
