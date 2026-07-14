---
tipo: protocolo
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-14 17:56 CEST
actualizado: 2026-07-14 17:56 CEST
ruta: protocolo/PROTOCOLO-AUDITORIA-ECOSISTEMA.md
tags: [protocolo, auditoria, ecosistema, yggdrasil]
status: vigente
version: 1.0
---

# 🔍 PROTOCOLO-AUDITORIA-ECOSISTEMA — Auditoría Total del Ecosistema Yggdrasil

> Auditoría completa de coherencia, integridad y salud de todos los repos del ecosistema.
> Se ejecuta mensualmente o tras cambios estructurales grandes (nuevo repo, deprecación, migración).
> El agente IA puede ejecutar las fases 1–4. Las fases 5–6 requieren acción humana en Madre.

---

## 0. CUÁNDO EJECUTAR ESTE PROTOCOLO

```
- Cierre de mes (obligatorio)
- Tras deprecar o migrar un repo
- Tras añadir un repo nuevo al ecosistema
- Tras cambiar la estructura de islas en yggdrasil-wiki
- Cuando MASTER-PENDIENTES lleva > 2 semanas sin revisión
- Cuando el INDEX de protocolos y los archivos físicos puedan estar desincronizados
```

---

## FASE 1 — INVENTARIO DE REPOS

**Objetivo:** verificar que la tabla de repos en `ECOSYSTEM-ARCHITECTURE.md` refleja la realidad.

```
[ ] Listar todos los repos GitHub del usuario alvarofernandezmota-tech
[ ] Comparar con tabla en ECOSYSTEM-ARCHITECTURE.md § 2
[ ] Identificar repos en GitHub que NO están en la tabla → candidatos a documentar o archivar
[ ] Identificar repos en tabla que NO están en GitHub → candidatos a eliminar de la tabla
[ ] Verificar estado (Activo / Mantenimiento / DEPRECADO) de cada repo
[ ] Actualizar tabla y fecha en ECOSYSTEM-ARCHITECTURE.md
```

**Señales de alerta:**
- Repo en GitHub sin README
- Repo en GitHub sin commits en > 90 días sin estar marcado DEPRECADO
- Repo marcado DEPRECADO con commits recientes

---

## FASE 2 — RUTAS LOCALES EN MADRE

**Objetivo:** verificar que los repos clonados en Madre coinciden con el ecosistema activo.

**Comando de diagnóstico (ejecutar en Madre):**
```bash
find /home/varopc -maxdepth 2 -name ".git" -type d 2>/dev/null | sed 's/\/.git//'
```

```
[ ] Ejecutar comando en Madre
[ ] Comparar resultado con tabla § 3 de ECOSYSTEM-ARCHITECTURE.md
[ ] Identificar repos clonados con nombre incorrecto (ej: WIKI---PERSONAL vs yggdrasil-wiki)
[ ] Identificar repos del ecosistema activo NO clonados en Madre
[ ] Identificar repos clonados DEPRECADOS que deberían eliminarse
[ ] Actualizar tabla de rutas locales en ECOSYSTEM-ARCHITECTURE.md
```

**Acciones correctoras:**
```bash
# Renombrar carpeta local incorrecta
mv /home/varopc/WIKI---PERSONAL /home/varopc/yggdrasil-wiki

# Eliminar repo DEPRECADO de Madre (tras verificar que no hay cambios sin push)
cd /home/varopc/yggdrasil-formacion- && git status
# Si limpio:
rm -rf /home/varopc/yggdrasil-formacion-

# Clonar repo faltante
cd /home/varopc && git clone git@github.com:alvarofernandezmota-tech/<repo>.git
```

---

## FASE 3 — INTEGRIDAD DEL INDEX DE PROTOCOLOS

**Objetivo:** verificar que `protocolo/INDEX.md` y los archivos físicos en `protocolo/` están sincronizados.

```
[ ] Listar archivos físicos en protocolo/: ls protocolo/*.md
[ ] Comparar con entradas en protocolo/INDEX.md
[ ] Identificar entradas en INDEX sin archivo físico → fantasmas (borrar del INDEX)
[ ] Identificar archivos físicos sin entrada en INDEX → huérfanos (añadir al INDEX)
[ ] Verificar que versiones en INDEX coinciden con versiones en frontmatter de cada archivo
[ ] Verificar que ningún protocolo tiene status: deprecado sin estar marcado en INDEX
```

