---
tags: [setup, movil, iphone, apple, personal]
fecha-actualizacion: 2026-06-22
---

# 📱 iPhone 11 — Móvil Personal

> Dispositivo personal principal. No forma parte de la infraestructura de red.
> Rol: acceso a THDORA, Obsidian Mobile, comunicaciones.

---

## Hardware

| Componente | Detalle |
|---|---|
| Modelo | iPhone 11 |
| OS | iOS (actualizar a última versión estable) |
| Almacenamiento | verificar con `Ajustes > General > Almacenamiento` |

---

## Rol en el ecosistema

| Función | App | Estado |
|---|---|---|
| Bot THDORA | Telegram | ✅ Activo |
| Segundo cerebro | Obsidian Mobile | ⏳ Pendiente instalar |
| Red | WiFi hotspot Samsung | ✅ Conectado |
| Tailscale | Tailscale iOS | ⏳ Pendiente instalar |

---

## 🔒 Seguridad pendiente reforzar

- [ ] Contraseña / Face ID activado y fuerte
- [ ] Cifrado activado (iOS lo hace automáticamente con código)
- [ ] Copias de seguridad iCloud o local activadas
- [ ] Revisar apps con acceso a ubicación — desactivar las innecesarias
- [ ] Revisar apps con acceso a cámara/micro — desactivar las innecesarias
- [ ] Activar "Borrado remoto" (Find My iPhone)
- [ ] VPN en iOS (Tailscale) para acceso seguro fuera de casa
- [ ] Actualizar iOS a última versión estable

---

## 📲 Obsidian Mobile — setup pendiente

```
1. Instalar Obsidian desde App Store
2. Crear vault nuevo local
3. Instalar plugin Obsidian Git
4. Configurar repo: alvarofernandezmota-tech/yggdrasil-dew
5. Git pull → vault sincronizado con todo el ecosistema
```

> ⚠️ Obsidian Git en iOS requiere Working Copy o similar como intermediario git.
> Alternativa más simple: iSH + git manual.

---

## 🔵 Tailscale iOS — setup pendiente

```
1. Instalar Tailscale desde App Store
2. Login con la misma cuenta
3. Activar VPN → acceso a Madre (100.91.112.32) desde cualquier red
4. Probar: acceder a Grafana desde Safari → 100.91.112.32:3000
```

---

## 📊 Qué podemos monitorizar del iPhone

| Métrica | Cómo verlo |
|---|---|
| Batería % | Widget iOS nativo |
| Almacenamiento | Ajustes > General |
| Datos móviles usados | Ajustes > Móvil |
| Apps que más consumen | Ajustes > Batería |
| Conexión WiFi actual | Ajustes > WiFi |

> iOS no permite monitorización externa como Linux. Solo desde el propio dispositivo o apps autorizadas.

---

_Ver también: [[setup/hotspot]] · [[setup/tailscale]] · [[setup/dashboard]] · [[HOME]]_
