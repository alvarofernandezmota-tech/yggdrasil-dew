---
tipo: normas
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-23 15:53 CEST
ruta: CONVENCIONES.md
tags: [normas, convenciones, ecosistema, commits]
status: vigente
---

# 📐 Convenciones — yggdrasil-dew

> Fuente de verdad única para estructura, nombrado, commits y flujo de trabajo.
> Todo agente IA, script, Copilot o contribuidor humano debe leer esto antes de tocar el repo.

## 1. Commits

Formato: `<tipo>(<scope>): <descripción imperativa en minúsculas>`

- `feat(docker)`: nueva funcionalidad.
- `fix(infra)`: corrección de bug.
- `docs(diarios)`: solo documentación.
- `chore(repo)`: mantenimiento.
- `infra(madre)`: cambios de infraestructura.
- `security(ssh)`: cambios de seguridad.
- `refactor(scripts)`: reestructuración.
- `ci(github)`: cambios en GitHub Actions.
- `debt(scripts)`: resolución de deuda técnica.

## 2. Nombrado de ficheros

| Tipo | Convención | Ejemplo |
|---|---|---|
| Scripts | `kebab-case` | `install-docker.sh` |
| Agentes | `agente-<función>.sh` | `agente-mejorador.sh` |
| Documentos raíz | `MAYUSCULAS.md` | `README.md` |
| Docs en subcarpetas | `kebab-case.md` | `ssh-hardening.md` |
| Diarios | `YYYY-MM-DD.md` | `2026-07-05.md` |

## 3. Ramas

| Rama | Propósito |
|---|---|
| `main` | Producción — siempre estable |
| `feat/<nombre>` | Nueva funcionalidad |
| `fix/<nombre>` | Corrección |
| `docs/<nombre>` | Solo documentación |
| `debt/<nombre>` | Resolución de deuda técnica |
| `copilot/<nombre>` | Trabajo de Copilot |

## 4. Protocolo de sesión

### Apertura
```bash
git pull origin main
cat AGENT.md
cat ESTADO-SISTEMA.md
cat MASTER-PENDIENTES.md
```

### Cierre
```bash
# 1. Escribir diario en docs/diarios/YYYY-MM-DD.md
# 2. Actualizar ESTADO-SISTEMA.md
# 3. Commit de cierre
git add .
git commit -m "chore(sesion): cierre sesion YYYY-MM-DD"
git push
```

## 5. Convenciones Obsidian ↔ GitHub

> Este repo es también vault de Obsidian. Las siguientes reglas garantizan compatibilidad total entre ambas herramientas sin conflictos ni ruido en git.

### 5.1 Qué va al .gitignore

| Ruta | Motivo |
|---|---|
| `.obsidian/workspace.json` | Estado UI local — distinto en cada dispositivo |
| `.obsidian/workspace-mobile.json` | Ídem para móvil |
| `.obsidian/cache` | Cache regenerable, genera ruido en git |
| `.trash/` | Papelera de Obsidian |
| `.smart-connections/` | Index de plugin pesado, regenerable |
| `.env` | Secretos — nunca al repo |
| `logs/` | Logs locales |

> ⚠️ `.obsidian/` completo se trackea para sincronizar configuración entre dispositivos. Solo se excluyen los archivos volátiles de arriba.

### 5.2 Frontmatter estándar

Todo archivo `.md` en `docs/` debe tener este frontmatter:

```yaml
***
tipo: diario
tags: [diario, madre]
estado: activo
created: 2026-07-05
***
```

Los ficheros raíz (`README.md`, `CONVENCIONES.md`, etc.) usan frontmatter extendido con `author`, `ruta` y `actualizado`.

### 5.3 Links

| Contexto | Formato correcto | Motivo |
|---|---|---|
| Dentro de `docs/` | `[[wiki-link]]` | Obsidian los renderiza y navega |
| Ficheros raíz (`README`, `CONVENCIONES`…) | `[texto](ruta.md)` | GitHub no renderiza `[[ ]]` |
| Links externos | `[texto](https://...)` | Universal |

> Nunca usar `[[wikilinks]]` en ficheros raíz.

### 5.4 Attachments e imágenes

- Todas las imágenes y adjuntos van a `assets/`, nunca en raíz ni en `docs/` directamente.
- Configurar en Obsidian: `Settings → Files & Links → Default location for new attachments → assets/`
- Archivos de más de 100MB no van al repo; usar enlace externo.

### 5.5 Sync Obsidian Git

Configuración recomendada del plugin **Obsidian Git**:

```text
Auto commit-and-sync interval: 15 min
Auto pull interval:             15 min
Pull on startup:                activado
Push on commit-and-sync:        activado
Merge strategy:                 Merge
Author name:                    Alvaro Fernandez Mota
Author email:                   alvarofernandezmota@gmail.com
```

> En iPhone (Blink Shell) el sync es manual: `git pull && git add . && git commit -m "..." && git push`.
