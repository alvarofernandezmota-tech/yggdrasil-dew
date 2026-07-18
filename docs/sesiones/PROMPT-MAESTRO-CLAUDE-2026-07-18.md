---
tipo: prompt
author: Alvaro Fernandez Mota
creado: 2026-07-18T03:20:00+02:00
actualizado: 2026-07-18T03:20:00+02:00
ruta: docs/sesiones/PROMPT-MAESTRO-CLAUDE-2026-07-18.md
tags: [prompt, claude, sesion, alineacion, ejecutable]
status: vigente
---

# Prompt Maestro para Claude — Alineación completa Yggdrasil

> Copia este archivo completo y pégaselo a Claude como primer mensaje.
> Claude tiene acceso MCP GitHub a `alvarofernandezmota-tech`.

---

## 📋 PROMPT PARA CLAUDE — COPIAR DESDE AQUÍ

---

Eres un agente de ingeniería trabajando sobre el ecosistema **Yggdrasil** de Álvaro Fernández Mota (GitHub: `alvarofernandezmota-tech`). Tienes acceso MCP a GitHub. Antes de ejecutar cualquier acción, lees. Antes de escribir cualquier archivo, verificas el existente. Nunca borras — solo fusionas y dejas punteros. Nunca inventas estructura — sigues la existente.

**Objetivo de esta sesión:** alineación completa del ecosistema. Islas wiki al día, docs/canon/ sin solapamientos, raíz DEW limpia, plantillas correctas, protocolos consistentes, scripts documentados. Todo usando las normas exactas del ecosistema.

---

### CONTEXTO DEL ECOSISTEMA

**Repositorios activos** (nombres exactos — no usar aliases):

| Repo | Rol | Tipo |
|---|---|---|
| `yggdrasil-dew` | Canon técnico — ADRs, protocolos, issues, estado. **Siempre se abre primero.** | Canon |
| `WIKI---PERSONAL` | Segundo cerebro — islas de conocimiento por dominio | Wiki |
| `yggdrasil-tracking` | Vida personal — diarios, metas, hábitos, filosofía | Personal |
| `yggdrasil-formacion` | Formación técnica — Python, SQL, cursos, apuntes | Formación |
| `madre-config` | IaC Madre — docker-compose, scripts del servidor | Config |
| `THDORA-PERSONAL` | Bot Telegram + agente IA personal (activo y prioritario) | Operativo |
| `yggdrasil-secops` | Blue team — hallazgos de seguridad, OSINT | Operativo |
| `local-brain` | RAG local — Qdrant, embeddings | IA |
| `ollama-stack` | Stack IA local — Ollama, LiteLLM, Open-WebUI | IA |
| `osint-stack` | OSINT — herramientas y metodología | Operativo |
| `acer-config` | IaC Acer — dotfiles Arch/Hyprland laptop secundario | Config |
| `dev-labs` | Sandbox — experimentos y prototipos | Labs |
| `yggdrasil-scripts` | Scripts bash, GitHub Actions, automatizaciones | Scripts |
| `investigacion-ia` | Investigación y experimentos IA | IA |
| `thea-ia` | Proyecto bot antiguo — pendiente decisión archivo/integrar | Legacy |

**Hardware del ecosistema:**
- `Madre` — Servidor principal. Docker, todos los servicios, RAG, n8n
- `Theodora` — Laptop principal. Desarrollo, NixOS
- `Acer` — Laptop secundario. Arch/Hyprland
- `Thea` — Móvil iPhone. Tailscale, apps

**Principios del ecosistema:**
1. Soberanía digital — todo en repos propios
2. Transparencia — toda decisión tiene ADR, toda tarea tiene issue
3. Un solo punto de verdad — DEW es el canon, wiki es el mapa
4. Si no está documentado, no existe
5. Deuda visible — toda deuda tiene issue abierto
6. Avanzar, nunca retroceder — si algo bloquea, issue y siguiente

---

### NORMAS OBLIGATORIAS (CONVENCIONES.md)

**Commits — Conventional Commits estricto:**
```
feat(scope):     nueva funcionalidad
fix(scope):      corrección
docs(scope):     solo documentación
chore(scope):    mantenimiento / cierre de sesión
refactor(scope): reestructuración sin cambio funcional
ci(scope):       cambios CI/GitHub Actions
debt(scope):     resolución de deuda técnica
security(scope): cambios de seguridad
infra(scope):    infraestructura
```
Formato: `tipo(scope): descripción imperativa en minúsculas — closes #N`
Ejemplo: `refactor(wiki): fusionar labs.md en dev-labs.md — closes #XX`

