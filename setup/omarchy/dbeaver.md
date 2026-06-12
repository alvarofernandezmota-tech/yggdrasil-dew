# DBeaver — Gestor de bases de datos

> Última actualización: 12 junio 2026

---

## Qué es

Cliente universal de bases de datos. Soporta PostgreSQL, MySQL, SQLite, y más.
Interface gráfica para explorar, editar y ejecutar queries.

---

## Instalación

```bash
yay -S dbeaver
```

---

## Conexión a PostgreSQL local (Acer)

Cuando PostgreSQL esté dockerizado en Acer (Fase 7):

| Campo | Valor |
|---|---|
| Host | `100.86.119.102` (IP Tailscale Acer) |
| Puerto | `5432` |
| Base de datos | `thdora` (u otras) |
| Usuario | según config Docker |

---

## Notas Wayland

Si DBeaver no arranca correctamente en Hyprland:

```bash
# Forzar modo XWayland si hay problemas de render
DISPLAY=:0 dbeaver
```

---

_Volver al índice: [README.md](README.md)_
