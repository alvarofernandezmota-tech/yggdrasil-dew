---
tags: [setup, obsidian, sync, ecosistema, git]
fecha-actualizacion: 2026-06-22
---

# 🔄 Obsidian Sync — Ecosistema completo

> Un vault. Un repo. Todos los dispositivos sincronizados.
> Filosofia: yggdrasil-dew es la fuente única de verdad.

---

## 🎯 Cómo funciona

```
github.com/alvarofernandezmota-tech/yggdrasil-dew
                    ↓  git push/pull
    ┌────────────────────────────┐
    │                          │
🖥️ varopc/Madre    💻 Acer    📱 iPhone
 (Obsidian)      (CLI/Obsidian)  (Obsidian Mobile)
    └────────────────────────────┘
     Todos leen y escriben el mismo vault
```

---

## 🖥️ varopc (Madre) — ya configurado

```bash
# Verificar estado
cd ~/dev/yggdrasil-dew   # o donde esté el vault
git status
git pull

# Obsidian Git plugin — configurar si no está
# Settings > Community Plugins > Obsidian Git
# Auto-pull interval: 5 minutos
# Auto-commit: al guardar o cada X min
```

---

## 💻 Acer — setup git + Obsidian

```bash
# 1. SSH al Acer
ssh varopc@100.86.119.102

# 2. Instalar git (probablemente ya está)
sudo pacman -S git

# 3. Clonar el vault
mkdir -p ~/vaults
cd ~/vaults
git clone git@github.com:alvarofernandezmota-tech/yggdrasil-dew.git

# 4. Configurar git
git config --global user.name "Alvaro"
git config --global user.email "alvarofernandezmota@gmail.com"

# 5. Instalar Obsidian en Acer (tiene escritorio?)
# Si tiene escritorio:
yay -S obsidian
# Abrir Obsidian > Open folder as vault > ~/vaults/yggdrasil-dew

# Si es solo CLI (sin escritorio):
# Usar solo git pull/push para sincronizar
# Editar archivos con nvim o nano

# 6. Script sync rápido — guardar como ~/ygg-sync.sh
cat > ~/ygg-sync.sh << 'EOF'
#!/bin/bash
cd ~/vaults/yggdrasil-dew
git pull
echo "✅ yggdrasil-dew sincronizado"
EOF
chmod +x ~/ygg-sync.sh
echo "alias ygg='cd ~/vaults/yggdrasil-dew && git pull'" >> ~/.zshrc
```

---

## 📱 iPhone 11 — Obsidian Mobile

```
1. App Store → instalar Obsidian (gratis)
2. Instalar Working Copy (cliente git para iOS) — 4,99€ una vez
   O alternativa gratis: a-Shell o iSH
3. Working Copy:
   - Añadir repositorio > GitHub
   - Seleccionar yggdrasil-dew
   - Clone
4. Obsidian Mobile:
   - Open vault as folder
   - Seleccionar carpeta de Working Copy
5. Cada vez que quieras sincronizar:
   - Working Copy > Pull (para recibir cambios)
   - Working Copy > Commit + Push (para enviar)
```

> ⚠️ Alternativa gratuita: usar Obsidian Mobile con iCloud como intermediario.
> Método: vault en iCloud > script en varopc que sincroniza iCloud ↔ git.
> Más complejo pero sin coste.

---

## 🔄 Flujo de trabajo diario

```
Mañana:
  varopc: git pull (Obsidian Git lo hace automático)
  iPhone: Working Copy > Pull

Durante el día:
  Editas en cualquier dispositivo
  Obsidian Git hace commit+push automático en varopc
  En iPhone: commit manual desde Working Copy

Noche:
  git pull en Acer para tener todo al día
```

---

## ⏳ Checklist sync ecosistema

- [x] varopc: vault clonado
- [ ] varopc: Obsidian Git configurado con auto-commit
- [ ] Acer: repo clonado en `~/vaults/yggdrasil-dew`
- [ ] Acer: alias `ygg` en `.zshrc`
- [ ] iPhone: Obsidian Mobile instalado
- [ ] iPhone: Working Copy instalado y repo clonado
- [ ] iPhone: vault abierto en Obsidian Mobile
- [ ] Probar flujo completo: editar en iPhone → push → pull en varopc

---

_Ver también: [[setup/obsidian]] · [[setup/acer]] · [[setup/iphone]] · [[HOME]]_
