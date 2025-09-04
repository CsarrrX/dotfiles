# Configuración de Neovim

Repositorio para versionar y reproducir la configuración de Neovim en cualquier máquina.

## Descripción
Contiene los archivos de configuración de Neovim ubicados en `~/.config/nvim`. Permite sincronizar y mantener la misma configuración en distintas máquinas usando Git.

## Instalación en una nueva máquina

1. Clonar el repositorio como un repositorio bare:
```bash
git clone --bare git@github.com:TU_USUARIO/nvim-config.git $HOME/.cfg
```
2. Configurar el alias para manejar los dotfiles:
```bash
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
3. Hacer checkout de los archivos:
```bash
config checkout
```
Si hay conflictos por archivos existentes, muévelos o renómbralos antes de hacer checkout.

Opcional: ocultar archivos no versionados en status:
```bash
config config --local status.showUntrackedFiles no
```
4. Uso

Para agregar o actualizar archivos en el repositorio:
```bash
config add <archivo>
config commit -m "mensaje"
config push
```


