---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: docs/canon/PROTOCOLO-VERIFICACION-COMMITS.md
tags: [protocolo, canon, commits, sesiones, diario, auditoria]
status: vigente
---

# 🔍 PROTOCOLO — Verificación de Commits y Documentación

> Asegura que **todo commit de cada repo queda documentado** en el diario o en el log de sesión correspondiente.  
> Y que todo lo apuntado en diario/sesión tiene su commit verificado en el repo correcto.  
> **Bidireccional:** commits → docs y docs → commits.

---

## 🎯 Cuándo ejecutar este protocolo

- Al **inicio de cada sesión** (como parte del `PROTOCOLO-INICIO-SESION.md`)
- Al **cierre de cada sesión** (como parte del `PROTOCOLO-CIERRE-SESION.md`)
- Siempre que se sospeche desalineación entre lo ejecutado y lo documentado
- Después de cualquier sesión que haya generado más de 3 commits

---

## 🗂️ Estructura canonica de `docs/sesiones/`

Todos los archivos de sesiones siguen este esquema de nomenclatura:

```
docs/sesiones/
├── PROXIMA-SESION.md              ← siempre presente, un solo archivo
├── YYYY-MM-DD-diario.md           ← diario del día (uno por día)
├── YYYY-MM-DD-sesion-[N].md       ← log de sesión (puede haber varias por día)
└── YYYY-MM-DD-cierre.md           ← cierre del día (uno por día)
```

**Regla de nomenclatura:**
- Prefijo siempre `YYYY-MM-DD-`
- Sufijos válidos: `diario`, `sesion-manana`, `sesion-tarde`, `sesion-noche`, `sesion-[N]`, `cierre`, `auditoria-[tema]`
- Sin mayúsculas excepto `PROXIMA-SESION.md`
- Sin espacios, sin tildes en nombres de archivo

---

## 📝 Estructura de cada log de sesión

Cada archivo `YYYY-MM-DD-sesion-*.md` o `YYYY-MM-DD-diario.md` **debe contener**:

```markdown
## Commits ejecutados

| Repo | Commit SHA (7 chars) | Mensaje | Archivo(s) afectado(s) |
|------|----------------------|---------|------------------------|
| yggdrasil-dew | abc1234 | feat: ... | docs/canon/X.md |
| yggdrasil-wiki | def5678 | fix: ... | wiki/islas/X.md |
```

Si el log **no tiene esta tabla**, está incompleto y debe ser actualizado.

---

## ⚙️ Pasos del protocolo (ejecutar en orden)

### FASE 1 — Inventario de logs del día

```
1. Listar todos los archivos en docs/sesiones/ con fecha de hoy (YYYY-MM-DD-*)
2. Verificar que existe al menos:
   - Un archivo YYYY-MM-DD-diario.md O YYYY-MM-DD-sesion-*.md
   - Si hubo cierre: YYYY-MM-DD-cierre.md
3. Si falta el diario del día → CREARLO (ver plantilla al final)
```

### FASE 2 — Commits → Documentación

```
Para cada repo activo del ecosistema:
  1. Obtener commits de las últimas 24h (list_commits con since: hoy)
  2. Para cada commit:
     a. Buscar su SHA (7 chars) en todos los logs de docs/sesiones/
     b. Si NO está documentado:
        - Añadir entrada en el log de sesión correspondiente a la fecha del commit
        - Si no existe log para esa fecha: crear YYYY-MM-DD-diario.md
```

**Repos a verificar (ecosistema completo):**
- `yggdrasil-dew`
- `yggdrasil-wiki`
- `yggdrasil-tracking`
- `THDORA-PERSONAL`
- `madre-config`
- `acer-config`
- `yggdrasil-scripts`

### FASE 3 — Documentación → Commits

```
Para cada entrada en los logs de sesiones que mencione un archivo creado/modificado:
  1. Verificar que el archivo existe en el repo mencionado
  2. Verificar que hay un commit que lo incluye
  3. Si el archivo NO existe → marcar como ⚠️ PENDIENTE en PROXIMA-SESION.md
  4. Si el archivo existe pero no hay commit → imposible (GitHub crea commit al push), ignorar
```

### FASE 4 — Normalizar nomenclatura

```
Revisar todos los archivos en docs/sesiones/:
  1. Detectar archivos que NO siguen el esquema YYYY-MM-DD-[sufijo].md
  2. Listarlos como ⚠️ anomalías en el log del día
  3. NO renombrar — solo documentar (renombrar rompe git history)
```

### FASE 5 — Actualizar PROXIMA-SESION.md

```
Actualizar la sección de pendientes con:
  - Commits sin documentar encontrados
  - Entradas de log sin commit verificado
  - Anomalías de nomenclatura detectadas
```

---

## 📊 Checklist de verificación

```
[ ] docs/sesiones/ tiene archivo para hoy
[ ] Todos los commits de hoy están en algún log
[ ] Todos los items del log tienen su archivo en el repo
[ ] PROXIMA-SESION.md refleja el estado real
[ ] No hay archivos hürfanos en docs/sesiones/ sin log asociado
[ ] Nomenclatura canonica respetada (o anomalías documentadas)
```

---

## 📝 Plantilla — diario del día

```markdown
---
tipo: diario
author: Alvaro Fernandez Mota
fecha: YYYY-MM-DD
ruta: docs/sesiones/YYYY-MM-DD-diario.md
tags: [diario, sesion]
---

# Diario — YYYY-MM-DD

## Resumen del día

<!-- Qué se hizo, en qué repos, por qué -->

## Commits ejecutados

| Repo | Commit SHA | Mensaje | Archivos afectados |
|------|------------|---------|--------------------|
| | | | |

## Pendientes generados

- [ ] 

## Notas

<!-- Decisiones tomadas, bloqueos, contexto importante -->

---

_Generado: YYYY-MM-DD HH:MM CEST · Perplexity MCP_
```

---

## 🔗 Protocolos relacionados

- [`PROTOCOLO-INICIO-SESION.md`](PROTOCOLO-INICIO-SESION.md) — ejecutar al arrancar
- [`PROTOCOLO-CIERRE-SESION.md`](PROTOCOLO-CIERRE-SESION.md) — ejecutar al cerrar
- [`PROTOCOLO-AUDITORIA.md`](PROTOCOLO-AUDITORIA.md) — auditoría profunda del ecosistema
- [`PROTOCOLO-ALINEACION.md`](PROTOCOLO-ALINEACION.md) — alineación de repos

---

_Creado: 2026-07-16 19:04 CEST · Perplexity MCP_
