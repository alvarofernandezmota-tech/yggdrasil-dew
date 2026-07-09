---
tipo: canon
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/canon/RUNBOOKS.md
tags: [runbook, operaciones, incidencias, canon, madre]
status: activo
---

# Runbooks — Ecosistema Yggdrasil

> Procedimientos operativos estandarizados para incidencias conocidas.
> Formato: contexto → diagnóstico → pasos → criterio de resolución → escalado.
> Un runbook por incidencia. Nunca improvisar en producción sin consultar este documento primero.

---

## RB-001 — Madre no responde por SSH

**Contexto:** No se puede conectar a Madre vía SSH desde Acer o iPhone.

**Diagnóstico rápido:**
```bash
# Desde cualquier dispositivo con Tailscale
ping 100.91.112.32          # Verificar conectividad Tailscale
tailscale status             # Ver si Madre está en la red
telnet 100.91.112.32 22     # Verificar puerto SSH
```

**Pasos de resolución:**
1. Si `tailscale status` no muestra Madre → Tailscale caído en Madre → reinicio físico necesario
2. Si Tailscale responde pero SSH no → `sshd` caído: acceso físico o IPMI/KVM
3. Si SSH responde pero rechaza conexión → verificar `~/.ssh/authorized_keys` en Madre
4. Si todo responde → problema en cliente: `ssh -vvv` para diagnóstico

**Criterio de resolución:** `ssh alvaro@100.91.112.32` conecta sin error.

**Escalado:** Si requiere reinicio físico, documentar en diario con causa y hora.

---

## RB-002 — Servicio Docker caído

**Contexto:** Un contenedor del stack (Wazuh, Suricata, Pihole, SearXNG) no responde.

**Diagnóstico rápido:**
```bash
docker ps -a                          # Ver estado de todos los contenedores
docker logs <nombre-contenedor>       # Ver últimos logs
docker stats --no-stream              # Ver uso de recursos
df -h                                 # Verificar espacio en disco
```

**Pasos de resolución:**
1. Contenedor `Exited` → `docker start <nombre>` y verificar logs
2. OOM Kill (memoria) → `docker update --memory 2g <nombre>` o reducir otros servicios
3. Disco lleno → `docker system prune -f` y limpiar logs (`/var/log`)
4. Imagen corrupta → `docker-compose down && docker-compose pull && docker-compose up -d`

**Criterio de resolución:** `docker ps` muestra el contenedor en estado `Up`.

**Escalado:** Si el fallo es recurrente, abrir issue en yggdrasil-dew con logs y contexto.

---

## RB-003 — Ollama no responde / modelos no cargan

**Contexto:** `ollama list` falla o los modelos no responden.

**Diagnóstico rápido:**
```bash
systemctl status ollama              # Estado del servicio
curl http://localhost:11434/api/tags # API directa
nvidia-smi                           # Estado GPU
journalctl -u ollama -n 50          # Logs recientes
```

**Pasos de resolución:**
1. Servicio inactivo → `sudo systemctl restart ollama`
2. GPU no detectada → verificar driver NVIDIA: `nvidia-smi` debe mostrar GTX 1060
3. Modelo corrupto → `ollama rm <modelo> && ollama pull <modelo>`
4. Puerto ocupado → `ss -tlnp | grep 11434` y matar proceso conflictivo

**Criterio de resolución:** `ollama run mistral:7b 'hola'` devuelve respuesta.

---

## RB-004 — CI fallando en GitHub Actions

**Contexto:** Un workflow de CI falla en `validate-canon.yml` o `gitleaks`.

**Diagnóstico rápido:**
```bash
# Ver el log del workflow en GitHub
# https://github.com/alvarofernandezmota-tech/yggdrasil-dew/actions

# Reproducir localmente
git diff HEAD~1 --name-only          # Ver archivos cambiados
grep -rE '([0-9]{1,3}\.){3}[0-9]{1,3}' docs/  # Buscar IPs
grep -rE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' docs/  # Buscar emails
```

**Pasos de resolución:**
1. Fallo `validate-canon` por IP/email → reemplazar con placeholder `[REDACTED]` o mover a repo privado
2. Fallo `gitleaks` → revocar el secreto inmediatamente, rotar token, limpiar historial con BFG
3. Fallo de frontmatter → verificar campos `tipo:`, `ruta:`, `tags:`, `status:` en el archivo
4. CI roto por cambio de workflow → revisar sintaxis YAML con `yamllint`

**Criterio de resolución:** Todos los checks en verde en GitHub Actions.

**Escalado:** Si hay secreto expuesto → abrir HAL nuevo en yggdrasil-secops inmediatamente.

---

## RB-005 — Disco lleno en Madre

**Contexto:** Servicios fallan por falta de espacio o `df -h` muestra >90% en `/`.

**Diagnóstico rápido:**
```bash
df -h                                    # Uso por partición
du -sh /var/log/* | sort -rh | head -10  # Logs más grandes
du -sh ~/.ollama/models/*                # Modelos Ollama
docker system df                         # Espacio Docker
```

**Pasos de resolución:**
1. Logs excesivos → `journalctl --vacuum-size=500M`
2. Docker basura → `docker system prune -af --volumes`
3. Modelos Ollama no usados → `ollama rm <modelo>`
4. Archivos temporales → `find /tmp -mtime +7 -delete`

**Criterio de resolución:** `df -h /` muestra <80% de uso.

**Escalado:** Si el crecimiento es continuo, revisar qué proceso genera más datos y añadir rotación.

---

## RB-006 — Token GitHub o Telegram comprometido

**Contexto:** Sospecha o confirmación de token expuesto en historial git o en un log.

**Acción inmediata (primeros 5 minutos):**
1. **Revocar el token ahora** — GitHub Settings > Developer settings > Personal access tokens
2. Para Telegram: `https://t.me/BotFather` → `/revoke` → seleccionar bot
3. Verificar que el token ya no funciona: `curl -H "Authorization: token TOKEN" https://api.github.com/user`

**Investigación:**
```bash
# Buscar en historial git
git log --all --full-history -S 'TOKEN_PARCIAL' -- .
git grep 'TOKEN_PARCIAL' $(git rev-list --all)
```

**Limpiar historial con BFG:**
```bash
java -jar bfg.jar --replace-text patterns.txt .
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force
```

**Criterio de resolución:** Token revocado + no aparece en historial + nuevo token generado y funcionando.

**Escalado:** Abrir HAL en yggdrasil-secops. Documentar en diario con hora exacta de detección y resolución.

---

_Creado: 2026-07-06 · Fase 5 Plan de Alineación · Formato: runbook operativo estándar_
