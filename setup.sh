#!/bin/bash

# TODO
# Use lsb-release to determine whether we're on ubuntu or debian
#sudo apt-get update && sudo apt-get upgrade && sudo apt-get install lsb-release

# TODO
# Make this interactive and do separate installs for work/play

# TODO
# Check whether we're building on x86_64 or aarch64

sudo apt-get update && sudo apt-get upgrade && \
sudo apt-get install \
  apt-utils \
  lsb-release \
  wget \
  software-properties-common \
  gnupg \
  vim \
  htop \
  tmux \
  byobu \
  build-essential \
  cmake \
  ninja-build \
  ccache \
  curl \
  openssh-server \
  mosh

# Stable LLVM
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
  
read -n 1 -s -p "Install desktop stuff?:" var
if  [ "$var" = "Y" ] || [ "$var" = "y" ]
then
  # spotify
  curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update && sudo apt-get install spotify-client

  # brave browser
  sudo apt install apt-transport-https
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update
  sudo apt install brave-browser

  sudo add-apt-repository ppa:regolith-linux/release
  sudo apt install regolith-desktop-standard # or regolith-desktop-mobile for laptops
  sudo apt install i3xrocks-cpu-usage i3xrocks-memory i3xrocks-temp i3xrocks-volume
  sudo apt install regolith-look-solarized-dark
  # regolith-look set solarized-dark
  # regolith-look refresh
fi

# Node
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup target add wasm32-wasi
cp cargo-config.toml ~/.cargo/config.toml

# Cross compilers and QEMU
read -n 1 -s -p "Install arm dev tools?:" var
if  [ "$var" = "Y" ] || [ "$var" = "y" ]
then
  sudo apt-get install \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    qemu-system-arm \
    qemu-efi-aarch64 \
  rustup target add aarch64-unknown-linux-gnu
fi

read -n 1 -s -p "Setup for work?:" var
if  [ "$var" = "Y" ] || [ "$var" = "y" ]
then
  git config --global user.email "sam.parker@arm.com"
  git config --global user.name "Sam Parker"
  git clone https://github.com/llvm/llvm-project.git ~/src/llvm-project
  git clone --recursive https://github.com/sparker-arm/wasmtime.git ~/src/wasmtime
  # Cranelift IR syntax
  mkdir -p ~/.vim/pack/plugins/start/
  git clone https://github.com/CraneStation/cranelift.vim ~/.vim/pack/plugins/start/cranelift.vim
else
  git config --global user.email "samuel@grubbymits.dev"
  git config --global user.name "Samuel Parker-Haynes"
fi
git config --global core.editor "vim"

# Setup git credential storing.
sudo apt install gpg pass
gpg --gen-key
git config --global credential.credentialStore gpg
echo "Don't forget to setup pass afterwards: pass init <gpg-id>"

# Setup vim with solarized colours
mkdir -p ~/.vim/colors
mkdir ~/.vim/syntax
wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -O ~/.vim/colors/solarized.vim

# Typescript syntax
mkdir -p ~/.vim/pack/typescript/start/
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

# Airline
mkdir -p ~/.vim/pack/dist/start
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes

# LLVM syntax
cp tablegen.vim ~/.vim/syntax
cp llvm.vim ~/.vim/syntax

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

# Add usual directories in home
mkdir -p ~/src/patches
mkdir ~/scripts
