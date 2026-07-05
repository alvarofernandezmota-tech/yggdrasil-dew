---
tipo: normas
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-06-01 00:00 CEST
actualizado: 2026-07-05 12:00 CEST
ruta: CONVENCIONES.md
tags: [normas, convenciones, ecosistema, commits]
status: vigente
---

# 📐 CONVENCIONES — yggdrasil-dew

> Fuente de verdad única para estructura, nombrado, commits y flujo de trabajo.
> Todo agente IA, script, Copilot o contribuidor humano DEBE leer esto antes de tocar el repo.

---

## 1. Commits — Conventional Commits

Formato: `<tipo>(<scope>): <descripción imperativa en minúsculas>`

```
feat(docker):       nueva funcionalidad
fix(infra):         corrección de bug
docs(diarios):      solo documentación
chore(repo):        mantenimiento
infra(madre):       cambios de infraestructura
security(ssh):      cambios de seguridad
refactor(scripts):  reestructuración
ci(github):         cambios en GitHub Actions
debt(scripts):      resolución de deuda técnica
```

---

## 2. Nombrado de ficheros

| Tipo | Convención | Ejemplo |
|---|---|---|
| Scripts | `kebab-case` | `install-docker.sh` |
| Agentes | `agente-<función>.sh` | `agente-mejorador.sh` |
| Documentos raíz | `MAYUSCULAS.md` | `README.md` |
| Docs en subcarpetas | `kebab-case.md` | `ssh-hardening.md` |
| Diarios | `YYYY-MM-DD.md` | `2026-07-05.md` |

---

## 3. Ramas

| Rama | Propósito |
|---|---|
| `main` | Producción — siempre estable |
| `feat/<nombre>` | Nueva funcionalidad |
| `fix/<nombre>` | Corrección |
| `docs/<nombre>` | Solo documentación |
| `debt/<nombre>` | Resolución de deuda técnica |
| `copilot/<nombre>` | Trabajo de Copilot |

---

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

---

_Migrado desde WIKI---PERSONAL: 2026-07-05 · Perplexity-MCP_
