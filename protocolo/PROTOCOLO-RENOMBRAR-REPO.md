---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-RENOMBRAR-REPO.md
tags: [protocolo, renombrar, repo, nombres]
status: vigente
version: 1.0
---

# PROTOCOLO-RENOMBRAR-REPO v1.0

> Pasos para renombrar un repositorio del ecosistema.
> Requiere terminal en Madre para actualizar remotes locales.
> Tiempo estimado: 20-30 min.

---

## Caso de uso principal

```
Ejemplo pendiente: WIKI---PERSONAL -> yggdrasil-wiki
  (renombrar en GitHub + actualizar remote en Madre)
```

---

## FASE 1 — Pre-renombrado (antes de tocar nada)

```
[ ] Confirmar el nombre nuevo es canonico (PROTOCOLO-NOMBRES)
[ ] Identificar todos los repos que referencian el nombre antiguo
[ ] Buscar en DEW: grep -r 'nombre-antiguo' . (en Madre)
[ ] Buscar en WIKI: grep -r 'nombre-antiguo' .
[ ] Listar los archivos que hay que actualizar antes y despues
```

---

## FASE 2 — Renombrado en GitHub

```
[ ] GitHub -> repo -> Settings -> Repository name -> cambiar
[ ] GitHub redirige las URLs automaticamente (pero no indefinidamente)
[ ] Anotar la fecha del renombrado
```

---

## FASE 3 — Actualizar remote en Madre (requiere terminal)

```bash
cd /ruta/al/repo/local
git remote set-url origin git@github.com:alvarofernandezmota-tech/NOMBRE-NUEVO.git
git remote -v  # verificar
```

---

## FASE 4 — Actualizar referencias en el ecosistema (MCP)

```
[ ] ECOSYSTEM-ARCHITECTURE.md -> actualizar nombre del repo
[ ] ESTADO-SISTEMA.md -> tabla de repos
[ ] MASTER-PENDIENTES.md -> si el repo aparece
[ ] Islas WIKI que mencionen el repo
[ ] ADRs que mencionen el repo
[ ] protocolo/INDEX.md si el repo aparece
[ ] README.md del propio repo -> campo 'ruta'
```

---

## FASE 5 — Verificacion post-renombrado

```
[ ] git clone del repo con el nombre nuevo funciona
[ ] git push desde Madre funciona
[ ] CI del repo pasa en verde
[ ] Ninguna referencia al nombre antiguo en archivos canon
[ ] Diario DEW del dia documenta el renombrado
[ ] Abrir issue de seguimiento si queda algo pendiente
```

---

## Relacionado

- PROTOCOLO-NOMBRES.md
- PROTOCOLO-ACTUALIZACION-ECOSISTEMA.md
- ECOSYSTEM-ARCHITECTURE.md

---

_Creado: 2026-07-16 v1.0 F17 Perplexity MCP_
