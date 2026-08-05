#!/bin/bash
set -e

echo "Atualizando sistema"
sudo apt update

echo "Instalando dependencias"
sudo apt install -y git curl make unzip gcc ripgrep fd-find tree-sitter-cli xclip wget 

echo "Instalando o homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configura o Homebrew no PATH para a sessão atual do script
echo >> /home/user/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/user/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "Instalando o neovim"
HOMEBREW_NO_AUTO_UPDATE=1 NONINTERACTIVE=1 brew install neovim
HOMEBREW_NO_AUTO_UPDATE=1 NONINTERACTIVE=1 brew install node

echo "Baixando configurações"
rm -rf /home/user/.config/nvim
mkdir -p /home/user/.config/nvim

git clone https://github.com/4NUB1Ss2/kickstart.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
