---
tipo: protocolo
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-14 17:56 CEST
actualizado: 2026-07-14 17:56 CEST
ruta: protocolo/PROTOCOLO-NOMBRES.md
tags: [protocolo, naming, convenciones, ecosistema]
status: vigente
version: 2.0
---

# 📛 PROTOCOLO-NOMBRES — Convenciones de Nomenclatura

> Fuente de verdad única para nombres en todo el ecosistema Yggdrasil.
> Aplica a repos, archivos, ramas, issues, scripts y carpetas.
> **Regla de oro:** si el nombre no pasa este protocolo, no se hace push.

---

## 0. ANTES DE NOMBRAR — checklist rápido

```
[ ] ¿El nombre describe exactamente lo que contiene, sin ambigüedad?
[ ] ¿Sigue el patrón del tipo de objeto (ver secciones abajo)?
[ ] ¿Está en minúsculas con guiones? (salvo excepciones documentadas)
[ ] ¿No duplica un nombre ya existente en el ecosistema?
[ ] ¿Pasa la prueba del año: seguirá teniendo sentido en 12 meses?
```

---

## 1. REPOS — Nombres de Repositorios GitHub

### Patrón general

```
<prefijo>-<descripción>
```

### Prefijos del ecosistema

| Prefijo | Capa | Ejemplos |
|---|---|---|
| `yggdrasil-` | Cerebro / ecosistema global | `yggdrasil-dew`, `yggdrasil-wiki`, `yggdrasil-tracking`, `yggdrasil-scripts`, `yggdrasil-secops` |
| `<dispositivo>-config` | Infraestructura / dotfiles | `madre-config`, `acer-config` |
| `<nombre>-stack` | Servicio autocontenido | `ollama-stack`, `osint-stack` |
| `<nombre>-personal` | Bot o herramienta personal | `THDORA-PERSONAL` |
| `<nombre>-<función>` | Proyecto específico | `local-brain`, `formacion-tech`, `investigacion-ia`, `dev-labs` |

### Reglas

1. **Siempre minúsculas y guiones** — nunca espacios, guiones bajos ni mayúsculas intermedias.
2. **Excepción documentada:** `THDORA-PERSONAL` usa mayúsculas porque THDORA es un nombre propio. Única excepción activa.
3. **Sin fechas en el nombre del repo** — la fecha va en el frontmatter, no en el nombre.
4. **Sin versiones en el nombre del repo** — `yggdrasil-wiki-v2` está prohibido.
5. **Máximo 3 palabras separadas por guión.**

### Casos actuales resueltos

| Nombre actual en Madre | Nombre correcto | Acción requerida |
|---|---|---|
| `WIKI---PERSONAL` | `yggdrasil-wiki` | Renombrar carpeta local + verificar remote |
| `yggdrasil-formacion-` | DEPRECADO | Eliminar de Madre tras verificar migración |
| `yggdrasil-tracking` | `yggdrasil-tracking` | ✅ Correcto |

---

## 2. ARCHIVOS — Nombres de Ficheros

### Por tipo

| Tipo | Convención | Ejemplo | Notas |
|---|---|---|---|
| Documentos raíz del repo | `MAYUSCULAS.md` | `README.md`, `CONVENCIONES.md` | Solo en raíz del repo |
| Protocolos | `PROTOCOLO-NOMBRE.md` | `PROTOCOLO-NOMBRES.md` | Siempre en `protocolo/` |
| Documentos en subcarpetas | `kebab-case.md` | `ssh-hardening.md` | `docs/`, `wiki/`, etc. |
| Diarios | `YYYY-MM-DD.md` | `2026-07-14.md` | ISO 8601 siempre |
| Scripts bash | `kebab-case.sh` | `backup-repos.sh` | Verbo-objeto |
| Scripts Python | `snake_case.py` | `sync_repos.py` | PEP8 |
| Configs docker | `docker-compose.yml` | `docker-compose.yml` | Nombre estándar |
| Templates | `TEMPLATE-NOMBRE.md` | `TEMPLATE-ISSUE-APERTURA.md` | En `docs/templates/` |
| Estados de isla Wiki | `ESTADO-ISLA-<NOMBRE>.md` | `ESTADO-ISLA-TECNOLOGIA.md` | En raíz de `yggdrasil-dew` |
| ADRs | `ADR-NNN-descripcion.md` | `ADR-001-context-protocol.md` | En `docs/adr/` |

### Frontmatter obligatorio para todo `.md`

