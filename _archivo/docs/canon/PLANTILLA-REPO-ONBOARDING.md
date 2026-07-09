---
tipo: plantilla
author: Alvaro Fernandez Mota
creado: 2026-07-09
actualizado: 2026-07-09
ruta: docs/canon/PLANTILLA-REPO-ONBOARDING.md
tags: [plantilla, onboarding, repo, ecosistema, canon]
status: activo
---

# Plantilla — Onboarding de Repo al Ecosistema

> Usar esta plantilla cada vez que un repo nuevo se incorpora al ecosistema Yggdrasil,
> o cuando se audita uno existente para verificar su integración.
> Crear el archivo resultante en: `docs/auditorias/<nombre-repo>.md`

---

## Por qué existe esta plantilla

Cada repo del ecosistema necesita estar documentado en tres niveles:
1. **Desde fuera** — el ecosistema sabe que existe, dónde vive y qué hace (`ownership-matrix.md`, `MAPA-REPOS-MADRE.md`)
2. **Ficha propia** — este documento, que concentra todo lo verificado del repo
3. **Desde dentro** — el propio repo tiene su `README.md`, `CONTEXT.md` y `AGENT.md` actualizados

Sin estos tres niveles, cuando algo falla o cuando un agente IA necesita contexto, no hay fuente de verdad fiable.

---

## 1. Identificación del repo

| Campo | Valor |
|---|---|
| **Nombre GitHub** | `alvarofernandezmota-tech/NOMBRE-REPO` |
| **URL** | https://github.com/alvarofernandezmota-tech/NOMBRE-REPO |
| **Visibilidad** | 🔴 Privado / 🟢 Público |
| **Isla en el ecosistema** | [Seguridad / THDORA / Cerebro / Infra / Labs / IA Local / Personal] |
| **Propósito** | Una frase clara de qué hace este repo |

---

## 2. Ubicación física en Madre

```bash
# Verificar con:
docker inspect <contenedor> --format '{{.Config.Labels}}' | tr ',' '\n' | grep -i compose
git remote -v
git log -1 --oneline
```

| Campo | Valor |
|---|---|
| **Ruta física real** | `/home/varopc/...` |
| **Symlink operativo** | `~/repos/NOMBRE` → `ruta-real` (si aplica) |
| **Branch activo** | `main` (último commit: `xxxxxxx`) |
| **Remote confirmado** | `git@github.com:alvarofernandezmota-tech/NOMBRE-REPO.git` |

> ⚠️ Si la ruta física NO es `~/repos/NOMBRE-REPO`, documentar la excepción y su motivo.

---

## 3. Stack Docker (si aplica)

| Campo | Valor |
|---|---|
| **Compose file activo** | `/ruta/docker-compose.yml` |
| **Compose project** | `nombre-proyecto` |
| **Archivo de entorno** | `.env` (verificar permisos `600` y que NO está en repo) |

### Contenedores

| Contenedor | `yggdrasil.layer` | `yggdrasil.role` | Estado |
|---|---|---|---|
| `nombre_contenedor` | layer | role | Running / Healthy / Unhealthy |

---

## 4. Incidentes registrados

| HAL | Descripción | Estado |
|---|---|---|
| — | Sin incidentes conocidos | — |

---

## 5. Conexión con el ecosistema

| Documento | Enlace |
|---|---|
| Ownership matrix | [docs/canon/ownership-matrix.md](../canon/ownership-matrix.md) |
| Mapa físico Madre | [WIKI: MAPA-REPOS-MADRE.md](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/docs/infra/MAPA-REPOS-MADRE.md) |
| Diario verificación | [docs/diarios/YYYY-MM-DD.md](../diarios/YYYY-MM-DD.md) |

---

## 6. Checklist de onboarding

### Desde fuera (ecosistema)
- [ ] Entrada en `ownership-matrix.md` con ruta física real
- [ ] Entrada en `MAPA-REPOS-MADRE.md` (WIKI) con sección completa
- [ ] Esta ficha de auditoría creada en `docs/auditorias/`
- [ ] Aparece en `MASTER-PENDIENTES.md` si tiene tareas pendientes

### Desde dentro (el propio repo)
- [ ] `README.md` menciona que forma parte del ecosistema Yggdrasil con enlace a Dew
- [ ] `CONTEXT.md` o `AGENT.md` tiene ruta física real en Madre
- [ ] Labels Docker con `yggdrasil.layer` y `yggdrasil.role` en todos los contenedores
- [ ] `.env` real con permisos `600` y en `.gitignore`
- [ ] Repo con visibilidad correcta (privado si tiene IPs, tokens o datos sensibles)

### Seguridad básica
- [ ] CI de secretos activo (si es público)
- [ ] Branch protection en `main`
- [ ] No hay tokens, IPs reales ni credenciales en el historial git

---

## Regla de oro

> Un repo no está "en el ecosistema" hasta que los tres niveles están completos:
> ecosistema sabe de él + tiene su ficha + se documenta a sí mismo.

---

_Plantilla creada: 2026-07-09 · Perplexity MCP · revisar si cambia el estándar del ecosistema_
