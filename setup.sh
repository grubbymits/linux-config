#!/bin/sh

# Use lsb-release to determine whether we're on ubuntu or debian
#sudo apt-get update && sudo apt-get upgrade && sudo apt-get install lsb-release

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
  snapd

sudo snap install node --channel=14/stable --classic

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git config --global user.email "grubbymitts69@gmail.com"
git config --global user.name "Samuel Parker-Haynes"

# Setup vim with solarized colours
mkdir -p ~/.vim/colors
mkdir ~/.vim/syntax
wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o ~/.vim/colors/solarized.vim

# Typescript syntax
mkdir -p ~/.vim/pack/typescript/start/
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

# Cranelift IR syntax
mkdir -p ~/.vim/pack/plugins/start/
git clone https://github.com/CraneStation/cranelift.vim ~/.vim/pack/plugins/start/cranelift.vim

# LLVM syntax
cp tablegen.vim ~/.vim/syntax
cp llvm.vim ~/.vim/syntax

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

# Add usual directories in home
mkdir ~/src
mkdir ~/scripts
