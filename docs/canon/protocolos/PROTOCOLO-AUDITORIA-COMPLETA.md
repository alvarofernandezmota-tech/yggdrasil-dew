# PROTOCOLO-AUDITORIA-COMPLETA

> **Versión:** 1.0 · **Creado:** 2026-07-18 · **Autor:** Perplexity-MCP  
> **Nivel:** 2 — Protocolo de auditoría  
> **Issue de origen:** #80

---

## Propósito

Protocolo maestro que orquesta agentes especializados por dominio para auditar el ecosistema Yggdrasil de principio a fin. Se ejecuta:
- Al inicio de una sesión de revisión profunda
- Cuando se sospecha de inconsistencias entre repos
- Antes de una consolidación o reestructuración mayor
- Una vez al mes como mantenimiento preventivo

---

## Arquitectura de agentes

```
PROTOCOLO-AUDITORIA-COMPLETA
    │
    ├── AGENTE-DEW      → audita issues, ADRs, protocolos, ESTADO-SISTEMA
    ├── AGENTE-WIKI     → audita islas, INDEX, ecosistema.md, 279→<80 archivos
    ├── AGENTE-TRACKING → audita diarios, estructura canónica, estado personal
    ├── AGENTE-INFRA    → audita servicios Madre, docker-compose, puertos
    └── consolida       → informe gaps + commit canon + issues abiertos
```

---

## FASE 0 — Pre-auditoría (5 min)

```
□ Ejecutar PROTOCOLO-INICIO-SESION completo
□ Confirmar que BOOTSTRAP.md está actualizado
□ Listar todos los repos activos de la org
□ Declarar al usuario el alcance de la auditoría
```

---

## FASE 1 — AGENTE-DEW (10-15 min)

Repo objetivo: `yggdrasil-dew`

```
□ Listar issues abiertos — identificar duplicados
□ Cerrar duplicados detectados (con referencia al issue maestro)
□ Verificar que todos los issues tienen label adecuada
□ Auditar ADRs:
    □ ¿Hay decisiones sin ADR? → abrir issue para crearla
    □ ¿Hay ADRs deprecadas sin marcar? → marcarlas
□ Auditar protocolos en docs/canon/protocolos/:
    □ ¿Todos los referenciados en BOOTSTRAP existen?
    □ ¿Algún protocolo está desactualizado?
□ Verificar ESTADO-SISTEMA.md — ¿está actualizado?
□ Verificar OWNERSHIP-MATRIX.md — ¿cubre todos los servicios?
```

Output: lista de gaps con issues creados.

---

## FASE 2 — AGENTE-WIKI (10-15 min)

Repo objetivo: `WIKI---PERSONAL` (o `yggdrasil-wiki`)

```
□ Contar archivos .md activos (objetivo: <80)
□ Auditar wiki/islas/INDEX.md — ¿todas las islas tienen ficha?
□ Para cada isla en INDEX:
    □ ¿La ficha tiene >800 bytes de contenido real?
    □ ¿Está actualizada (no tiene datos de hace >30 días sin revisión)?
□ Identificar archivos candidatos a archivar en wiki/_archivo/
□ Identificar contenido técnico que debería vivir en yggdrasil-dew
□ Verificar que ecosistema.md refleja los repos actuales
```

Output: lista de islas vacías, archivos a archivar, contenido a mover.

---

## FASE 3 — AGENTE-TRACKING (5-10 min)

Repo objetivo: `yggdrasil-tracking` (o `VIDAPERSONAL`)

```
□ Verificar estructura canónica de diarios: YYYY-MM/YYYY-MM-DD.md
□ Identificar diarios fuera de la estructura canónica
□ Verificar que el diario de la sesión actual existe
□ ¿Hay tareas en diarios que deberían ser issues en DEW?
□ ¿El estado personal refleja la realidad actual?
```

Output: lista de inconsistencias estructurales.

---

## FASE 4 — AGENTE-INFRA (15-20 min, requiere terminal)

Requiere: acceso SSH a Madre

```
□ docker ps — listar todos los servicios y su estado (healthy/unhealthy)
□ Identificar contenedores en crash loop
□ Verificar puertos expuestos — comparar con OWNERSHIP-MATRIX.md
□ Verificar que .env está en .gitignore (NUNCA trackeado)
□ Verificar que docker-compose de los servicios activos están en madre-config
□ Verificar Tailscale activo
□ Verificar backups (si existe script de backup)
```

Output: HALs detectados (issues en yggdrasil-dew con label `bug`).

**Nota:** Si no hay terminal disponible, esta fase se documenta como PENDIENTE con issue abierto.

---

## FASE 5 — Consolidación y cierre (5 min)

```
□ Generar informe de auditoría:
    □ Issues cerrados (duplicados, resueltos)
    □ Issues abiertos en esta sesión
    □ Gaps detectados por dominio
    □ Estado de cada repo: CONSISTENTE / DEUDA / ROTO
□ Actualizar ESTADO-SISTEMA.md con resultado de la auditoría
□ Actualizar BOOTSTRAP.md si cambió algo estructural
□ Ejecutar PROTOCOLO-CIERRE-SESION
```

---

## Formato del informe de auditoría

```markdown
## AUDITORÍA YGGDRASIL — YYYY-MM-DD HH:MM CEST

### Resumen
- Issues cerrados: N
- Issues abiertos: N
- Repos auditados: N
- HALs detectados: N

### Estado por dominio
| Dominio | Repo | Estado | Notas |
|---|---|---|---|
| Canon | yggdrasil-dew | CONSISTENTE | - |
| Wiki | WIKI---PERSONAL | DEUDA | 279 archivos, objetivo <80 |
| Tracking | yggdrasil-tracking | CONSISTENTE | - |
| Infra | madre-config | PENDIENTE (sin terminal) | - |

### Próxima auditoría sugerida
[fecha] — foco en [dominio con más deuda]
```

---

## Frecuencia recomendada

| Tipo | Frecuencia | Fases |
|---|---|---|
| Auditoría express | Inicio de sesión | FASE 0 + FASE 1 |
| Auditoría completa | Semanal | TODAS las fases |
| Auditoría profunda | Mensual | TODAS + revisión de ADRs |

---

## Relacionado

- Issue #80 — origen de este protocolo
- `PROTOCOLO-INICIO-SESION.md`
- `PROTOCOLO-CIERRE-SESION.md`
- `yggdrasil-orquestador/BOOTSTRAP.md`
- ADR-001, ADR-002, ADR-008, ADR-013
