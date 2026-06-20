# Inbox — Hyprlock Crash + Dashboard · 20 junio 2026 ~18:40

> Tags: `#hyprlock` `#hyprland` `#crash` `#fix` `#tty` `#dashboard` `#ecosistema` `#aprendizaje`
> Estado: 🟡 Documentado

---

## 🔒 Hyprlock crash — fix completo

### Qué pasó
Hyprlock crashó (“Oopsie daisy”) — el compositor bloqueó la sesión por seguridad pero el locker murió. Pantalla bloqueada sin salida visible.

### Fix paso a paso

**1. Saltar a otra TTY**
```
Ctrl + Alt + F3  (o F4, F5...)
```
Login con usuario y contraseña.

**2. Opción A — Recuperar hyprlock (recomendado)**
```bash
hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'
hyprctl --instance 0 'dispatch exec hyprlock'
```

**3. Opción B — Si sigue roto, matar y relanzar**
```bash
killall -9 hyprlock
hyprctl --instance 0 'dispatch exec hyprlock'
```

**4. Volver a Hyprland**
```
Ctrl + Alt + F1  (o F2)
```

### Prevención — ver logs
```bash
journalctl -u hyprlock --since today
# o
cat ~/.local/share/hyprlock.log
```
Causas comunes: tipografías rotas, renderizado hora, Wayland al despertar de suspensión.

### Fix permanente — deshabilitar salvapantallas
Si no quieres que vuelva a pasar, comenta `hypridle` en la config:
```bash
nvim ~/.config/hypr/hyprland.conf
# Busca la línea con hypridle o swayidle y pon # delante
```

---

## 🛠️ Dashboard Ecosistema — Plan de construcción

> Objetivo: Varo aprende HTML/CSS/JS construyéndolo paso a paso.
> Mentalidad: Ingeniero de software open source — cada pieza se entiende, no se copia.

### Arquitectura final
```
yggdrasil-dew/tools/dashboard/
├── index.html          ← dashboard principal
├── style.css           ← dark theme propio
├── app.js              ← lógica fetch + render
├── data/
│   ├── varopc.json         ← snapshot Acer
│   └── madre.json          ← snapshot Madre
└── scripts/
    ├── snapshot-acer.sh    ← genera varopc.json
    └── snapshot-madre.sh   ← genera madre.json
```

### Fases
| Fase | Qué construimos | Qué aprendemos |
|---|---|---|
| 1 | HTML estático con datos reales | HTML semántico, estructura, etiquetas |
| 2 | CSS dark theme propio | Selectores, variables, grid, flexbox |
| 3 | JSON + fetch() datos reales | Bash, JSON, JS async/await |
| 4 | Auto-refresco en tiempo real | setInterval, DOM manipulation |
| 5 | Alertas → issues en ygg | GitHub API, curl, cron |

### Datos ya disponibles para Fase 1
- **Acer**: hostname `varo12f`, IP `100.86.119.102`, batería 67.8% salud, 633mA consumo, TLP activo
- **Madre**: hostname `varpc`, IP `100.91.112.32`, Docker + bot + thdora (estado pendiente verificar)
- **Tailscale**: red privada entre nodos

---

## 📚 Concepto clave: Ingeniero de software open source

Un ingeniero de software open source no solo usa herramientas — **las entiende, las construye y las mejora**.
Este dashboard es el primer proyecto real del ecosistema:
- Código propio, en tu repo, versionado con git
- Datos reales de tu infraestructura
- Alertas que escriben a tu segundo cerebro (ygg)
- Base para futuros proyectos más complejos

---

_Procesar a: `projects/dashboard-ecosistema.md` · `setup/hyprland.md` · `aprendizaje/roadmap.md`_
