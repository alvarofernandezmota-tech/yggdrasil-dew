---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-13
actualizado: 2026-07-13
ruta: docs/canon/CONVENCIONES-SEGURIDAD.md
tags: [canon, seguridad, ci, secretos, convenciones]
status: vigente
---

# Convenciones de Seguridad — Yggdrasil

> Este documento define qué detecta el CI automáticamente, qué no detecta (y hay que vigilar manualmente), y cuáles son las reglas de oro para no filtrar información sensible.

---

## Capas de detección automática

| Capa | Workflow | Qué detecta | Se activa |
|------|----------|-------------|----------|
| **1 — Gitleaks** | `gitleaks.yml` | Secretos en el historial git completo (tokens, keys, passwords en cualquier commit) | Push + PR a main |
| **2 — Patrones sensibles** | `validate-canon.yml` (job `secret-patterns`) | IPv4 no genéricas, emails reales, tokens hardcodeados en docs | Push + PR sobre `.md` |
| **3 — Markdownlint** | `markdownlint.yml` | Errores de formato Markdown que pueden ocultar contenido | Push + PR sobre `.md` |
| **4 — Frontmatter** | `validate-canon.yml` (job `frontmatter`) | Docs sin metadatos requeridos (tipo, actualizado, status) | Push + PR sobre `.md` |

---

## Reglas de oro — nunca hacer

1. **Nunca `cat` ni `nl` sobre un `.env` en un chat compartido** — HAL-008 [#45]
2. **Nunca pegar output de `docker inspect` o `env` sin filtrar** — expone variables de entorno
3. **Nunca commitear un `.env` real** — siempre `.env.example` con valores ficticios
4. **Nunca escribir una IP de Tailscale en docs/** — el CI la detectará y bloqueará el push
5. **Nunca escribir un email personal en docs/** — ídem
6. **Si hay duda, usar `grep -c '=' .env` en lugar de imprimir el contenido**

---

## IPs y emails permitidos en docs (lista blanca)

### IPs genéricas permitidas
```
192.168.1.1   127.0.0.1   0.0.0.0   255.255.255.255
10.0.0.0      10.0.0.1    172.16.0.1  8.8.8.8  1.1.1.1
```

### Emails permitidos (sólo ejemplos)
```
user@example.com    test@test.com    your@email.com
```

Cualquier otra IP o email **bloquea el push automáticamente**.

---

## Rotación de credenciales — protocolo

### Si se expone un token de Telegram
```bash
# 1. BotFather → /mybots → bot → API Token → Revoke
# 2. Actualizar /home/varopc/.env con el nuevo token
# 3. docker restart thdora_api thdora_bot
# 4. Cerrar issue HAL-008 (#45)
```

### Si se expone cualquier otro secreto
```bash
# 1. Revocar en el servicio origen (n8n, LiteLLM, code-server, etc.)
# 2. Generar nuevo valor
# 3. Actualizar /home/varopc/.env
# 4. docker restart [servicio afectado]
# 5. Verificar en logs que el servicio arranca con el nuevo valor
```

---

## Issues de seguridad activos

| Issue | HAL | Estado | Acción requerida |
|-------|-----|--------|------------------|
| [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44) | HAL-007 | 🔴 Abierto | `nano /home/varopc/.env` — arreglar línea 7 |
| [#45](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/45) | HAL-008 | 🔴 Abierto | BotFather → revocar token Telegram |
| [#46](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/46) | HAL-009 | 🔴 Abierto | Espera cierre de #44 y #45 |
| [#15](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/15) | — | 🟡 Pendiente | Confirmar puerto 21 cerrado desde IP externa |

---

_Creado: 2026-07-13 · Fase 5 CI completada · Cierra #38 y #39 · Perplexity-MCP_
