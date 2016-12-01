#!/bin/bash

# Fail fast
set -euo pipefail

# Here
SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Utils used later (messages, message color)
source $SETUP_DIR/util.sh

report "Making ~/bin" YELLOW
mkdir -p ~/bin

# Install essential build tools
source $SETUP_DIR/build-essentials.sh

# Install Homebrew if needed
source $SETUP_DIR/brew.sh

# Git
# git pullall  # pull and update submodules
git config --global alias.pullall '!f(){ git pull "$@" && git submodule update --init --recursive; }; f'
# git lg  # prettier git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit"
brew install git git-lfs
git lfs install --force
git config --global rerere.enabled true

# Powerline Meslo fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh
cd $SETUP_DIR

# Bash
brew install bash-completion bash-git-prompt

# Install links (sym)
ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/bash_profile ~/.bash_profile
ln -s $PWD/pdbrc ~/.pdbrc
ln -s $PWD/iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
ln -s $PWD/custom.css ~/.jupyter/custom/custom.css  # dark Jupyter