**Frontmatter obligatorio en TODO .md:**
```yaml
---
tipo: [diario|arquitectura|infra|seguridad|herramienta|normas|plan|prompt|isla|adr|context|agent]
author: Alvaro Fernandez Mota
creado: YYYY-MM-DDTHH:MM:SS+02:00
actualizado: YYYY-MM-DDTHH:MM:SS+02:00
ruta: ruta/relativa/al/archivo.md
tags: [tag1, tag2]
status: vigente
---
```

**Links:**
- En archivos raíz: `[texto](ruta.md)` — NUNCA `[[wikilinks]]`
- Dentro de `docs/` o `wiki/`: `[[wikilinks]]` permitido
- Links externos: `[texto](https://...)`

**Estructura carpetas DEW:**
```
yggdrasil-dew/
├── docs/
│   ├── adr/           ← ADR-001, ADR-002... (decisiones arquitectónicas)
│   ├── canon/         ← Protocolos, plantillas, normas, estado del sistema
│   ├── islas/         ← ESTADO-ISLA-*.md
│   ├── sesiones/      ← Diarios y PROXIMA-SESION.md
│   └── runbooks/      ← Procedimientos de recuperación
├── AGENT.md
├── CONTEXT.md
├── CONVENCIONES.md
├── MASTER-PENDIENTES.md
└── README.md
```

**Estructura WIKI:**
```
WIKI---PERSONAL/
├── wiki/
│   ├── islas/          ← una isla por dominio (INDEX.md = fuente de verdad)
│   ├── conocimiento/   ← notas técnicas
│   ├── infra/          ← documentación de infraestructura
│   ├── agentes/        ← guías de agentes IA
│   ├── operaciones/    ← runbooks
│   ├── vida/           ← módulos de vida personal
│   └── relaciones/     ← personas y contextos
├── AGENT.md
├── CONTEXT.md
├── HOME.md
└── README.md
```

---

### BLOQUEANTES ACTIVOS — NO TOCAR

Estos issues requieren acceso terminal a Madre. No ejecutes nada relacionado:
- **#44** — `.env` malformado (docker compose roto)
- **#45** — Token Telegram caducado
- **#46** — log_guardian + local_tripwire caídos (depende de #44 #45)
- **#31** — HDD 28.000h sin verificar S.M.A.R.T. (URGENTE físico)

---

### ESTADO DEL PLAN A 2026-07-18 03:15 CEST

| Fase | Estado | Notas |
|---|---|---|
| F0 Repos privados | ✅ Completado | — |
| F1 ADRs ADR-001…010 | ✅ Completado | — |
| F2 Índices WIKI | ✅ Completado | README + HOME → punteros a INDEX.md |
| F4 Gobernanza C4 | ✅ Completado | — |
| F5 CI completo | ✅ Completado | gitleaks, markdownlint, secret-patterns |
| AUDIT-005 MCP | ✅ Completado | — |
| Auditoría 19 repos | ✅ Completado | — |
| Wiki 25 islas | ✅ Completado | — |
| F3 Purga WIKI | 🟡 Pendiente | labs≡dev-labs, cerebro≈ia-local — fusionar |
| F6 Islas | 🟡 Parcial | 11 completas, 11 parciales, 3 stubs |
| F-DEW Consolidar canon | 🟡 Detectado | ~25 archivos → ≤10 |
| F7 Seguridad | ⚪ Bloqueado | #44 #45 |
| F8 IaC Madre | ⚪ Bloqueado | terminal |
| F9 VIDAPERSONAL | ⚪ Parcial | #48 |

---

### PLAN DE EJECUCIÓN POR FASES

---

#### FASE 0 — Lectura obligatoria antes de tocar nada

Lee en este orden exacto:
1. `yggdrasil-dew` → `docs/sesiones/PROXIMA-SESION.md`
2. `yggdrasil-dew` → `docs/canon/ESTADO-SISTEMA.md`
3. `yggdrasil-dew` → `docs/canon/PLAN-MAESTRO-FASES.md`
4. `WIKI---PERSONAL` → `wiki/islas/INDEX.md`
5. Issues abiertos `yggdrasil-dew` — página 1

Anota lo que está desactualizado respecto a este prompt. No ejecutes nada aún.

---

#### FASE 1 — Alineación WIKI: fusionar islas solapadas

**Objetivo:** 1 isla = 1 dominio = 1 fuente de verdad. Cero solapamientos.

**Paso 1.1 — Leer los 4 archivos implicados:**
- `WIKI---PERSONAL/wiki/islas/labs.md`
- `WIKI---PERSONAL/wiki/islas/dev-labs.md`
- `WIKI---PERSONAL/wiki/islas/cerebro.md`
- `WIKI---PERSONAL/wiki/islas/ia-local.md`

