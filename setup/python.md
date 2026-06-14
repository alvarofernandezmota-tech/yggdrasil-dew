# Setup Python

## Arquitectura / Objetivo

Documentar el entorno Python completo en Madre y Acer: instalación, gestión de versiones, entornos virtuales, herramientas del curso y proyectos.

---

## Configuración

### Instalación en Arch Linux

```bash
# Python viene preinstalado en Arch
python --version
pip --version

# Herramientas base
sudo pacman -S python python-pip python-virtualenv
```

### Entorno virtual (por proyecto)

```bash
# Crear venv
python -m venv .venv

# Activar
source .venv/bin/activate

# Desactivar
deactivate

# Instalar dependencias
pip install -r requirements.txt

# Guardar dependencias
pip freeze > requirements.txt
```

### Herramientas del curso Escuela Musk

```bash
# Testing
pip install pytest

# Datos (M5)
pip install pandas numpy matplotlib

# OCR (python-snippets)
pip install pillow pytesseract
# + instalar tesseract: sudo pacman -S tesseract tesseract-data-spa
```

### Editor / IDE

| Herramienta | Uso | Estado |
|---|---|---|
| Neovim (nvim) | Editor principal en terminal | ✅ instalado en Madre |
| VSCode / VSCodium | IDE completo con extensiones | pendiente instalar |
| Jupyter Notebook | Análisis de datos, M5 | instalar con `pip install jupyter` |

```bash
# VSCodium (open source)
yay -S vscodium-bin

# Jupyter
pip install jupyter
jupyter notebook
```

### Extensiones recomendadas (VSCodium)

- Python (ms-python)
- Pylance
- Python Test Explorer
- Jupyter

---

## Estado

| Máquina | Python | pip | venv | pytest | pandas/numpy |
|---|---|---|---|---|---|
| Madre | ✅ | ✅ | ✅ | pendiente verificar | pendiente |
| Acer | pendiente verificar | pendiente | pendiente | pendiente | pendiente |

---

## Próximo paso

- [ ] Verificar versiones de Python en Madre y Acer
- [ ] Instalar VSCodium en Madre
- [ ] Crear venv para el curso en Madre
- [ ] Migrar ejercicios M1–M5 desde personal (v1)
- [ ] Retomar Clases Extra desde CE-01 SQL

---

_Actualizado: 14 jun 2026_