**Regla:** si INDEX y disco no coinciden → disco manda, INDEX se corrige.

---

## FASE 4 — COHERENCIA ENTRE REPOS

**Objetivo:** verificar que las referencias cruzadas entre repos son correctas.

```
[ ] Verificar que yggdrasil-dew/ECOSYSTEM-ARCHITECTURE.md nombra correctamente todos los repos activos
[ ] Verificar que cada repo activo tiene README.md con frontmatter correcto
[ ] Verificar que los repos con ESTADO-ISLA-*.md en yggdrasil-dew tienen archivo actualizado
[ ] Verificar que MASTER-PENDIENTES.md no tiene ítems completados sin cerrar
[ ] Verificar que no hay issues abiertos marcados [CIERRE] sin cerrar
[ ] Verificar que las labels GitHub existen en todos los repos activos
```

---

## FASE 5 — AUDITORÍA DE SEGURIDAD SUPERFICIAL

**Objetivo:** detección rápida de problemas de seguridad evidentes.

```
[ ] Verificar que ningún repo público contiene .env o secretos en commits recientes
[ ] Verificar que yggdrasil-secops/hallazgos/ tiene los HAL abiertos con fecha < 30 días
[ ] Verificar que las claves SSH de Madre no han expirado
[ ] Verificar que Tailscale está activo: tailscale status
[ ] Verificar que no hay puertos abiertos inesperados: ss -tlnp
```

> Para auditoría de seguridad profunda → ejecutar PROTOCOLO-AUDITORIA-PROYECTO.md por repo.

---

## FASE 6 — SALUD DEL SISTEMA MADRE

**Objetivo:** verificar estado del servidor principal.

```bash
# Disco
df -h /home/varopc

# Docker
docker ps --format "table {{.Names}}\t{{.Status}}"

# Servicios críticos
systemctl status ollama 2>/dev/null || echo "ollama: no systemd"

# Git status de todos los repos clonados
for dir in $(find /home/varopc -maxdepth 2 -name ".git" -type d | sed 's/\/.git//'); do
  echo "=== $dir ==="
  git -C "$dir" status --short
done
```

```
[ ] Disco: /home/varopc > 20% libre
[ ] Docker: todos los contenedores esperados corriendo
[ ] Git: ningún repo con cambios sin push
[ ] Logs: sin errores críticos en /var/log/syslog últimas 24h
```

---

## FASE 7 — INFORME DE AUDITORÍA

**Objetivo:** documentar resultados y crear issues para lo encontrado.

```
[ ] Crear issue [AUDITORIA] en yggdrasil-dew con:
    - Fecha de auditoría
    - Repos verificados
    - Hallazgos por fase
    - Acciones correctoras ejecutadas
    - Acciones correctoras pendientes (con issue propio cada una)
[ ] Actualizar ECOSYSTEM-ARCHITECTURE.md fecha de auditoría
[ ] Push commit: "chore(auditoria): ecosistema YYYY-MM-DD"
```

**Formato del issue de auditoría:**
```markdown
## Auditoría Ecosistema — YYYY-MM-DD

**Duración:** Xmin
**Ejecutado por:** Álvaro + Perplexity-MCP

### Hallazgos
- [ ] F1: ...
- [ ] F2: ...

### Acciones ejecutadas
- ✅ ...

### Pendiente
- [ ] Issue #XX — ...
```

---

## PERIODICIDAD RECOMENDADA

| Frecuencia | Fases | Tiempo estimado |
|---|---|---|
| Mensual (obligatorio) | Todas (1–7) | ~45 min |
| Semanal (recomendado) | 1, 2, 3 | ~10 min |
| Tras cambio estructural | 1, 2, 3, 4 | ~20 min |
| Incidente de seguridad | 5 + PROTOCOLO-AUDITORIA-PROYECTO | Variable |

---

_Creado: 2026-07-14 17:56 CEST · Perplexity-MCP_