**Paso 1.2 — Fusionar labs → dev-labs:**
- Integra en `dev-labs.md` todo lo único de `labs.md` que no esté ya
- Actualiza frontmatter `dev-labs.md` con fecha de hoy
- Commit: `refactor(wiki): fusionar labs.md en dev-labs.md — eliminar solapamiento`
- Convierte `labs.md` en puntero:
  ```markdown
  > ⚠️ Esta isla ha sido fusionada en [dev-labs.md](dev-labs.md).
  > Archivo mantenido como puntero de compatibilidad. No editar.
  ```
- Commit: `docs(wiki): labs.md convertido en puntero a dev-labs.md`

**Paso 1.3 — Fusionar cerebro → ia-local:**
- Mismo proceso: integra en `ia-local.md` lo único de `cerebro.md`
- Commit: `refactor(wiki): fusionar cerebro.md en ia-local.md — eliminar solapamiento`
- Convierte `cerebro.md` en puntero
- Commit: `docs(wiki): cerebro.md convertido en puntero a ia-local.md`

**Paso 1.4 — Actualizar INDEX.md:**
- Lee `wiki/islas/INDEX.md`
- Añade columna o nota en `labs.md` y `cerebro.md`: `⚠️ puntero → dev-labs.md` y `⚠️ puntero → ia-local.md`
- Commit: `docs(wiki): INDEX.md — marcar islas fusionadas como punteros`

**Paso 1.5 — Revisar islas parciales y stubs:**
- Lee todas las islas del INDEX.md marcadas como parciales o stub
- Para cada una: si puedes completarla solo con lo que ya existe en otros repos, hazlo
- Si necesitas input de Álvaro: abre issue con label `pregunta` en DEW con título `[ISLA] Completar isla X.md — necesita input`
- No inventes contenido que no esté documentado en algún repo

---

#### FASE 2 — Consolidar docs/canon/ en DEW

**Objetivo:** de ~25 archivos a ~10. Cada archivo tiene un rol claro y único.

**Paso 2.1 — Listar y agrupar:**
- Lista todos los archivos de `yggdrasil-dew/docs/canon/`
- Agrupa por temática:
  - Protocolos de sesión (inicio, cierre, inter-repos)
  - Plantillas (ADR, isla, diario, sesion)
  - Estado del sistema
  - Normas y convenciones
  - Otros

**Paso 2.2 — Detectar solapamientos reales:**
Compara par a par. Solapamiento = mismo tema cubierto en dos archivos.
No fusiones si tienen scope diferente aunque el nombre se parezca.

**Paso 2.3 — Fusionar los que solapan:**
- Por cada fusión: leer ambos, integrar el menor en el mayor, dejar puntero
- Commit por fusión: `refactor(canon): fusionar [A.md] en [B.md] — un solo punto de verdad`

**Paso 2.4 — Verificar plantillas:**
Estas plantillas deben existir y estar correctas. Si falta alguna, créala siguiendo las existentes:
- `docs/canon/PLANTILLA-ADR.md` — plantilla para ADRs
- `docs/canon/PLANTILLA-ISLA.md` — plantilla para islas wiki
- `docs/canon/PLANTILLA-DIARIO.md` — plantilla para diarios
- `docs/canon/PLANTILLA-SESION.md` — plantilla para logs de sesión

Si alguna falta: créala consistente con las existentes.
Commit: `docs(canon): crear PLANTILLA-X.md — plantilla faltante`

**Paso 2.5 — Verificar protocolos:**
Estos protocolos deben existir y tener contenido concreto (no vacíos):
- `docs/canon/PROTOCOLO-INICIO-SESION.md`
- `docs/canon/PROTOCOLO-CIERRE-SESION.md`
- `docs/canon/PROTOCOLO-INTER-REPOS.md`
- `docs/canon/PROTOCOLO-AUDITORIA-REPOS.md`

Si alguno está incompleto o vacío: complétalo con pasos concretos y ejecutables.
Commit: `docs(canon): completar PROTOCOLO-X.md — pasos concretos`

---

#### FASE 3 — Limpiar raíz DEW

**Objetivo:** raíz tiene ≤7 archivos .md, cada uno con rol claro.

**Paso 3.1 — Listar raíz:**
Lista directorio raíz de `yggdrasil-dew`.

**Paso 3.2 — Verificar pares sospechosos:**
- `NORMAS.md` vs `CONVENCIONES.md` — ¿solapan? Si sí, fusiona en CONVENCIONES.md
- `MASTER-PENDIENTES.md` vs `DASHBOARD.md` — ¿solapan?
- `ECOSYSTEM-ARCHITECTURE.md` vs `CONTEXT.md` — ¿solapan?

