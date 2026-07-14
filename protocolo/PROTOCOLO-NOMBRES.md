---
tipo: protocolo
subtipo: convenciones
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-01-01
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-NOMBRES.md
tags: [protocolo, nomenclatura, convenciones, naming, agente-ia]
status: vigente
version: 2.0
audiencia: [humano, agente-ia]
nivel-escalado: 0 — Manual
candidato-a: 1 — Script (linter)
---

# 📛 PROTOCOLO DE NOMBRES Y CONVENCIONES v2

> **Propósito:** Definir las convenciones de nomenclatura del ecosistema Yggdrasil para archivos, carpetas, ramas, variables, funciones, commits e issues.
> **Por qué importa:** Un ecosistema con 15+ repos y agentes IA que lo leen necesita nombres predecibles. El agente puede inferir el propósito de un archivo por su nombre sin leerlo.

---

## 👤 PARA EL HUMANO — RESUMEN RÁPIDO

| Qué | Convención | Ejemplo |
|-----|-----------|--------|
| Archivos de documentación | MAYÚSCULAS + guiones | `PROTOCOLO-NOMBRES.md` |
| Archivos de código | kebab-case | `mi-modulo.py`, `api-client.ts` |
| Carpetas | kebab-case | `docs/templates/`, `src/api-client/` |
| Variables (Python) | snake_case | `api_key`, `repo_name` |
| Variables (JS/TS) | camelCase | `apiKey`, `repoName` |
| Constantes | UPPER_SNAKE_CASE | `MAX_RETRIES`, `API_BASE_URL` |
| Clases | PascalCase | `RepoManager`, `EcosystemAudit` |
| Commits | Conventional Commits | `feat(protocolo): add audit v2` |
| Branches | kebab-case con prefijo | `feat/audit-proyecto`, `fix/push-error` |
| Issues | Frase descriptiva + labels | `[BUG] Error al hacer push en madre-config` |
| Repos del ecosistema | kebab-case | `yggdrasil-dew`, `madre-config` |
| CONTEXT-PACKs | MAYÚSCULAS + guiones | `CONTEXT-PACK-WIKI.md` |

---

## 🤖 PARA EL AGENTE IA — REGLAS DETALLADAS

### Regla 1: Archivos de documentación y protocolos

```
Formato:   NOMBRE-EN-MAYUSCULAS.md
Ejemplos:  PROTOCOLO-SECRETOS.md, ESTADO-SISTEMA.md, CONTEXT-PACK-WIKI.md
Excepciones: README.md, CHANGELOG.md, LICENSE (convenciones universales)
```

Por qué: Los archivos en MAYÚSCULAS son documentos de referencia del ecosistema. Se distinguen de los archivos de código a golpe de vista.

### Regla 2: Archivos de código

```
Formato:   kebab-case.extension
Ejemplos:  api-client.py, repo-scanner.ts, docker-compose.yml
NO:        ApiClient.py, api_client.py, apiclient.py
```

Excepción: si el framework impone otro formato (Django usa snake_case, React puede usar PascalCase para componentes).

### Regla 3: Commits — Conventional Commits obligatorio

```
<tipo>(<ámbito-opcional>): <descripción en inglés o español>

Tipos permitidos:
  feat     — nueva funcionalidad
  fix      — corrección de bug
  docs     — solo documentación
  chore    — tareas de mantenimiento sin impacto en código
  refactor — refactorización sin cambio de comportamiento
  test     — añadir o corregir tests
  ci       — cambios en CI/CD
  perf     — mejoras de rendimiento
  revert   — revertir un commit

Ejemplos válidos:
  feat(protocolo): add PROTOCOLO-AUDITORIA-PROYECTO v1
  fix(madre-config): correct nginx port binding
  docs(wiki): update knowledge-graph structure
  chore(deps): update python dependencies

Ejemplos NO válidos:
  "update stuff"
  "fix"
  "WIP"
  "cambios varios"
```

### Regla 4: Branches

```
Formato:   <prefijo>/<descripcion-kebab>
Prefijos:  feat/, fix/, chore/, docs/, refactor/, hotfix/
Ejemplos:  feat/audit-proyecto, fix/push-error, docs/context-pack-wiki
NO:        feature-audit, Fix_push, new-stuff
```

### Regla 5: Issues

```
Título:    [TIPO] Descripción concisa del problema u objetivo
Tipos:     [BUG], [FEAT], [DOCS], [CHORE], [APERTURA], [CIERRE], [AUDIT]
Labels:    al menos 1 obligatorio (bug, enhancement, documentation, etc.)

Ejemplos válidos:
  [BUG] Error al hacer push en madre-config desde iPhone
  [FEAT] Añadir CONTEXT-PACK para yggdrasil-tracking
  [APERTURA] 2026-07-14 — Continuar auditoría ecosistema
```

### Regla 6: Variables de entorno

```
Formato:   UPPER_SNAKE_CASE
Prefijos recomendados por servicio:
  OPENAI_*      — variables de OpenAI
  TELEGRAM_*    — variables de Telegram/THDORA
  GITHUB_*      — variables de GitHub (las propias de Actions usan este prefijo)
  DB_*          — variables de base de datos
  REDIS_*       — variables de Redis
  APP_*         — variables de la aplicación

Ejemplos: OPENAI_API_KEY, TELEGRAM_BOT_TOKEN, DB_PASSWORD_PROD
```

### Verificación de nomenclatura

Antes de crear un archivo, rama, commit o issue, el agente verifica:

```
[VERIFICACIÓN NOMBRES]
Tipo: [archivo/commit/branch/issue/variable]
Valor propuesto: [nombre]
Convención aplicable: [Regla N]
Conformes: ✅ / ❌ Sugerencia: [nombre correcto]
```

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script linter | `scripts/lint-nombres.sh` | 🔲 pendiente |
| 2 — GitHub Action | Check de naming en cada PR | 🔲 pendiente |
| 3 — Bot THDORA | Advertencia en tiempo real | 🔲 pendiente |

---

_Actualizado: 2026-07-14 · v2.0_
