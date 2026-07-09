---
tipo: sesion
fecha: 2026-07-09
cierre: 2026-07-10T00:44 CEST
author: Alvaro Fernandez Mota
status: cerrada
tags: [sesion, madre, docker, seguridad, iac, watchdog, env, hdd]
---

# Sesión 2026-07-09/10 — Cierre

## Resumen ejecutivo

Sesión larga de documentación, auditoría y hallazgos operativos en Madre.
Se completó la estructura del triángulo (DEW / VIDAPERSONAL / WIKI), se auditaron islas,
se descubrieron incidencias críticas en Madre y se documentaron con issues.

---

## Trabajo realizado

### VIDAPERSONAL
- Estructura canónica definida: `2026/MM-mes/YYYY-MM-DD.md`
- Issue #14 creado con comandos de limpieza git
- `ECOSISTEMA-CANON.md` creado en `00_sistema/`
- `PLAN-DOMINGO-2026-07-13.md` creado con 5 bloques
- `PENDIENTE-ECOSISTEMA.md` actualizado

### WIKI (yggdrasil-wiki)
- Islas completadas: `vida`, `ecosistema`, `madre`, `acer`, `thea`, `impresion3d`, `ia-local`, `seguridad`, `labs`, `thdora`, `formacion`
- Triángulo documentado en todas las islas relevantes
- `ecosistema.md` actualizado con las 18 repos

### DEW
- Issue #43 creado: IaC Madre — versionar 16 docker-compose
- Issue #30 cerrado: HAL-006 secretos THDORA (.env) — rotación completada

---

## Hallazgos operativos Madre (2026-07-10 00:25 CEST)

### HAL-007 — .env raiz malformado 🔴 CRÍTICO

**Archivo:** `/home/varopc/.env`
**Error:** `failed to read /home/varopc/.env: line 7: key cannot contain a space`

**Causa:** El `.env` contiene comandos bash mezclados con variables de entorno:
- Línea 2: `CODE_SERVER_PASSWORD=batcueva2026 CODE_SERVER_SUDO=batcueva2026` (dos vars en una línea)
- Línea 7: `docker compose -f docker-compose.maestro.yml up -d` (comando bash, no variable)
- Línea 8: `--force-recreateTS_CHECK_INTERVAL=60 TS_OFFLINE_UMBRAL=3 NODO_madre=100.91.112.32`

**Impacto:** `docker compose` falla al leer el `.env` — todos los servicios que dependen de él pueden no recibir variables de entorno correctamente.

**Acción inmediata:**
```bash
cp /home/varopc/.env /home/varopc/.env.bak-2026-07-10
# Editar y separar cada variable en su propia línea
# Eliminar comandos bash del archivo
chmod 600 /home/varopc/.env
```

**Estado:** 🔴 Abierto — Issue #44 DEW

---

### HAL-008 — Secretos expuestos en chat 🔴 CRÍTICO

Durante la sesión se expusieron las siguientes credenciales reales en el chat:

- `N8N_ENCRYPTION_KEY` — rotar en n8n
- `CODE_SERVER_PASSWORD` / `CODE_SERVER_SUDO` — cambiar en code-server
- `LITELLM_MASTER_KEY` — rotar en LiteLLM
- `TELEGRAM_BOT_TOKEN` — revocar en BotFather y regenerar
- `TELEGRAM_USER_ID` — no secreto pero documentado

**Acción inmediata:**
1. Ir a BotFather → /mybots → Revoke token del bot
2. Generar nuevo token y actualizar `.env`
3. Reiniciar contenedores THDORA
4. Regenerar `LITELLM_MASTER_KEY` y `N8N_ENCRYPTION_KEY`

**Estado:** 🔴 Abierto — Issue #45 DEW

---

### HAL-009 — log_guardian_bot en crash loop 🟡 ALTA

**Evidencia del watchdog:**
```
[!] log_guardian_bot: health=unhealthy — reiniciando (intento #971, próxima revisión en 300s)
[!] local_tripwire: health=unhealthy — reiniciando (intento #486, próxima revisión en 300s)
```

