# Runbook: HAL-007 — Corregir .env malformado en Madre

**Issue:** [#44](https://github.com/alvarofernandezmota-tech/yggdrasil-dew/issues/44)  
**Tiempo estimado:** 10 min  
**Prerrequisito:** Haber rotado tokens primero (HAL-008 #45)

---

## Síntoma

```
failed to read /home/varopc/.env: line 7: key cannot contain a space
```

El `.env` tiene comandos bash mezclados con variables y múltiples variables en una sola línea.

---

## Pasos

```bash
# 1. Conectar a Madre
ssh varopc@madre

# 2. Backup del .env actual
cp /home/varopc/.env /home/varopc/.env.bak-$(date +%Y%m%d)

# 3. Editar — REGLA: una variable por línea, sin comandos bash, sin espacios
nano /home/varopc/.env
```

**Formato correcto:**
```
CODE_SERVER_PASSWORD=tu_valor
CODE_SERVER_SUDO=tu_valor
LITELLM_MASTER_KEY=tu_valor
TELEGRAM_BOT_TOKEN=tu_nuevo_token
TELEGRAM_USER_ID=tu_id
N8N_ENCRYPTION_KEY=tu_valor
```

**Errores comunes a eliminar:**
- Dos variables en una línea: `VAR_A=x VAR_B=x` → separar en dos líneas
- Comandos bash: `docker compose up -d` → borrar
- Flags pegados: `--force-recreateTS_CHECK=60` → borrar

```bash
# 4. Permisos correctos
chmod 600 /home/varopc/.env

# 5. Validar que docker compose lee el .env correctamente
docker compose -f /home/varopc/docker-compose.yml config > /dev/null && echo "✅ OK"
```

---

## Verificación de cierre

```bash
# Sin errores de parsing
docker compose config > /dev/null && echo "OK"

# El .env no está trackeado en git
git -C ~/yggdrasil-dew status | grep -v ".env.template"
```

---

## Lección aprendida

NUNCA usar `cat` o `nl` sobre `.env` en un chat. Para contar líneas: `wc -l .env`.
