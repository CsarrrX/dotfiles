#!/bin/bash
set -e

# ================================
# Dotfiles Bootstrap Script (Fedora)
# ================================

# --- Paquetes base ---
echo "[*] Instalando paquetes base..."
sudo dnf install -y git curl wget gcc make python3 python3-pip zsh fastfetch

# --- Git config global ---
echo "[*] Configurando Git..."
git config --global user.name "csarrrx"
git config --global user.email "cesarpeam@proton.me"

# --- Miniconda ---
if [ ! -d "$HOME/miniconda3" ]; then
    echo "[*] Instalando Miniconda..."
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm ~/miniconda3/miniconda.sh
fi

# --- Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[*] Instalando Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- Powerlevel10k ---
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "[*] Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# --- Symlinks de dotfiles ---
echo "[*] Creando symlinks..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
mkdir -p ~/.config/fastfetch
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

echo "[✔] Instalación completada. Ejecuta: exec zsh"

