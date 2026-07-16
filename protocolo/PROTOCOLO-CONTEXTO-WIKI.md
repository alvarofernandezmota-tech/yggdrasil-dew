---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-CONTEXTO-WIKI.md
tags: [protocolo, contexto, wiki, agente, apertura]
status: vigente
version: 1.0
---

# PROTOCOLO-CONTEXTO-WIKI v1.0

> Este protocolo carga el contexto completo de `yggdrasil-wiki` al inicio de cualquier sesión
> que implique trabajo en este repo.

---

## 1. Propósito del repo

`yggdrasil-wiki` es el **mapa conceptual** del ecosistema:
- Islas temáticas: qué existe y por qué
- Relaciones entre islas
- Modelo mental del ecosistema
- Referencias a repos canónicos para cada dominio

No contiene: comandos, scripts, configuraciones, diarios, secretos.

---

## 2. Estructura del repo

```
yggdrasil-wiki/
├── README.md              ← entrada principal
├── HOME.md                ← mapa de navegación
├── wiki/
│   ├── islas/             ← una isla = un dominio/repo
│   │   ├── INDEX.md       ← índice de islas ← leer primero
│   │   ├── <isla>.md      ← isla temática
│   │   └── ...
│   └── ...
```

---

## 3. Checklist de contexto al abrir sesión

```
[ ] Leer wiki/islas/INDEX.md — lista de islas activas
[ ] Verificar qué isla(s) afecta el trabajo de la sesión
[ ] Leer la isla correspondiente antes de modificarla
[ ] Confirmar que el frontmatter cumple el esquema WIKI (tipo: isla|mapa|modelo|redirect)
[ ] Si se crea isla nueva — actualizar INDEX.md
```

---

## 4. Frontmatter obligatorio para islas

```yaml
---
tipo: isla | mapa | modelo | redirect
nombre: Nombre legible
descripcion: Una linea
repo_principal: URL del repo operativo correspondiente
estado: estable | borrador | deprecado
author: Alvaro Fernandez Mota
creado: YYYY-MM-DD
actualizado: YYYY-MM-DD
ruta: wiki/islas/<nombre>.md
tags: [lista, de, tags]
status: vigente | deprecado
---
```

---

## 5. Reglas críticas de WIKI

- Cada isla apunta a **un solo repo principal** (`repo_principal`).
- Una isla deprecada mantiene `tipo: redirect` y link al sustituto — nunca se borra.
- No duplicar contenido que ya existe en DEW u otro repo operativo.
- Nunca mezclar comandos/scripts con conceptos.
- `wiki/islas/formacion.md` → apunta a `yggdrasil-formacion` (sin guión).
- `wiki/islas/VIDAPERSONAL.md` → redirect deprecado, apunta a tracking + formacion.

---

## 6. Islas activas (2026-07-16)

Ver: [wiki/islas/INDEX.md](https://github.com/alvarofernandezmota-tech/yggdrasil-wiki/blob/main/wiki/islas/INDEX.md)

---

_Creado: 2026-07-16 · F13 Protocolo Contexto WIKI v1.0 · Perplexity MCP_
