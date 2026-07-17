---
tipo: protocolo
version: 1
author: Alvaro Fernandez Mota
creado: 2026-07-18
actualizado: 2026-07-18
ruta: docs/canon/protocolos/PROTOCOLO-AUDITORIA-REPOS.md
tags: [protocolo, auditoria, repos, canon]
status: vigente
---

# PROTOCOLO — Auditoría de Repos del Ecosistema

> Ejecutar cuando se quiera saber el estado real de todos los repos.
> Puede ejecutarlo un agente IA (MCP) o Álvaro manualmente.

---

## Cuándo ejecutar

- Al inicio de una sesión de mantenimiento
- Cuando hay dudas sobre el estado de un repo
- Al menos una vez por semana si el ecosistema está activo
- Siempre antes de una sesión de trabajo importante

---

## Repos a auditar

| Repo | Tipo | Prioridad |
|---|---|---|
| `yggdrasil-dew` | Canon | P0 — siempre primero |
| `WIKI---PERSONAL` | Conocimiento | P1 |
| `yggdrasil-tracking` | Personal | P1 |
| `yggdrasil-orquestador` | Orquestador | P1 |
| `madre-config` | Infra | P2 |
| `yggdrasil-formacion` | Aprendizaje | P2 |
| `yggdrasil-secops` | Seguridad | P2 |
| `THDORA-PERSONAL` | Bot | P2 |
| `ollama-stack` | IA local | P3 |
| `yggdrasil-scripts` | Scripts | P3 |
| `acer-config` | Workstation | P3 |

---

## Checklist por repo

Para cada repo verificar:

### Estructura mínima
- [ ] `README.md` existe y está al día
- [ ] `AGENT.md` existe (contrato del agente)
- [ ] `CONTEXT.md` existe (estado actual)
- [ ] `.gitignore` existe y cubre `.env`, secretos, binarios
- [ ] No hay archivos `.env` reales trackeados

### Calidad del contenido
- [ ] `AGENT.md` tiene: rol, reglas, repos relacionados, rutas clave
- [ ] `CONTEXT.md` tiene: fecha actualización, estado actual, pendientes
- [ ] `README.md` describe el repo correctamente

### Salud git
- [ ] Rama principal es `main`
- [ ] No hay ramas obsoletas sin cerrar
- [ ] Último commit tiene menos de 30 días (o hay razón documentada)
- [ ] No hay archivos de más de 1MB innecesarios

### Coherencia con DEW
- [ ] El repo aparece en `ESTADO-SISTEMA.md`
- [ ] El repo aparece en `MASTER-PENDIENTES.md` si tiene tareas abiertas
- [ ] El nombre del repo coincide con el canon (sin aliases viejos)

---

## Proceso de auditoría MCP

```
1. Leer ESTADO-SISTEMA.md de DEW — estado conocido
2. Para cada repo P0 y P1:
   a. get_file_contents AGENT.md
   b. get_file_contents CONTEXT.md
   c. get_file_contents README.md
   d. list_commits — ver fecha último commit
3. Comparar con estado esperado
4. Documentar hallazgos
5. Abrir issues para cada gap encontrado
6. Actualizar ESTADO-SISTEMA.md con el resultado
```

---

## Proceso de auditoría con terminal (completo)

Usar el script `yggdrasil-scripts/ygg-audit.sh`

```bash
# Clonar todos los repos si no están
bash ~/scripts/ygg-clone-all.sh

# Ejecutar auditoría
bash ~/scripts/ygg-audit.sh

# Ver resumen
cat ~/ygg-audit-report.txt
```

---

## Resultado esperado

Al final de una auditoría correcta:
- Todos los repos tienen checklist completado
- Issues abiertos para cada gap
- `ESTADO-SISTEMA.md` actualizado con estado real
- Diario técnico con hallazgos en `docs/sesiones/`

---

## Señales de alarma

| Señal | Acción |
|---|---|
| Repo sin AGENT.md | Crear AGENT.md antes de siguiente sesión |
| CONTEXT.md con fecha > 14 días | Actualizar en la sesión actual |
| Commit más reciente > 30 días | Revisar si el repo está activo o archivarlo |
| `.env` trackeado | URGENTE — purgar con BFG + rotar todos los secretos |
| README desactualizado | Actualizar al cierre de la sesión |
| Nombre incorrecto en referencias | Corregir referencias en todos los repos afectados |

---

_Creado: 2026-07-18 · Perplexity-MCP_
