# Dotfiles de csarrrx

Este repositorio contiene mi configuración personal de **Zsh**, **Oh My Zsh**, **Powerlevel10k**, **Fastfetch** y demás herramientas básicas para desarrollo en Fedora/Linux.  
Incluye un script `install.sh` que automatiza la instalación y enlaza las configuraciones.

---

## 🚀 Instalación

1. Clona este repositorio en tu home:
   ```bash
   git clone git@github.com:csarrrx/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```
2. Da permisos de ejecución al install.sh:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
3. Reinicia tu shell:
   ```bash
   exec zsh
   ```
   
## 📁 Organización:

dotfiles/
├── .zshrc              # Configuración de Zsh + Oh My Zsh
├── .p10k.zsh           # Tema Powerlevel10k
├── fastfetch/          # Configuración de fastfetch
│   └── config.jsonc
├── install.sh          # Script de instalación
└── README.md           # Este archivo

## 👾 Actualización:
   ```bash
   cd ~/dotfiles
   git pull
   ./install.sh
   ```

## ⚙️ Software que instala

- Zsh + Oh My Zsh
- Powerlevel10k
- Fastfetch
- Miniconda
- Git, GCC, Make, Python
- Configuración global de git:
   - user.name = csarrrx
   - user.email = cesarpeam@proton.me


