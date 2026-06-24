# Obsidian — Setup y conexión con yggdrasil-dew

> Cómo conectar Obsidian al repo para tener el cerebro visual funcionando.

---

## Plugins imprescindibles

| Plugin | Función | Instalación |
|---|---|---|
| **Obsidian Git** | Auto-commit + sync con GitHub | Community plugins |
| **Dataview** | Queries sobre notas (como SQL) | Community plugins |
| **Templater** | Plantillas dinámicas con fecha, variables | Community plugins |
| **Calendar** | Vista calendario + diarios | Community plugins |
| **Local REST API** | THDORA y agentes pueden leer/escribir notas | Community plugins |
| **Kanban** | Tablero de tareas visual | Community plugins |

---

## Configuración Obsidian Git

```
Settings → Obsidian Git:
  Vault backup interval: 10 (minutos)
  Auto pull interval: 5 (minutos)
  Commit message: "obsidian: {{date}} {{time}}"
  Pull on startup: ON
  Push on backup: ON
```

### En Acer (primer setup)
```bash
# Clonar repo como vault de Obsidian
git clone https://github.com/alvarofernandezmota-tech/yggdrasil-dew ~/Obsidian/yggdrasil
# Abrir Obsidian → Open folder as vault → ~/Obsidian/yggdrasil
```

### En cualquier máquina nueva
```bash
git clone https://github.com/alvarofernandezmota-tech/yggdrasil-dew ~/Obsidian/yggdrasil
# Obsidian → Open vault → instalar plugins → listo
```

---

## Estructura de enlaces internos

Obsidian usa `[[nombre-fichero]]` para enlazar. Los ficheros maestros
deben enlazarse desde cualquier nota nueva:

```markdown
Ver: [[ESTADO-SISTEMA]] · [[MASTER-PENDIENTES]] · [[ROADMAP]]
```

---

## Dataview — queries útiles

### Pendientes de hoy
```dataview
task from "inbox"
where !completed
sort file.mtime desc
limit 20
```

### Sesiones de esta semana
```dataview
table file.mtime as "Fecha"
from "inbox"
where contains(file.name, "sesion")
sort file.mtime desc
limit 7
```

### Todos los ADR
```dataview
table file.mtime as "Fecha"
from "inbox"
where contains(file.name, "adr")
sort file.mtime desc
```

---

## Templater — plantilla diario

Guardar en `templates/diario.md`:

```markdown
# Diario — <% tp.date.now("DD MMM YYYY") %>

## Contexto
- Equipos activos:
- Servicios corriendo:

## Hecho hoy
-

## Pendiente mañana
-

## Notas

---
Ver: [[MASTER-PENDIENTES]] · [[ESTADO-SISTEMA]]
```

---

## Local REST API — THDORA escribe en Obsidian

Con el plugin Local REST API activo, THDORA puede:
```bash
# Crear nota en inbox desde THDORA
curl -X POST http://localhost:27123/vault/inbox/nota.md \
  -H "Authorization: Bearer TU_API_KEY" \
  -H "Content-Type: text/markdown" \
  -d "# Nota desde THDORA\nContenido..."
```

Configurar en: Settings → Local REST API → copiar API key → añadir a `.env`

---
_Ver: [ESTADO-SISTEMA.md](../ESTADO-SISTEMA.md) · [MASTER-PENDIENTES.md](../MASTER-PENDIENTES.md)_
