---
tipo: plan
author: Alvaro Fernandez Mota
creado: 2026-07-18T03:18:00+02:00
actualizado: 2026-07-18T03:18:00+02:00
ruta: docs/sesiones/PLAN-PARA-CLAUDE-2026-07-18.md
tags: [plan, claude, sesion, fases, ejecutable]
status: vigente
---

# Plan ejecutable para Claude — Yggdrasil 2026-07-18

> **Quién lo redactó:** Perplexity-MCP (sesión madrugada 2026-07-18)
> **Para qué:** Claude lo ejecuta fase a fase usando MCP GitHub
> **Regla fundamental:** avanzar, nunca retroceder. Si algo bloquea, abrir issue y continuar con lo siguiente.

---

## Contexto del ecosistema — leer antes de ejecutar

### Repositorios activos

| Repo | Rol |
|---|---|
| `yggdrasil-dew` | Canon técnico — ADRs, protocolos, estado, issues. **Siempre se abre primero.** |
| `WIKI---PERSONAL` | Segundo cerebro — islas de conocimiento por dominio |
| `yggdrasil-tracking` | Vida personal — diarios, metas, filosofía |
| `yggdrasil-formacion` | Formación técnica — Python, SQL, cursos, apuntes |
| `yggdrasil-scripts` | Scripts y automatizaciones del ecosistema |
| `yggdrasil-secops` | Blue team — hallazgos de seguridad |
| `THDORA-PERSONAL` | Bot IA personal (principal, activo) |
| `ollama-stack` | Stack IA local — Ollama, LiteLLM, Qdrant, Open-WebUI |
| `osint-stack` | OSINT — herramientas y metodología |
| `madre-config` | IaC Madre — configuración del servidor principal |
| `acer-config` | IaC Acer — configuración del portatil |
| `investigacion-ia` | Investigación y experimentos IA |
| `local-brain` | RAG y memoria local |
| `thea-ia` | Proyecto antiguo bot IA — pendiente decision archivo/integrar |
| `VIDAPERSONAL` | Diarios y vida (repo secundario a tracking) |

### Normas obligatorias (de CONVENCIONES.md)

- **Commits:** `tipo(scope): descripción imperativa en minúsculas`
  - `docs(plan):`, `feat(wiki):`, `chore(repo):`, `refactor(canon):`, `fix(infra):`
- **Frontmatter obligatorio** en todo .md: `tipo`, `author`, `creado`, `actualizado`, `ruta`, `tags`, `status`
- **Nunca borrar** sin issue de respaldo aprobado
- **Nunca secrets** en ningún archivo
- **Links en raíz:** formato markdown `[texto](ruta)` — nunca `[[wikilinks]]`
- **Links dentro de docs/:** `[[wikilinks]]` permitido
- **Actualizar ESTADO-SISTEMA.md** al cierre de cada sesión

### Estado del plan a 2026-07-18 03:15 CEST

| Fase | Estado |
|---|---|
| F0, F1, F2, F4, F5 | ✅ Completadas |
| F3 — Purga WIKI solapamientos | 🟡 Ejecutable ahora con MCP |
| F6 — Islas parciales/stubs | 🟡 Ejecutable parcialmente |
| F-DEW — Consolidar docs/canon/ | 🟡 Detectado esta sesión — sin ejecutar |
| F7, F8, F9 | ⚪ Bloqueadas por terminal |

### Bloqueantes activos (NO tocar hasta tener acceso terminal)

- **#44** — `.env` malformado en Madre
- **#45** — Token Telegram caducado
- **#46** — log_guardian + local_tripwire caídos (depende de #44 y #45)
- **#31** — HDD 28.000h sin verificar (URGENTE físico)

---

## FASE 1 — Verificación inicial (5 min)

> Antes de tocar nada, leer el estado real.

### Acciones

1. Leer `docs/sesiones/PROXIMA-SESION.md` en `yggdrasil-dew`
2. Leer `docs/canon/ESTADO-SISTEMA.md` en `yggdrasil-dew`
3. Leer `docs/canon/PLAN-MAESTRO-FASES.md` en `yggdrasil-dew`
4. Listar issues abiertos en `yggdrasil-dew` con label `bloqueado` o `HAL`
5. Anotar mentalmente qué ha cambiado respecto a este documento

