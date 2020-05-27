#!/bin/sh

# Use lsb-release to determine whether we're on ubuntu or debian
#sudo apt-get update && sudo apt-get upgrade && sudo apt-get install lsb-release

# Add the LLVM repos
#sudo echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-7 main" > /etc/apt/sources.list
#sudo echo "deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-7 main" > /etc/apt/sources.list
#wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

sudo apt-get update && sudo apt-get upgrade && \
sudo apt-get install apt-utils vim htop tmux byobu build-essential cmake nodejs npm

git config --global user.email "grubbymitts69@gmail.com"
git config --global user.name "Samuel Parker-Haynes"

# Setup vim with solarized colours and syntax highlighting for typescript.
mkdir -p ~/.vim/colors
mkdir ~/.vim/syntax
wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
mv solarized.vim ~/.vim/colors
mkdir -p ~/.vim/pack/typescript/start/
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp llvm.vim ~/.vim/syntax
cp tablegen.vim ~/.vim/syntax
