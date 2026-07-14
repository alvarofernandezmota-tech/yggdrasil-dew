---
tipo: protocolo
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-14 18:01 CEST
actualizado: 2026-07-14 18:01 CEST
ruta: protocolo/PROTOCOLO-BORRADO.md
tags: [protocolo, borrado, ecosistema, integridad]
status: vigente
version: 1.0
---

# 🗑️ PROTOCOLO-BORRADO — Eliminación Segura en Cascada

> Antes de borrar cualquier archivo, carpeta o repo del ecosistema, ejecuta este protocolo.
> **Regla de oro:** No se borra nada sin verificar que no rompe otra pieza del ecosistema.
> Origen de este protocolo: 2026-07-14, se borraron 19 protocolos sin limpiar sus referencias.

---

## 0. PREGUNTA PREVIA — oblitagoria

Antes de empezar, responde:

```
¿Qué quiero borrar exactamente?
¿Por qué lo borro? (obsoleto / migrado / error / duplicado)
¿El contenido existe en otro lugar del ecosistema?
```

Si el contenido **no existe en ningún otro lugar** → **STOP. Migrar primero, borrar después.**

---

## FASE 1 — DETECTAR REFERENCIAS

**Objetivo:** encontrar todas las menciones al elemento que vas a borrar.

```bash
# Buscar en el repo actual
grep -r "NOMBRE-DEL-ARCHIVO" . --include="*.md" --include="*.sh" --include="*.yml"

# Buscar en todos los repos clonados en Madre
for dir in $(find /home/varopc -maxdepth 2 -name ".git" -type d | sed 's/\/.git//'); do
  resultado=$(grep -r "NOMBRE-DEL-ARCHIVO" "$dir" --include="*.md" 2>/dev/null)
  if [ -n "$resultado" ]; then
    echo "=== $dir ==="
    echo "$resultado"
  fi
done
```

```
[ ] Ejecutado grep en repo actual
[ ] Ejecutado grep en todos los repos de Madre
[ ] Listados todos los archivos que referencian el elemento
```

---

## FASE 2 — CLASIFICAR EL BORRADO

Con la lista de referencias, clasifica:

| Tipo | Definición | Acción |
|---|---|---|
| **Borrado limpio** | 0 referencias en el ecosistema | Borrar directamente, continuar a Fase 4 |
| **Borrado con limpieza** | Tiene referencias pero el contenido está migrado o es obsoleto | Ejecutar Fase 3 antes de borrar |
| **Borrado bloqueado** | Tiene referencias Y el contenido no está en otro lugar | **NO BORRAR** — migrar primero |

```
[ ] Tipo de borrado clasificado: [ ] Limpio  [ ] Con limpieza  [ ] Bloqueado
```

---

## FASE 3 — LIMPIAR REFERENCIAS (solo si "Con limpieza")

Por cada referencia encontrada en Fase 1:

```
[ ] protocolo/INDEX.md — eliminar fila de la tabla o mover a sección "Pendientes"
[ ] MASTER-PENDIENTES.md — cerrar o reasignar cualquier ítem que mencione el archivo
[ ] ECOSYSTEM-ARCHITECTURE.md — actualizar si el archivo era parte de la arquitectura
[ ] README.md del repo — actualizar si hay enlace o mención
[ ] Otros archivos encontrados en grep — actualizar referencia o eliminar mención
[ ] Issues abiertos en GitHub — cerrar o actualizar los que mencionen el archivo
```

**Regla:** primero limpias las referencias, luego borras el archivo. Nunca al revés.

---

## FASE 4 — EJECUTAR EL BORRADO

```bash
# Opción A: borrar archivo del repo (via MCP o git local)
git rm protocolo/PROTOCOLO-EJEMPLO.md

# Opción B: borrar repo completo de Madre (solo tras verificar git status limpio)
cd /home/varopc/nombre-repo && git status
# Si limpio:
rm -rf /home/varopc/nombre-repo
```

```
[ ] Referencias limpiadas (Fase 3 completada o borrado es limpio)
[ ] Archivo / carpeta / repo eliminado
```

---

## FASE 5 — COMMIT Y CIERRE

```
[ ] Commit con mensaje: "chore(borrado): eliminar NOMBRE — motivo: <razón>"
[ ] Push verificado
[ ] Issue de cierre creado si el elemento borrado era relevante:
    Título: "[DOC] Borrado NOMBRE — <razón>"
    Labels: tipo:deuda + capa correspondiente
    Cuerpo: qué se borró, por qué, dónde está el contenido migrado (si aplica)
[ ] Cerrar el issue tras el push
```

---

## CASOS ESPECIALES

### Borrar un repo completo de GitHub

Además de las fases anteriores:
```
[ ] Verificar que no tiene dependencias activas (otro repo lo llama, Docker lo monta, etc.)
[ ] Hacer backup local antes de borrar: git clone --mirror git@github.com:.../repo.git repo-backup.git
[ ] Actualizar ECOSYSTEM-ARCHITECTURE.md: mover a sección ARCHIVADOS o eliminar fila
[ ] Archivar en GitHub (preferible a borrar) si el repo es público
```

### Borrar un diario o entrada personal

```
[ ] Los diarios NO se borran — se mueven a archivos/YYYY/ si se quiere ocultar
[ ] Nunca borrar entradas de yggdrasil-tracking sin respaldo
```

### Borrar un secreto de un archivo

```
[ ] Ejecutar PROTOCOLO-ROTACION-SECRETOS antes de borrar
[ ] El historial de git guarda el secreto aunque borres el archivo — rotar siempre
```

---

## CUÁNDO NO USAR ESTE PROTOCOLO

- Borrar archivos temporales o de trabajo local que nunca se pushearon
- Borrar líneas de código dentro de un archivo (eso es un edit normal)
- Borrar el contenido de un archivo sin borrar el archivo en sí

---

_Creado: 2026-07-14 18:01 CEST · Perplexity-MCP_
_Motivo: se borraron 19 protocolos el 2026-07-14 sin limpiar referencias en INDEX ni otros docs_
