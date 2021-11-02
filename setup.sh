#!/bin/sh

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
  vim \
  htop \
  tmux \
  byobu \
  build-essential \
  cmake \
  ninja-build \
  ccache \
  clang \
  lld \
  lldb \
  gcc-aarch64-linux-gnu \
  g++-aarch64-linux-gnu \
  qemu-system-arm \
  qemu-efi-aarch64 \
  curl \
  openssh-server \
  mosh \
  snapd

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

# Node
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-wasi
rustup target add aarch64-unknown-linux-gnu
cp cargo-config.toml ~/.cargo/config.toml

git config --global user.email "samuel@grubbymits.dev"
git config --global user.name "Samuel Parker-Haynes"
git config --global core.editor "vim"

# Setup vim with solarized colours
mkdir -p ~/.vim/colors
mkdir ~/.vim/syntax
wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -O ~/.vim/colors/solarized.vim

# Typescript syntax
mkdir -p ~/.vim/pack/typescript/start/
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

# Cranelift IR syntax
mkdir -p ~/.vim/pack/plugins/start/
git clone https://github.com/CraneStation/cranelift.vim ~/.vim/pack/plugins/start/cranelift.vim

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

git clone https://github.com/llvm/llvm-project.git ~/src/llvm-project
git clone --recursive https://github.com/sparker-arm/wasmtime.git ~/src/wasmtime