```yaml
---
tipo: <tipo>          # protocolo | arquitectura | diario | normas | template | estado
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: YYYY-MM-DD HH:MM CEST
actualizado: YYYY-MM-DD HH:MM CEST
ruta: <ruta/desde/raiz.md>
tags: [tag1, tag2]
status: vigente       # vigente | deprecado | borrador
version: X.Y
---
```

---

## 3. RAMAS — Nombres de Ramas Git

| Tipo | Patrón | Ejemplo |
|---|---|---|
| Producción | `main` | `main` |
| Feature | `feat/<descripción>` | `feat/protocolo-nombres` |
| Fix | `fix/<descripción>` | `fix/frontmatter-tracking` |
| Documentación | `docs/<descripción>` | `docs/auditoria-wiki` |
| Deuda técnica | `debt/<descripción>` | `debt/cleanup-protocolo` |
| Copilot | `copilot/<descripción>` | `copilot/refactor-scripts` |

**Reglas:**
- Todo en minúsculas con guiones.
- Descripción máximo 4 palabras.
- Nunca trabajar directamente en `main` salvo hotfixes documentados.

---

## 4. ISSUES — Títulos y Labels

### Títulos

```
[TIPO] Descripción corta en imperativo
```

| TIPO | Cuándo usarlo |
|---|---|
| `[BUG]` | Algo roto o incorrecto |
| `[FEAT]` | Nueva funcionalidad |
| `[DOC]` | Documentación |
| `[DEUDA]` | Deuda técnica |
| `[AUDITORIA]` | Resultado de auditoría |
| `[APERTURA]` | Issue de apertura de sesión |
| `[CIERRE]` | Issue de cierre de sesión |
| `[INCIDENTE]` | Incidente de seguridad o sistema |

**Ejemplos correctos:**
- `[DOC] Crear PROTOCOLO-NOMBRES v2.0`
- `[AUDITORIA] Renombrar WIKI---PERSONAL a yggdrasil-wiki en Madre`
- `[APERTURA] Sesión 2026-07-15 — objetivos: protocolo cierre + rutas madre`

### Labels obligatorias por issue

Todo issue debe tener al menos una label de cada categoría:
- **Capa:** `capa:cerebro`, `capa:infra`, `capa:tracking`... (ver `ECOSYSTEM-ARCHITECTURE.md`)
- **Tipo:** `tipo:bug`, `tipo:doc`, `tipo:feature`, `tipo:deuda`...
- **Prioridad:** `prioridad:alta`, `prioridad:media`, `prioridad:baja`

---

## 5. SCRIPTS — Nombres de Scripts

| Tipo | Patrón | Ejemplo |
|---|---|---|
| Mantenimiento | `<verbo>-<objeto>.sh` | `backup-repos.sh`, `update-system.sh` |
| Agentes IA | `agente-<función>.sh` | `agente-contexto.sh` |
| Setup | `setup-<componente>.sh` | `setup-ollama.sh` |
| Check/Audit | `check-<qué>.sh` | `check-secretos.sh` |
| Deploy | `deploy-<servicio>.sh` | `deploy-thdora.sh` |

**Reglas:**
- Siempre verbo en imperativo (`backup`, `deploy`, `check`, `setup`).
- Todo en kebab-case.
- Docstring obligatorio en las primeras 5 líneas:
  ```bash
  #!/usr/bin/env bash
  # Descripción: qué hace este script
  # Uso: ./nombre-script.sh [args]
  # Autor: Alvaro Fernandez Mota
  # Actualizado: YYYY-MM-DD
  ```

---

## 6. CARPETAS — Estructura de Directorios

| Carpeta | Convención | Ejemplo |
|---|---|---|
| Raíz de repo | `kebab-case/` o nombre estándar | `docs/`, `protocolo/`, `assets/` |
| Islas Wiki | `NN_nombre/` (número + guión bajo) | `01_tecnologia/`, `02_seguridad/` |
| Módulos de isla | `kebab-case/` | `linux/`, `docker/`, `redes/` |
| Diarios | `diarios/YYYY/` | `diarios/2026/` |
| Templates | `docs/templates/` | — |
| ADRs | `docs/adr/` | — |

**Regla:** nunca carpetas con espacios. Nunca más de 3 niveles de profundidad sin documentar.

---

## 7. APLICACIÓN DE ESTE PROTOCOLO

### Cuándo ejecutarlo
- Al crear un repo nuevo
- Al crear un archivo nuevo
- Al renombrar cualquier elemento existente
- En cada auditoría de ecosistema

### Quién lo ejecuta
- Humano: antes de crear o renombrar
- Agente IA: verifica antes de hacer push
- Script futuro: `check-nombres.sh` (nivel 1 pendiente)

---

_Creado: 2026-07-14 17:56 CEST · Perplexity-MCP_
