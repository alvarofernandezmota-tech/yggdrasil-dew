# VS Code + GitHub CLI

> Última actualización: 12 junio 2026

---

## Instalación

```bash
# VS Code
yay -S visual-studio-code-bin

# GitHub CLI
sudo pacman -S github-cli

# Autenticar GitHub CLI
gh auth login
# → GitHub.com → HTTPS → Login with browser
```

---

## Extensiones esenciales (VS Code)

```bash
# Git + GitHub
code --install-extension GitHub.vscode-pull-request-github
code --install-extension eamodio.gitlens

# Utilidades
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.vscode-typescript-next
```

---

## Configuración Git global

```bash
git config --global user.name "Alvaro"
git config --global user.email "tu@email.com"
git config --global core.editor "code --wait"
```

---

## Flujo de trabajo diario

```bash
gh repo clone <repo>        # clonar repo
gh pr create                # crear PR desde terminal
gh pr list                  # ver PRs abiertos
gh issue create             # crear issue
```

---

_Volver al índice: [README.md](README.md)_
