#!/bin/bash

# Fail fast
set -euo pipefail

# Here
SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SETUP_DIR

# Utils used later (messages, message color)
source $SETUP_DIR/util.sh

report "Making ~/bin/" YELLOW
mkdir -p ~/bin/

# Install essential build tools
source $SETUP_DIR/build-essentials.sh

# Install Homebrew if needed
source $SETUP_DIR/brew.sh

# Git
# git pullall  # pull and update submodules
git config --global alias.pullall '!f(){ git pull "$@" && git submodule update --init --recursive; }; f'
# git lg  # prettier git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui auto
brew install git git-lfs hub
git lfs install --force
git config --global rerere.enabled true
git config --global core.excludesfile "$PWD/gitignore-global"

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Bash
brew install bash-completion bash-git-prompt

# Utils
brew install tree htop git git-lfs hub imagemagick pyenv

# Vim
report "Making ~/.vim/" YELLOW
mkdir -p ~/.vim/
mkdir -p ~/.vim/files/backup/
mkdir -p ~/.vim/files/swap/
mkdir -p ~/.vim/files/undo/
mkdir -p ~/.vim/files/info/

# Install links (sym)
ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/bash_profile ~/.bash_profile
ln -s $PWD/vimrc ~/.vim/vimrc
ln -s $PWD/pdbrc ~/.pdbrc
ln -s $PWD/pythonrc ~/.pythonrc
ln -s $PWD/iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
ln -s $PWD/custom.css ~/.jupyter/custom/custom.css  # dark Jupyter