### Criterio de salida
- Tienes claro el estado real del ecosistema
- Sabes qué está bloqueado y qué puedes ejecutar ahora

---

## FASE 2 — Bloque 3 WIKI: purgar solapamientos (20 min)

> Objetivo: 1 tema = 1 archivo. Eliminar duplicidades documentadas.

### Contexto
Estas islas solapan temática y lo sabe el plan desde julio-13:
- `wiki/islas/labs.md` ≡ `wiki/islas/dev-labs.md` → fusionar en `dev-labs.md`
- `wiki/islas/cerebro.md` ≈ `wiki/islas/ia-local.md` → fusionar en `ia-local.md`

### Acciones

**2.1 — Leer los 4 archivos primero:**
```
WIKI---PERSONAL/wiki/islas/labs.md
WIKI---PERSONAL/wiki/islas/dev-labs.md
WIKI---PERSONAL/wiki/islas/cerebro.md
WIKI---PERSONAL/wiki/islas/ia-local.md
```

**2.2 — Fusionar labs.md en dev-labs.md:**
- Leer ambos, identificar qué tiene `labs.md` que no tenga `dev-labs.md`
- Integrar el contenido único de `labs.md` dentro de `dev-labs.md`
- Actualizar frontmatter de `dev-labs.md`: `actualizado: 2026-07-18T...`
- Push con commit: `refactor(wiki): fusionar labs.md en dev-labs.md — eliminar solapamiento`
- Reemplazar contenido de `labs.md` por redirección: `> ⚠️ Esta isla ha sido fusionada en [dev-labs.md](dev-labs.md). Archivo mantenido como puntero.`
- Push con commit: `docs(wiki): labs.md convertido en puntero a dev-labs.md`

**2.3 — Fusionar cerebro.md en ia-local.md:**
- Mismo proceso: leer ambos, extraer único de `cerebro.md`, integrar en `ia-local.md`
- Push con commit: `refactor(wiki): fusionar cerebro.md en ia-local.md — eliminar solapamiento`
- Convertir `cerebro.md` en puntero
- Push con commit: `docs(wiki): cerebro.md convertido en puntero a ia-local.md`

**2.4 — Actualizar INDEX.md:**
- Leer `wiki/islas/INDEX.md`
- Marcar `labs.md` y `cerebro.md` como `⚠️ puntero` en la tabla
- Push con commit: `docs(wiki): INDEX.md — marcar islas fusionadas como punteros`

### Criterio de salida
- `dev-labs.md` tiene todo el contenido relevante de ambas islas
- `ia-local.md` tiene todo el contenido relevante de ambas islas
- `labs.md` y `cerebro.md` son punteros, no borrados
- `INDEX.md` refleja la nueva realidad

---

## FASE 3 — F-DEW: consolidar docs/canon/ (30 min)

> Objetivo: bajar de ~25 archivos a ~10 fusionando los que solapan temática.

### Contexto
`docs/canon/` tiene protocolos, plantillas y estado mezclados. Detectado en sesión 2026-07-18.

### Acciones

**3.1 — Listar todos los archivos de docs/canon/:**
```
yggdrasil-dew/docs/canon/
```
Anota los que tienen temática similar o redundante.

**3.2 — Identificar y agrupar:**
Busca grupos naturales:
- Protocolos de sesión (inicio, cierre, apertura) → ¿se pueden unificar en uno?
- Plantillas (ADR, isla, diario) → ¿estaban ya en su carpeta correcta?
- Estado del sistema → ¿hay duplicidades con ESTADO-SISTEMA.md raíz?

**3.3 — Ejecutar fusiones detectadas:**
- Por cada fusión: leer ambos, integrar, convertir el menor en puntero
- Commit por cada fusión: `refactor(canon): fusionar [A] en [B] — eliminar solapamiento`

**3.4 — Crear issue si algo requiere decisión de Álvaro:**
- Título: `[F-DEW] Decisión: [qué decidir]`
- Label: `pregunta`
- No bloquear el resto por esto

### Criterio de salida
- `docs/canon/` tiene ≤10 archivos, cada uno con función clara y única
- Ningún archivo borrado — solo punteros o fusionados
- Ningún solapamiento evidente

---

## FASE 4 — DEW raíz: limpiar duplicidades (15 min)

> Objetivo: la raíz de yggdrasil-dew tiene ~10 .md. Verificar que ningún par solapa.