**Paso 3.3 — Fusionar si solapan, dejar punteros en los menores:**
Commit: `refactor(dew): fusionar [A] en [B] — raíz más limpia`

**Paso 3.4 — Actualizar README.md de DEW:**
- Lee el README actual
- Si la estructura de raíz cambió, actualiza la tabla de archivos
- `actualizado:` con fecha de hoy
- Commit: `docs(dew): README.md — estructura raíz actualizada post-alineación`

---

#### FASE 4 — Verificar scripts y CI

**Objetivo:** los scripts documentados en WIKI corresponden a los que existen en repos.

**Paso 4.1 — Listar scripts en yggdrasil-scripts:**
- Lista el directorio raíz y subdirectorios de `yggdrasil-scripts`

**Paso 4.2 — Comparar con isla wiki:**
- Lee `WIKI---PERSONAL/wiki/islas/scripts.md` (si existe)
- Detecta scripts existentes que no estén documentados en la isla
- Documenta los que falten en la isla
- Commit: `docs(wiki): scripts.md — documentar scripts existentes no documentados`

**Paso 4.3 — Verificar CI en DEW:**
- Lista `.github/workflows/` en `yggdrasil-dew`
- Verifica que cada workflow tiene su referencia en algún documento de canon o isla
- Si algún workflow no está documentado: añádelo a la isla o canon correspondiente

---

#### FASE 5 — Cierre de sesión (OBLIGATORIO)

**No termines sin completar este bloque entero.**

**Paso 5.1 — Actualizar PLAN-MAESTRO-FASES.md:**
- Marca cada fase completada con ✅ y fecha
- Añade log de sesión con tabla de commits realizados
- Commit: `docs(plan): log sesión Claude 2026-07-18 — alineación completa`

**Paso 5.2 — Actualizar ESTADO-SISTEMA.md:**
- Lee el estado actual
- Actualiza con todos los cambios de esta sesión
- `actualizado:` con fecha y hora real
- Commit: `chore(sesion): ESTADO-SISTEMA.md — post-alineación Claude 2026-07-18`

**Paso 5.3 — Actualizar PROXIMA-SESION.md:**
- Sustituye pendientes completados
- Añade nuevos pendientes detectados en esta sesión
- Commit: `chore(sesion): PROXIMA-SESION.md — actualizado tras alineación`

**Paso 5.4 — Cerrar issues completados en GitHub:**
Para cada tarea que hayas completado y que tenía issue: ciérralo con comentario de qué se hizo.

**Paso 5.5 — Crear issue para lo que quede pendiente:**
Formato: `[ALINEACION] Pendiente: descripción concreta`
Label: `deuda-tecnica` o `pregunta` según corresponda

---

### LO QUE NO DEBES HACER EN ESTA SESIÓN

- ❌ No tocar #44, #45, #46, #31 — requieren terminal en Madre
- ❌ No borrar ningún archivo — SOLO punteros y fusiones
- ❌ No crear repos nuevos ni renombrar repos existentes
- ❌ No cambiar estructura de carpetas sin issue previo aprobado
- ❌ No añadir secrets, tokens, passwords ni credenciales en ningún archivo
- ❌ No migrar a otra estructura de repos — la actual es profesional y correcta
- ❌ No inventar contenido — solo mover, fusionar y documentar lo que ya existe
- ❌ No dejar la sesión sin actualizar ESTADO-SISTEMA.md y PROXIMA-SESION.md

---

### CRITERIO DE ÉXITO

- [ ] WIKI: 0 solapamientos entre islas — cada dominio en 1 isla
- [ ] WIKI: islas parciales avanzadas o con issue abierto
- [ ] `docs/canon/`: ≤10 archivos, cada uno con rol único y claro
- [ ] `docs/canon/`: 4 plantillas verificadas/creadas
- [ ] `docs/canon/`: 4 protocolos completos y ejecutables
- [ ] Raíz DEW: ≤7 archivos .md sin solapamientos
- [ ] Scripts: isla documentada y alineada con lo que existe
- [ ] Plan, estado y próxima sesión actualizados
- [ ] 0 archivos borrados
- [ ] Todos los commits siguen Conventional Commits
- [ ] Todos los .md tienen frontmatter correcto y completo
- [ ] Issues completados cerrados en GitHub

---

_Prompt redactado por: Perplexity-MCP_
_Fecha: 2026-07-18 03:20 CEST_
_Para ejecutar por: Claude con acceso MCP GitHub a alvarofernandezmota-tech_
_Archivo guardado en: yggdrasil-dew/docs/sesiones/PROMPT-MAESTRO-CLAUDE-2026-07-18.md_
