---
tipo: canon
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-AUDITORIA.md
tags: [canon, auditoria, protocolo, isla, repo]
status: vigente
version: 1
---

# 🔍 Protocolo de Auditoría

> Checklist estándar para auditar cualquier isla, repo o servicio del ecosistema.  
> Usar siempre que un AUDIT-XXX issue esté activo.  
> Resultado: isla/repo en estado conocido y documentado.

---

## Cuándo ejecutar este protocolo

- Issue con label `audit` abierto
- Isla marcada como `estado: desconocido` en `wiki/islas/INDEX.md`
- Repo sin auditar tras +30 días sin sesión
- Antes de cualquier cambio estructural en un repo
- Tras un incidente HAL que afecta a un repo

---

## Bloque A — Auditoría de REPO

### A1. Estructura
- [ ] `README.md` existe y tiene propósito claro
- [ ] `AGENT.md` existe y está actualizado (o está planificado)
- [ ] `CONTEXT.md` existe y tiene ecosistema correcto
- [ ] No hay archivos en raíz sin clasificar (zombis)
- [ ] Estructura de carpetas sigue las convenciones del ecosistema
- [ ] Nombres de archivos en kebab-case o MAYUSCULAS según tipo

### A2. Seguridad
- [ ] `.env` NO está trackeado (`git ls-files | grep .env` → vacío)
- [ ] `.gitignore` tiene `.env`, `*.key`, `*.pem`, `node_modules/`
- [ ] No hay secretos hardcodeados en ningún `.md` o script
- [ ] Si hay tokens → están en `.env` y `.env` está en `.gitignore`

### A3. Consistencia con el ecosistema
- [ ] Nombre del repo correcto según tabla canónica de nombres
- [ ] Referencias a otros repos usan nombres actuales (no aliases viejos)
- [ ] Isla correspondiente en `wiki/islas/` existe y está al día
- [ ] Issues relacionados en DEW existen y están en estado correcto

### A4. Git
- [ ] Rama principal es `main` (no `master`)
- [ ] No hay ramas huérfanas sin cerrar
- [ ] Último commit tiene mensaje descriptivo
- [ ] No hay archivos grandes (>1MB) trackeados innecesariamente

### A5. Documentación
- [ ] `README.md` tiene: propósito, estructura, cómo contribuir
- [ ] Cambios recientes relevantes tienen ADR asociado
- [ ] Si es repo operativo: runbook o procedimiento de recuperación existe

---

## Bloque B — Auditoría de ISLA (wiki)

### B1. Ficha de isla
- [ ] `wiki/islas/NOMBRE.md` existe
- [ ] Tiene frontmatter completo: `fecha`, `estado`, `repo`, `tags`
- [ ] Estado es uno de: `activo`, `standby`, `archivado`, `deprecado`
- [ ] Tiene sección de hardware/software real (no placeholder)
- [ ] Tiene sección de conexiones con otras islas
- [ ] Tiene sección de pendientes o issues relacionados
- [ ] Tamaño > 800 bytes (no está vacía)

### B2. Consistencia con DEW
- [ ] Issues de DEW relacionados con esta isla están linkeados
- [ ] ADRs que afectan esta isla están referenciados
- [ ] Estado en `wiki/islas/INDEX.md` coincide con el de la ficha

---

## Bloque C — Auditoría de SERVICIO (Docker/infra)

### C1. Estado
- [ ] `docker ps` muestra el contenedor como `healthy` o `Up`
- [ ] Logs sin errores recurrentes (`docker logs --tail 100 NOMBRE`)
- [ ] Puerto expuesto correcto y documentado en `ownership-matrix.md`
- [ ] Healthcheck configurado en el compose

### C2. Configuración
- [ ] `docker-compose.yml` versionado en `madre-config`
- [ ] Variables de entorno en `.env` (no hardcodeadas en compose)
- [ ] `restart: unless-stopped` configurado
- [ ] Volúmenes nombrados (no rutas anónimas)

### C3. Recuperabilidad
- [ ] Runbook de recuperación existe en `docs/runbooks/`
- [ ] Backup strategy documentada en `ownership-matrix.md`
- [ ] Se puede recrear desde cero con los archivos versionados

---

## Plantilla de resultado de auditoría

```markdown
## Resultado auditoría — [NOMBRE] — YYYY-MM-DD

**Ejecutada por:** Perplexity-MCP / Álvaro
**Tipo:** repo / isla / servicio

### Hallazgos
| Ítem | Estado | Acción |
|---|---|---|
| [bloque.check] | ✅/❌/⚠️ | [qué hacer si ❌] |

### Issues creados
- #N — [título]

### Estado final
> [LIMPIO / CON DEUDA / CRÍTICO] — [una frase]
```

---

## Criterio de auditoría completada

> La auditoría está completada cuando:
> 1. Todos los checks del bloque aplicable están marcados ✅ o tienen issue abierto en DEW
> 2. El resultado está documentado en `docs/islas/ESTADO-ISLA-[X].md` o en el issue de auditoría
> 3. El issue AUDIT-XXX está cerrado en GitHub
> 4. `wiki/islas/INDEX.md` tiene el estado actualizado de la isla

---

_Creado: 2026-07-16 · v1 · Perplexity MCP_
