# Roadmap Terminal

Hoja de ruta de todo lo que hay que aprender e investigar sobre el terminal.  
Se documenta aquí a medida que se investiga y practica.

---

## Nivel 1 — Pendiente de completar (setup actual)

- [ ] Instalar tmux en Acer (`sudo pacman -S tmux`)
- [ ] Añadir alias `madre` a `~/.zshrc`
- [ ] Configurar prompt diferenciado en Madre
- [ ] Hacer permanente el prompt `theodora` en Acer (verificar tras reinicio)

---

## Nivel 2 — Productividad diaria

### Alias
Atajos para comandos que usas mucho.
```bash
alias ll='ls -la'
alias gs='git status'
alias gc='git commit -m'
alias madre='tmux new-session -s madre "ssh madre"'
```
- [ ] Investigar y crear lista de alias personales útiles

### Tmux avanzado
- [ ] Aprender ventanas (`Ctrl+b c`) vs paneles (`Ctrl+b %`)
- [ ] Configurar `~/.tmux.conf` con atajos propios
- [ ] Barra de estado con info útil (batería, hora, máquina)
- [ ] Investigar: tmux-resurrect (guardar sesiones entre reinicios)

### Zsh plugins
- [ ] `zsh-autosuggestions` — sugiere comandos mientras escribes
- [ ] `zsh-syntax-highlighting` — colorea comandos válidos/inválidos
- [ ] `zsh-history-substring-search` — buscar en historial con flecha arriba
```bash
sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
```

---

## Nivel 3 — Scripts y automatización

### Scripts bash/zsh
- [ ] Aprender estructura básica de un script `.sh`
- [ ] Variables, condicionales, bucles en bash
- [ ] Crear script de backup automático de configs
- [ ] Crear script que sincronice archivos entre Acer y Madre

### Cron y automatización
- [ ] Aprender `crontab -e` para tareas programadas
- [ ] Automatizar sincronización de repos con git

---

## Nivel 4 — Terminal avanzado

### Gestión de procesos
- [ ] `htop` / `btop` — monitor de recursos en terminal
- [ ] `systemctl` — gestionar servicios del sistema
- [ ] `journalctl` — ver logs del sistema

### Red y SSH
- [ ] `ssh-keygen` — claves SSH sin contraseña entre Acer y Madre
- [ ] `rsync` — sincronizar archivos entre máquinas eficientemente
- [ ] `scp` — copiar archivos por SSH
- [ ] Investigar: SSH config file (`~/.ssh/config`) para simplificar conexiones

### Herramientas modernas (rust-based)
- [ ] `eza` — reemplazo de `ls` con colores e iconos
- [ ] `bat` — reemplazo de `cat` con syntax highlighting
- [ ] `fd` — reemplazo de `find` más rápido
- [ ] `ripgrep (rg)` — búsqueda en archivos ultrarrápida
- [ ] `fzf` — búsqueda fuzzy en terminal (archivos, historial)
- [ ] `zoxide` — reemplazo de `cd` con memoria de directorios

---

## Nivel 5 — Investigar / Ideas futuras

- [ ] Neovim como editor principal en terminal
- [ ] Dotfiles repo — versionar todas las configs (`.zshrc`, `starship.toml`, `.tmux.conf`)
- [ ] Stow — gestionar symlinks de dotfiles
- [ ] Ansible — automatizar instalación del setup completo en cualquier máquina

---

## Recursos

- [Tmux cheatsheet](https://tmuxcheatsheet.com)
- [Starship docs](https://starship.rs/config/)
- [Zsh docs](https://zsh.sourceforge.io/Doc/)
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