### Archivos en raíz conocidos
```
AGENT.md, CONTEXT.md, CONVENCIONES.md, MASTER-PENDIENTES.md,
README.md, ESTADO-SISTEMA.md, DASHBOARD.md, NORMAS.md,
ECOSYSTEM-ARCHITECTURE.md, MASTER-PENDIENTES.md
```

### Acciones

**4.1 — Listar raíz real:**
Leer directorio raíz de `yggdrasil-dew`

**4.2 — Detectar solapamientos:**
- `NORMAS.md` vs `CONVENCIONES.md` — ¿solapan?
- `MASTER-PENDIENTES.md` vs `DASHBOARD.md` — ¿solapan?
- `ECOSYSTEM-ARCHITECTURE.md` vs `CONTEXT.md` — ¿solapan?

**4.3 — Fusionar los que solapan, dejar punteros en los menores**
- Commit: `refactor(dew): fusionar [A] en [B] — raíz más limpia`

**4.4 — Actualizar README.md de DEW** si la estructura cambia:
- Leer README.md actual
- Actualizar tabla de archivos raíz si procede
- Commit: `docs(dew): README.md — estructura raíz actualizada`

### Criterio de salida
- Raíz tiene ≤7 archivos .md, cada uno con rol claro
- Sin solapamientos obvios

---

## FASE 5 — Cierre de sesión (10 min)

> Obligatorio. Seguir protocolo de cierre de AGENT.md.

### Acciones

**5.1 — Actualizar PLAN-MAESTRO-FASES.md:**
- Marcar F3 ✅ si se completó
- Marcar F-DEW ✅ o 🟡 según avance
- Añadir log de sesión de hoy (tabla de commits realizados)
- Commit: `docs(plan): log sesión Claude 2026-07-18 — fases X, Y completadas`

**5.2 — Actualizar ESTADO-SISTEMA.md:**
- Leer estado actual
- Actualizar con cambios realizados hoy
- `actualizado:` con fecha/hora real
- Commit: `chore(sesion): ESTADO-SISTEMA.md — actualizado post-sesión Claude 2026-07-18`

**5.3 — Actualizar PROXIMA-SESION.md:**
- Leer archivo actual
- Sustituir pendientes completados
- Añadir nuevos pendientes detectados
- Commit: `chore(sesion): PROXIMA-SESION.md — actualizado tras sesión Claude`

**5.4 — Cerrar issues completados en GitHub**

### Criterio de salida
- Plan actualizado con estado real
- PROXIMA-SESION.md lista para la siguiente sesión
- Todos los commits pusheados
- Sin archivos pendientes de commit

---

## Resumen ejecutivo

| Fase | Qué | Tiempo estimado | Herramienta |
|---|---|---|---|
| 1 | Verificación inicial | 5 min | MCP read |
| 2 | Bloque 3 WIKI — fusionar islas solapadas | 20 min | MCP read + push |
| 3 | F-DEW — consolidar docs/canon/ | 30 min | MCP read + push |
| 4 | DEW raíz — limpiar duplicidades | 15 min | MCP read + push |
| 5 | Cierre de sesión | 10 min | MCP push |
| **Total** | | **~80 min** | |

---

## Qué NO hacer en esta sesión

- ❌ No tocar #44, #45, #46, #31 — requieren terminal
- ❌ No borrar ningún archivo — solo punteros y fusiones
- ❌ No crear repos nuevos ni renombrar repos existentes
- ❌ No cambiar estructura de carpetas sin issue previo
- ❌ No añadir secrets o tokens en ningún archivo
- ❌ No migrar a otra estructura de repos — la actual es correcta y profesional

---

## Criterio de éxito de la sesión completa

- [ ] WIKI tiene 0 solapamientos evidentes entre islas
- [ ] `docs/canon/` tiene ≤10 archivos con roles claros
- [ ] Raíz DEW tiene ≤7 archivos .md
- [ ] Plan, estado y próxima sesión actualizados
- [ ] 0 archivos borrados (solo punteros)
- [ ] Todos los commits siguen Conventional Commits
- [ ] Todos los .md tienen frontmatter correcto

---

_Redactado por: Perplexity-MCP_
_Fecha: 2026-07-18 03:18 CEST_
_Para ejecutar por: Claude (con acceso MCP GitHub a alvarofernandezmota-tech)_
