# Diarios

> Memoria episódica del sistema. Un archivo por día.
> Formato: `YYYY-MM-DD.md` dentro de la carpeta del año.
> Última actualización: 12 junio 2026

---

## Estructura

```
diarios/
├── README.md          ← este archivo
├── _plantilla.md      ← plantilla base para cada día
└── 2026/
    ├── 2026-06-12.md
    ├── 2026-06-13.md
    └── ...
```

---

## Secciones de cada entrada

Cada día usa estas secciones (solo las que apliquen):

```
## 🖥️ Servidor       ← avances de infraestructura
## 💻 Proyectos      ← código, THDORA, portfolio...
## 📚 Formación      ← qué he aprendido hoy
## 🧠 Personal       ← reflexiones, estado, contexto vital
```

**Regla:** si una sección no tiene contenido ese día, no se pone.

---

## Cómo crear una entrada

1. Copiar `_plantilla.md`
2. Renombrar a `2026/YYYY-MM-DD.md`
3. Rellenar solo las secciones con contenido
4. Decirle a Perplexity: "crea el diario de hoy" — lo hace automáticamente