**Impacto:** Bot de alertas de seguridad no operativo. 971 reinicios = fallo estructural, no puntual.
**Sospecha:** Puede estar relacionado con el `.env` malformado (variables de entorno incorrectas).

**Acción:** Arreglar `.env` primero → reiniciar log_guardian_bot → revisar logs del propio contenedor.

**Estado:** 🟡 Abierto — Issue #46 DEW

---

### Puerto 21 FTP — filtered (no open) ✅ MEJORADO

**Evidencia:**
```
Nmap scan report for varpc.taileb8343.ts.net (100.91.112.32)
PORT   STATE    SERVICE
21/tcp filtered ftp
```

**Interpretación:** `filtered` significa que hay un firewall/filtro bloqueando las sondas.
El puerto no aparece como `open`. Riesgo reducido vs estado anterior.
**Pendiente:** Confirmar desde red externa que no está abierto en IP pública real (no Tailscale).

**Estado:** 🟡 Parcialmente resuelto — Issue #15 actualizado

---

### HDD Madre — SMART estable pero antiguo 🟡 MONITORIZAR

**Evidencia smartctl:**
```
Power_On_Hours:      28.811 horas (~3.3 años continuo)
Reallocated_Sector_Ct:   0  (ninguno reasignado)
Current_Pending_Sector:  0  (ninguno pendiente)
Offline_Uncorrectable:   0  (ninguno irrecuperable)
Temperatura:             45°C (normal)
```

**Conclusión:** No hay fallo SMART activo. El riesgo es estadístico por antigüedad.
**Plan:** Monitorizar mensualmente con smartctl. Planificar sustitución preventiva en Q4 2026.

**Estado:** 🟡 En monitorización — Issue #31 actualizado

---

### IaC Docker — 28 compose files detectados, 0 versionados en madre-config 🔴

**Inventario detectado:**
```
/home/varopc/docker-compose.yml                    ← stack IA principal
/home/varopc/Projects/thdora/docker-compose.yml   ← THDORA
/home/varopc/spiderfoot/docker-compose.yml         ← SpiderFoot
/home/varopc/docker/batcueva-nueva/               ← batcueva
/home/varopc/yggdrasil-secops/...                 ← blue team (7 composes)
/srv/yggdrasil-dew/docker/madre/...               ← fases 1-3 (versionados)
```

**Problema:** Los compose en `/home/varopc/` son la verdad operativa pero no están en un repo.
**Estado:** 🔴 Abierto — Issue #43 DEW

---

## Stack IA Principal (docker-compose.yml raíz)

Documentado en esta sesión. 4 servicios, validado 2026-06-25:

| Servicio | Imagen | RAM límite | Estado |
|----------|--------|------------|--------|
| ollama | ollama/ollama:latest | 7 GB | ▶ running |
| ollama-embeddings | ollama/ollama:latest | 2 GB | ▶ running |
| qdrant | qdrant/qdrant:latest | 2 GB | ▶ running |
| open-webui | ghcr.io/open-webui/open-webui:main | 1 GB | ▶ running |

**RAM total estimada con stack completo: ~11.5 GB / 16 GB ✅**
**Restricciones:** NO qwen2.5:14b con stack activo. NO dos modelos 7B+ simultáneos.

---

## Issues abiertos por esta sesión

| Issue | Título | Prioridad |
|-------|--------|-----------|
| #43 | IaC Madre — versionar 16 docker-compose | 🔴 CRÍTICO |
| #44 | HAL-007 .env raíz malformado | 🔴 CRÍTICO |
| #45 | HAL-008 Secretos expuestos en chat | 🔴 CRÍTICO |
| #46 | log_guardian_bot crash loop #971 + local_tripwire | 🟡 ALTA |

## Issues cerrados por esta sesión

| Issue | Título |
|-------|---------|
| #30 | HAL-006 Secretos THDORA — rotación completada |

---

_Sesión cerrada: 2026-07-10 00:44 CEST · Perplexity-MCP_
