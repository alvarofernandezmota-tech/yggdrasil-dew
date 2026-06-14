# Impresión 3D — Anycubic Photon V1

> Repo completo: [alvarofernandezmota-tech/impresion-3d](https://github.com/alvarofernandezmota-tech/impresion-3d)
> Este archivo es la ficha de conexión — el contenido vive en el repo dedicado.
> Última actualización: 14 junio 2026

---

## Qué es

Proyecto de impresión 3D con resina. Impresora: **Anycubic Photon V1**.
Repo independiente con diarios de sesión, configuraciones, modelos, resinas y workflow completo.

---

## Estado actual

| Item | Estado |
|---|---|
| Impresora | ✅ Anycubic Photon V1 operativa |
| Slicer en Windows | ✅ Chitubox Free instalado |
| Slicer en Madre (Arch Linux) | ⏳ Pendiente instalar |
| Último uso | Mayo 2026 |

---

## Instalación slicer en Madre (Arch Linux)

El slicer principal es **Chitubox Free**. Es propietario pero es el que mejor soporta el Photon V1.

⚠️ **Nota filosofía:** Chitubox no es open source. La alternativa open source es **PrusaSlicer** pero no tiene soportes automáticos gratis para resina. Para este proyecto usamos Chitubox con esta excepción documentada.

### Instalar Chitubox en Arch

```bash
# Opción 1 — AUR (recomendada)
yay -S chitubox-free

# Opción 2 — Descarga manual
# 1. Ir a https://www.chitubox.com/en/download/chitubox-free
# 2. Descargar versión Linux (.AppImage o .deb)
# 3. AppImage:
chmod +x CHITUBOX_Free_V*.AppImage
./CHITUBOX_Free_V*.AppImage
```

### Configuración inicial en Madre
1. Abrir Chitubox → **Settings → Printer → Add printer**
2. Buscar **"Anycubic"** → seleccionar **"Photon"** (sin letra)
3. Formato de salida: `.pwma`
4. Añadir perfil de resina según marca usada

### Alternativa open source
```bash
# PrusaSlicer — open source, sin soportes automáticos para resina
yay -S prusa-slicer
```

---

## Flujo de trabajo

```
1. Descargar STL (Thingiverse, Printables, Myminifactory)
2. Abrir en Chitubox
3. Orientar modelo (30-45° para minimizar succión)
4. Soportes automáticos → revisar manualmente
5. Configurar perfil resina
6. Slicear → exportar .pwma → USB → imprimir
```

---

## Decisiones tomadas

| Decisión | Razón |
|---|---|
| Chitubox sobre Lychee | Lychee tiene soportes automáticos solo en premium |
| Chitubox sobre PrusaSlicer | PrusaSlicer no tiene soportes automáticos para resina |
| Repo independiente | Tiene su propio workflow, diarios y lifecycle |

---

## TODO próximo

- [ ] Instalar Chitubox en Madre via AUR (`yay -S chitubox-free`)
- [ ] Verificar que genera `.pwma` correcto en Linux
- [ ] Añadir perfil resina actual en Chitubox

---

## Historial

| Fecha | Evento |
|---|---|
| 14 jun 2026 | Ficha creada en personal-v2, instalación Madre pendiente |
| 27 may 2026 | Último commit en repo impresion-3d |
| 23 may 2026 | Repo creado, Chitubox instalado en Windows |
